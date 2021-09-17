package main.java.controllers;

import com.smattme.MysqlExportService;
import com.sun.jmx.defaults.JmxProperties;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Cursor;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

import java.awt.*;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.sql.SQLException;
import java.util.Properties;
import java.util.ResourceBundle;

public class FirstTimeViewController implements Initializable {

    @FXML
    private Label skip;

    @FXML
    private Label next, back;

    @FXML
    private AnchorPane secondScreenPane, firstScreenPane;

    @FXML
    private Label next1;

    @FXML
    private Hyperlink websiteLink;


    public FirstTimeViewController() {
        websiteLink = new Hyperlink();
    }

    public void stageFrame(String path) {

        try {
            Stage primaryStage = new Stage();
            Parent root = FXMLLoader.load(getClass().getResource(path));
            Scene scene = new Scene(root);
            primaryStage.setScene(scene);
            primaryStage.initStyle(StageStyle.UNDECORATED);
            primaryStage.setResizable(false);
            primaryStage.show();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void setSkip() {

        loadSplashScreen();
        Stage stage = (Stage) skip.getScene().getWindow();
        stage.close();

    }

    public void loadSplashScreen() {
        stageFrame("/main/resources/view/splashScreen.fxml");
        Stage stage = (Stage) skip.getScene().getWindow();
        stage.close();

    }

    public void setNext() {
        secondScreenPane.setVisible(true);
        firstScreenPane.setVisible(false);
    }

    public void setBack() {
        secondScreenPane.setVisible(false);
        firstScreenPane.setVisible(true);
    }

    public void setWebsiteLink() {

    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        skip.setOnMouseEntered(e -> {
            skip.setStyle("-fx-underline:true ");

        });
        next.setOnMouseEntered(e -> {
            next.setStyle("-fx-underline:true ");
        });
        next1.setOnMouseEntered(e -> {
            next1.setStyle("-fx-underline:true ");
        });
        back.setOnMouseEntered(e -> {
            back.setStyle("-fx-underline:true ");
        });


        skip.setOnMouseExited(e -> {
            skip.setStyle("-fx-underline:false ");

        });
        next.setOnMouseExited(e -> {
            next.setStyle("-fx-underline:false ");
        });
        next1.setOnMouseExited(e -> {
            next1.setStyle("-fx-underline:false ");
        });
        back.setOnMouseExited(e -> {
            back.setStyle("-fx-underline:false ");
        });
        skip.setOnMouseClicked(event -> setSkip());
        next.setOnMouseClicked(event -> setNext());
        next1.setOnMouseClicked(event -> setSkip());
        back.setOnMouseClicked(event -> setBack());
        websiteLink.setOnAction(e -> {
            try {
                Desktop.getDesktop().browse(new URL(websiteLink.getText()).toURI());
            } catch (MalformedURLException malformedURLException) {
                malformedURLException.printStackTrace();
            } catch (IOException ioException) {
                ioException.printStackTrace();
            } catch (URISyntaxException uriSyntaxException) {
                uriSyntaxException.printStackTrace();
            }
        });


    }

}
