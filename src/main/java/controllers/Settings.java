package main.java.controllers;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.util.Duration;
import main.java.backup.Backup;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ProgressBar;
import javafx.scene.layout.VBox;
import main.java.others.DBConnection;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ResourceBundle;

public class Settings implements Initializable {


    @FXML
    private JFXTextField previousCompanyNameField;

    @FXML
    private JFXTextField newCompanyNameField;

    @FXML
    private JFXTextArea previousAddressField;

    @FXML
    private JFXTextArea newAddressField;

    @FXML
    private JFXTextField previousPhoneNumber;

    @FXML
    private JFXTextField newPhoneNumber;

    @FXML
    private JFXTextField emailField;

    @FXML
    private Button saveCompanyInfoButton;

    @FXML
    private Button backupButton;

    @FXML
    private ProgressBar backupProgressBar;
    Connection connection;


    public boolean validatePhoneNumber(String phoneNumber) {
        try {
            if (phoneNumber.contains("a-zA-Z") || phoneNumber.length() > 11) {
                TrayNotification notification = new TrayNotification();
                notification.setTray("ERROR", "Phone Number cannot contain Alphabet", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public void insertNewInfo() {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `companyinfo`(`name`, `address`, `conatct`, `email`) VALUES (?,?,?,?)");
            if (newCompanyNameField.getText().isEmpty()) {
                preparedStatement.setString(1, previousCompanyNameField.getText());

            } else {
                preparedStatement.setString(1, newCompanyNameField.getText());

            }
            if (newAddressField.getText().isEmpty()) {
                preparedStatement.setString(2, previousAddressField.getText());

            } else {
                preparedStatement.setString(2, newAddressField.getText());

            }

            if (newPhoneNumber.getText().isEmpty()) {

                preparedStatement.setString(3, previousPhoneNumber.getText());

            } else {
                if (validatePhoneNumber(newPhoneNumber.getText())) {
                    preparedStatement.setString(3, newPhoneNumber.getText());
                }
            }
            if (!emailField.getText().isEmpty()) {
                preparedStatement.setString(4, emailField.getText());

            }
            preparedStatement.executeUpdate();
            System.out.println("insert Success");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void getExistingData() {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from companyInfo");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                previousCompanyNameField.setText(resultSet.getString("name"));
                previousAddressField.setText(resultSet.getString("address"));
                previousPhoneNumber.setText(resultSet.getString("contact"));
                emailField.setText(resultSet.getString("email"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public void backingUp() {
        Thread thread = new Thread(backup);
        thread.start();


    }

    Runnable backup = new Runnable() {
        @Override
        public void run() {
            backupAction();
        }


    };

    private void backupAction() {

        Backup backup = new Backup();
        backup.backupDatabase(backupProgressBar, "C:\\xampp\\mysql\\bin\\mysqldump.exe", "inventory", "root", "back.sql");


    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        previousCompanyNameField.setEditable(false);
        previousPhoneNumber.setEditable(false);
        previousAddressField.setEditable(false);
        connection = DBConnection.getConnection();
        getExistingData();
        saveCompanyInfoButton.setOnAction(e -> {
            insertNewInfo();
            getExistingData();
        });
        backupButton.setOnAction(e -> {


            try {
                backingUp();
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `companyinfo`(`lastBackUpTime`) VALUES (?)");
                preparedStatement.setDate(1, Date.valueOf(String.valueOf(LocalDateTime.now())));
                TrayNotification notification=new TrayNotification();
                notification.setTray("Backup","Backup Successful",NotificationType.SUCCESS);
                notification.showAndDismiss(Duration.seconds(3));
            } catch (Exception e1) {
                e1.printStackTrace();
            }

        });
    }
}
