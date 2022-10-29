package main.java.controllers;

import com.jfoenix.controls.*;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.layout.AnchorPane;
import javafx.util.Duration;
import main.java.others.DBConnection;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ResourceBundle;


public class NewEmployeeController implements Initializable {
    @FXML
    private JFXTextField txtUsername;
    @FXML
    private JFXTextField txtPhone;
    @FXML
    private JFXTextField txtUserID;

    @FXML
    private JFXTextField txtEmail;
    @FXML
    private JFXComboBox<String> cboAccessLevel;
    @FXML
    private JFXPasswordField txtPass;
    @FXML
    private AnchorPane empPane;
    @FXML
    private JFXPasswordField txtPassConf;
    @FXML
    private JFXButton addEmployee;
    @FXML
    void saveEmployee(ActionEvent event) {
        boolean flag = true;

        if(txtUsername.getText().equals("") || txtEmail.getText().equals("") || txtPass.equals("") || txtPass.equals("")) {

            TrayNotification notification= new TrayNotification();
            notification.setTray("Operation failed","Fields can not be empty!", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
        } else if(!txtPass.getText().equals(txtPassConf.getText())) {
            flag = false;

            TrayNotification notification= new TrayNotification();
            notification.setTray("Operation failed","Passwords did not match", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
        }

        else {
            Connection con = DBConnection.serverConnection();
            try {
                PreparedStatement ps = con.prepareStatement("INSERT INTO user(userID, username, password, email, phone, accessLevel) VALUES (?,?,?,?,?,?)");
               ps.setInt(1, Integer.parseInt(txtUserID.getText()));
                ps.setString(2, txtUsername.getText());
                ps.setString(3, txtPass.getText());
                ps.setString(4, txtEmail.getText());
                ps.setString(5, txtPhone.getText());
                ps.setString(6, cboAccessLevel.getValue());

                ps.executeUpdate();

                txtPass.getScene().getWindow().hide();
                TrayNotification notification= new TrayNotification();
                notification.setTray("Operation Successful","New Employee added! You can now log in with the given credentials.", NotificationType.SUCCESS);
                notification.showAndDismiss(Duration.seconds(3));
               // new PromptDialogController("Operation Successful", "New Employee added! You can now log in with the given credentials.");
            } catch (SQLException e) {
                if(e.getErrorCode() == 1062) {
                   // new PromptDialogController("Operation failed", "This username is already taken. Try another!");
                    TrayNotification notification= new TrayNotification();
                    notification.setTray("Operation failed","This username is already taken. Try another!", NotificationType.ERROR);
                    notification.showAndDismiss(Duration.seconds(3));
                }
            }catch (NumberFormatException ee){
                TrayNotification notification= new TrayNotification();
                notification.setTray("User ID","Please Enter user ID", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));
            }
        }
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        ObservableList<String> accessLevel = FXCollections.observableArrayList();
        accessLevel.addAll("Admin", "Employee");
        cboAccessLevel.setItems(accessLevel);
        cboAccessLevel.setValue("Employee");
    }
}
