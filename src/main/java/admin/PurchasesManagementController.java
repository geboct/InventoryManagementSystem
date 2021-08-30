package main.java.admin;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXSnackbar;
import com.jfoenix.controls.JFXTextField;
import de.jensd.fx.glyphs.fontawesome.FontAwesomeIcon;
import de.jensd.fx.glyphs.fontawesome.FontAwesomeIconView;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Duration;
import main.java.admin.purchaseModel.PurchaseModel;
import main.java.controllers.LogInController;
import main.java.controllers.PromptDialogController;
import main.java.others.DBConnection;
import main.java.others.Item;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;
import java.util.ResourceBundle;

public class PurchasesManagementController implements Initializable {

    @FXML
    private VBox allPurchasesVBox;
    @FXML
    private Button newPurchaseButton;
    @FXML
    private Button deletePurchasesbutton;
    @FXML
    private Button addNewCategoryButton;

    @FXML
    private TableView<PurchaseModel> purchasesTableView;
    @FXML
    private TableColumn<PurchaseModel, String> barcodeColumn;
    @FXML
    private TableColumn<PurchaseModel, String> productNameColumn;
    @FXML
    private TableColumn<PurchaseModel, Double> priceColumn;
    @FXML
    private TableColumn<PurchaseModel, Double> quantityColumn;
    @FXML
    private TableColumn<PurchaseModel, Double> totalColumn;
    @FXML
    private TableColumn<PurchaseModel, Date> dateTimeColumn;
    @FXML
    private TableColumn<PurchaseModel, String> customerNameColumn;
    @FXML
    private TableColumn<PurchaseModel, String> employeeNameColumn;

    @FXML
    private AnchorPane posPane;

    //new purchases

    @FXML
    private JFXTextField productNameTextField;
    @FXML
    private TextField searchTextField;
    @FXML
    private JFXComboBox<String> categoryComboBox;

    @FXML
    private JFXButton removeProduct;
    @FXML
    private JFXButton addTocartButton;
    @FXML
    private JFXButton updateProduct;

    @FXML
    private JFXTextField barcodeField;

    @FXML
    private TextArea descriptionTextArea;
    @FXML
    private JFXTextField stockTextField;
    @FXML
    private JFXTextField sellingPriceTextField;
    @FXML
    private JFXTextField purchasedPriceTextField;
    @FXML
    private Label lblPageIndex, lblMode, lblSearchResults;
    @FXML
    private JFXButton btnPrevEntry;
    @FXML
    private JFXButton btnNextEntry;

    @FXML
    private JFXButton newProduct;

    @FXML
    private JFXButton btnListAll;
    @FXML
    private JFXButton btnOutOfStock, btnGoBack, btnDelete;
    @FXML
    private JFXTextField txtSearch;
    @FXML
    private FontAwesomeIconView btnAddIcon;
    @FXML
    private JFXButton btnSearch;
    @FXML
    private AnchorPane itemPane;
    @FXML
    private AnchorPane itemListPane;
    @FXML
    private ComboBox<String> filterByComboBox;
    @FXML
    private TableView<PurchaseModel> tbl;
    @FXML
    private TableColumn<main.java.others.Item, String> barcode;
    @FXML
    private TableColumn<main.java.others.Item, String> columnItemName;
    @FXML
    private TableColumn<main.java.others.Item, String> descriptionColumn;
    @FXML
    private TableColumn<main.java.others.Item, Double> columnPrice;
    @FXML
    private TableColumn<main.java.others.Item, Integer> columnStock;
    @FXML
    private TableColumn<main.java.others.Item, String> columnCategory;

    @FXML
    private TableView<PurchaseModel> cartTableview;
    @FXML
    private TableColumn<PurchaseModel, String> cartProductNameColumn;
    @FXML
    private TableColumn<PurchaseModel, Double> cartPriceColumn;
    @FXML
    private TableColumn<PurchaseModel, Double> cartStockColumn;
    @FXML
    private JFXButton printButton;
    @FXML
    private JFXTextField companyTextField;
    @FXML
    private Button submitButton, removeButton;
    @FXML
    private FontAwesomeIconView btnSearchIcon;
    private static int recordIndex = 0;
    private static int recordSize = 0;
    private main.java.others.Item onView = null;
    String currentBC;

    Connection connection = DBConnection.getConnection();
    /**
     * addFlag will differentiate b/w Adding a new entry
     * and updating an existing entry.
     * True: New Record Entry Mode
     * False: Updating an Existing Entry
     */
    private static boolean addFlag = false;
    private static boolean searchDone = false;
    public static ObservableList<Item> itemList = FXCollections.observableArrayList(); //This field will auto set from InitializerController Class
    public static ObservableList<Item> tempList = FXCollections.observableArrayList(); //Will hold the main list while searching
    public static ArrayList<String> itemNames = new ArrayList<>();
    ObservableList<Item> listOfAllItems = FXCollections.observableArrayList();
    ObservableList<String> filterItems = FXCollections.observableArrayList();
    ObservableList<PurchaseModel> searchWithCategory = FXCollections.observableArrayList();
    ObservableList<PurchaseModel> searchWithPrice = FXCollections.observableArrayList();
    ObservableList<PurchaseModel> searchWithStock = FXCollections.observableArrayList();
    ObservableList<PurchaseModel> searchWithName = FXCollections.observableArrayList();
    ObservableList<PurchaseModel> listOfPurchases = FXCollections.observableArrayList();
    ObservableList<PurchaseModel> addToCartItems = FXCollections.observableArrayList();


