package main.java.admin;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.util.Duration;
import main.java.admin.SalesModel.SalesModel;
import main.java.controllers.CheckoutController;
import main.java.entity.Item;
import main.java.entity.Product;
import main.java.others.DBConnection;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.ResourceBundle;

public class SalesManagementController implements Initializable {

    @FXML
    private VBox allSalesVBox;
    @FXML
    private Button newSaleButton;
    @FXML
    private Button deleteSaleButton;

    @FXML
    private TableView<SalesModel> salesTableView;
    @FXML
    private TableColumn<SalesModel, String> barcodeColumn;
    @FXML
    private TableColumn<SalesModel, String> productNameColumn;
    @FXML
    private TableColumn<SalesModel, Double> priceColumn;
    @FXML
    private TableColumn<SalesModel, Double> quantityColumn;
    @FXML
    private TableColumn<SalesModel, Double> totalColumn;
    @FXML
    private TableColumn<SalesModel, Date> dateTimeColumn;
    @FXML
    private TableColumn<SalesModel, String> customerNameColumn;
    @FXML
    private TableColumn<SalesModel, String> employeeNameColumn;

    //pos properties start here
    @FXML
    private AnchorPane posPane;

    @FXML
    private TextField posSearchField;
    @FXML
    private TableView<Product> posListAllProductTableView;
    @FXML
    private TableColumn<Product, String> posListProductColumn;
    @FXML
    private TableView<Item> posCartTableView;
    @FXML
    private TableColumn<Item, String> posCartNameColumn;
    @FXML
    private TableColumn<Item, String> posCartPriceColumn;
    @FXML
    private TableColumn<Item, String> posCartQuantityColumn;
    @FXML
    private TableColumn<Item, String> posCartTotalColumn;

    @FXML
    private TextField posBarcodeTextField;
    @FXML
    private TextField searchSalesTextField;
    @FXML
    private TextField posProductNameTextField;
    @FXML
    private TextField posPriceTextField;
    @FXML
    private TextField posQuantityTextField;
    @FXML
    private TextArea posDescriptionTextArea;
    @FXML
    private TextField subTotalField;
    @FXML
    private TextField vatField;
    @FXML
    private TextField discountField;
    @FXML
    private TextField netPayableField;
    @FXML
    private TextField searchCartTextField;
    @FXML
    private Button backButton;
    @FXML
    private Button addButton;
    @FXML
    private Button removeButton;
    @FXML
    private Button resetButton;
    @FXML
    private Button paymentButton;
    @FXML
    private Label posStockLabel;
    String netPayableAmount, currentBC = "";

    private double xOffset = 0;
    private double yOffset = 0;
    //pos properties end here
    Connection connection = DBConnection.getConnection();


    ObservableList<Product> listAllProducts = FXCollections.observableArrayList();
    ObservableList<Item> cartItems = FXCollections.observableArrayList();
    ObservableList<Item> productList = FXCollections.observableArrayList();
    ObservableList<SalesModel> listOfSales = FXCollections.observableArrayList();
    ObservableList<Item> cartSearch = FXCollections.observableArrayList();


