package main.java.controllers;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import de.jensd.fx.glyphs.fontawesome.FontAwesomeIconView;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.util.Duration;
import main.java.others.DBConnection;
import main.java.others.Categories;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class CategoryController implements Initializable {
    @FXML
    private TableView<Categories> categoryTable;
    @FXML
    private TableColumn<Categories, String> typeName;
    @FXML
    private TableColumn<Categories, Integer> totalItems;
    @FXML
    private JFXButton updateButton;
    @FXML
    private JFXButton addButton;
    @FXML
    private FontAwesomeIconView btnAddIcon;
    @FXML
    private JFXButton btnDelete;
    @FXML
    private FontAwesomeIconView addIcon;
    @FXML
    private AnchorPane anchorPane;

    @FXML
    private JFXTextField categoryName;
    @FXML
    private JFXButton btnRefresh;
    private boolean updateMode = false; //This is variable will be used to differentiate

    //between update mode and new entry mode
    //false = new entry; true = update
    @FXML
    void reload(ActionEvent event) {
        //Setting Values to null and normal
        categoryName.setText("");
        addIcon.setGlyphName("PLUS");
        setTableData();
    }


    public void addCategory() {
        Connection con = DBConnection.localConnection();
        try {
            if (categoryName.getText()!="") {
                PreparedStatement stmtInsert = con.prepareStatement("INSERT INTO categories VALUES(?)");

                stmtInsert.setString(1, categoryName.getText());

                stmtInsert.executeUpdate();
                setTableData();
                con.close();

                TrayNotification notification = new TrayNotification();
                notification.setTray("Success", categoryName.getText() + " Added Successfully", NotificationType.SUCCESS);
                notification.showAndDismiss(Duration.seconds(3));
                categoryName.clear();
            } else {
                TrayNotification notification = new TrayNotification();
                notification.setTray("Error", "Unable to create Category", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));
            }

        } catch (SQLException e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Error: Add New Category ", " Connection to server lost", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            //  new PromptDialogController("Error", "Error Code: " + e.getErrorCode());
        }

    }

    public void updateCategory(String selectedCategory) {


        Connection con = DBConnection.serverConnection();
        Connection localCon = DBConnection.localConnection();
        try {
            PreparedStatement updateCategory = con.prepareStatement("UPDATE categories SET categoryName = ? WHERE categoryName = ?");
            PreparedStatement localUpdateCategory = localCon.prepareStatement("UPDATE categories SET categoryName = ? WHERE categoryName = ?");

            updateCategory.setString(1, categoryName.getText());
            updateCategory.setString(2, selectedCategory);
            localUpdateCategory.setString(1, categoryName.getText());
            localUpdateCategory.setString(2, selectedCategory);

            updateCategory.executeUpdate();
            localUpdateCategory.executeUpdate();
            setTableData();
            con.close();

            TrayNotification notification = new TrayNotification();
            notification.setTray("Success", selectedCategory + " Updated Successfully", NotificationType.SUCCESS);
            notification.showAndDismiss(Duration.seconds(3));
            addIcon.setGlyphName("PLUS");
            categoryName.clear();

            // new PromptDialogController("Success!", "Updating Entry Successful");
        } catch (SQLException e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Error", " Unable to update", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
        }

    }

    @FXML
    void deleteCategory(ActionEvent event) {
        Connection con = DBConnection.serverConnection();
        Connection localCon = DBConnection.localConnection();
        try {
            PreparedStatement deleteCat = con.prepareStatement("DELETE FROM categories WHERE categoryname = ?");
            PreparedStatement localDeleteCat = localCon.prepareStatement("DELETE FROM categories WHERE categoryname = ?");

            deleteCat.setString(1, categoryTable.getSelectionModel().getSelectedItem().getCategoryName());
            localDeleteCat.setString(1, categoryTable.getSelectionModel().getSelectedItem().getCategoryName());

            deleteCat.executeUpdate();
            localDeleteCat.executeUpdate();
            setTableData();
            con.close();
            TrayNotification notification = new TrayNotification();
            notification.setTray("Success", "Category deleted successfully", NotificationType.SUCCESS);
            notification.showAndDismiss(Duration.seconds(3));
            //  new PromptDialogController("Success!", "Deleting Entry Successful");
        } catch (SQLException e) {
            if (e.getErrorCode() == 1451) {
                //Has foreign key constraints


                TrayNotification notification = new TrayNotification();
                notification.setTray("Error", "Can't delete type. The type has one or more item entries listed.", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));

            } else {
                TrayNotification notification = new TrayNotification();
                notification.setTray("Error", "Can't delete type. The type has one or more item entries listed.", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));
                //  new PromptDialogController("Error", "Error Code: " + e.getErrorCode());
            }

        }
    }

    private void setTableData() {
        //Setting cell value factory of the table
        typeName.setCellValueFactory(new PropertyValueFactory<>("categoryName"));
        totalItems.setCellValueFactory(new PropertyValueFactory<>("totalItems"));

        //Getting Data From Database
        Connection con = DBConnection.localConnection();
        ObservableList<Categories> listOfCategories = FXCollections.observableArrayList();


        try {
            PreparedStatement getCategories = con.prepareStatement("select * from categories");
            ResultSet resultSet = getCategories.executeQuery();


            while (resultSet.next()) {
                PreparedStatement getCategoryProduct = con.prepareStatement("SELECT COUNT(*) FROM products WHERE category=?");
                getCategoryProduct.setString(1, resultSet.getString("categoryName"));
                ResultSet resultSet1 = getCategoryProduct.executeQuery();
                while (resultSet1.next()) {
                    listOfCategories.addAll(new Categories(resultSet.getString("categoryName"), resultSet1.getInt(1)));
                }
            }

            categoryTable.setItems(listOfCategories);


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        setTableData();
        categoryTable.setOnMouseClicked(e -> {
            if (e.getClickCount() == 2) {
                addIcon.setGlyphName("SAVE");
                categoryName.setText(String.valueOf(categoryTable.getSelectionModel().getSelectedItem().getCategoryName()));
                System.out.println(categoryTable.getSelectionModel().getSelectedItem().getCategoryName());
                addButton.setOnAction(event -> {
                    try {
                        updateCategory(categoryTable.getSelectionModel().getSelectedItem().getCategoryName());

                    }catch (NullPointerException ee){
                        TrayNotification notification = new TrayNotification();
                        notification.setTray("Error", "Can't Update CAtegory.Select a category to update", NotificationType.ERROR);
                        notification.showAndDismiss(Duration.seconds(3));
                    }
                });
            }
        });
        addButton.setOnAction(event -> {
            if (addIcon.getGlyphName().equals( "PLUS")) {
                addCategory();
            }
        });

        ////// btnAddIcon.setOnMouseClicked(e->addOrUpdateCategory());
    }
}
