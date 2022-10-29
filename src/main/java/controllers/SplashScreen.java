package main.java.controllers;

import javafx.animation.TranslateTransition;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.util.Duration;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.net.URL;
import java.util.ResourceBundle;

public class SplashScreen implements Initializable {
    Stage primaryStage = new Stage();
    @FXML
    private AnchorPane anchorpane;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        TranslateTransition translateTransition = new TranslateTransition();
        translateTransition.setNode(anchorpane);
        translateTransition.setDuration(Duration.seconds(3));
        translateTransition.setCycleCount(1);
        translateTransition.play();
        translateTransition.setOnFinished(e -> {
            try {

                Parent root = FXMLLoader.load(getClass().getResource("/main/resources/view/login.fxml"));
                Scene scene = new Scene(root);
                String css = this.getClass().getResource("/main/resources/css/login.css").toExternalForm(); // Getting stylesheet
                scene.getStylesheets().add(css); // Adding stylesheet
                primaryStage.setTitle("Log In Prompt");
                primaryStage.getIcons().setAll(new Image("/images/logo.png"));
                primaryStage.setScene(scene);
                // primaryStage.getIcons().add(new Image("/main/resources/icons/inventory.png"));
                primaryStage.setResizable(false);
                primaryStage.show();
                Stage stage = (Stage) anchorpane.getScene().getWindow();
                stage.close();
            } catch (Exception ee) {
                /* new PromptDialogController("Error!", "Error occurred. Failed to initialize system.");*/
                TrayNotification notification = new TrayNotification();
                notification.setTray("Error!", " Database server is offline.", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));
                Stage stage = (Stage) anchorpane.getScene().getWindow();
                stage.close();
                ee.printStackTrace();
            }
        });
    }
}
