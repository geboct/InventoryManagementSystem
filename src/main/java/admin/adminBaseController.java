package main.java.admin;

import com.jfoenix.controls.JFXButton;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.layout.AnchorPane;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.stage.FileChooser;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Duration;
import main.java.controllers.LogInController;
import main.java.others.DBConnection;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.io.*;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.ResourceBundle;


public class adminBaseController implements Initializable {
    @FXML
    private AnchorPane paneRight;
    @FXML
    private Circle circle = new Circle();
    @FXML
    private AnchorPane paneLeft;
    @FXML
    private JFXButton btnDashboard;
    @FXML
    private Label lblAccessLevel;
    @FXML
    private Label lblUsername;
    @FXML
    private JFXButton btnCustomers, newPurchase;
    @FXML
    private JFXButton btnInventoryItem;
    @FXML
    private JFXButton btnAccounts;
    @FXML
    private JFXButton btnDueUpdate;
    @FXML
    private JFXButton btnAdmin;
    @FXML
    private JFXButton btn;
    @FXML
    private Label lblClock;
    @FXML
    private JFXButton btnHelp;
    @FXML
    private JFXButton btnSells;
    private static String username = "";
    private static String accessLevel = "";
    private AnchorPane newRightPane = null;
    private JFXButton temp = null;
    private JFXButton recover = null;
    private static boolean anchorFlag = false;
    Connection connection = DBConnection.serverConnection();
    Connection localConnection = DBConnection.localConnection();
    /**
     * FXML_URL will be used to store locations of
     * main.resources.view files and it will be used to navigate
     * between different menus
     */
    private HashMap<String, String> FXML_URL = new HashMap<>();

    /**
     * This method will resize right pane size
     * relative to it's parent whenever window is resized
     */
    private void autoResizePane() {
        newRightPane.setPrefWidth(paneRight.getWidth());
        newRightPane.setPrefHeight(paneRight.getHeight());
    }

    /**
     * This method will help to set appropriate right pane contents
     * respective to the left pane selection and will make it responsive if
     * any window resize occurs
     *
     * @param URL: main.resources.view file path; scene
     * @throws IOException
     */

