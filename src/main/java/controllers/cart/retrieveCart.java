package main.java.controllers.cart;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.control.TableView;
import main.java.entity.Product;
import main.java.others.DBConnection;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class retrieveCart {
    Connection connection = DBConnection.localConnection();



    private void getcart(TableView<Product> productTableView ) {
        ObservableList<Product>productList= FXCollections.observableArrayList();

        try {
            PreparedStatement getCartStatement = connection.prepareStatement("select * from cart");
            ResultSet resultSet = getCartStatement.executeQuery();
            while (resultSet.next()) {
                productList.addAll(new Product(resultSet.getString("productName"),resultSet.getDouble("salePrice"),resultSet.getDouble("quantity"),
                        resultSet.getDouble("total")));
            }
            productTableView.getItems().clear();
            productTableView.setItems(productList);
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }


}
