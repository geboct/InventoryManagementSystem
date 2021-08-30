package main.java.others;

import javafx.util.Duration;
import main.java.controllers.PromptDialogController;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection {

    private static final String URLs = "jdbc:mysql://localhost:3306/inventory?autoReconnect=yes&useSSL=no";
    private static final String URL = "jdbc:mysql://localhost:3306/inventory?useTimezone=true&serverTimezone=UTC";


    public static Connection getConnection() {


        Connection con;
        try {
            con = DriverManager.getConnection(URL, "root", "");
            System.out.println("db initialization success");
        } catch (SQLException e) {

            if (e.getErrorCode() == 0) { //Error Code 0: database server offline
                TrayNotification notification = new TrayNotification();
                notification.setTray("Error code: " + e.getErrorCode(), "Database server is offline!", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(5));
                e.printStackTrace();
            }

            return null;
        }
        return con;
    }
}
