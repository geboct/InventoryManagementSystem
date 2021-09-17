package main.java.backup;

import com.smattme.MysqlExportService;
import javafx.application.Platform;
import javafx.scene.control.Alert;
import javafx.scene.control.ProgressBar;
import javafx.util.Duration;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

public class Backup {
    String password = "", username = "", email, emailPassword = "";

    public Backup() {
    }

    public Backup(String password, String username, String email, String emailPassword) {
        this.password = password;
        this.username = username;
        this.email = email;
        this.emailPassword = emailPassword;
    }


    public void backupDatabase(ProgressBar progressBar, String MYSQLDUMP_LOCATION, String dbName, String dbUserName, String path) {
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                double progress = 0;
                for (int i = 0; i < 10; i++) {
                    String executeCmd;
                    executeCmd = MYSQLDUMP_LOCATION + " -u " + dbUserName + " --add-drop-database -B " + dbName + " -r " + path;
                    System.out.println(executeCmd);
                    Process runtimeProcess;
                    try {

                        runtimeProcess = Runtime.getRuntime().exec(executeCmd);
                        int processComplete = runtimeProcess.waitFor();

                        if (processComplete == 0) {

                            System.out.println("Backup created successfully");

                        } else {

                            System.out.println("Could not create the backup");
                        }
                    } catch (IOException | InterruptedException ex) {
                        ex.printStackTrace();
                    }
                    progress += 0.1;
                    final double reportedProgress = progress;
                    Platform.runLater(new Runnable() {
                        @Override
                        public void run() {
                            progressBar.setProgress(reportedProgress);

                        }
                    });

                }

            }

        });

        thread.start();


    }





    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmailPassword() {
        return emailPassword;
    }

    public void setEmailPassword(String emailPassword) {
        this.emailPassword = emailPassword;
    }
}
