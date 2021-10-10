package main.java.admin;

import com.jfoenix.controls.JFXTextField;
import main.java.others.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class PurchasesInvoiceGenerator {


    Connection connection = DBConnection.getConnection();


    public PurchasesInvoiceGenerator(JFXTextField invoiceNumberField, String DBTable) throws SQLException {
        try {
            String dbName = "purchasescart";
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT MAX(invoiceNumber) FROM " + dbName);
            ResultSet resultSet1 = preparedStatement.executeQuery();
            if (resultSet1.next()) {
                long id = Long.parseLong(resultSet1.getString("MAX(invoiceNumber)").substring(4));
                id++;
                invoiceNumberField.setText("INV-" + String.format("%07d", id));
            }

        } catch (Exception ex) {
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
            }finally {
                connection.close();
            }
        } finally {
            connection.close();
        }
    }


}
