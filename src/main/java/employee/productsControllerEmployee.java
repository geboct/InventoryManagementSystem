package main.java.employee;

import com.jfoenix.controls.*;
import de.jensd.fx.glyphs.fontawesome.FontAwesomeIconView;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import main.java.controllers.PromptDialogController;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;
import org.controlsfx.control.textfield.TextFields;
import main.java.others.DBConnection;
import main.java.others.Item;

import java.net.URL;

import java.sql.*;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.TreeMap;


public class productsControllerEmployee implements Initializable {

    @FXML
    private JFXTextField txtItemName;
    @FXML
    private JFXComboBox<String> categoryComboBox;

    @FXML
    private Label itemID;

    @FXML
    private JFXTextField txtStock;
    @FXML
    private JFXTextField txtPrice;
    @FXML
    private Label lblPageIndex, lblSearchResults;
    @FXML
    private JFXButton btnPrevEntry;
    @FXML
    private JFXButton btnNextEntry;
    @FXML
    private JFXButton btnListAll;
    @FXML
    private JFXButton btnOutOfStock, btnGoBack;
    @FXML
    private JFXTextField txtSearch;
    @FXML
    private TextField searchTextField;

    @FXML
    private TextArea description;

    @FXML
    private JFXButton btnSearch;
    @FXML
    private AnchorPane itemPane;
    @FXML
    private AnchorPane itemListPane;
    @FXML
    private TableView<Item> tbl;
    @FXML
    private TableColumn<Item, String> barcode;
    @FXML
    private TableColumn<Item, String> columnItemName;
    @FXML
    private TableColumn<Item, String> columnCategory;

    @FXML
    private TableColumn<Item, Double> columnPrice;
    @FXML
    private TableColumn<Item, Integer> columnStock;
    @FXML
    private TableColumn<Item, String> descriptionColumn;

    @FXML
    private FontAwesomeIconView btnSearchIcon;
    private static int recordIndex = 0;
    private static int recordSize = 0;
    private Item onView = null;

    private static boolean searchDone = false;
    private static String imgPath = null;
    public static TreeMap<String, Integer> itemType = new TreeMap<>();
    public static ObservableList<Item> itemList = FXCollections.observableArrayList(); //This field will auto set from InitializerController Class
    public static ObservableList<Item> tempList = FXCollections.observableArrayList(); //Will hold the main list while searching
    public static ArrayList<String> itemNames = new ArrayList<>();
    public static ObservableList<String> itemTypeName = FXCollections.observableArrayList();
    ObservableList <Item>listOfProducts=FXCollections.observableArrayList();
    Connection connection = DBConnection.serverConnection();

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        TextFields.bindAutoCompletion(txtSearch, itemNames);