    @FXML
    private void ctrlRightPane(String URL) throws IOException {
        try {
            paneRight.getChildren().clear(); //Removing previous nodes
            newRightPane = FXMLLoader.load(getClass().getResource(URL));
            //get the height and width of the right window and setting the new window
            newRightPane.setPrefHeight(paneRight.getHeight());
            newRightPane.setPrefWidth(paneRight.getWidth());

            paneRight.getChildren().add(newRightPane);

            //Listener to monitor any window size change
            paneRight.layoutBoundsProperty().addListener((obs, oldVal, newVal) -> {
                // Some components of the scene will be resized automatically
                autoResizePane();
            });

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * The method here is universal method for all the navigators from left
     * pane which will identify the selection by user and
     * set the respective right pane FXML
     *
     * @param event
     */

    @FXML
    void btnNavigators(ActionEvent event) {
        borderSelector(event); //Marking selected navigator button

        JFXButton btn = (JFXButton) event.getSource();

        // Getting navigation button label
        String btnText = btn.getText();

        // Checking which button is clicked from the map
        // and navigating to respective menu
        try {
            ctrlRightPane(FXML_URL.get(btnText));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void loadFXMLMap() {
        // Adding URLS in the FXML_URL ArrayList field
        // to avoid code redundancy in ctrlRightPane() method
        FXML_URL.put("Dashboard", "/main/resources/view/dashboard.fxml");
        FXML_URL.put("Products", "/main/resources/view/productsAdmin.fxml");
        FXML_URL.put("User Management", "/main/resources/view/userManagement.fxml");
        FXML_URL.put("Categories", "/main/resources/view/categories.fxml");
        FXML_URL.put("Sales", "/main/resources/view/salesManagement.fxml");
        FXML_URL.put("Purchases", "/main/resources/view/purchasesManagement.fxml");
        FXML_URL.put("Accounts", "/main/resources/view/adminAccount.fxml");
        FXML_URL.put("Report", "/main/resources/view/report.fxml");


    }


    private void borderSelector(ActionEvent event) {
        JFXButton btn = (JFXButton) event.getSource();

        if (temp == null) {
            temp = btn; //Saving current button properties
        } else {
            temp.setStyle(""); //Resetting previous selected button properties
            temp = btn; //Saving current button properties
        }

        btn.setStyle("-fx-background-color: #455A64;-fx-border-color: white;-fx-border-radius: 10;-fx-background-radius: 10");
    }


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        btnHelp.setOnAction(e -> {
            try {
                Parent root = FXMLLoader.load(getClass().getResource("/main/resources/view/help.fxml"));
                Stage stage = new Stage();
                stage.getIcons().setAll(new Image("/images/logo.jpg"));
                stage.setScene(new Scene(root));
                stage.initModality(Modality.APPLICATION_MODAL);
                stage.show();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        });


        loadFXMLMap();
        username = LogInController.loggerUsername;
        accessLevel = LogInController.loggerAccessLevel;
        lblUsername.setText(username.toUpperCase());
        lblAccessLevel.setText(accessLevel);
        //retrieveImage();
        //  retrieveImage();

        //Setting Clock within a new Thread
        Runnable clock = new Runnable() {
            @Override
            public void run() {
                runClock();
            }
        };

        Thread newClock = new Thread(clock); //Creating new thread
        newClock.setDaemon(true); //Thread will automatically close on applications closing
        newClock.start(); //Starting Thread

        //Setting DashboardControllerBoth on RightPane
        try {
            ctrlRightPane("/main/resources/view/dashboard.fxml");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void runClock() {
        runClock(lblClock);
    }

    public static void runClock(Label lblClock) {
        while (true) {
            Platform.runLater(new Runnable() {
                @Override
                public void run() {
                    // Getting the system time in a string
                    String time = LocalTime.now().format(DateTimeFormatter.ofPattern("hh:mm:ss a"));
                    // Setting the time in a label
                    lblClock.setText(time);
                }
            });

            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
//retrieving user image from database

    private void retrieveImage() {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from user where username=?");
            preparedStatement.setString(1, lblUsername.getText());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                InputStream is = resultSet.getBinaryStream("userImage");

                OutputStream os = new FileOutputStream(new File("profilePicture.jpg"));
                byte[] content = new byte[1024];
                int size = 0;


                while ((size = is.read(content)) != -1) {

                    os.write(content, 0, size);
                }

                os.close();
                is.close();
                Image im = new Image("file:profilePicture.jpg");
                circle.setFill(new ImagePattern(im));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //updating user image
    @FXML
    private void updateUserImage() {


        try {
            FileChooser fileChooser = new FileChooser();
            fileChooser.getExtensionFilters().addAll(new FileChooser.ExtensionFilter("Images", "*.jpg", "*.png", "*.jpeg"));
            File selectedFile = fileChooser.showOpenDialog(null);
            Image im = new Image(selectedFile.toURI().toString());
            circle.setFill(new ImagePattern(im));
            try {
                FileInputStream fin = new FileInputStream(selectedFile);
                int len = (int) selectedFile.length();
                PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `user` SET `userImage`=? WHERE username=?");
                preparedStatement.setBinaryStream(1, fin, len);
                preparedStatement.setString(2, lblUsername.getText());
                preparedStatement.executeUpdate();

                TrayNotification notification = new TrayNotification();
                notification.setTitle("Success");
                notification.setTray("", "Picture updated Successfully", NotificationType.SUCCESS);
                notification.showAndDismiss(Duration.seconds(4
                ));
            } catch (SQLException e) {
                TrayNotification notification = new TrayNotification();
                notification.setTitle("ERROR");
                notification.setTray("", "Unable to upload image to database", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(4
                ));
            }
            // insert the new image into database

        } catch (Exception eee) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("", "Select a different Image", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(4
            ));
        }
    }

    /**
     * Upon logging out this method will set log in prompt on
     * screen by closing main application
     */
    @FXML
    private void logOut() {
        Stage current = (Stage) lblUsername.getScene().getWindow();
        current.close();

        try {
            // Setting login window
            Parent root = FXMLLoader.load(getClass().getResource("/main/resources/view/login.fxml"));
            root.getStylesheets().add("/main/resources/css/login.css");
            Scene scene = new Scene(root);
            Stage logInPrompt = new Stage();
            logInPrompt.setScene(scene);
            logInPrompt.show();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
