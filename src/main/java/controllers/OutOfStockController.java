package main.java.controllers;

import com.jfoenix.controls.JFXButton;

import de.jensd.fx.glyphs.fontawesome.FontAwesomeIconView;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;

import javafx.scene.layout.AnchorPane;
import javafx.scene.paint.Color;
import main.java.others.DBConnection;
import main.java.others.Item;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;
import java.util.ResourceBundle;

public class OutOfStockController implements Initializable {


    @FXML
    private FontAwesomeIconView btnAddIcon;
    @FXML
    private JFXButton btnSearch;
    @FXML
    private Button printOutOfStock;
    @FXML
    private AnchorPane itemPane;
    @FXML
    private AnchorPane itemListPane;
    @FXML
    private TableView<Item> tbl;
    @FXML
    private TableColumn<Item, String> productID;
    @FXML
    private TableColumn<Item, String> columnItemName;

    @FXML
    private TableColumn<Item, Double> columnPrice;
    @FXML
    private TableColumn<Item, Integer> columnStock;
    @FXML
    private TableColumn<Item, String> columnCategory;


    public static ArrayList<String> itemNames = new ArrayList<>();
    ObservableList<Item> outOfStk = FXCollections.observableArrayList();
    ObservableList<Item> listOfOutOfStock = FXCollections.observableArrayList();
    Connection con = DBConnection.getConnection();


    @Override
    public void initialize(URL location, ResourceBundle resources) {

        productID.setCellValueFactory(new PropertyValueFactory<>("barcode"));
        columnItemName.setCellValueFactory(new PropertyValueFactory<>("name"));
        columnStock.setCellValueFactory(new PropertyValueFactory<>("stock"));
        columnCategory.setCellValueFactory(new PropertyValueFactory<>("itemType"));
        columnPrice.setCellValueFactory(new PropertyValueFactory<>("salePrice"));
        columnCategory.setCellValueFactory(new PropertyValueFactory<>("category"));
        outOfStockList();
    }


    public void outOfStockList() {


        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE stock <=" + 5);
            ResultSet itemResultSet = ps.executeQuery();


            while (itemResultSet.next()) {

                listOfOutOfStock.addAll(new Item(itemResultSet.getString("barcodeField"),
                        itemResultSet.getString("productName"),
                        itemResultSet.getDouble("salePrice"),
                        itemResultSet.getDouble("stock"),
                        itemResultSet.getString("category"), itemResultSet.getString("description")));


            }
           /* for (Item i : listOfOutOfStock) {
                insertIntOutOfStock(i.getBarcode(), i.getName(), i.getSalePrice(), i.getStock(), i.getCategory(), i.getDescription());

            }*/
            tbl.setItems(listOfOutOfStock);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void insertIntOutOfStock(String barcode, String productName, double salePrice, double quantity, String category, String description) {

        try {
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO `printoutofstock`" +
                    "(`barcode`, `productName`, `salePrice`, `stock`, `category`, `description`) VALUES (?,?,?,?,?,?)");
            preparedStatement.setString(1, barcode);
            preparedStatement.setString(2, productName);
            preparedStatement.setDouble(3, salePrice);
            preparedStatement.setDouble(4, quantity);
            preparedStatement.setString(5, category);
            preparedStatement.setString(6, description);
            preparedStatement.executeUpdate();

            System.out.println("products inserted into out of stock");


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @FXML
    private void setPrintOutOfStock() {
        for (Item i : listOfOutOfStock) {
            insertIntOutOfStock(i.getBarcode(), i.getName(), i.getSalePrice(), i.getStock(), i.getCategory(), i.getDescription());

        }
        try {
            //exporting to pdf
            JasperDesign jasperDesign = JRXmlLoader.load("outOfStock.jrxml");
            JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, con);
            System.out.println();
            JasperViewer.viewReport(jasperPrint, false);
            System.out.println("printing done");

            try {
                PreparedStatement preparedStatement = con.prepareStatement("delete from printoutofstock");
                preparedStatement.executeUpdate();

                System.out.println("deleting from outofstock done");


            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}