        setView();

    }


    private void reloadRecords() {
        itemList.clear();
        Connection connection = DBConnection.serverConnection();
        try {
            PreparedStatement getItemList = connection.prepareStatement("SELECT *" +
                    "FROM products ORDER BY barcode");
            ResultSet itemResultSet = getItemList.executeQuery();

            while (itemResultSet.next()) {
                Item item = new Item(itemResultSet.getString("barcodeField"),
                        itemResultSet.getString("productName"),
                        itemResultSet.getDouble("salePrice"),
                        itemResultSet.getDouble("stock"),
                        itemResultSet.getString("category"));

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
            lblPageIndex.setText("Showing " + (recordIndex + 1) + " of " + recordSize + " results");
            btnNextEntry.setDisable(false);
            if (recordIndex == 0)
                btnPrevEntry.setDisable(true);

        });

        btnNextEntry.setDisable(true); //For purpose ;)

        if (recordSize > 0) {
            onView = itemList.get(recordIndex); //Setting value for current record

            //Setting customer default fields
            recordNavigator();

            //Setting page indexer value
            lblPageIndex.setText("Showing " + (recordIndex + 1) + " of " + recordSize + " results");

            if (recordSize > 1) {
                btnNextEntry.setDisable(false); //Next entry will be enabled if there is more than one entry
            }
        }

        btnPrevEntry.setDisable(true); //Disabling prevButton Initially


    }

    //This method will set navigate between Items
    private void recordNavigator() {

        txtStock.setStyle("-fx-text-fill: #263238"); //Resetting stock color

        txtPrice.setText(String.valueOf(onView.getSalePrice()));

        itemID.setText(String.valueOf(onView.getBarcode()));
        txtItemName.setText(onView.getName());
        //categoryComboBox.setValue(onView.getCategory());
        categoryComboBox.getItems().setAll(onView.getCategory());
        categoryComboBox.getSelectionModel().select(0);
        txtStock.setText(Double.toString(onView.getStock()));
        description.setText(onView.getDescription());


        if (onView.getStock() <= 5) //Setting stock color red if it's very limited
            txtStock.setStyle("-fx-text-fill: red");

        //Setting Image

    }


    public void listAllItems() {

        listOfProducts.clear();
        Connection connection = DBConnection.serverConnection();

        btnGoBack.setOnAction(e -> {
            itemListPane.setVisible(false);  //Setting item list pane visible
            itemPane.setVisible(true); //Setting item pane visible
        });
        itemList.clear();
        //getting all products in database
        try {
            PreparedStatement selectProductStatement = connection.prepareStatement("select * from products");
            ResultSet selectResultSet = selectProductStatement.executeQuery();
            while (selectResultSet.next()) {
                //loop through the available products
                String productId = selectResultSet.getString("barcodeField");
                String productName = selectResultSet.getString("productName");
                double salePrice = selectResultSet.getDouble("salePrice");
                Double stockLeft = selectResultSet.getDouble("stock");
                String category = selectResultSet.getString("category");


                //adding products to the list
                itemList.addAll(new Item(productId, productName, salePrice, stockLeft, category, selectResultSet.getString("description")));
                listOfProducts.addAll(new Item(productId, productName, salePrice, stockLeft, category, selectResultSet.getString("description")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //adding products to the table
      //  tbl.setItems(itemList);
        tbl.setItems(listOfProducts);
        listView();
    }


    @FXML
    void outOfStockList(ActionEvent event) {

        btnGoBack.setOnAction(e -> {
            itemListPane.setVisible(false);  //Setting item list pane visible
            itemPane.setVisible(true); //Setting item pane visible
        });

        Connection con = DBConnection.serverConnection();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE  stock <=" + 5);
            ResultSet itemResultSet = ps.executeQuery();

            ObservableList<Item> outOfStk = FXCollections.observableArrayList();

            while (itemResultSet.next()) {
                Item item = new Item(itemResultSet.getString("barcodeField"),
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
    }

    private void listView() {
        itemPane.setVisible(false); //Setting default item pane not visible
        itemListPane.setVisible(true); //Setting item list visible

        barcode.setCellValueFactory(new PropertyValueFactory<>("barcode"));
        columnItemName.setCellValueFactory(new PropertyValueFactory<>("name"));
        columnStock.setCellValueFactory(new PropertyValueFactory<>("stock"));
        columnCategory.setCellValueFactory(new PropertyValueFactory<>("category"));
        columnPrice.setCellValueFactory(new PropertyValueFactory<>("salePrice"));
        descriptionColumn.setCellValueFactory(new PropertyValueFactory<>("description"));
    }


    /**
     * This method search into database with the id of a item and returns the result
     *
     * @param id: ID of the item
     * @return: The search result of the query
     */
    private ObservableList<Item> searchWithID(Integer id) {
        Connection con = DBConnection.serverConnection();

        ObservableList<Item> searchResult = FXCollections.observableArrayList(); //list to hold search result

        try {
            PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM products WHERE barcodeField = ? ");
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            //Getting values from Items result set
            while (resultSet.next()) {
                Item item = new Item(resultSet.getString("barcodeField"),
                        resultSet.getString("productName"),
                        resultSet.getDouble("salePrice"),
                        resultSet.getDouble("stock"),
                        resultSet.getString("category"));


                searchResult.add(item);
            }

            con.close();

        } catch (SQLException e) {

            new PromptDialogController("SQL Error!",
                    "Error occured while executing Query.\nSQL Error Code: " + e.getErrorCode());
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

    private ObservableList<Item> searchWithName(String name) {
        Connection con = DBConnection.serverConnection();

        String nameSQL = "SELECT * FROM products WHERE productName COLLATE UTF8_GENERAL_CI like ? ";

        ObservableList<Item> searchResult = FXCollections.observableArrayList(); //list to hold search result

        try {
            PreparedStatement preparedStatement = con.prepareStatement(nameSQL);
            preparedStatement.setString(1, "%" + txtSearch.getText() + "%");

            ResultSet resultSet = preparedStatement.executeQuery();

            //Getting values from products result set
            while (resultSet.next()) {
                Item item = new Item(resultSet.getString("barcodeField"),
                        resultSet.getString("productName"),
                        resultSet.getDouble("salePrice"),
                        resultSet.getDouble("stock"),
                        resultSet.getString("category"),
                        resultSet.getString("description"));

                //  System.out.println(item);
                searchResult.add(item);
                // System.out.println(searchResu);

            }

            con.close();

        } catch (SQLException e) {
            new PromptDialogController("SQL Error!",
                    "Error occured while executing Query.\nSQL Error Code: " + e.getErrorCode());
        }

        return searchResult;
    }


    @FXML
    void btnSearchAction(ActionEvent event) {
        if (searchDone) {
            searchDone = false;
            lblSearchResults.setVisible(false);
            itemList = tempList; //Reassigning customers List
            recordSize = itemList.size();
            btnSearch.setTooltip(new Tooltip("Search with customers name or id"));
            btnSearchIcon.setGlyphName("SEARCH");
            setView();
        } else {
            ObservableList<Item> searchResult = FXCollections.observableArrayList(); //list to hold search result
            try {
                // Checking if input field is a number then searching with ID
                // If parsing of Integer fails then we shall try to search
                // with name instead
                Integer id = Integer.valueOf(txtSearch.getText());
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

    @FXML
    private void printProductList() {
        try {
            //exporting to pdf
            JasperDesign jasperDesign = JRXmlLoader.load("printProducts.jrxml");
            JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);

            JasperViewer.viewReport(jasperPrint, false);
            //new Printer(jasperPrint, "POS-58C");
            System.out.println("printing done");
            // new PDFPrinter(jasperPrint, "", today.getText());

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println();
        }


    }


    @FXML
    private void setSearchTextField() {

        FilteredList<Item> searchedData = new FilteredList<>(listOfProducts, e -> true);

        searchTextField.setOnKeyReleased(e -> {
            searchTextField.textProperty().addListener((observable, oldValue, newValue) -> {
                searchedData.setPredicate(item -> {
                    if (newValue == null || newValue.isEmpty()) {
                        return true;
                    }
                    String lowerCaseFilter = newValue.toLowerCase();
                    if (item.getName().toLowerCase().contains(lowerCaseFilter)) {
                        return true;
                    } else return item.getBarcode().toLowerCase().contains(lowerCaseFilter);
                });
            });

            SortedList<Item> sortedData = new SortedList<>(searchedData);
            sortedData.comparatorProperty().bind(tbl.comparatorProperty());
            tbl.setItems(sortedData);
        });
    }
}
