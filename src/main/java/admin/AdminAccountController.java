package main.java.admin;

import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import main.java.controllers.LogInController;
import main.java.controllers.PromptDialogController;
import main.java.others.DBConnection;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class AdminAccountController implements Initializable {


    @FXML
    private JFXTextField employeeUserName;
    @FXML
    private Label lblId;
    @FXML
    private JFXTextField emailField;
    @FXML
    private PasswordField confirmPassword;

    @FXML
    private AnchorPane innerAnchorPane;
    @FXML
    private PasswordField newPassword;
    @FXML
    private PasswordField currentPassword;

    @FXML
    private JFXTextField phoneNumberField;
    @FXML
    private JFXPasswordField password = new JFXPasswordField();
    @FXML
    private HBox passwordHBox;


    @FXML
    private Button saveChangePassword;

    @FXML
    private Pane pane;
    @FXML
    private Label forgotPasswordLabel;

    @FXML
    private AnchorPane accountPane;


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        passwordHBox.getChildren().setAll(password);
        password.setEditable(false);
        password.setPrefWidth(284);
        password.setPrefHeight(44);
        password.setAlignment(Pos.CENTER);

        initiate();


        pane.setVisible(false);


        forgotPasswordLabel.setOnMouseClicked(e -> pane.setVisible(true));

        forgotPasswordLabel.setOnMouseEntered(e -> forgotPasswordLabel.setUnderline(true));

        forgotPasswordLabel.setOnMouseExited(e -> forgotPasswordLabel.setUnderline(false));

        saveChangePassword.setOnAction(e -> {

            changePassword();

        });
        currentPassword.setOnMouseClicked(e -> currentPassword.setStyle("-fx-border-color: null"));
        newPassword.setOnMouseClicked(e -> newPassword.setStyle("-fx-border-color: null"));
        confirmPassword.setOnMouseClicked(e -> confirmPassword.setStyle("-fx-border-color: null"));
    }


    public void changePassword() {
        if (currentPassword.getText().matches(password.getText())) {
            if (newPassword.getText().isEmpty() || newPassword.getText() == null) {
                newPassword.setStyle("-fx-border-color: red");

                // new PromptDialogController("Empty Field", "Password Field Cannot be Empty");

            } else if (confirmPassword.getText().isEmpty() || confirmPassword.getText() == null) {
                confirmPassword.setStyle("-fx-border-color: red");
                // new PromptDialogController("Empty Field", "Password Field Cannot be Empty");

            } else {
                if (checkChangePasswords()) {
                    Connection localConnection = DBConnection.localConnection();
                    Connection serverConnection = DBConnection.serverConnection();
                    try {
                        PreparedStatement localPreparedStatement = localConnection.prepareStatement("update user set password=? where username=?");
                        PreparedStatement serverPreparedStatement = localConnection.prepareStatement("update user set password=? where username=?");
                        localPreparedStatement.setString(1, newPassword.getText().trim());
                        localPreparedStatement.setString(2, employeeUserName.getText());

                        serverPreparedStatement.setString(1, newPassword.getText().trim());
                        serverPreparedStatement.setString(2, employeeUserName.getText());
                        serverPreparedStatement.executeUpdate();
                        localPreparedStatement.executeUpdate();
                        System.out.println("Password for " + employeeUserName.getText() + " has been changed successfully");
                        new PromptDialogController("Password Change", "Password Changed Successfully");
                        pane.setVisible(false);

                    } catch (Exception e) {
                        new PromptDialogController("Can't Save Password", "Cant connect to Database");
                        e.printStackTrace();
                    }
                } else {
                    new PromptDialogController("Can't Save Password", "Password Does not match...");
                }
            }

        } else {
            currentPassword.setStyle("-fx-border-color: red");
        }

    }


    public boolean checkChangePasswords() {
        return confirmPassword.getText().matches(newPassword.getText());

    }


    private void initiate() {

        //Getting highest account ID to set the next
        try {
            Connection localConnection = DBConnection.localConnection();

            PreparedStatement localPs = localConnection.prepareStatement("SELECT * FROM user where username=?");
            localPs.setString(1, LogInController.loggerUsername);
            ResultSet rs = localPs.executeQuery();

            while (rs.next()) {
                System.out.println();
                lblId.setText(String.valueOf(rs.getInt("userID")));
                employeeUserName.setText(rs.getString("username"));
                phoneNumberField.setText(rs.getString("phone"));
                password.setText(rs.getString("password"));

            }
        } catch (SQLException e) {
            new PromptDialogController("SQL Error!", "Error occured while executing Query.\nSQL Error Code: " + e.getErrorCode());
            e.printStackTrace();
        }


    }


}




