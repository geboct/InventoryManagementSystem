package main.java.admin;

import com.jfoenix.controls.JFXButton;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.stage.Modality;
import javafx.stage.Stage;
import main.java.controllers.PromptDialogController;
import main.java.controllers.TotalSalesListController;
import main.java.others.DBConnection;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Optional;
import java.util.ResourceBundle;

public class ReportController implements Initializable {
    @FXML
    private JFXButton btnLastThirty, btnTrans;
    @FXML
    private JFXButton btnUpdateEmp;
    @FXML
    private JFXButton btnTotalRents;
    @FXML
    private JFXButton btnTotalSell, totalPurchases, productsManagementButton;
    @FXML
    private JFXButton btnAddNew;
    @FXML
    private JFXButton btnRemoveEmployee;
    @FXML
    private JFXButton btEmpList;
    @FXML
    private JFXButton btnTopTen;
    @FXML
    private JFXButton btnAccDelete;
    @FXML
    private JFXButton btnAccUpdate;

    /**
     * This method will take Window Title and Scene location as arguments
     * and will show a new window
     *
     * @param title: Title of the window
     * @param URL:   main.resources.view file location
     */
    void loadWindow(String title, String URL) {
        try {
            Parent acc = FXMLLoader.load(getClass().getResource(URL));
            Scene s = new Scene(acc);

            Stage stg = new Stage();
            stg.initModality(Modality.APPLICATION_MODAL);
            stg.getIcons().setAll(new Image("/images/logo.png"));

            stg.setTitle(title);
            stg.setScene(s);
            stg.setResizable(false);
            stg.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    void accUpdate(ActionEvent event) {
        loadWindow("Account Management", "/main/resources/view/accountmanager.fxml");
    }

    @FXML
    void itemTypeManage(ActionEvent event) {
        loadWindow("Category Management", "/main/resources/view/categories.fxml");
    }

    @FXML
    void addNewEmployee(ActionEvent event) {
        loadWindow("User Management", "/main/resources/view/userManagement.fxml");
    }

    @FXML
    void manageProducts(ActionEvent event) {
        loadWindow("Manage Products", "/main/resources/view/productsAdmin.fxml");
    }


    @FXML
    void outOfStockList(ActionEvent event) {
        loadWindow("Out of Stock", "/main/resources/view/outOfStock.fxml");
    }


    @FXML
    void purchases(ActionEvent event) {
        loadWindow("Purchases", "/main/resources/view/totalPurchasesList.fxml");
    }

    @FXML
    void totalSales(ActionEvent event) {

        loadWindow("Sale's List", "/main/resources/view/totalSalesList.fxml");
    }


    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }
}