    private void onCartItemClicked(MouseEvent event) {
        Connection connection = DBConnection.getConnection();
        if (event.getClickCount() == 2) {
            if (posCartTableView.getSelectionModel().getSelectedItem() == null) {

            } else if (posCartTableView.getSelectionModel().getSelectedItem() != null) {
                posProductNameTextField.setText(posCartTableView.getSelectionModel().getSelectedItem().getItemName());
                posPriceTextField.setText(String.valueOf(posCartTableView.getSelectionModel().getSelectedItem().getUnitPrice()));
                posQuantityTextField.setText(String.valueOf(posCartTableView.getSelectionModel().getSelectedItem().getQuantity()));
                posDescriptionTextArea.setText(posCartTableView.getSelectionModel().getSelectedItem().getItemName());

                //getting description and available stock from db
                try {
                    PreparedStatement preparedStatement = connection.prepareStatement("select * from products where productName=?");
                    preparedStatement.setString(1, posCartTableView.getSelectionModel().getSelectedItem().getItemName());
                    ResultSet resultSet = preparedStatement.executeQuery();
                    while (resultSet.next()) {
                        posStockLabel.setText(String.valueOf(resultSet.getString("stock")));
                        posDescriptionTextArea.setText(resultSet.getString("description"));
                    }


                    posQuantityTextField.setDisable(false);
                    addButton.setDisable(false);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                addButton.setText("Update");
                addButton.setOnAction(e -> {
                    if (validateInput()) {
                        try {

                            PreparedStatement updateStatement = connection.prepareStatement("UPDATE `cart` SET `quantity`=?,`total`=?  where productName=?");

                            updateStatement.setString(1, posQuantityTextField.getText());
                            updateStatement.setString(2, (String.valueOf(Double.parseDouble(posQuantityTextField.getText()) * (Double.parseDouble(posPriceTextField.getText())))));
                            updateStatement.setString(3, posProductNameTextField.getText());
                            updateStatement.executeUpdate();
                            resetAdd();
                        } catch (SQLException e1) {
                            e1.printStackTrace();
                        }
                    }

                    getItemsFromCart();
                    calculation();
                    addButton.setText("Add");

                    posQuantityTextField.setDisable(true);
                    addButton.setDisable(true);

                });
            }

        }
    }


    @FXML
    private void searchCartItems() {
        FilteredList<Item> searchedData = new FilteredList<>(posCartTableView.getItems(), e -> true);

        searchCartTextField.setOnKeyReleased(e -> {
            searchCartTextField.textProperty().addListener((observable, oldValue, newValue) -> {
                searchedData.setPredicate(items -> {
                    if (newValue == null || newValue.isEmpty()) {
                        return true;
                    }
                    String lowerCaseFilter = newValue.toLowerCase();
                    if (items.getItemName().toLowerCase().contains(lowerCaseFilter)) {
                        return true;
                    } else return items.getItemName().toLowerCase().contains(lowerCaseFilter);
                });
            });

            SortedList<Item> sortedData = new SortedList<>(searchedData);
            sortedData.comparatorProperty().bind(posCartTableView.comparatorProperty());
            posCartTableView.setItems(sortedData);
        });
    }

    private void insertIntoCart(String productName, double price, double quantity, double total) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO cart(productName, price, quantity, total) VALUES (?,?,?,?)");
            preparedStatement.setString(1, productName);
            preparedStatement.setDouble(2, price);
            preparedStatement.setDouble(3, quantity);
            preparedStatement.setDouble(4, total);

            preparedStatement.executeUpdate();
            System.out.println("products inserted into cart");


        } catch (SQLException e) {
            e.printStackTrace();

        }

    }


    @FXML
    private void paymentAction() {
        writeNetAmount(netPayableField.getText().trim());

        /*//inserting the items into cart
        for (Item s : cartItems) {
            insertIntoCart(s.getItemName(), s.getUnitPrice(), s.getQuantity(), s.getTotal());
            System.out.println("inserted to cart success");

        }*/

        try {

            FXMLLoader loader = new FXMLLoader((getClass().getResource("/main/resources/view/checkout.fxml")));
            CheckoutController controller = new CheckoutController();
            loader.setController(controller);

            Parent root = loader.load();
            Stage stage = new Stage();


            stage.initModality(Modality.APPLICATION_MODAL);
            root.setOnMousePressed((MouseEvent e) -> {
                xOffset = e.getSceneX();
                yOffset = e.getSceneY();
            });
            root.setOnMouseDragged((MouseEvent e) -> {
                stage.setX(e.getScreenX() - xOffset);
                stage.setY(e.getScreenY() - yOffset);
            });
            Scene scene = new Scene(root);

            stage.initModality(Modality.APPLICATION_MODAL);
            stage.setTitle("Payment");
            //  stage.initStyle(StageStyle.UNDECORATED);
            stage.setScene(scene);
            stage.show();


        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void resetInterface() {
        posCartTableView.getItems().clear();
        paymentButton.setDisable(true);
        posListAllProductTableView.getSelectionModel().clearSelection();
        posQuantityTextField.setText("");
        resetAdd();
        resetInvoice();
    }


    public void writeNetAmount(String netAMount) {
        try {
            FileWriter fw = new FileWriter("net amount");
            fw.write(netAMount);
            this.netPayableAmount = netAMount;
            fw.close();
            System.out.println("writing done");
            System.out.println("net amount is : " + netAMount);
        } catch (Exception e) {
            System.out.println(e);
        }
    }


    @FXML
    public void removeAction() {

        int index = posCartTableView.getSelectionModel().getSelectedIndex();

        if (index > 0) {
            posCartTableView.getItems().remove(index);
            calculation();
        } else if (index == 0) {
            posCartTableView.getItems().remove(index);
            resetInvoice();
        }
    }

    @FXML
    private void resetInvoice() {
        subTotalField.setText("0.00");
        vatField.setText("0.00");
        netPayableField.setText("0.00");
        paymentButton.setDisable(true);
        posCartTableView.getItems().clear();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from cart");
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void calculation() {

        double subTotalPrice = 0.0;
        subTotalPrice = posCartTableView.getItems().stream().map(
                Item::getTotal).reduce(subTotalPrice, (accumulator, _item) -> accumulator + _item);

        if (subTotalPrice > 0) {
            paymentButton.setDisable(false);
            double vat = 0.0 /*(double) subTotalPrice * 0.025*/;
            DecimalFormat decimalFormat = new DecimalFormat("###.#");

            //  double netPayablePrice = (Math.abs((subTotalPrice + vat) /*- 5*/));
            double netPayablePrice = Double.parseDouble(decimalFormat.format((Math.abs((subTotalPrice + vat) /*- 5*/))));

            subTotalField.setText(String.valueOf(subTotalPrice));
            vatField.setText(String.valueOf(vat));
            netPayableField.setText(String.valueOf(netPayablePrice));
        }

    }


    @FXML
    private void setAddButton() {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from cart where productName=?");
            preparedStatement.setString(1, posProductNameTextField.getText());
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String productName = resultSet.getString("productName");
                Double quantity = Double.parseDouble(resultSet.getString("quantity"));
                Double price = Double.parseDouble(resultSet.getString("price"));


                Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
                alert.setHeaderText(productName + " Already Exist in Cart");
                alert.setContentText("Would you like to update quantity?\n\n" +
                        "Quantity: " + quantity + "  " + "Price: " + price);

                alert.getButtonTypes().setAll(ButtonType.NO, ButtonType.YES);
                alert.showAndWait();
                if (alert.getResult() == ButtonType.NO) {
                    alert.close();
                    resetAdd();
                } else if (alert.getResult() == ButtonType.YES) {
                    addButton.setText("Update");
                    posQuantityTextField.setText(String.valueOf(quantity));
                    addButton.setOnAction(e -> {
                        if (validateInput()) {
                            try {

                                PreparedStatement updateStatement = connection.prepareStatement("UPDATE `cart` SET `quantity`=?,`total`=?  where productName=?");

                                updateStatement.setString(1, posQuantityTextField.getText());
                                updateStatement.setString(2, (String.valueOf(Double.parseDouble(posQuantityTextField.getText()) * price)));
                                updateStatement.setString(3, posProductNameTextField.getText());
                                updateStatement.executeUpdate();
                                resetAdd();

                            } catch (SQLException e1) {
                                e1.printStackTrace();
                            }
                        }

                        getItemsFromCart();
                        calculation();
                        addButton.setText("Add");
                        posQuantityTextField.setDisable(true);
                        addButton.setDisable(true);

                    });

                    System.out.println("asem aba");
                }

            } else {
                addProductToCartWithValidateInput();
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


    private void getItemsFromCart() {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("Select * from cart");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                cartItems.addAll(new Item(resultSet.getString("productName"),
                        resultSet.getDouble("price"), resultSet.getDouble("quantity"), resultSet.getDouble("total")));
            }
            posCartTableView.getItems().setAll(cartItems);
            cartItems.clear();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void addProductToCartWithValidateInput() {

        if (validateInput()) {


            try {
                PreparedStatement preparedStatement = connection.prepareStatement("select * from products where productName=?");
                preparedStatement.setString(1, posProductNameTextField.getText());
                ResultSet resultSet = preparedStatement.executeQuery();


                while (resultSet.next()) {
                    String nameOfProduct = resultSet.getString("productName");
                    double unitPrice = resultSet.getDouble("salePrice");
                    double quantity = Double.parseDouble(posQuantityTextField.getText());
                    DecimalFormat decimalFormat = new DecimalFormat("###.#");

                    double total = Double.parseDouble(decimalFormat.format(unitPrice * quantity));


                    //inserting the item into cart(db)
                    preparedStatement = connection.prepareStatement("INSERT INTO `cart`(`productName`, `price`, `quantity`, `total`) VALUES (?,?,?,?)");
                    preparedStatement.setString(1, nameOfProduct);
                    preparedStatement.setString(2, String.valueOf(unitPrice));
                    preparedStatement.setString(3, String.valueOf(quantity));
                    preparedStatement.setString(4, String.valueOf(total));
                    preparedStatement.executeUpdate();
                    System.out.println("Item added to cart(db)");


                }
                getItemsFromCart();//displaying items in cart(db) into the table
                System.out.println("items added to table");


                calculation();
                posListAllProductTableView.getSelectionModel().clearSelection();

                resetAdd();


            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    private void resetAdd() {
        posBarcodeTextField.setText("");
        posProductNameTextField.setText("");
        posPriceTextField.setText("");
        posQuantityTextField.setText("");
        posQuantityTextField.setDisable(true);
        posStockLabel.setText("");
        posDescriptionTextArea.setText("");
    }


    public boolean validateInput() {

        String errorMessage = "";

        if (posQuantityTextField.getText().equals("")) {
            errorMessage += "Quantity is Invalid!\n";
            posQuantityTextField.setStyle("-fx-border-color: red");
        } else if (
                Double.parseDouble(posQuantityTextField.getText()) < 1) {
            errorMessage += "Quantity is Invalid!\n";
            posQuantityTextField.setStyle("-fx-border-color: red");
        } else {
            double quantity = Double.parseDouble(posQuantityTextField.getText());
            String available = posStockLabel.getText();
            double availableQuantity = Double.parseDouble(available/*.substring(7)*/);

            if (quantity > availableQuantity) {
                errorMessage += "Available Quantity is less!\n";
            }
        }

        if (errorMessage.length() == 0) {
            return true;
        } else {
            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Warning");
            alert.setHeaderText("Please input the valid number of products");
            alert.setContentText(errorMessage);
            alert.showAndWait();

            return false;
        }
    }

    @FXML
    private void onProductsTableClicked() {
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = null;
            if (connection != null) {
                preparedStatement = connection.prepareStatement("select * from products where productName=?");
            }
            if (posListAllProductTableView.getSelectionModel() == null) {
                System.out.println("nothing is selected");
            } else {
                preparedStatement.setString(1, posListAllProductTableView.getSelectionModel().getSelectedItem().getProductName());

                ResultSet resultSet = preparedStatement.executeQuery();
                Double quantityOfProducts;
                while (resultSet.next()) {
                    posQuantityTextField.setDisable(false);
                    posQuantityTextField.setText("");
                    addButton.setText("Add");
                    posBarcodeTextField.setText(resultSet.getString("barcodeField"));
                    posDescriptionTextArea.setText(resultSet.getString("description"));
                    posProductNameTextField.setText(resultSet.getString("productName"));
                    posPriceTextField.setText(String.valueOf(resultSet.getDouble("salePrice")));
                    posStockLabel.setText(resultSet.getString("stock"));
                    quantityOfProducts = Double.parseDouble(resultSet.getString("stock"));


                }
                showDetails();
                addButton.setOnAction(e -> setAddButton());
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


    private void showDetails() {
        if (!posListAllProductTableView.getSelectionModel().isEmpty()) {
            posQuantityTextField.setDisable(false);
            addButton.setDisable(false);
            if (Double.parseDouble(posStockLabel.getText()) > 0) {
                posQuantityTextField.setEditable(true);
                posQuantityTextField.setStyle(null);
            } else {
                posQuantityTextField.setEditable(false);
                posQuantityTextField.setStyle("-fx-background-color: red;-fx-border-width: 3px");
            }

        } else {
            posProductNameTextField.setText("");
            posPriceTextField.setText("");
            posStockLabel.setText("");
            posDescriptionTextArea.setText("");
            posQuantityTextField.setDisable(true);
            addButton.setDisable(true);
        }
    }


    public void selectAllProducts() {
        Connection connection;
        try {
            connection = DBConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("select * from products ");
            ResultSet resultSet = preparedStatement.executeQuery();


            while (resultSet.next()) {
                listAllProducts.addAll(new Product(resultSet.getString("productName")));
            }
            posListAllProductTableView.setItems(listAllProducts);
            getItemsFromCart();
            if (!posCartTableView.getItems().isEmpty()) {
                paymentButton.setDisable(false);
                calculation();
            }
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }




    @FXML
    private void setNewSaleButton() {
        posPane.setVisible(true);
        allSalesVBox.setVisible(false);

        initializePosTables();

        selectAllProducts();
    }

    @FXML
    private void setBackButton() {
        posPane.setVisible(false);
        allSalesVBox.setVisible(true);

    }

    /**
     * select all sales from db
     */
    private void selectAllSales() {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from sales");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                listOfSales.addAll(new SalesModel(resultSet.getString("barcode"),
                        resultSet.getString("productName"),
                        resultSet.getDouble("price"),
                        resultSet.getDouble("quantity"),
                        resultSet.getDouble("total"),
                        resultSet.getString("date"),
                        resultSet.getString("customerName"),
                        resultSet.getString("employeeName")));
            }
            salesTableView.setItems(listOfSales);
            connection.close();
        } catch (SQLException e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Error", "unable to load sales", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            e.printStackTrace();
        }
    }


    private void initializePosTables() {
        posListProductColumn.setCellValueFactory(new PropertyValueFactory<>("productName"));
        posCartNameColumn.setCellValueFactory(new PropertyValueFactory<>("itemName"));
        posCartPriceColumn.setCellValueFactory(new PropertyValueFactory<>("unitPrice"));
        posCartQuantityColumn.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        posCartTotalColumn.setCellValueFactory(new PropertyValueFactory<>("total"));
    }

    @FXML
    private void filterData() {
        FilteredList<SalesModel> searchedData = new FilteredList<>(listOfSales, e -> true);

        searchSalesTextField.setOnKeyReleased(e -> {
            searchSalesTextField.textProperty().addListener((observable, oldValue, newValue) -> {
                searchedData.setPredicate(product -> {
                    if (newValue == null || newValue.isEmpty()) {
                        return true;
                    }
                    String lowerCaseFilter = newValue.toLowerCase();
                    if (product.getProductName().toLowerCase().contains(lowerCaseFilter)) {
                        return true;
                    } else return product.getProductName().toLowerCase().contains(lowerCaseFilter);
                });
            });

            SortedList<SalesModel> sortedData = new SortedList<>(searchedData);
            sortedData.comparatorProperty().bind(salesTableView.comparatorProperty());
            salesTableView.setItems(sortedData);
        });
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {

        barcodeColumn.setCellValueFactory(new PropertyValueFactory<>("barcode"));
        productNameColumn.setCellValueFactory(new PropertyValueFactory<>("productName"));
        priceColumn.setCellValueFactory(new PropertyValueFactory<>("price"));
        quantityColumn.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        totalColumn.setCellValueFactory(new PropertyValueFactory<>("total"));
        dateTimeColumn.setCellValueFactory(new PropertyValueFactory<>("dateTime"));
        customerNameColumn.setCellValueFactory(new PropertyValueFactory<>("customerName"));
        employeeNameColumn.setCellValueFactory(new PropertyValueFactory<>("employeeName"));


        selectAllSales();
        posCartTableView.setOnMouseClicked(this::onCartItemClicked);


    }
}
