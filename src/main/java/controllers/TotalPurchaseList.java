package main.java.controllers;


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
import main.java.entity.Purchases;
import main.java.entity.Sale;
import main.java.others.DBConnection;
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

public class TotalPurchaseList implements Initializable {
    @FXML
    private TableView<Purchases> purchasesTableView;

    @FXML
    private DatePicker fromDate;

    @FXML
    private Button searchButton, printButton, exportToPDFButton;
    @FXML
    private Button clearFields, searchFieldButton;
    @FXML
    private DatePicker toDate;
    @FXML
    private TextField searchField;

    @FXML
    private TableColumn<Purchases, String> barcode;
    @FXML
    private TableColumn<Purchases, String> companyName;
    @FXML
    private TableColumn<Purchases, String> purchasedPrice;
    @FXML
    private TableColumn<Purchases, String> productName;
    @FXML
    private TableColumn<Purchases, String> total;
    @FXML
    private TableColumn<Purchases, Date> date;
    @FXML
    private TableColumn<Purchases, Double> quantity;

    @FXML
    private TableColumn<Purchases, String> employeeName;
    @FXML
    private Label purchaseCount;
    @FXML
    private Label lblHeader, lblDue, today;
    @FXML
    private Label lblAmount;
    ObservableList<Purchases> listOfaLLPurchases;


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        searchFieldButton.setGraphic(new FontAwesomeIconView(FontAwesomeIcon.SEARCH));
        searchFieldButton.setTooltip(new Tooltip("Search With Invoice"));
        searchField.setPromptText("Search with Invoice");
        searchButton.setOnAction(e -> searchWithDate());
        //exportToPDFButton.setOnAction(e -> setExportToPDFButton());

