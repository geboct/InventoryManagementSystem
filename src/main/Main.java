package main;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.stage.StageStyle;
import javafx.util.Duration;
import main.java.controllers.PromptDialogController;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;


public class Main extends Application {
    @Override
    public void start(Stage primaryStage) {


        try {

            File firstTimeLaunch = new File("FirstLaunch");
            if (!firstTimeLaunch.exists()) {
                FileWriter fileWriter = new FileWriter(firstTimeLaunch);
                Parent root = FXMLLoader.load(getClass().getResource("/main/resources/view/firstTimeView.fxml"));
                Scene scene = new Scene(root);
                primaryStage.setScene(scene);

            } else {


                Parent root = FXMLLoader.load(getClass().getResource("/main/resources/view/splashScreen.fxml"));
                Scene scene = new Scene(root);
                primaryStage.setScene(scene);
            }
            primaryStage.initStyle(StageStyle.UNDECORATED);
            primaryStage.setResizable(false);
            primaryStage.show();
        } catch (Exception e) {
            // new PromptDialogController("Error!", "Error occurred. Failed to initialize system.");
            e.printStackTrace();

        }
    }

    public static void main(String[] args) {
        launch(args);
    }


}
