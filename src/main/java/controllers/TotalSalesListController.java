package main.java.controllers;

import com.jfoenix.controls.JFXButton;
import de.jensd.fx.glyphs.fontawesome.FontAwesomeIcon;
import de.jensd.fx.glyphs.fontawesome.FontAwesomeIconView;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import main.java.entity.Sale;
import main.java.others.DBConnection;
import main.java.printing.PDFPrinter;
import main.java.printing.Printer;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

import java.net.URL;
import java.sql.*;
import java.time.LocalDate;
import java.util.ResourceBundle;

public class TotalSalesListController implements Initializable {
    @FXML
    private TableView<Sale> salesTableView;

    @FXML
    private DatePicker fromDate;

    @FXML
    private Button searchButton, pdfButton;
    @FXML
    private Button clearFields, todaySales, searchFieldButton;
    @FXML
    private DatePicker toDate;
    @FXML
    private TextField searchField;
    @FXML
    private TableColumn<Sale, Integer> invoiceID;
    @FXML
    private TableColumn<Sale, String> total;
    @FXML
    private TableColumn<Sale, String> unitPrice;
    @FXML
    private TableColumn<Sale, String> productName;
    @FXML
    private TableColumn<Sale, Date> date;
    @FXML
    private TableColumn<Sale, Double> quantity;
    @FXML
    private TableColumn<Sale, Double> paidAmount;
    @FXML
    private TableColumn<Sale, String> employeeName;
    @FXML
    private Label lblSaleCount;
    @FXML
    private Label lblHeader, today;


    @FXML
    private Label lblAmount;
    public static boolean todayFlag = false;
    Connection connection;
    ObservableList<Sale> listOfAllSales = FXCollections.observableArrayList();
    ObservableList<Sale>listOfSearchresults=FXCollections.observableArrayList();


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        initializeTableColumns();
        today.setText(LocalDate.now().toString());
        connection = DBConnection.getConnection();
        todaySales.setText("Today's Sales");
        clearFields.setOnAction(e -> setClearFields());
        searchButton.setOnAction(e -> searchWithDate());