        initializeTableColumns();
        getAllPurchasesFromDB();
        searchWithInvoiceNumber();
        today.setText(LocalDate.now().toString());

    }
    private void print() {
        Connection connection = DBConnection.getConnection();

        if (!searchField.getText().equals("")&& !purchasesTableView.getItems().isEmpty()) {

            try {

                for (Purchases purchases : listOfaLLPurchases) {
                    PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `printpurchases`(`productName`, `quantity`, `salePrice`, `total`, `date`, `employeeName`) VALUES (?,?,?,?,?,?)");
                    preparedStatement.setString(1, purchases.getProductName());
                    System.out.println();
                    preparedStatement.setDouble(2, purchases.getQuantity());
                    preparedStatement.setDouble(3, purchases.getTotal();
                    preparedStatement.setDouble(4, purchases.getTotal());
                    preparedStatement.setString(5, String.valueOf(purchases.getDate()));
                    preparedStatement.setString(6, purchases.getEmployeeName());
                    preparedStatement.executeUpdate();
                    System.out.println("products inserted into  print purchases");
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

                PreparedStatement preparedStatement = connection.prepareStatement("delete from printpurchases");
                preparedStatement.executeUpdate();
                System.out.println("delete from print sales");


            } catch (Exception e) {
                e.printStackTrace();
                System.out.println();
            }

        } else if ((searchFieldButton.getText().isEmpty()) && fromDate.getValue() == null && !(purchasesTableView.getItems() == null)) {

            try {

                for (Purchases purchases : listOfaLLPurchases) {
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


                for (Purchases purchases : listOfaLLPurchases) {
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

                for (Purchases purchases : listOfaLLPurchases) {

                    PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `printsales`(`productName`, `quantity`, `salePrice`, `total`, `date`, `employeeName`, `invoiceNumber`, `fromDate`) VALUES (?,?,?,?,?,?,?,?)");
                    preparedStatement.setString(1, purchases.getProductName());
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


    @FXML
    private void setExportToPDFButton() {
        System.out.println("not working");
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setContentText("Export under development");
        ButtonType ok = new ButtonType("OK");
        alert.getButtonTypes().setAll(ok);
        alert.setOnCloseRequest(e -> alert.close());
        alert.showAndWait();
    }

    private void searchWithDate() {

        Connection connection = DBConnection.getConnection();


        if (!(fromDate.getValue() == null) && !(toDate.getValue() == null)) {
            ObservableList<Purchases> listOfPurchasesBoth = FXCollections.observableArrayList();

            try {
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM purchases WHERE date between ? and ?");
                preparedStatement.setDate(1, Date.valueOf(fromDate.getValue()));
                preparedStatement.setDate(2, Date.valueOf(toDate.getValue()));
                ResultSet resultSet = preparedStatement.executeQuery();
                int count = 0;
                while (resultSet.next()) {
                    count = +1;
                    listOfPurchasesBoth.addAll(new Purchases(
                            resultSet.getString("barcode"),
                            resultSet.getString("productName"),
                            resultSet.getDouble("quantity"),
                            resultSet.getDouble("purchasedPrice"),
                            resultSet.getDouble("total"),
                            resultSet.getDate("date"),
                            resultSet.getString("companyName"),
                            resultSet.getString("employeeName")));

                }

                purchasesTableView.getItems().setAll(listOfPurchasesBoth);
                purchaseCount.setText(String.valueOf(count));
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if (!(fromDate.getValue() == null) && (toDate.getValue() == null)) {
            ObservableList<Purchases> listOfPurchaseOneDate = FXCollections.observableArrayList();


            try {
                assert connection != null;
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM purchases WHERE date =?");
                preparedStatement.setDate(1, Date.valueOf(fromDate.getValue()));
                int count = 0;
                ResultSet resultSet2 = preparedStatement.executeQuery();
                //good to go
                while (resultSet2.next()) {
                    count = +1;
                    listOfPurchaseOneDate.addAll(new Purchases(
                            resultSet2.getString("barcode"),
                            resultSet2.getString("productName"),
                            resultSet2.getDouble("quantity"),
                            resultSet2.getDouble("purchasedPrice"),
                            resultSet2.getDouble("total"),
                            resultSet2.getDate("date"),
                            resultSet2.getString("companyName"),
                            resultSet2.getString("employeeName")));
                }

                purchasesTableView.getItems().setAll(listOfPurchaseOneDate);
                purchaseCount.setText(String.valueOf(count));
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else {
            //nothing to do yet
            System.out.println("nothing to do yet with search with date in Total Sales Report");
        }

    }


    private void searchWithInvoiceNumber() {
        try {
            FilteredList<Purchases> searchedData = new FilteredList<>(listOfaLLPurchases, e -> true);

            searchField.setOnKeyReleased(e -> {
                searchField.textProperty().addListener((observable, oldValue, newValue) -> {
                    searchedData.setPredicate(purchases -> {
                        if (newValue == null || newValue.isEmpty()) {
                            return true;
                        }
                        String lowerCaseFilter = newValue.toLowerCase();
                        if (purchases.getBarcode().toLowerCase().contains(lowerCaseFilter)) {
                            return true;

                        } else return purchases.getBarcode().toLowerCase().contains(lowerCaseFilter);
                    });
                });

                SortedList<Purchases> sortedData = new SortedList<>(searchedData);
                sortedData.comparatorProperty().bind(purchasesTableView.comparatorProperty());
                purchasesTableView.setItems(sortedData);
            });
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private void initializeTableColumns() {
        barcode.setCellValueFactory(new PropertyValueFactory<>("barcode"));
        companyName.setCellValueFactory(new PropertyValueFactory<>("companyName"));
        purchasedPrice.setCellValueFactory(new PropertyValueFactory<>("purchasedPrice"));
        productName.setCellValueFactory(new PropertyValueFactory<>("productName"));
        date.setCellValueFactory(new PropertyValueFactory<>("date"));
        quantity.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        employeeName.setCellValueFactory(new PropertyValueFactory<>("employeeName"));
        total.setCellValueFactory(new PropertyValueFactory<>("total"));
    }

    private void getAllPurchasesFromDB() {

        Connection connection = DBConnection.getConnection();
        listOfaLLPurchases = FXCollections.observableArrayList();
        int count = 0;
        Double totalAmount = 0.00;

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT *, sum(total) as amount  from purchases GROUP by productName ORDER by date DESC");

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                count += 1;
                listOfaLLPurchases.addAll( new Purchases(
                        resultSet.getString("barcode"),
                        resultSet.getString("productName"),
                        resultSet.getDouble("quantity"),
                        resultSet.getDouble("purchasedPrice"),
                        resultSet.getDouble("total"),
                        resultSet.getDate("date"),
                        resultSet.getString("companyName"),
                        resultSet.getString("employeeName")));
                totalAmount += Double.valueOf(resultSet.getString("amount"));

            }

            purchasesTableView.getItems().setAll(listOfaLLPurchases);
            purchaseCount.setText(String.valueOf(count));
            lblAmount.setText(String.valueOf(totalAmount));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
