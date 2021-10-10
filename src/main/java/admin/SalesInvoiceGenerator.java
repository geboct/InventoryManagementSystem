package main.java.admin;

import com.jfoenix.controls.JFXTextField;
import main.java.others.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SalesInvoiceGenerator {

    Connection connection = DBConnection.getConnection();


    public SalesInvoiceGenerator(JFXTextField invoiceNumberField, String DBTable) {

            try {
                PreparedStatement statement = connection.prepareStatement("SELECT MAX(invoiceNumber) FROM " + DBTable);

                ResultSet resultSet = statement.executeQuery();
                resultSet.next();
                resultSet.getString("MAX(invoiceNumber)");
                if (resultSet.getString("MAX(invoiceNumber)") == null) {

                    invoiceNumberField.setText("INV-0000001");
                } else {
                    long id = Long.parseLong(resultSet.getString("MAX(invoiceNumber)").substring(4));
                    id++;
                    invoiceNumberField.setText("INV-" +
                            "" + String.format("%07d", id));
                }

            } catch (Exception ee) {
                ee.printStackTrace();
            }

    }

}