        todaySales.setOnAction(e -> {
            //  todaysSales();
            switch (todaySales.getText()) {
                case "Today's Sales":
                    todaysSales();
                    lblHeader.setText("Today's Sales");
                    break;
                case "Total Sales":
                    getAllSales();
                    lblHeader.setText("Total Sales -");
                default:
                    System.out.println("Error");
            }

        });
        searchWithInvoiceNumber();
        searchFieldButton.setOnAction(e -> searchWithInvoiceNumber());
        searchFieldButton.setGraphic(new FontAwesomeIconView(FontAwesomeIcon.SEARCH));
        pdfButton.setOnAction(e -> print());
        getAllSales();


    }


    private void print() {
        Connection connection = DBConnection.getConnection();

        if (!searchField.getText().equals("")&& !salesTableView.getItems().isEmpty()) {

            try {

                for (Sale sale : listOfSearchresults) {
                    PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `printsales`(`productName`, `quantity`, `salePrice`, `total`, `date`, `employeeName`) VALUES (?,?,?,?,?,?)");
                    preparedStatement.setString(1, sale.getProductName());
                    System.out.println();
                    preparedStatement.setDouble(2, sale.getQuantity());
                    preparedStatement.setDouble(3, sale.getSalePrice());
                    preparedStatement.setDouble(4, sale.getTotal());
                    preparedStatement.setString(5, sale.getDate());
                    preparedStatement.setString(6, sale.getEmployeeName());
                    preparedStatement.executeUpdate();
                    System.out.println("products inserted into  print sale");
                    //generate report for search sales


                }
                System.out.println("insert into print sales done");

                //exporting to pdf
                JasperDesign jasperDesign = JRXmlLoader.load("searchProducts.jrxml");
                JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);

                JasperViewer.viewReport(jasperPrint, false);
                //new Printer(jasperPrint, "POS-58C");
                System.out.println("printing done");
                // new PDFPrinter(jasperPrint, "", today.getText());
                //deleting from print sales after printing

                PreparedStatement preparedStatement = connection.prepareStatement("delete from printsales");
                preparedStatement.executeUpdate();
                System.out.println("delete from print sales");


            } catch (Exception e) {
                e.printStackTrace();
                System.out.println();
            }

        } else if ((searchFieldButton.getText().isEmpty()) && fromDate.getValue() == null && !(salesTableView.getItems() == null)) {

            try {

                for (Sale sale : listOfAllSales) {
                    PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `printsales`(`productName`, `quantity`, `salePrice`, `total`, `date`, `employeeName`) VALUES (?,?,?,?,?,?)");
                    preparedStatement.setString(1, sale.getProductName());
                    preparedStatement.setDouble(2, sale.getQuantity());
                    preparedStatement.setDouble(3, sale.getSalePrice());
                    preparedStatement.setDouble(4, sale.getTotal());
                    preparedStatement.setString(5, sale.getDate());
                    preparedStatement.setString(6, sale.getEmployeeName());
                    preparedStatement.executeUpdate();
                    System.out.println("products inserted into  print sale");
                    //generate report for total sales


                }
                System.out.println("insert into print sales done");

                //exporting to pdf
                JasperDesign jasperDesign = JRXmlLoader.load("AllProducts.jrxml");
                JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);

                JasperViewer.viewReport(jasperPrint, false);
                //new Printer(jasperPrint, "POS-58C");
                System.out.println("printing done");
                // new PDFPrinter(jasperPrint, "", today.getText());
                //deleting from print sales after printing

                PreparedStatement preparedStatement = connection.prepareStatement("delete from printsales");
                preparedStatement.executeUpdate();
                System.out.println("delete from print sales");


            } catch (Exception e) {
                e.printStackTrace();
                System.out.println();
            }


        } else if (searchField.getText().isEmpty() && !(fromDate.getValue() == null) && !(toDate.getValue() == null)) {

            try {


                for (Sale sale : listOfAllSales) {
                    PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `printsales`(`productName`, `quantity`, `salePrice`, `total`, `date`, `employeeName`, `invoiceNumber`, `fromDate`, `toDate`) VALUES (?,?,?,?,?,?,?,?,?)");
                    preparedStatement.setString(1, sale.getProductName());
                    preparedStatement.setDouble(2, sale.getQuantity());
                    preparedStatement.setDouble(3, sale.getSalePrice());
                    preparedStatement.setDouble(4, sale.getTotal());
                    preparedStatement.setString(5, sale.getDate());
                    preparedStatement.setString(6, sale.getEmployeeName());
                    preparedStatement.setString(7, searchField.getText());
                    preparedStatement.setDate(8, Date.valueOf(fromDate.getValue()));
                    preparedStatement.setDate(9, Date.valueOf(toDate.getValue()));
                    preparedStatement.executeUpdate();
                    System.out.println("products inserted into  print sale");

                    //generate report for search both dates

                }

                //exporting to pdf
                JasperDesign jasperDesign = JRXmlLoader.load("twoDates.jrxml");
                JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);

                JasperViewer.viewReport(jasperPrint, false);
                // new Printer(jasperPrint, "POS-58C");
                System.out.println("printing done");
                //  new PDFPrinter(jasperPrint, "", today.getText());


                //delete from print sales
                PreparedStatement preparedStatement = connection.prepareStatement("delete from printsales");
                preparedStatement.executeUpdate();
                System.out.println("delete from print sales");

            } catch (Exception e) {
                e.printStackTrace();
            }


        } else if (searchField.getText().isEmpty() && !(fromDate.getValue() == null) && toDate.getValue() == null) {


            try {

                for (Sale sale : listOfAllSales) {

                    PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `printsales`(`productName`, `quantity`, `salePrice`, `total`, `date`, `employeeName`, `invoiceNumber`, `fromDate`) VALUES (?,?,?,?,?,?,?,?)");
                    preparedStatement.setString(1, sale.getProductName());
                    preparedStatement.setDouble(2, sale.getQuantity());
                    preparedStatement.setDouble(3, sale.getSalePrice());
                    preparedStatement.setDouble(4, sale.getTotal());
                    preparedStatement.setString(5, sale.getDate());
                    preparedStatement.setString(6, sale.getEmployeeName());
                    preparedStatement.setString(7, searchField.getText());
                    preparedStatement.setDate(8, Date.valueOf(fromDate.getValue()));
                    preparedStatement.executeUpdate();
                    System.out.println("products inserted into  print sale");
                }
                System.out.println("insert into print sales done");

                //exporting to pdf
                JasperDesign jasperDesign = JRXmlLoader.load("oneDate.jrxml");
                JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);

                JasperViewer.viewReport(jasperPrint, false);
                // new Printer(jasperPrint, "POS-58C");
                System.out.println("printing done");
                // new PDFPrinter(jasperPrint, "", today.getText());


                //delete from print sales
                PreparedStatement preparedStatement = connection.prepareStatement("delete from printsales");
                preparedStatement.executeUpdate();
                System.out.println("delete from print sales");
            } catch (Exception e) {
                e.printStackTrace();
            }


        }


    }

    private void searchWithInvoiceNumber() {
        try {
            FilteredList<Sale> searchedData = new FilteredList<>(listOfAllSales, e -> true);

            searchField.setOnKeyReleased(e -> {
                searchField.textProperty().addListener((observable, oldValue, newValue) -> {
                    searchedData.setPredicate(sales -> {
                        if (newValue == null || newValue.isEmpty()) {
                            return true;
                        }
                        String lowerCaseFilter = newValue.toLowerCase();
                        if (sales.getProductName().toLowerCase().contains(lowerCaseFilter)) {
                            return true;
                        } else return sales.getProductName().toLowerCase().contains(lowerCaseFilter);
                    });
                });

                SortedList<Sale> sortedData = new SortedList<>(searchedData);
                sortedData.comparatorProperty().bind(salesTableView.comparatorProperty());
                salesTableView.setItems(sortedData);

                listOfSearchresults.setAll(sortedData);
            });
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private void todaysSales() {


        try {
            listOfAllSales.clear();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM sales WHERE date ='" + Date.valueOf(LocalDate.now()) + "' GROUP BY TOTAL");
            ResultSet resultSet = preparedStatement.executeQuery();
            int counter = 0;
            Double totalAmount = 0.0;
            while (resultSet.next()) {
                counter += 1;
                totalAmount = totalAmount+resultSet.getDouble("total");
                listOfAllSales.add(new Sale(

                        resultSet.getString("customerName"),
                        resultSet.getString("productName"),
                        resultSet.getDouble("quantity"),
                        resultSet.getDouble("price"),
                        resultSet.getDouble("total"),
                        resultSet.getDouble("amountPaid"),
                        resultSet.getString("date"),
                        resultSet.getString("employeeName")));

            }

            salesTableView.setItems(listOfAllSales);
            lblAmount.setText(String.valueOf(totalAmount));
            lblSaleCount.setText(String.valueOf(counter));
            todaySales.setText("Total Sales");
            lblHeader.setText("Total Sales");


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    private void searchWithDate() {

        today.setText(LocalDate.now().toString());
        total.setCellValueFactory(new PropertyValueFactory<>("total"));
        unitPrice.setCellValueFactory(new PropertyValueFactory<>("price"));
        productName.setCellValueFactory(new PropertyValueFactory<>("productName"));
        date.setCellValueFactory(new PropertyValueFactory<>("date"));
        quantity.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        paidAmount.setCellValueFactory(new PropertyValueFactory<>("amountPaid"));
        employeeName.setCellValueFactory(new PropertyValueFactory<>("employeeName"));


        Connection connection = DBConnection.getConnection();
        ResultSet salesList;


        if (!(fromDate.getValue() == null) && !(toDate.getValue() == null)) {
            //  ObservableList<Sale> listOfProducts = FXCollections.observableArrayList();
            listOfAllSales.clear();
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM sales WHERE date between ? and ? GROUP BY total");
                preparedStatement.setDate(1, Date.valueOf(fromDate.getValue()));
                preparedStatement.setDate(2, Date.valueOf(toDate.getValue()));
                salesList = preparedStatement.executeQuery();
                int counter = 0;
                Double totalAmount = 0.0;
                while (salesList.next()) {
                    counter += 1;
                    totalAmount = totalAmount+salesList.getDouble("total");
                    listOfAllSales.add(new Sale(
                            salesList.getString("customerName"),
                            salesList.getString("productName"),
                            salesList.getDouble("quantity"),
                            salesList.getDouble("price"),
                            salesList.getDouble("total"),

                            salesList.getDouble("amountPaid"),
                            salesList.getString("date"),
                            salesList.getString("employeeName")));

                }

                salesTableView.setItems(listOfAllSales);
                lblSaleCount.setText(String.valueOf(counter));
                lblAmount.setText(String.valueOf(totalAmount));
                lblHeader.setText("Sales made from " + Date.valueOf(fromDate.getValue()) + " to " + Date.valueOf(toDate.getValue()));
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if (!(fromDate.getValue() == null) && (toDate.getValue() == null)) {

            listOfAllSales.clear();
            try {
                assert connection != null;
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM sales WHERE date =?");
                preparedStatement.setDate(1, Date.valueOf(fromDate.getValue()));

                ResultSet salesList2 = preparedStatement.executeQuery();
                //good to go
                while (salesList2.next()) {
                    listOfAllSales.add(new Sale(
                            salesList2.getString("customerName"),
                            salesList2.getString("productName"),
                            salesList2.getDouble("quantity"),
                            salesList2.getDouble("price"),
                            salesList2.getDouble("total"),

                            salesList2.getDouble("amountPaid"),
                            salesList2.getString("date"),
                            salesList2.getString("employeeName")));
                }

                salesTableView.setItems(listOfAllSales);
                lblHeader.setText("Sales made on " + Date.valueOf(fromDate.getValue()));
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else {
            //nothing to do yet
            System.out.println("nothing to do yet with search with date in Total Sales Report");
        }

    }

    private void setClearFields() {


        fromDate.setValue(null);
        toDate.setValue(null);

        getAllSales();
        lblHeader.setText("Today's Sales");
    }

    private void initializeTableColumns() {
        total.setCellValueFactory(new PropertyValueFactory<>("total"));
        unitPrice.setCellValueFactory(new PropertyValueFactory<>("salePrice"));
        productName.setCellValueFactory(new PropertyValueFactory<>("productName"));
        date.setCellValueFactory(new PropertyValueFactory<>("date"));
        quantity.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        paidAmount.setCellValueFactory(new PropertyValueFactory<>("amountPaid"));

        employeeName.setCellValueFactory(new PropertyValueFactory<>("employeeName"));
    }

    private void getAllSales() {

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM sales group by total");
            ResultSet salesList = preparedStatement.executeQuery();
            listOfAllSales.clear();


            Integer counter = 0;
            Double amount = 0.0;

            while (salesList.next()) {
                listOfAllSales.addAll(new Sale(
                        salesList.getString("customerName"),
                        salesList.getString("productName"),
                        salesList.getDouble("quantity"),
                        salesList.getDouble("price"),
                        salesList.getDouble("total"),
                        salesList.getDouble("amountPaid"),
                        salesList.getString("date"),
                        salesList.getString("employeeName")));

                counter += 1;
                amount = amount+salesList.getDouble("total");

            }

            lblAmount.setText(amount.toString() + " GH₵");
            lblSaleCount.setText(counter.toString());

            //salesTableView.getItems().setAll(listOfAllSales);
            salesTableView.setItems(listOfAllSales);
            todaySales.setText("Today's Sales");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
