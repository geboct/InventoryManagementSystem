package main.java.controllers;

import com.jfoenix.controls.JFXButton;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Modality;
import javafx.stage.Stage;
import main.java.others.DBConnection;

import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.time.LocalDate;
import java.util.ResourceBundle;


public class DashboardControllerBoth implements Initializable {


    @FXML
    private JFXButton btnTodaySell, todayPuchasesButton, thisMonthSalesButton, thisMonthPuchasesButton;
    @FXML
    private Label salesCounter, todayPurchasesCounter, thisMonthSalesCounter, thisMonthPurchasesCounter, outOfStockLabel;
    @FXML
    private Label todaySalesAmount, todayPurchasesAmount, thisMonthSalesAmount, thisMonthPurchasesAmount;


    @FXML
    private JFXButton loadAgain;
    @FXML
    private Label lblOutOfStock;


    public static Integer stockOut = 0;

    @Override
    public void initialize(URL location, ResourceBundle resources) {

        loadTodaySales();
        loadTodayPurchases();
        thisMonthSales();
        thisMonthPurchases();
        loadAgain.setOnAction(e -> {
            loadTodaySales();
            loadTodayPurchases();

        });


        outOfStockLabel.setOnMouseEntered(e -> {
            outOfStockLabel.setUnderline(true);
        });
        outOfStockLabel.setOnMouseExited(e -> {
            outOfStockLabel.setUnderline(false);
        });

        outOfStockLabel.setOnMouseClicked(e -> {
            Stage stage = new Stage();
            try {
                Parent root = FXMLLoader.load(getClass().getResource("/main/resources/view/outOfStock.fxml"));
                stage.setScene(new Scene(root));
                stage.initModality(Modality.APPLICATION_MODAL);
                stage.show();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        });
    }


    private void loadTodaySales() {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*), SUM(total) FROM sales WHERE date = '" + Date.valueOf(LocalDate.now()) + "'");
            ResultSet todaySales = preparedStatement.executeQuery();
            while (todaySales.next()) {
                System.out.println(Date.valueOf(LocalDate.now()));
                //todaySales.last();
                salesCounter.setText(String.valueOf(todaySales.getInt(1)));
                todaySalesAmount.setText(todaySales.getInt(2) + " GH₵");
            }
            outOfStock();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void thisMonthSales() {
        Connection connection = DBConnection.getConnection();
        LocalDate currentDate = LocalDate.now();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*), SUM(total) FROM sales WHERE year ='" + currentDate.getYear() + "' and  month  = '" + currentDate.getMonth() + "' ");
            ResultSet thisMothResultSet = preparedStatement.executeQuery();
            while (thisMothResultSet.next()) {
                System.out.println(currentDate.getYear() + " " + currentDate.getMonth());

                thisMonthSalesCounter.setText(String.valueOf(thisMothResultSet.getInt(1)));
                thisMonthSalesAmount.setText(" GH₵" + thisMothResultSet.getInt(2));
            }
            outOfStock();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void loadTodayPurchases() {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*), SUM(total) FROM purchases WHERE date = '" + Date.valueOf(LocalDate.now()) + "'");
            ResultSet todayPurchases = preparedStatement.executeQuery();

            while (todayPurchases.next()) {

                todayPurchasesCounter.setText(String.valueOf(todayPurchases.getInt(1)));
                todayPurchasesAmount.setText(todayPurchases.getInt(2) + " GH₵");


            }


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void thisMonthPurchases() {
        Connection connection = DBConnection.getConnection();
        LocalDate currentDate = LocalDate.now();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*), SUM(total) FROM purchases WHERE year ='" + currentDate.getYear() + "' and  month  = '" + currentDate.getMonth() + "' ");
            ResultSet todayPurchases = preparedStatement.executeQuery();

            while (todayPurchases.next()) {

                thisMonthPurchasesCounter.setText(String.valueOf(todayPurchases.getInt(1)));
                thisMonthPurchasesAmount.setText(todayPurchases.getInt(2) + " GH₵");


            }


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void outOfStock() {
        Connection connection = DBConnection.getConnection();
        stockOut = 0;
        try {
            PreparedStatement getOutOfStock = connection.prepareStatement("SELECT * FROM products WHERE  stock <= ?");
            getOutOfStock.setInt(1, 5);
            ResultSet stockOutRs = getOutOfStock.executeQuery();
            while (stockOutRs.next()) {
                stockOut += 1;
            }
            lblOutOfStock.setText(String.valueOf(stockOut));


        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    @FXML
    void showSales(ActionEvent event) {
        try {
            TotalSalesListController.todayFlag = true;
            Parent sellsList = FXMLLoader.load(getClass().getResource("/main/resources/view/totalSalesList.fxml"));
            Scene s = new Scene(sellsList);
            Stage stg = new Stage();
            stg.setScene(s);
            stg.setResizable(false);
            stg.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    void showPurchases() {
        try {
            TotalSalesListController.todayFlag = true;
            Parent purchasesStage = FXMLLoader.load(getClass().getResource("/main/resources/view/totalPurchasesList.fxml"));
            Scene s = new Scene(purchasesStage);
            Stage stg = new Stage();
            stg.setScene(s);
            stg.setResizable(false);
            stg.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
