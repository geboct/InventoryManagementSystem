package main.java.others;

import javafx.util.Duration;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection {

    private static final String URLs = "jdbc:mysql://calceushub.com:3306/inventory";
    private static final String URL = "jdbc:mysql://localhost:3306/inventory?useTimezone=true&serverTimezone=UTC";


    public static Connection serverConnection() {


        Connection con;
        try {
            Class.forName ("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URLs, "maininventory", "Salifuandme1@@.");
            System.out.println("db initialization success");
        } catch (SQLException e) {

            if (e.getErrorCode() == 0) { //Error Code 0: database server offline
                TrayNotification notification = new TrayNotification();
                notification.setTray("Error code: " + e.getErrorCode(), "Database server is offline!", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(5));
                e.printStackTrace();
            }

            return null;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return con;
    }

    public static Connection localConnection() {


        Connection con;
        try {
            Class.forName ("com.mysql.cj.jdbc.Driver");
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
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return con;
    }
}