    String oldProductName;


    @FXML
    private void setNewPurchaseButton() {
        posPane.setVisible(true);
        allPurchasesVBox.setVisible(false);
        initializeCartTableView();
        editableFields();


    }

    @FXML
    private void setBackButton() {
        posPane.setVisible(false);
        allPurchasesVBox.setVisible(true);
        unEditableFields();
        selectAllPurchases();
    }

    /**
     * select all purchases from db
     */
    private void selectAllPurchases() {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from purchases");
            ResultSet resultSet = preparedStatement.executeQuery();
            listOfPurchases.clear();
            while (resultSet.next()) {
                listOfPurchases.addAll(new PurchaseModel(resultSet.getString("barcode"),
                        resultSet.getString("productName"),
                        resultSet.getDouble("purchasedPrice"),
                        resultSet.getDouble("quantity"),
                        resultSet.getDouble("total"),
                        resultSet.getString("date"),
                        resultSet.getString("companyName"),
                        resultSet.getString("employeeName")));
            }
            purchasesTableView.setItems(listOfPurchases);
            connection.close();
        } catch (SQLException e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Error", "unable to load purchases", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            e.printStackTrace();
        }
    }


    @Override
    public void initialize(URL location, ResourceBundle resources) {

        barcodeColumn.setCellValueFactory(new PropertyValueFactory<>("barcode"));
        productNameColumn.setCellValueFactory(new PropertyValueFactory<>("productName"));
        priceColumn.setCellValueFactory(new PropertyValueFactory<>("purchasedPrice"));
        quantityColumn.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        totalColumn.setCellValueFactory(new PropertyValueFactory<>("total"));
        dateTimeColumn.setCellValueFactory(new PropertyValueFactory<>("dateTime"));
        customerNameColumn.setCellValueFactory(new PropertyValueFactory<>("companyName"));
        employeeNameColumn.setCellValueFactory(new PropertyValueFactory<>("employeeName"));
        initializeCartTableView();


        selectAllPurchases();
        deletePurchasesbutton.setOnAction(e -> setDeletePurchasesButton());

        newPurchaseButton.setGraphic(new FontAwesomeIconView(FontAwesomeIcon.PLUS_CIRCLE));
        newPurchaseButton.getGraphic().setStyle("-fx-fill: #ffffff");

        unEditableFields();
        filterItems.setAll("Product Name", "Category", "Price", "Available Stock", "Default");
        filterByComboBox.setItems(filterItems);
        filterByComboBox.getSelectionModel().select("Default");
        setView();

    }


    /**
     * new purchase begins here
     */


    @FXML
    void keyPressed(KeyEvent event) {
        if (event.getCode().equals(KeyCode.ENTER)) {
            barcodeField.setText(currentBC);

        } /*else {
            currentBC += event.getText();
        }*/
    }

    @FXML
    private void checkItemExistence(KeyEvent event) {
        Connection con = DBConnection.getConnection();

        String barcode = "", productName = "", description = "", category = "";
        Double salePrice = 0.00, stock = 0.00;

        if (event.getSource().equals(barcodeField) && event.getCode().equals(KeyCode.ENTER)) {
            try {
                PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM products WHERE barcodeField =  ?");
                preparedStatement.setString(1, barcodeField.getText());

                ResultSet itemResultSet = preparedStatement.executeQuery();

                //Getting values from Items result set
                searchItemExistence(itemResultSet);

            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if (event.getSource().equals(productNameTextField) && event.getCode().equals(KeyCode.ENTER)) {
            try {
                PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM products WHERE productName =  ?");
                preparedStatement.setString(1, productNameTextField.getText());

                ResultSet itemResultSet = preparedStatement.executeQuery();

                //Getting values from Items result set
                searchItemExistence(itemResultSet);

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }


    }

    private void searchItemExistence(ResultSet itemResultSet) throws SQLException {
        String barcode;
        String productName;
        Double salePrice;
        Double stock;
        String category;
        String description;
        if (itemResultSet.next()) {

            barcode = itemResultSet.getString("barcodeField");
            productName = itemResultSet.getString("productName");
            salePrice = itemResultSet.getDouble("salePrice");
            stock = itemResultSet.getDouble("stock");
            category = itemResultSet.getString("category");
            description = itemResultSet.getString("description");


            barcodeField.setText(barcode);
            productNameTextField.setText(productName);
            sellingPriceTextField.setText(String.valueOf(salePrice));
            stockTextField.setText(String.valueOf(stock));
            categoryComboBox.getSelectionModel().select(category);
            descriptionTextArea.setText(description);


        } else {

            productNameTextField.setText("");
            sellingPriceTextField.setText(String.valueOf(""));
            stockTextField.setText(String.valueOf(""));
            categoryComboBox.getSelectionModel().clearSelection();
            descriptionTextArea.setText("");

        }
    }


    @FXML
    private void setSaveButton() {

        btnSaveAction();
        editableFields();


    }


    private void unEditableFields() {
        barcodeField.setText("");
        barcodeField.setEditable(false);
        productNameTextField.setEditable(false);
        productNameTextField.setText("");
        sellingPriceTextField.setEditable(false);
        sellingPriceTextField.setText("");
        stockTextField.setEditable(false);
        stockTextField.setText("");
        descriptionTextArea.setEditable(false);
        descriptionTextArea.setText("");
        categoryComboBox.getItems().clear();
        categoryComboBox.setEditable(false);


    }


    private void editableFields() {
        barcodeField.setText("");
        barcodeField.setEditable(true);
        productNameTextField.setEditable(true);
        productNameTextField.setText("");
        purchasedPriceTextField.setText("");
        purchasedPriceTextField.setEditable(true);
        sellingPriceTextField.setEditable(true);
        sellingPriceTextField.setText("");
        stockTextField.setEditable(true);
        stockTextField.setText("");
        descriptionTextArea.setEditable(true);
        descriptionTextArea.setText("");
        categoryComboBox.getItems().clear();
        getCategories(categoryComboBox);
        companyTextField.setText("");
        companyTextField.setEditable(true);


    }


    private void reloadRecords() {
        itemList.clear();
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement getItemList = connection.prepareStatement("SELECT *" +
                    "FROM products ORDER BY barcodeField");
            ResultSet itemResultSet = getItemList.executeQuery();

            while (itemResultSet.next()) {
                main.java.others.Item item = new main.java.others.Item(itemResultSet.getString("barcodeField"),
                        itemResultSet.getString("productName"),
                        itemResultSet.getDouble("salePrice"),
                        itemResultSet.getDouble("stock"),
                        itemResultSet.getString("category"),
                        itemResultSet.getString("description"));
                System.out.println("\n");
                itemNames.add(itemResultSet.getString("productName"));

                itemList.add(item);

            }

            setView();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void setView() {
        itemListPane.setVisible(false);
        recordIndex = 0; //Resetting index value
        recordSize = itemList.size();


        //Setting Fields
        btnNextEntry.setOnAction(event -> {
            onView = itemList.get(++recordIndex);
            recordNavigator();
            lblPageIndex.setText("Showing " + (recordIndex + 1) + " of " + recordSize + " results.");
            if (recordIndex == recordSize - 1)
                btnNextEntry.setDisable(true);
            btnPrevEntry.setDisable(false);

        });

        //Setting previous entry if any on previous button action
        btnPrevEntry.setOnAction(event -> {
            onView = itemList.get(--recordIndex);
            recordNavigator();
            lblPageIndex.setText("Showing " + (recordIndex + 1) + " of " + recordSize + " results.");
            btnNextEntry.setDisable(false);
            System.out.println();
            if (recordIndex == 0)
                btnPrevEntry.setDisable(true);

        });

        btnNextEntry.setDisable(true); //For purpose ;)

        if (recordSize > 0) {
            onView = itemList.get(recordIndex); //Setting value for current record

            //Setting customer default fields
            recordNavigator();

            //Setting page indexer value
            lblPageIndex.setText("Showing " + (recordIndex + 1) + " of " + recordSize + " results.");

            if (recordSize > 1) {
                btnNextEntry.setDisable(false); //Next entry will be enabled if there is more than one entry
            }
        }

        btnPrevEntry.setDisable(true); //Disabling prevButton Initially


    }

    //This method will set navigate between Items
    private void recordNavigator() {
        stockTextField.setStyle("-fx-text-fill: #263238"); //Resetting stock color


        barcodeField.setText(onView.getBarcode());
        productNameTextField.setText(onView.getName());
        sellingPriceTextField.setText(String.valueOf(onView.getSalePrice()));
        descriptionTextArea.setText(onView.getDescription());
        categoryComboBox.getItems().setAll(onView.getCategory());
        categoryComboBox.getSelectionModel().select(0);
        stockTextField.setText(Double.toString(onView.getStock()));

        if (onView.getStock() <= 5) //Setting stock color red if it's very limited
            stockTextField.setStyle("-fx-text-fill: red");


    }


    public void updateProduct() {

        if (productNameTextField.getText().isEmpty()) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Error", " Select a product to update", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));

        } else {
            try {
                Connection con = DBConnection.getConnection();
                ObservableList<String> list = FXCollections.observableArrayList();
                PreparedStatement preparedStatement = con.prepareStatement("select * from categories");
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    list.addAll(resultSet.getString("categoryName"));
                }
                oldProductName = productNameTextField.getText();
                barcodeField.setEditable(true);
                productNameTextField.setEditable(true);
                sellingPriceTextField.setEditable(true);
                stockTextField.setEditable(true);
                descriptionTextArea.setEditable(true);
                categoryComboBox.getItems().setAll(list);
            } catch (SQLException e) {
                e.printStackTrace();
            }


           /* addTocartButton.setOnAction(e -> {
                updateRecord();
                unEditableFields();
            });*/

        }

    }


    public void setRemoveProduct() {
        Connection connection = DBConnection.getConnection();


        if (productNameTextField.getText().isEmpty()) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setHeaderText("Can't Delete");
            alert.setContentText("No product has been selected to delete");
            ButtonType ok = new ButtonType("OK");
            alert.getButtonTypes().setAll(ok);
            alert.setOnCloseRequest(e -> alert.close());
            alert.showAndWait();


        } else {
            try {
                String product = productNameTextField.getText();
                PreparedStatement preparedStatement = connection.prepareStatement("delete from products where productName=?");
                preparedStatement.setString(1, productNameTextField.getText());

                Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
                alert.setTitle("Confirm Delete");
                alert.setGraphic(new ImageView(this.getClass().getResource("/main/resources/icons/x-button.png").toString()));
                alert.setHeaderText("Do you really want to delete ?\n" + product +
                        " This action will delete the product from database.\n" +
                        "Once it is done it can not be undone!");
                alert.setContentText("Press OK to confirm, Cancel to go back");

                Optional<ButtonType> result = alert.showAndWait();

                if (result.get() == ButtonType.OK) {
                    preparedStatement.executeUpdate();

                    new PromptDialogController("Operation Successful!", product + " has been deleted Successfully");
                }

                //setting the fields to uneditable
                txtSearch.setText("");
                productNameTextField.setText("");
                productNameTextField.setEditable(false);
                sellingPriceTextField.setEditable(false);
                sellingPriceTextField.setText("");
                stockTextField.setEditable(false);
                stockTextField.setText("");
                descriptionTextArea.setText("");
                descriptionTextArea.setEditable(false);
                barcodeField.setText("");
                barcodeField.setEditable(false);
                categoryComboBox.getItems().clear();

            } catch (SQLException e) {
                new PromptDialogController("Can't delete", e.getMessage());
                e.printStackTrace();
            }
        }


    }


    @FXML
    void btnDelAction(ActionEvent event) {
        Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
        alert.setTitle("Confirm Delete");
        alert.setGraphic(new ImageView(this.getClass().getResource("/main/resources/icons/x-button.png").toString()));

        alert.setHeaderText("Do you really want to delete this entry?");
        alert.setContentText("Press OK to confirm, Cancel to go back");

        Optional<ButtonType> result = alert.showAndWait();

        if (result.get() == ButtonType.OK) {
            Connection connection = DBConnection.getConnection();
            try {
                PreparedStatement ps = connection.prepareStatement("DELETE FROM  products WHERE barcode = " + barcodeField.getText());
                ps.executeUpdate();

                TrayNotification notification = new TrayNotification();
                notification.setTray("Operation Successful.", "Item is deleted from the database. Restart or refresh to see effective result.", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));
                reloadRecords();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

   /* @FXML
    void outOfStockList(ActionEvent event) {
//setting the fields to uneditable
        unEditableFields();


        btnGoBack.setOnAction(e -> {
            itemListPane.setVisible(false);  //Setting item list pane visible
            itemPane.setVisible(true); //Setting item pane visible
        });

        Connection con = DBConnection.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE stock <=" + 5);
            ResultSet itemResultSet = ps.executeQuery();

            ObservableList<main.java.others.Item> outOfStk = FXCollections.observableArrayList();

            while (itemResultSet.next()) {
                main.java.others.Item item = new Item(itemResultSet.getString("barcodeField"),
                        itemResultSet.getString("productName"),
                        itemResultSet.getDouble("salePrice"),
                        itemResultSet.getDouble("stock"),
                        itemResultSet.getString("category"), itemResultSet.getString("description"));

                itemNames.add(itemResultSet.getString("productName"));


                btnGoBack.setOnAction(e -> {
                    itemListPane.setVisible(false);  //Setting item list pane visible
                    itemPane.setVisible(true); //Setting item pane visible
                });

                outOfStk.add(item);

            }

            tbl.setItems(outOfStk);

            listView();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/


    /**
     *
     */
    private void listView() {
        itemPane.setVisible(false); //Setting default item pane not visible
        itemListPane.setVisible(true); //Setting item list visible

        barcode.setCellValueFactory(new PropertyValueFactory<>("barcode"));
        columnItemName.setCellValueFactory(new PropertyValueFactory<>("name"));
        columnStock.setCellValueFactory(new PropertyValueFactory<>("stock"));
        columnCategory.setCellValueFactory(new PropertyValueFactory<>("itemType"));
        columnPrice.setCellValueFactory(new PropertyValueFactory<>("salePrice"));
        columnCategory.setCellValueFactory(new PropertyValueFactory<>("category"));
        descriptionColumn.setCellValueFactory(new PropertyValueFactory<>("description"));

    }

    @FXML
    void btnAddMode(ActionEvent event) {
        if (addFlag) {
            addFlag = false; //Resetting addFlag value.


            //Enabling other buttons
            btnPrevEntry.setDisable(false);
            btnNextEntry.setDisable(false);
            btnListAll.setDisable(false);
            btnSearch.setDisable(false);
            btnOutOfStock.setDisable(false);
            btnDelete.setDisable(false);

            String defColor = "#263238";

            //Changing Focus Color
            productNameTextField.setUnFocusColor(Color.web(defColor));
            sellingPriceTextField.setUnFocusColor(Color.web(defColor));
            categoryComboBox.setUnFocusColor(Color.web(defColor));
            txtSearch.setUnFocusColor(Color.web(defColor));
            stockTextField.setUnFocusColor(Color.web(defColor));

            reloadRecords();


        } else {
            Connection con = DBConnection.getConnection();
            try {
                PreparedStatement ps = con.prepareStatement("SELECT max(itemID) FROM products");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    barcodeField.setText(String.valueOf(rs.getString(1)));
                }

                addFlag = true; //Setting flag true to enable exit mode
                btnAddIcon.setGlyphName("UNDO"); //Changing glyph

                //Setting Label
                lblMode.setText("Entry Mode");


                //Disabling other buttons
                btnPrevEntry.setDisable(true);
                btnNextEntry.setDisable(true);
                btnOutOfStock.setDisable(true);
                btnListAll.setDisable(true);
                btnSearch.setDisable(true);
                btnDelete.setDisable(true);

                //Cleaning fields
                productNameTextField.setText("");
                categoryComboBox.setValue("");
                sellingPriceTextField.setText("");
                stockTextField.setText("");
            } catch (SQLException e) {
                e.printStackTrace();
                new PromptDialogController("SQL Error!", "Error occured while executing Query.\nSQL Error Code: " + e.getErrorCode());
            }
        }
    }


    /**
     * This method search into database with the id of a item and returns the result
     *
     * @param id: ID of the item
     * @return: The search result of the query
     */
    private ObservableList<main.java.others.Item> searchWithID(Long id) {
        Connection con = DBConnection.getConnection();

        String idSQL = "SELECT * FROM products WHERE barcodeField like  ?";

        ObservableList<main.java.others.Item> searchResult = FXCollections.observableArrayList(); //list to hold search result

        try {
            PreparedStatement preparedStatement = con.prepareStatement(idSQL);
            preparedStatement.setLong(1, id);

            ResultSet itemResultSet = preparedStatement.executeQuery();

            //Getting values from Items result set
            while (itemResultSet.next()) {
                main.java.others.Item item = new main.java.others.Item(itemResultSet.getString("barcodeField"),
                        itemResultSet.getString("productName"),
                        itemResultSet.getDouble("salePrice"),

                        itemResultSet.getDouble("stock"),
                        itemResultSet.getString("category"), itemResultSet.getString("description"));


                searchResult.add(item);
            }

            con.close();

        } catch (SQLException e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("SQL ERROR", "Unable to execute query", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));

        }

        return searchResult;
    }

    /**
     * This method search into the customer database with a string and
     * returns any records that has a match with the search string
     *
     * @param name: Name of the item
     * @return: List of the result
     */

    private ObservableList<main.java.others.Item> searchWithName(String name) {
        Connection con = DBConnection.getConnection();

        String nameSQL = "SELECT * FROM products WHERE productName like ? ";

        ObservableList<main.java.others.Item> searchResult = FXCollections.observableArrayList(); //list to hold search result

        try {
            PreparedStatement preparedStatement2 = con.prepareStatement(nameSQL);
            preparedStatement2.setString(1, "%" + name + "%");

            ResultSet itemResultSet = preparedStatement2.executeQuery();

            //Getting values from customers result set
            while (itemResultSet.next()) {
                main.java.others.Item item = new main.java.others.Item(itemResultSet.getString("barcodeField"),
                        itemResultSet.getString("productName"),
                        itemResultSet.getDouble("salePrice"),
                        itemResultSet.getDouble("stock"),
                        itemResultSet.getString("category"),
                        itemResultSet.getString("description"));
                System.out.println();
                searchResult.add(item);
            }

            con.close();

        } catch (SQLException e) {
           /* new PromptDialogController("SQL Error!",
                    "Error occured while executing Query.\nSQL Error Code: " + e.getErrorCode());*/
            e.printStackTrace();

        }

        return searchResult;
    }

    @FXML
    void btnSearchAction(ActionEvent event) {
        unEditableFields();
        if (searchDone) {
            searchDone = false;
            lblSearchResults.setVisible(false);
            itemList = tempList; //Reassigning customers List
            recordSize = itemList.size();
            btnSearch.setTooltip(new Tooltip("Search with product name or barcode"));
            btnSearchIcon.setGlyphName("SEARCH");
            setView();
        } else {
            ObservableList<main.java.others.Item> searchResult = FXCollections.observableArrayList(); //list to hold search result
            try {
                // Checking if input field is a number then searching with ID
                // If parsing of Integer fails then we shall try to search
                // with name instead
                Long id = Long.valueOf(txtSearch.getText());
                searchResult = searchWithID(id);
            } catch (NumberFormatException e) {
                String name = txtSearch.getText();
                searchResult = searchWithName(name);
            } finally {
                if (searchResult.size() <= 0) {
                    lblSearchResults.setText("No Results Found!");
                    lblSearchResults.setVisible(true);
                } else {
                    tempList = FXCollections.observableArrayList(itemList);
                    searchDone = true;
                    btnSearchIcon.setGlyphName("CLOSE");
                    btnSearch.setTooltip(new Tooltip("Reset Full List"));
                    itemList = searchResult; //Assigning search result to customerList
                    recordSize = searchResult.size();

                    lblSearchResults.setText(recordSize + " results found!");
                    lblSearchResults.setVisible(true);
                    setView();
                }
            }

        }
    }

    private boolean checkFields() {
        boolean entryFlag = true;
        if (productNameTextField.getText().equals("")) {
            productNameTextField.setUnFocusColor(Color.web("red"));
            entryFlag = false;
        }

        if (categoryComboBox.getValue() == null) {
            categoryComboBox.setUnFocusColor(Color.web("red"));
            entryFlag = false;

        }

        if (stockTextField.getText().equals("")) {
            stockTextField.setUnFocusColor(Color.web("red"));
            entryFlag = false;

        }

        if (descriptionTextArea.getText().equals("")) {
            descriptionTextArea.setStyle("-fx-border-color: red");
            entryFlag = false;

        }
        if (sellingPriceTextField.getText().equals("")) {
            sellingPriceTextField.setUnFocusColor(Color.web("red"));
            entryFlag = false;

        }

        return entryFlag;
    }

    @FXML
    void onFieldsClicked(MouseEvent event) {
        if (event.getSource() == productNameTextField) {
            productNameTextField.setUnFocusColor(Color.web("#263238"));

        }

        if (event.getSource() == categoryComboBox) {
            categoryComboBox.setUnFocusColor(Color.web("#263238"));


        }

        if (event.getSource() == stockTextField) {
            stockTextField.setUnFocusColor(Color.web("#263238"));


        }

        if (event.getSource() == descriptionTextArea) {
            descriptionTextArea.setStyle("-fx-border-color: #263238");


        }
        if (event.getSource() == sellingPriceTextField) {
            sellingPriceTextField.setUnFocusColor(Color.web("#263238"));


        }

    }


    public boolean validatePurchasedPrice(String price) {
        try {
            Double.parseDouble(price);
            return true;
        } catch (Exception e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Invalid Purchased Price", "Enter valid Amount", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(4));

            return false;
        }
    }

    public boolean validateSellingPrice(String price) {
        try {
            Double.parseDouble(price);
            return true;
        } catch (Exception e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Invalid Selling Price", "Enter valid Amount", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(4));

            return false;
        }
    }

    public boolean validateCategory(String category) {
        try {
            if (categoryComboBox.getSelectionModel().getSelectedItem() == null) {
                return true;
            }
            return true;
        } catch (Exception e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Invalid category", "Select a category", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(4));

            return false;
        }
    }

    public boolean validateBarcode(String barcode) {
        try {
            Double.parseDouble(barcode);
            return true;
        } catch (Exception e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Barcode Error", "Enter a valid Barcode", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(4));

            return false;
        }
    }

    public boolean validateStock(String stock) {
        try {
            Double.parseDouble(stock);
            return true;
        } catch (Exception e) {
            // new PromptDialogController("Invalid Stock", "Please Enter a valid amount");
            TrayNotification notification = new TrayNotification();
            notification.setTray("Invalid Stock", "Please Enter a valid amount", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(4));
            return false;
        }
    }


    //adding purchased items into database
    @FXML
    private void addRecordToDatabase() {


        for (PurchaseModel itemsInCart : addToCartItems) {
            try {

                ///inserting purchases items into purchases database
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `purchases`(`invoiceNumber`, `barcode`, `productName`," +
                        " `quantity`, " +
                        "`purchasedPrice`,`total`,  `date`, `companyName`, `employeeName`, " +
                        "`description`, `category`) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
                preparedStatement.setString(1, "");
                preparedStatement.setString(2, barcodeField.getText());
                preparedStatement.setString(3, productNameTextField.getText());
                preparedStatement.setDouble(4, Double.valueOf(stockTextField.getText()));
                preparedStatement.setDouble(5, Double.valueOf(purchasedPriceTextField.getText()));
                preparedStatement.setDouble(6, (itemsInCart.getQuantity() * itemsInCart.getPurchasedPrice()));
                preparedStatement.setString(7, String.valueOf(LocalDateTime.now()));
                preparedStatement.setString(8, itemsInCart.getCompanyName());
                preparedStatement.setString(9, LogInController.loggerUsername);
                preparedStatement.setString(10, itemsInCart.getDescription());
                preparedStatement.setString(11, itemsInCart.getCategory());


                //inserting purchased items into products database
                PreparedStatement ps = connection.prepareStatement("INSERT INTO products(barcodeField, productName, description, stock, salePrice, purchasedPrice,category,dateAdded) VALUES( ?,?, ?, ?, ?,?, ?,?)");

                ps.setString(1, itemsInCart.getBarcode());
                ps.setString(2, itemsInCart.getProductName());
                ps.setString(3, itemsInCart.getDescription());
                ps.setDouble(4, itemsInCart.getQuantity());
                ps.setDouble(5, itemsInCart.getSellingPrice());
                ps.setDouble(6, itemsInCart.getPurchasedPrice());
                ps.setString(7, itemsInCart.getCategory());
                ps.setDate(8, java.sql.Date.valueOf(LocalDate.now()));
                preparedStatement.executeUpdate();
                ps.executeUpdate();

                //clearing fields
                editableFields();
                ///delete items from purchases cart after inserting items into db
                deleteItemsFromPurchasesCartDb();


                TrayNotification notification = new TrayNotification();
                notification.setTray("New Product", "Successfully Added", NotificationType.SUCCESS);
                notification.showAndDismiss(Duration.seconds(4));


            } catch (SQLException e) {
                e.printStackTrace();
                // new PromptDialogController("SQL Error!", "Error occured while executing Query.\nSQL Error Code: " + e.getErrorCode());
            }
        }

    }


    //adding item to the purchases cart database and displaying in the cart table
    @FXML
    private void addToCart() {
        try {

            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `purchasescart`(`invoiceNumber`, `barcode`, `productName`," +
                    " `quantity`, " +
                    "`purchasedPrice`, `sellingPrice`, `date`, `companyName`, `employeeName`, " +
                    "`description`, `category`) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, "");
            if (validateBarcode(barcodeField.getText())) {
                preparedStatement.setString(2, barcodeField.getText());
            }
            preparedStatement.setString(3, productNameTextField.getText());
            if (validateStock(String.valueOf(stockTextField.getText()))) {
                preparedStatement.setDouble(4, Double.valueOf(stockTextField.getText()));
            }
            if (validatePurchasedPrice(purchasedPriceTextField.getText())) {
                preparedStatement.setDouble(5, Double.valueOf(purchasedPriceTextField.getText()));
            }
            preparedStatement.setDouble(6, Double.valueOf(sellingPriceTextField.getText()));
            preparedStatement.setString(7, String.valueOf(LocalDateTime.now()));
            preparedStatement.setString(8, companyTextField.getText());
            preparedStatement.setString(9, LogInController.loggerUsername);
            preparedStatement.setString(10, descriptionTextArea.getText());
            preparedStatement.setString(11, categoryComboBox.getSelectionModel().getSelectedItem());
            preparedStatement.executeUpdate();
            //get items from db
            getItemsFromPurchasesCartDb();

        } catch (Exception e) {
            e.printStackTrace();
        }


    }


    //get list of items in the purchases cart and display them in the purchases cart table
    public void getItemsFromPurchasesCartDb() {
        try {
            PreparedStatement selectPreparedStatement = connection.prepareStatement("select * from purchasescart");
            ResultSet resultSet = selectPreparedStatement.executeQuery();
            addToCartItems.clear();
            while (resultSet.next()) {
                addToCartItems.addAll(new PurchaseModel(resultSet.getString("barcode"), resultSet.getString("productName"), resultSet.getDouble("quantity"),
                        resultSet.getDouble("purchasedPrice"), resultSet.getDouble("sellingPrice"), resultSet.getDate("date"), resultSet.getString("description"), resultSet.getString("category"), resultSet.getString("companyName"),
                        resultSet.getString("employeeName")));
            }
            cartTableview.setItems(addToCartItems);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    //delete items from purchases cart after submitting items in cart to purchases and products db
    public void deleteItemsFromPurchasesCartDb() {
        try {
            PreparedStatement deletePreparedStatement = connection.prepareStatement("delete from purchasescart");
            deletePreparedStatement.executeUpdate();
            addToCartItems.clear();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void btnSaveAction() {

        //checkFields();
        if (checkFields()) {
            Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
            alert.setTitle("Confirm Entry");
            alert.setGraphic(new ImageView(this.getClass().getResource("/main/resources/icons/question (2).png").toString()));

            alert.setHeaderText("Do you really want to add this entry?");
            alert.setContentText("Press OK to confirm, Cancel to go back");

            Optional<ButtonType> result = alert.showAndWait();

            if (result.get() == ButtonType.OK) {
                addRecordToDatabase();
                editableFields();
            }
        } else {
            JFXSnackbar snackbar = new JFXSnackbar(itemPane);
            snackbar.show("One or more fields are empty!", 3000);
        }


    }


    //getCategories from db
    public void getCategories(JFXComboBox<String> comboBox) {

        Connection connection = DBConnection.getConnection();
        ObservableList<String> categories = FXCollections.observableArrayList();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from categories");
            ResultSet resultSet = preparedStatement.executeQuery();
            comboBox.getItems().clear();
            while (resultSet.next()) {
                categories.addAll(resultSet.getString("categoryName"));
            }
            comboBox.getItems().setAll(categories);

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @FXML
    private void onSearchButtonClicked() {
        ObservableList<String> categoryList = FXCollections.observableArrayList();


        try {
            PreparedStatement categoryStatement = connection.prepareStatement("select * from categories");
            PreparedStatement preparedStatement = connection.prepareStatement("select * from purchases where productName like ?");
            preparedStatement.setString(1, txtSearch.getText());
            ResultSet resultSet = preparedStatement.executeQuery();
            ResultSet categoryResultSet = categoryStatement.executeQuery();


            while (resultSet.next()) {
                String barcode = resultSet.getString("barcodeField");
                String productName = resultSet.getString("productName");
                Double price = resultSet.getDouble("salePrice");
                String descriptionS = resultSet.getString("description");
                String category = resultSet.getString("category");
                Double stock = resultSet.getDouble("stock");

                while (categoryResultSet.next()) {
                    categoryList.setAll(categoryResultSet.getString("categoryName"));

                }
                barcodeField.setText(resultSet.getString("barcodeField"));
                productNameTextField.setText(resultSet.getString("productName"));
                sellingPriceTextField.setText(resultSet.getString("salePrice"));
                descriptionTextArea.setText(descriptionS);
                categoryComboBox.setItems(categoryList);
                categoryComboBox.getSelectionModel().select(category);


                stockTextField.setText(String.valueOf(stock));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @FXML
    private void setSearchTextField() {


        if (filterByComboBox.getValue() == ("Category")) {

            try {
                PreparedStatement selectPreparedStatement = connection.prepareStatement(" select * from purchases where category like ?");
                selectPreparedStatement.setString(1, "%" + searchTextField.getText() + "%");
                ResultSet resultSet = selectPreparedStatement.executeQuery();
                searchWithCategory.clear();
                while (resultSet.next()) {
                    searchWithCategory.setAll(new PurchaseModel(resultSet.getString("barcode"),
                            resultSet.getString("productName"),
                            resultSet.getDouble("purchasedPrice"),
                            resultSet.getDouble("quantity"),
                            resultSet.getDouble("total"),
                            resultSet.getString("date"),
                            resultSet.getString("companyName"),
                            resultSet.getString("employeeName")));


                }
                tbl.setItems(searchWithCategory);

            } catch (SQLException e) {
                e.printStackTrace();
            }


        } else if (filterByComboBox.getValue() == ("Price")) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(" select * from purchases where purchasedprice like ?");
                preparedStatement.setString(1, "%" + searchTextField.getText() + "%");
                ResultSet resultSet = preparedStatement.executeQuery();
                searchWithPrice.clear();
                while (resultSet.next()) {
                    searchWithPrice.setAll(new PurchaseModel(resultSet.getString("barcode"),
                            resultSet.getString("productName"),
                            resultSet.getDouble("purchasedPrice"),
                            resultSet.getDouble("quantity"),
                            resultSet.getDouble("total"),
                            resultSet.getString("date"),
                            resultSet.getString("companyName"),
                            resultSet.getString("employeeName")));
                }
                tbl.setItems(searchWithPrice);

            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if (filterByComboBox.getValue() == ("Available Stock")) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(" select * from purchases where stock like ?");
                preparedStatement.setString(1, "%" + searchTextField.getText() + "%");
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    searchWithStock.setAll(new PurchaseModel(resultSet.getString("barcode"),
                            resultSet.getString("productName"),
                            resultSet.getDouble("purchasedPrice"),
                            resultSet.getDouble("quantity"),
                            resultSet.getDouble("total"),
                            resultSet.getString("date"),
                            resultSet.getString("companyName"),
                            resultSet.getString("employeeName")));
                }
                tbl.setItems(searchWithStock);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (filterByComboBox.getValue() == ("Product Name")) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(" select * from purchases where productName like ?");
                preparedStatement.setString(1, "%" + searchTextField.getText() + "%");
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    searchWithName.setAll(new PurchaseModel(resultSet.getString("barcode"),
                            resultSet.getString("productName"),
                            resultSet.getDouble("purchasedPrice"),
                            resultSet.getDouble("quantity"),
                            resultSet.getDouble("total"),
                            resultSet.getString("date"),
                            resultSet.getString("companyName"),
                            resultSet.getString("employeeName")));
                    System.out.println(resultSet.getString("productName"));
                }
                tbl.setItems(searchWithName);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (filterByComboBox.getValue() == ("Default")) {

            FilteredList<PurchaseModel> searchedData = new FilteredList<>(listOfPurchases, e -> true);

            searchTextField.setOnKeyReleased(e -> {
                searchTextField.textProperty().addListener((observable, oldValue, newValue) -> {
                    searchedData.setPredicate(searchList -> {
                        if (newValue == null || newValue.isEmpty()) {
                            return true;
                        }
                        String lowerCaseFilter = newValue.toLowerCase();
                        if (searchList.getProductName().toLowerCase().contains(lowerCaseFilter)) {
                            return true;
                        } else return searchList.getProductName().toLowerCase().contains(lowerCaseFilter);
                    });
                });

                SortedList<PurchaseModel> sortedData = new SortedList<>(searchedData);
                sortedData.comparatorProperty().bind(tbl.comparatorProperty());
                tbl.setItems(sortedData);
            });
        }
    }


    private void printProductList() {
        if (filterByComboBox.getValue() == "Category") {
            try {


                insertIntoPrintCategory();


                //exporting to pdf
                JasperDesign jasperDesign = JRXmlLoader.load("printWithCategory.jrxml");
                JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);
                System.out.println();
                JasperViewer.viewReport(jasperPrint, false);
                System.out.println("printing done");

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {


            try {
                //exporting to pdf
                JasperDesign jasperDesign = JRXmlLoader.load("printProducts.jrxml");
                JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);
                System.out.println();
                JasperViewer.viewReport(jasperPrint, false);
                System.out.println("printing done");

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

    @FXML
    public void runPrint() {
        Thread thread = new Thread(printAtBackground);
        thread.start();

    }

    Runnable printAtBackground = new Runnable() {
        @Override
        public void run() {
            printProductList();
        }

    };


    public void insertIntoPrintCategory() {
        for (PurchaseModel items : searchWithCategory) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `printproductcat`(`barcodeField`, `productName`, `salePrice`, `purchasedPrice`, `stock`, `description`, `category`, `dateAdded`) VALUES (?,?,?,?,?,?,?,?)");
                preparedStatement.setString(1, items.getBarcode());
                preparedStatement.setString(2, items.getProductName());
                preparedStatement.setDouble(3, items.getSellingPrice());
                preparedStatement.setDouble(4, items.getPurchasedPrice());
                preparedStatement.setDouble(5, items.getQuantity());
                preparedStatement.setString(6, items.getDescription());
                preparedStatement.setString(7, items.getCategory());
                preparedStatement.setDate(8, items.getDateAdded());
                preparedStatement.executeUpdate();
                System.out.println(items.getProductName());

            } catch (SQLException e) {
                e.printStackTrace();
            }


        }
    }

    @FXML
    public void addNewCategory() {
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/main/resources/view/categories.fxml"));
            Stage stage = new Stage();
            stage.setOnCloseRequest(e -> {
                stage.close();
                getCategories(categoryComboBox);

            });
            stage.initModality(Modality.APPLICATION_MODAL);
            stage.setAlwaysOnTop(true);
            stage.setResizable(false);
            stage.setScene(new Scene(root));
            stage.show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void initializeCartTableView() {
        cartProductNameColumn.setCellValueFactory(new PropertyValueFactory<>("ProductName"));
        cartPriceColumn.setCellValueFactory(new PropertyValueFactory<>("sellingPrice"));
        cartStockColumn.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        getItemsFromPurchasesCartDb();

    }

    public void setDeletePurchasesButton() {
        Alert alert=new Alert(Alert.AlertType.INFORMATION);
        alert.setHeaderText("Delete Purchase");
        alert.setContentText("For security purposes\nDeletion is disabled\n Kindly contact Admin");
        alert.showAndWait();
       /* TrayNotification notification = new TrayNotification();
        notification.setTray("Delete Purchase", "For security purposes\nDeletion is disabled\n Kindly contact Admin", NotificationType.ERROR);
        notification.showAndDismiss(Duration.seconds(3));*/
    }

}
