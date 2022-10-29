package main.java.admin;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import main.java.entity.Product;
import main.java.others.DBConnection;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ResourceBundle;

public class AdminDashboardController implements Initializable {


    @FXML
    private Label totalUsersLabel;
    @FXML
    private Label totalCategoriesLabel;
    @FXML
    private Label totalProductsLabel;
    @FXML
    private Label totalSalesLabel;
    @FXML
    private Label dashboardDateLabel;


    @FXML
    private TableView<Product> highestSellingTableView;
    @FXML
    private TableColumn<Product, String> highestSellingNameColumn;
    @FXML
    private TableColumn<Product, String> highestSellingAmountColumn;
    @FXML
    private TableColumn<Product, String> highestSellingQuantityColumn;

    @FXML
    private TableView<Product> recentlyAddedProductsTableView;
    @FXML
    private TableColumn<Product, String> recentlyAddedProductNameColumn;
    @FXML
    private TableColumn<Product, String> recentlyAddedProductsDateColumn;
    @FXML
    private TableColumn<Product, String> recentlyAddedProductsQuantityColumn;


    @FXML
    private TableView<Product> outOfStockTableView;
    @FXML
    private TableColumn<Product, String> outOfStockNameColumn;
    @FXML
    private TableColumn<Product, String> outOfStockQuantityColumn;


    private void setDateLabel() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
        LocalDate localDate = LocalDate.now();
        System.out.println(localDate.getMonth() + "," + localDate.getDayOfMonth() + " " + localDate.getYear());
        String date = localDate.getMonth() + "," + localDate.getDayOfMonth() + " " + localDate.getYear();
        dashboardDateLabel.setText(date);
    }

    /**
     * select all users
     */
    private void selectAllUsers() {
        Connection connection = DBConnection.localConnection();
        try {

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT( *) FROM `user`");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                totalUsersLabel.setText(resultSet.getString(1));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * select all categories
     */
    private void selectAllCategories() {
        Connection connection = DBConnection.localConnection();
        try {

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT( *) FROM `categories`");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                totalCategoriesLabel.setText(resultSet.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * select all products out of stock
     */
    private void SelectAllOutOfStock() {
        Connection connection = DBConnection.localConnection();
        try {

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from products where stock <5 ORDER by productName DESC ");
             ResultSet resultSet = preparedStatement.executeQuery();
            ObservableList<Product> outOfStockList = FXCollections.observableArrayList();
            while (resultSet.next()) {
                outOfStockList.addAll(new Product(resultSet.getString("productName"), resultSet.getDouble("stock")));

            }
            outOfStockTableView.setItems(outOfStockList);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * select all products
     */
    private void selectAllProducts() {
        Connection connection = DBConnection.localConnection();
        try {

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT( productName) as productName FROM `products`");
            ResultSet resultSet = preparedStatement.executeQuery();
            ObservableList<String> recentlyAddedProductList = FXCollections.observableArrayList();
            while (resultSet.next()) {
                totalProductsLabel.setText(resultSet.getString(1));
                recentlyAddedProductList.addAll(resultSet.getString("productName"));
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * select all sales
     */
    private void selectAllSales() {
        Connection connection = DBConnection.localConnection();
        try {

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT( *) FROM `sales`");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                totalSalesLabel.setText(resultSet.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * select all high selling products
     */
    private void selectAllHighSellingProducts() {
        Connection connection = DBConnection.localConnection();
        try {

            ObservableList<Product> order = FXCollections.observableArrayList();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT productName, sum(total) as amount ,SUM(quantity) as total from sales GROUP by productName ORDER by SUM(quantity) DESC");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                order.addAll(new Product(resultSet.getString(1), resultSet.getDouble(2), resultSet.getDouble(3)));
            }
            highestSellingTableView.setItems(order);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * select all high selling products
     */
    private void selectRecentlyAddedProducts() {
        Connection connection = DBConnection.localConnection();
        try {

            ObservableList<Product> recentlyAdded = FXCollections.observableArrayList();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT productName,sum(stock) as quantity,dateAdded FROM products GROUP by productName ORDER BY dateAdded DESC");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                recentlyAdded.addAll(new Product(resultSet.getString(1), resultSet.getDouble(2), resultSet.getDate(3)));
            }
            recentlyAddedProductsTableView.setItems(recentlyAdded);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /***
     *
     * @param location
     * @param resources
     */

    @Override
    public void initialize(URL location, ResourceBundle resources) {
               highestSellingNameColumn.setCellValueFactory(new PropertyValueFactory<>("productName"));
        highestSellingAmountColumn.setCellValueFactory(new PropertyValueFactory<>("total"));
        highestSellingQuantityColumn.setCellValueFactory(new PropertyValueFactory<>("quantity"));




        recentlyAddedProductNameColumn.setCellValueFactory(new PropertyValueFactory<>("productName"));
        recentlyAddedProductsQuantityColumn.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        recentlyAddedProductsDateColumn.setCellValueFactory(new PropertyValueFactory<>("date"));


        outOfStockNameColumn.setCellValueFactory(new PropertyValueFactory<>("productName"));
        outOfStockQuantityColumn.setCellValueFactory(new PropertyValueFactory<>("quantity"));


        selectAllUsers();
        selectAllCategories();
        selectAllProducts();
        selectAllSales();
        SelectAllOutOfStock();
        selectRecentlyAddedProducts();
        selectAllHighSellingProducts();

        setDateLabel();
    }
}
