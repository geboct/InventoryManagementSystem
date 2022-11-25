package main.java.controllers;

import java.net.URL;
import java.net.URLConnection;

public class CheckNetworkAvailabililty {

    public boolean checkNetwork() {
        try {
            URL url = new URL("https://www.calceushub.com/");
            URLConnection connection = url.openConnection();
            connection.connect();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
