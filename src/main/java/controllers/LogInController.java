package main.java.controllers;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXCheckBox;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.stage.Stage;
import javafx.util.Duration;
import main.java.others.DBConnection;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.io.*;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ResourceBundle;


public class LogInController implements Initializable {
    @FXML
    private JFXButton btnLogIn;
    @FXML
    private Label forgotPasswordLabel;
    @FXML
    private JFXTextField txtUsername;
    @FXML
    private Label lblWarnUsername;
    @FXML
    private Label lblWarnPassword;
    @FXML
    private JFXPasswordField txtPassword;
    @FXML
    private JFXTextField txtPasswordShown;
    @FXML
    private JFXCheckBox chkPasswordMask;
    @FXML
    private JFXCheckBox chkSaveCredentials;
    private static final String DIALOG_URL = "/main/resources/view/dialog.fxml";
    private static final String RED = "-fx-text-fill: red";
    public static String loggerUsername = "";
    public static String loggerAccessLevel = "";
    Connection connection = DBConnection.localConnection();

    @FXML
    void ctrlLogInCheck(ActionEvent event) {
        userLogger();
    }

    @FXML
    void onEnterKey(KeyEvent event) {
        if (event.getCode().equals(KeyCode.ENTER)) {
            userLogger();
        }
    }

    @FXML
    public void chkPasswordMaskAction() {
        if (chkPasswordMask.isSelected()) {
            txtPasswordShown.setText(txtPassword.getText());
            txtPasswordShown.setVisible(true);
            txtPassword.setVisible(false);
        } else {
            txtPassword.setText(txtPasswordShown.getText());
            txtPassword.setVisible(true);
            txtPasswordShown.setVisible(false);
        }
    }


    private void getLastLogin() {


        try {

            PreparedStatement preparedStatement = connection.prepareStatement("update user set lastLogin=? where username=?");
            preparedStatement.setString(1, String.valueOf(LocalDateTime.now()));
            preparedStatement.setString(2, loggerUsername);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("couldn't update last login");
        }
    }

    /**
     * This method will set the previous saved username
     * password if any. In addition this method is responsible
     * for password visibility toggling
     */
    @Override
    public void initialize(java.net.URL location, ResourceBundle resources) {
txtPasswordShown.setVisible(false);

       /* try {
            PreparedStatement getCredents = connection.prepareStatement("SELECT * FROM usercredents");
            ResultSet resultSet = getCredents.executeQuery();

            if (resultSet.next()) {
                txtUsername.setText(resultSet.getString(1)); //Getting Saved Username
                txtPassword.setText(resultSet.getString(2)); //Getting Saved Password
            }
            txtPasswordShown.setVisible(false);

            txtUsername.setOnMouseClicked(event -> {
                lblWarnUsername.setVisible(false);
            });

            txtPasswordShown.setOnMouseClicked(event -> {
                lblWarnPassword.setVisible(false);
            });

            txtPassword.setOnMouseClicked(event -> {
                lblWarnPassword.setVisible(false);
            });


        } catch (SQLException e) {
            e.printStackTrace();
        }
*/

       

    }

    /**
     *
     */
    private void userLogger() {
        //Taking input from the username & password fields
        String username = txtUsername.getText();
        String password;

        //Getting input from the field in which
        //user inputted password.
        //Note: We have two password field.
        //One for visible password and another for hidden.
        if (chkPasswordMask.isSelected())
            password = txtPasswordShown.getText();
        else
            password = txtPassword.getText();

        //Checking if any fields were blank
        //If not then we're attempting to connect to DB
        TrayNotification notification = new TrayNotification();

        if (username.equals("")) {
            notification.setTray("", "Incorrect username", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            // lblWarnUsername.setVisible(true);
        } else if (password.equals("")) {
            notification.setTray("", "Incorrect password", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            // lblWarnPassword.setVisible(true);
        } else {
            try {

                String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
                PreparedStatement ps = connection.prepareStatement(sql);

                ps.setString(1, username);
                ps.setString(2, password);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    //Setting user credentials for further processing
                    loggerUsername = rs.getString("username");
                    loggerAccessLevel = rs.getString("accessLevel");


                    if (loggerAccessLevel.equals("Employee")) {
                        Parent root = null;
                        Stage base = new Stage();

                        try {
                            getLastLogin();
                            root = FXMLLoader.load(getClass().getResource("/main/resources/view/baseEmployee.fxml"));
                            Scene scene = new Scene(root);
                           // String css = this.getClass().getResource("/main/resources/css/base.css").toExternalForm();
                            //scene.getStylesheets().add(css);
                            base.setTitle("Inventory System");
                            base.getIcons().setAll(new Image("/images/logo.png"));
                            base.getIcons().add(new Image("/main/resources/icons/inventory.png"));
                            base.setScene(scene);
                            base.setOnCloseRequest(ee -> ee.consume());
                            base.setMaximized(true);
                            base.show();
                            Stage logIn = (Stage) btnLogIn.getScene().getWindow(); //Getting current window
                            logIn.close();
                        } catch (IOException ex) {
                            ex.printStackTrace();
                        }
                    } else if (loggerAccessLevel.equals("Admin")) {

                        Parent root = null;
                        Stage base = new Stage();

                        try {
                            getLastLogin();
                            root = FXMLLoader.load(getClass().getResource("/main/resources/view/baseAdmin.fxml"));
                            Scene scene = new Scene(root);
                            String css = this.getClass().getResource("/main/resources/css/base.css").toExternalForm();
                           // scene.getStylesheets().add(css);
                            base.setTitle("Inventory System");
                            base.getIcons().setAll(new Image("/images/logo.png"));
                            base.setScene(scene);
                            base.setOnCloseRequest(ee -> {
                                ee.consume();
                            });
                            base.setMaximized(true);
                            base.show();
                            Stage logIn = (Stage) btnLogIn.getScene().getWindow(); //Getting current window
                            logIn.close();
                        } catch (IOException ex) {
                            ex.printStackTrace();
                        }

                    }


                } else {

                    Alert alert = new Alert(Alert.AlertType.ERROR);
                    alert.setHeaderText(null);
                    alert.setContentText("Either username or password is incorrect");
                    alert.showAndWait();
                }


            } catch (SQLException e) {
                System.out.println(e.getErrorCode());
                e.printStackTrace();

            }
        }
    }

    @FXML
    private void onForgotPasswordLabelClicked() {
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/main/resources/view/forgotPassword.fxml"));
            Stage stage = (Stage) btnLogIn.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.show();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void onForgotPasswordLabelHover() {
        forgotPasswordLabel.setUnderline(true);

    }

    private void onForgotPasswordLabelHoverExit() {
        forgotPasswordLabel.setUnderline(false);
    }


}
