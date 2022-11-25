package main.java.controllers;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.util.Duration;
import main.java.admin.SalesManagementController;
import main.java.others.DBConnection;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ResourceBundle;

public class CheckoutController implements Initializable {

    Connection connection = DBConnection.serverConnection();

    @FXML
    private JFXTextField customerNameField;

    @FXML
    private Label totalAmountTextField;

    @FXML
    private VBox mainPane;
    @FXML
    private AnchorPane checkoutPane;
    @FXML
    private JFXTextField amountPaidTextField;


    @FXML
    private Label changeLabel;

    @FXML
    private JFXButton cancelButton;

    @FXML
    private JFXButton makePaymentButton;
    Double change;

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        cancelButton.setOnAction(e -> setCancelButton());
        makePaymentButton.setOnAction(e -> setMakePaymentButton());
        readNetAmount();
        changeLabel.setText("GH₵ 0.00");


    }

    private void setCancelButton() {
        Stage stage = (Stage) cancelButton.getScene().getWindow();
        stage.close();
        //cart must be cleared to avoid duplication on when user clicks pay
        //deleting items from cart

        // deleteItemsFromCart(connection);


    }

    private void deleteItemsFromCart(Connection connection) {
        try {
            PreparedStatement deleteCartStatement = connection.prepareStatement("delete from cart");
            deleteCartStatement.executeUpdate();
            System.out.println("delete from cart success");
        } catch (SQLException e) {
            e.getMessage();
        }
    }


    private void readNetAmount() {
        try {
            FileReader fr = new FileReader("net amount");
            BufferedReader br = new BufferedReader(fr);

            totalAmountTextField.setText(br.readLine());
            br.close();
            fr.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void setCalculateButton() {

        try {
            double total = Double.parseDouble(totalAmountTextField.getText());
            double paid = Double.parseDouble(amountPaidTextField.getText());

            change = Math.abs(paid - total);
            DecimalFormat decimalFormat = new DecimalFormat("###.#");
            if (validateInput())
                changeLabel.setText("GH₵ " + String.valueOf(decimalFormat.format(change)));

        } catch (Exception e) {
           /* TrayNotification notification = new TrayNotification();
            notification.setTray("Invalid Number", "please enter a valid amount", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(4));*/
            // new PromptDialogController("Invalid Number", "Please Enter valid Figure");

            changeLabel.setText("Invalid paid amount");
        }
    }


    //method to get Items From cart and insert into sales
    private void setMakePaymentButton() {
        if (checkFields()) {


            Connection connection = DBConnection.localConnection();
            try {


                assert connection != null;
                final PreparedStatement[] preparedStatement = {connection.prepareStatement(" Select * from cart")};
                ResultSet resultSet = preparedStatement[0].executeQuery();
                while (resultSet.next()) {
                    String productName = resultSet.getString("productName");
                    double salePrice = resultSet.getDouble("price");
                    double quantity = resultSet.getDouble("quantity");
                    double total = resultSet.getDouble("total");
                    double grandTotal = Double.parseDouble(totalAmountTextField.getText());
                    double amountPaid = Double.parseDouble(amountPaidTextField.getText());
                    double change = Double.parseDouble(changeLabel.getText().substring(4));


                    //inserting the purchased product into sales
                    try {
                        Connection serverConnection = DBConnection.serverConnection();

                        PreparedStatement insertStatement = connection.prepareStatement("INSERT INTO sales( productName, price, quantity, total, grandTotal, amountPaid,balance,date,customerName,employeeName) VALUES (?,?,?,?,?,?,?,?,?,?)");
                        PreparedStatement serverInsertStatement = serverConnection.prepareStatement("INSERT INTO sales( productName, price, quantity, total, grandTotal, amountPaid,balance,date,customerName,employeeName) VALUES (?,?,?,?,?,?,?,?,?,?)");

                        insertStatement.setString(1, productName);
                        insertStatement.setDouble(2, salePrice);
                        insertStatement.setDouble(3, quantity);
                        insertStatement.setDouble(4, total);
                        insertStatement.setDouble(5, grandTotal);
                        insertStatement.setDouble(6, amountPaid);
                        insertStatement.setDouble(7, change);
                        insertStatement.setDate(8, Date.valueOf(LocalDate.now()));
                        insertStatement.setString(9, customerNameField.getText());
                        insertStatement.setString(10, LogInController.loggerUsername);

                        serverInsertStatement.setString(1, productName);
                        serverInsertStatement.setDouble(2, salePrice);
                        serverInsertStatement.setDouble(3, quantity);
                        serverInsertStatement.setDouble(4, total);
                        serverInsertStatement.setDouble(5, grandTotal);
                        serverInsertStatement.setDouble(6, amountPaid);
                        serverInsertStatement.setDouble(7, change);
                        serverInsertStatement.setDate(8, Date.valueOf(LocalDate.now()));
                        serverInsertStatement.setString(9, customerNameField.getText());
                        serverInsertStatement.setString(10, LogInController.loggerUsername);
                        serverInsertStatement.executeUpdate();
                        insertStatement.executeUpdate();
                       // System.out.println("insert into sales successful");

                        //updating stock
                        updateStock();


                        insertIntoPrintInvoice(
                                productName,
                                salePrice,
                                quantity,
                                total,
                                grandTotal,
                                amountPaid,
                                change,
                                LogInController.loggerUsername,
                                customerNameField.getText());

                        //inserting into print invoice table


                        //since payment has been made, our cart is supposed to be empty
                        //deleting items from cart


                        deleteItemsFromCart(connection);
                        //clearing items from the cart table view


                        Stage stage = (Stage) makePaymentButton.getScene().getWindow();
                        stage.close();
                        new SalesManagementController().setPrintingDone(true);

                        try {
                            JasperDesign jasperDesign = JRXmlLoader.load("receipt.jrxml");
                            JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
                            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);

                            JasperViewer.viewReport(jasperPrint, false);
                            // new Printer(jasperPrint, "EPSON TM-T20II Receipt");
                            System.out.println("printing done");


                            String query = "delete from printinvoice";

                            preparedStatement[0] = connection.prepareStatement(query);

                            preparedStatement[0].executeUpdate();
                            System.out.println("New Sale deleted from print Invoice Table after printing");
                        } catch (Exception ee) {
                            TrayNotification notification = new TrayNotification();
                            notification.setTray("Cannot Locate Report", ee.getMessage(), NotificationType.ERROR);
                            notification.showAndDismiss(Duration.seconds(3));
                            // new PromptDialogController("Cannot Locate Report", "Specify report location");
                            ee.printStackTrace();
                        }


                    } catch (Exception e) {
                        e.getMessage();
                        e.printStackTrace();
                    }


                }


            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }


    private void updateStock() {
        String productName = "";
        double quantity, stock = 0, remainingStock = 0;

        try {
            //getting the names of product and quantity from cart
            Connection localConnection = DBConnection.localConnection();
            PreparedStatement preparedStatement = localConnection.prepareStatement("select * from cart");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                productName = resultSet.getString("productName");
                quantity = resultSet.getDouble("quantity");

                //getting the stock value from the products table
                PreparedStatement getStockStatement = connection.prepareStatement("select * from products where productName=?");
                getStockStatement.setString(1, productName);
                ResultSet stockResult = getStockStatement.executeQuery();
                while (stockResult.next()) {
                    stock = stockResult.getDouble("stock");
                }

                //subtracting the quantity purchased from the available stock
                remainingStock = (stock - quantity);

                //inserting the new stock into database
                //NOTE: the already stock will be replaced with the new one
                PreparedStatement insertNewStockStatement = localConnection.prepareStatement("UPDATE `products` SET stock=? WHERE productName=?  ");
                insertNewStockStatement.setDouble(1, remainingStock);
                insertNewStockStatement.setString(2, productName);
                PreparedStatement serverInsertNewStockStatement = connection.prepareStatement("UPDATE `products` SET stock=? WHERE productName=?  ");
                serverInsertNewStockStatement.setDouble(1, remainingStock);
                serverInsertNewStockStatement.setString(2, productName);
                insertNewStockStatement.executeUpdate();
                serverInsertNewStockStatement.executeUpdate();

                System.out.println("stock updated");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    public boolean validateInput() {

        String errorMessage = "";


        if (amountPaidTextField.getText() == null || amountPaidTextField.getText().length() <= 0) {
            errorMessage += "Invalid Input!\n";
        } else if (Double.parseDouble(amountPaidTextField.getText()) < Double.parseDouble(totalAmountTextField.getText())) {
            errorMessage += "Insufficient Input!\n";
        }

        if (errorMessage.length() == 0) {
            return true;
        } else {
            /*Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Warning");
            alert.setHeaderText("Please input the valid amount");
            alert.setContentText(errorMessage);
            alert.showAndWait();*/
            changeLabel.setText("invalid amount paid");


            return false;
        }
    }


    private boolean checkFields() {

        if (!amountPaidTextField.getText().isEmpty()) {
            try {

                if (Double.parseDouble(amountPaidTextField.getText()) < Double.parseDouble(totalAmountTextField.getText())) {
                    TrayNotification notification = new TrayNotification();
                    notification.setTray(null, "Amount paid can't be less than Total AMount", NotificationType.ERROR);
                    notification.showAndDismiss(Duration.seconds(3));
                    return false;
                }

            } catch (NumberFormatException e) {
                TrayNotification notification = new TrayNotification();
                notification.setTray(null, "Please Enter a valid Amount", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));
                return false;
            }
        } else {
            TrayNotification notification = new TrayNotification();
            notification.setTray(null, "Amount paid can't be Empty", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            return false;
        }
        return true;

    }


    /**
     * inserting the sale into the print invoice table
     **/

    public void insertIntoPrintInvoice(String productName, double unitPrice, double quantity, double total, double grandTotal, double amountPaid, double balance, String employeeName, String customername) {
        try {
Connection connection=DBConnection.localConnection();
            String query = "insert into printinvoice( productName, unitPrice, quantity, Total,grandTotal,amountPaid,balance,employeeName,customerName) values(?,?,?,?,?,?,?,?,?)";

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, productName);
            preparedStatement.setDouble(2, unitPrice);
            preparedStatement.setDouble(3, quantity);
            preparedStatement.setDouble(4, total);
            preparedStatement.setDouble(5, grandTotal);
            preparedStatement.setDouble(6, amountPaid);
            preparedStatement.setDouble(7, balance);
            preparedStatement.setString(8, employeeName);
            preparedStatement.setString(9, customername);
            preparedStatement.executeUpdate();
            System.out.println("new Sale inserted into invoice success");
        } catch (Exception ee) {
            ee.printStackTrace();
        }

    }


}
