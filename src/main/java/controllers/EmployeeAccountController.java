package main.java.controllers;

import javafx.fxml.FXML;
import javafx.scene.Cursor;
import javafx.scene.control.*;
import javafx.fxml.Initializable;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.util.Duration;
import main.java.employee.EmployeeBaseController;
import main.java.others.DBConnection;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;


public class EmployeeAccountController implements Initializable {
    @FXML
    private Label idLabel;
    @FXML
    private Label fullNameLabel;

    @FXML
    private Button passwordButton;
    @FXML
    private Button usernameButton;
    @FXML
    private Button saveUsernameButton;
    @FXML
    private Button phoneButton;
    @FXML
    private AnchorPane usernameAnchorPane;
    @FXML
    private TextField currentUsername;
    @FXML
    private TextField newUsername;
    @FXML
    private AnchorPane passwordAnchorPane;
    @FXML
    private PasswordField currentPassword;
    @FXML
    private TextField currentPasswordView;
    @FXML
    private CheckBox viewPasswordCheckBox;
    @FXML
    private PasswordField newPassword;
    @FXML
    private PasswordField confirmPassword;
    @FXML
    private Button savePasswordButton;
    @FXML
    private AnchorPane phoneAnchorPane;

    @FXML
    private TextField oldPhoneTextField;
    @FXML
    private TextField newPhoneField;
    @FXML
    private Button savePhoneButton;
    Connection connection = DBConnection.getConnection();

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        usernameButton.setOnAction(e -> {
            usernameAnchorPane.setVisible(true);
            passwordAnchorPane.setVisible(false);
            phoneAnchorPane.setVisible(false);
            setUsernameButton();

        });

        passwordButton.setOnAction(e -> {
            passwordAnchorPane.setVisible(true);
            usernameAnchorPane.setVisible(false);
            phoneAnchorPane.setVisible(false);
            setChangePassword();
        });
        phoneButton.setOnAction(e -> {
            phoneAnchorPane.setVisible(true);
            usernameAnchorPane.setVisible(false);
            passwordAnchorPane.setVisible(false);
            setPhoneButton();
        });

        setUsernameButton();
        idAndFullName();
        usernameAnchorPane.setVisible(true);
        currentPasswordView.setVisible(false);

        viewPasswordCheckBox.setOnAction(e -> {
            if (viewPasswordCheckBox.isSelected()) {
                currentPasswordView.setVisible(true);
                currentPassword.setVisible(false);
            } else {
                currentPasswordView.setVisible(false);
                currentPassword.setVisible(true);
            }
        });


    }


    private void setUsernameButton() {

        try {

            PreparedStatement preparedStatement = connection.prepareStatement("select * from user where username ='" + LogInController.loggerUsername + "'");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                currentUsername.setText(resultSet.getString("username"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


    private void setPhoneButton() {

        try {
            String currentPhone = "";
            PreparedStatement preparedStatement = connection.prepareStatement("select * from user where username ='" + LogInController.loggerUsername + "'");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                currentPhone = resultSet.getString("phone");

            }

            oldPhoneTextField.setText(currentPhone);
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


    private void setChangePassword() {

        try {

            PreparedStatement preparedStatement = connection.prepareStatement("select * from user  where username ='" + LogInController.loggerUsername + "'");

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                currentPassword.setText(resultSet.getString("password"));
                currentPasswordView.setText(resultSet.getString("password"));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @FXML
    private void onButtonHover(MouseEvent event) {
        if (event.getSource().equals(usernameButton)) {
            usernameButton.setStyle("-fx-text-fill: black");
            usernameButton.setCursor(Cursor.HAND);
        } else if (event.getSource().equals(passwordButton)) {
            passwordButton.setStyle("-fx-text-fill: black");
            passwordButton.setCursor(Cursor.HAND);
        } else if (event.getSource().equals(phoneButton)) {
            phoneButton.setStyle("-fx-text-fill: black");
            phoneButton.setCursor(Cursor.HAND);

        } else if (event.getSource().equals(saveUsernameButton)) {
            saveUsernameButton.setStyle("-fx-text-fill: black");
            saveUsernameButton.setCursor(Cursor.HAND);

        } else if (event.getSource().equals(savePasswordButton)) {
            savePasswordButton.setStyle("-fx-text-fill: black");
            savePasswordButton.setCursor(Cursor.HAND);

        } else if (event.getSource().equals(savePhoneButton)) {
            savePhoneButton.setStyle("-fx-text-fill: black");
            savePhoneButton.setCursor(Cursor.HAND);

        }
    }

    @FXML
    private void onButtonHoverExit(MouseEvent event) {
        if (event.getSource().equals(usernameButton)) {
            usernameButton.setStyle("-fx-text-fill: black");
        } else if (event.getSource().equals(passwordButton)) {
            passwordButton.setStyle("-fx-text-fill: black");
        } else if (event.getSource().equals(phoneButton)) {
            phoneButton.setStyle("-fx-text-fill: black");
        } else if (event.getSource().equals(saveUsernameButton)) {
            saveUsernameButton.setStyle("-fx-text-fill: black");
        } else if (event.getSource().equals(savePasswordButton)) {
            savePasswordButton.setStyle("-fx-text-fill: black");
        } else if (event.getSource().equals(savePhoneButton)) {
            savePasswordButton.setStyle("-fx-text-fill: black");
        }
    }


    private void idAndFullName() {

        try {
            String currentName = "";

            String id = "";
            PreparedStatement preparedStatement = connection.prepareStatement("select * from user where username ='" + LogInController.loggerUsername + "'");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                currentName = resultSet.getString("fullName");
                id = resultSet.getString("userId");

            }
            idLabel.setText(id);
            fullNameLabel.setText(currentName);
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


    @FXML
    private void saveUsername() {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update user set username=? where username=?");
            preparedStatement.setString(1, newUsername.getText());
            preparedStatement.setString(2, currentUsername.getText());
            preparedStatement.executeUpdate();
            LogInController.loggerUsername = newUsername.getText();
            EmployeeBaseController controller = new EmployeeBaseController();
            controller.getLoginUsername();

            setUsernameButton();

            newUsername.setText("");


            TrayNotification notification = new TrayNotification();
            notification.setTray("UPDATE", "username update Successfully", NotificationType.SUCCESS);
            notification.showAndDismiss(Duration.seconds(3));
        } catch (SQLException e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("UPDATE", "unable to update username", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            e.printStackTrace();
        }
    }


    @FXML
    private void savePassword() {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update user set password=? where username=?");
            preparedStatement.setString(1, newPassword.getText());
            preparedStatement.setString(2, currentUsername.getText());
            preparedStatement.executeUpdate();
            setChangePassword();
            newPassword.setText("");
            confirmPassword.setText("");


            TrayNotification notification = new TrayNotification();
            notification.setTray("UPDATE", "password changed Successfully", NotificationType.SUCCESS);
            notification.showAndDismiss(Duration.seconds(3));
        } catch (SQLException e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("UPDATE", "unable to update password", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            e.printStackTrace();
        }
    }


    @FXML
    private void savePPhone() {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update user set phone=? where username=?");
            preparedStatement.setString(1, newPhoneField.getText());
            preparedStatement.setString(2, currentUsername.getText());
            preparedStatement.executeUpdate();
            setChangePassword();


            TrayNotification notification = new TrayNotification();
            notification.setTray("UPDATE", "Phone Number changed Successfully", NotificationType.SUCCESS);
            notification.showAndDismiss(Duration.seconds(3));
        } catch (SQLException e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("UPDATE", "unable to update Phone Number", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            e.printStackTrace();
        }
    }
}
