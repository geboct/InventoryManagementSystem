package main.java.admin;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
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
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.util.Duration;
import main.java.admin.SalesModel.SalesModel;
import main.java.admin.purchaseModel.PurchaseModel;
import main.java.controllers.LogInController;
import main.java.entity.Item;
import main.java.entity.Product;
import main.java.others.DBConnection;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;
import org.jfree.chart.axis.Axis;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.io.*;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.ResourceBundle;

public class SalesManagementController implements Initializable {

    @FXML
    private VBox allSalesVBox;
    @FXML
    private Button newSaleButton, returnsButton;
    @FXML
    private Button deleteSaleButton;
    @FXML
    private AnchorPane returnsPane;

    @FXML
    protected TableView<SalesModel> salesTableView;
    @FXML
    private TableColumn<SalesModel, String> invoiceColumn;
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

    /**
     * checkout controller starts here
     */
    @FXML
    private JFXTextField customerNameField;

    @FXML
    private Label totalAmountTextField;

    @FXML
    private VBox mainPane;
    @FXML
    private AnchorPane checkoutPane;
    @FXML
    private JFXTextField amountPaidTextField;

    private JFXTextField invoiceNumberTexField;


    @FXML
    private Label changeLabel;

    @FXML
    private JFXButton cancelButton;

    @FXML
    private JFXButton makePaymentButton;
    Double change;

    /**
     * checkout controller properties end here
     */
    /**
     * return page properties begin here
     */
    @FXML
    private JFXTextField returnsInvoiceNumberTextField;

    @FXML
    private TableView<SalesModel> productsInInvoiceTableView;

    @FXML
    private TableColumn<SalesModel, String> productsInInvoiceName;

    @FXML
    private TableColumn<SalesModel, String> productsInInvoiceQuantity;

    @FXML
    private TableColumn<SalesModel, String> productsInInvoicePrice;

    @FXML
    private TableColumn<SalesModel, String> productsInInvoiceTotal;

    @FXML
    private TableColumn<SalesModel, String> productsInInvoiceDate;

    @FXML
    private Label returnsGrandTotalLabel;

    @FXML
    private Label returnsAmountPaidLabel;

    @FXML
    private RadioButton faultyRadioButton;

    @FXML
    private RadioButton notNeededRadioButton;

    @FXML
    private RadioButton wrongProductRadioButton;

    @FXML
    private RadioButton otherReasonRadioButton;

    @FXML
    private JFXTextArea otherReasonTextArea;

    @FXML
    private TableView<SalesModel> returningProductsTableView;

    @FXML
    private TableColumn<SalesModel, String> returningProductName;

    @FXML
    private TableColumn<SalesModel, String> returningProductPrice;

    @FXML
    private TableColumn<SalesModel, String> returningProductQuantity;

    @FXML
    private TableColumn<SalesModel, String> returningProductTotal;

    @FXML
    private FontAwesomeIconView pushAllRightIcon, returnsBackIcon;

    @FXML
    private FontAwesomeIconView pushAllLeftIcon;

    @FXML
    private FontAwesomeIconView pushSingleRightIcon;

    @FXML
    private FontAwesomeIconView pushSingleLeftIcon;

    @FXML
    private Button subMitReturnsButton;

    /**
     * return page property ends here
     */

    Connection connection = DBConnection.getConnection();


    ObservableList<Product> listAllProducts = FXCollections.observableArrayList();
    ObservableList<Item> cartItems = FXCollections.observableArrayList();
    ObservableList<Item> productList = FXCollections.observableArrayList();
    ObservableList<SalesModel> listOfSales = FXCollections.observableArrayList();
    ObservableList<Item> cartSearch = FXCollections.observableArrayList();
    ObservableList<SalesModel> listOfItemsInInvoice = FXCollections.observableArrayList();
    ObservableList<SalesModel> listOfItemsInInvoiceWorkWith = FXCollections.observableArrayList();


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
        cancelButton.setOnAction(e -> setCancelButton());
        makePaymentButton.setOnAction(e -> setMakePaymentButton());
        readNetAmount();
        changeLabel.setText("GH₵ 0.00");
        invoiceNumberTexField = new JFXTextField();
        checkoutPane.setVisible(true);
        posPane.setVisible(false);
       /* try {

            Parent root=FXMLLoader.load(getClass().getResource("/main/resources/view/checkout.fxml"));
            Stage stage=new Stage();

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
        }*/

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
                    preparedStatement = connection.prepareStatement("INSERT INTO `cart`(`productName`, `Price`, `quantity`, `total`) VALUES (?,?,?,?)");
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

    private void setReturnsButton() {
        allSalesVBox.setVisible(false);
        returnsPane.setVisible(true);
        initializeReturnsTables();

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
            listOfSales.clear();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from sales");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                listOfSales.addAll(new SalesModel(resultSet.getString("invoiceNumber"), resultSet.getString("barcode"),
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


    public void setDeleteSaleButton() {
        try {
            Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
            alert.setContentText("You are about t delete a sale\nClick Ok to delete or close to exit");
            alert.setHeaderText(null);
            alert.setTitle("Confirm Deletion");
            alert.getButtonTypes().setAll(ButtonType.OK, ButtonType.CLOSE);
            alert.showAndWait();
            if (alert.getResult() == ButtonType.OK) {
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `deletedsales`(`invoiceNumber`, " +
                        "`barcode`, `productName`, `price` ," +

                        "`quantity`, `total`, `date`, `customerName`, `employeeName`) VALUES (?,?,?,?,?,?,?,?,?)");
                preparedStatement.setString(1, salesTableView.getSelectionModel().getSelectedItem().getInvoiceNumber());
                preparedStatement.setString(2, salesTableView.getSelectionModel().getSelectedItem().getBarcode());
                preparedStatement.setString(3, salesTableView.getSelectionModel().getSelectedItem().getProductName());
                preparedStatement.setDouble(4, salesTableView.getSelectionModel().getSelectedItem().getPrice());
                preparedStatement.setDouble(5, salesTableView.getSelectionModel().getSelectedItem().getQuantity());
                preparedStatement.setDouble(6, salesTableView.getSelectionModel().getSelectedItem().getTotal());
                preparedStatement.setString(7, String.valueOf(LocalDate.now()));
                preparedStatement.setString(8, salesTableView.getSelectionModel().getSelectedItem().getCustomerName());
                preparedStatement.setString(9, LogInController.loggerUsername);
                preparedStatement.executeUpdate();

                PreparedStatement deletePurchase = connection.prepareStatement("delete from sales where invoiceNumber=? and productName=?");
                deletePurchase.setString(1, salesTableView.getSelectionModel().getSelectedItem().getInvoiceNumber());
                deletePurchase.setString(2, salesTableView.getSelectionModel().getSelectedItem().getProductName());
                deletePurchase.executeUpdate();
                selectAllSales();

                TrayNotification notification = new TrayNotification();
                notification.setTray("Delete Sales", "Product deleted Successfully", NotificationType.SUCCESS);
                notification.showAndDismiss(Duration.seconds(3));
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


       /* Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setHeaderText("Delete Sales");
        alert.setContentText("For security purposes\nDeletion is disabled\n Kindly contact Admin");
        alert.showAndWait();*/
       /* TrayNotification notification = new TrayNotification();
        notification.setTray("Delete Purchase", "For security purposes\nDeletion is disabled\n Kindly contact Admin", NotificationType.ERROR);
        notification.showAndDismiss(Duration.seconds(3));*/
    }

    public void onRightMouseButtonClickedOnAllPurchases(MouseEvent event) {//if user right clicks on the table showing all purchases
        // a pop should appear with a menu showing delete, update and returns
        ContextMenu returnsMenuContext = new ContextMenu();
        MenuItem returnsMenuItem = new MenuItem("Return a product");
        returnsMenuItem.setOnAction(ee -> {
            setReturnsButton();
        });

        MenuItem deleteMenuItem = new MenuItem("Delete a product");
        deleteMenuItem.setOnAction(ee -> {
            setDeleteSaleButton();
        });
        MenuItem newSaleMenuItem = new MenuItem("New Sale");
        newSaleMenuItem.setOnAction(ee -> {
            setNewSaleButton();
        });

        returnsMenuContext.getItems().addAll(newSaleMenuItem, deleteMenuItem, returnsMenuItem);
        if (event.getButton() == MouseButton.SECONDARY) {
            returnsMenuContext.show(salesTableView, event.getScreenX(), event.getScreenY());
        }

    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        invoiceColumn.setCellValueFactory(new PropertyValueFactory<>("invoiceNumber"));
        productNameColumn.setCellValueFactory(new PropertyValueFactory<>("productName"));
        priceColumn.setCellValueFactory(new PropertyValueFactory<>("price"));
        quantityColumn.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        totalColumn.setCellValueFactory(new PropertyValueFactory<>("total"));
        dateTimeColumn.setCellValueFactory(new PropertyValueFactory<>("dateTime"));
        customerNameColumn.setCellValueFactory(new PropertyValueFactory<>("customerName"));
        employeeNameColumn.setCellValueFactory(new PropertyValueFactory<>("employeeName"));

        deleteSaleButton.setOnAction(e -> setDeleteSaleButton());
        selectAllSales();
        posCartTableView.setOnMouseClicked(this::onCartItemClicked);
        returnsButton.setOnAction(e -> setReturnsButton());

        salesTableView.setOnMouseClicked(this::onRightMouseButtonClickedOnAllPurchases);
    }


    /**
     * checkout controller
     */

    private void setCancelButton() {
       /* Stage stage = (Stage) cancelButton.getScene().getWindow();
        stage.close();*/
        //cart must be cleared to avoid duplication on when user clicks pay
        //deleting items from cart

        // deleteItemsFromCart(connection);
        posPane.setVisible(true);
        checkoutPane.setVisible(false);

    }

    private void deleteItemsFromCart(Connection connection) {
        try {
            PreparedStatement deleteCartStatement = connection.prepareStatement("delete from cart");
            deleteCartStatement.executeUpdate();
            System.out.println("delete from cart success");

        } catch (SQLException e) {
            e.getMessage();
        }
    }


    private void readNetAmount() {
        try {
            FileReader fr = new FileReader("net amount");
            BufferedReader br = new BufferedReader(fr);

            totalAmountTextField.setText(br.readLine());
            br.close();
            fr.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void setCalculateButton() {

        try {
            double total = Double.parseDouble(totalAmountTextField.getText());
            double paid = Double.parseDouble(amountPaidTextField.getText());

            change = Math.abs(paid - total);
            DecimalFormat decimalFormat = new DecimalFormat("###.#");
            if (validateInputForChekoutController())
                changeLabel.setText("GH₵ " + String.valueOf(decimalFormat.format(change)));

        } catch (Exception e) {
           /* TrayNotification notification = new TrayNotification();
            notification.setTray("Invalid Number", "please enter a valid amount", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(4));*/
            // new PromptDialogController("Invalid Number", "Please Enter valid Figure");

            changeLabel.setText("Invalid paid amount");
        }
    }


    //method to get Items From cart and insert into sales
    private void setMakePaymentButton() {
        new SalesInvoiceGenerator(invoiceNumberTexField, "sales");

        if (checkFields()) {
            Connection connection = DBConnection.getConnection();
            try {
                assert connection != null;
                final PreparedStatement[] preparedStatement = {connection.prepareStatement(" Select * from cart")};
                ResultSet resultSet = preparedStatement[0].executeQuery();
                while (resultSet.next()) {
                    String productName = resultSet.getString("productName");
                    double salePrice = resultSet.getDouble("price");
                    double quantity = resultSet.getDouble("quantity");
                    double total = resultSet.getDouble("total");
                    double grandTotal = Double.parseDouble(totalAmountTextField.getText());
                    double amountPaid = Double.parseDouble(amountPaidTextField.getText());
                    double change = Double.parseDouble(changeLabel.getText().substring(4));

                    //inserting the purchased product into sales
                    try {

                        PreparedStatement insertStatement = connection.prepareStatement("INSERT INTO sales(invoiceNumber, productName, price, quantity, total, grandTotal, amountPaid,balance,date,customerName,employeeName) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
                        insertStatement.setString(1, invoiceNumberTexField.getText());
                        insertStatement.setString(2, productName);
                        insertStatement.setDouble(3, salePrice);
                        insertStatement.setDouble(4, quantity);
                        insertStatement.setDouble(5, total);
                        insertStatement.setDouble(6, grandTotal);
                        insertStatement.setDouble(7, amountPaid);
                        insertStatement.setDouble(8, change);
                        insertStatement.setDate(9, java.sql.Date.valueOf(LocalDate.now()));
                        insertStatement.setString(10, customerNameField.getText());
                        insertStatement.setString(11, LogInController.loggerUsername);
                        insertStatement.executeUpdate();
                        System.out.println("insert into sales successful");

                        //updating stock
                        updateStock();


                        //inserting into print invoice table
                        insertIntoPrintInvoice(
                                productName,
                                salePrice,
                                quantity,
                                total,
                                grandTotal,
                                amountPaid,
                                change,
                                LogInController.loggerUsername,
                                customerNameField.getText());

                        //since payment has been made, our cart is supposed to be empty
                        //deleting items from cart


                        deleteItemsFromCart(connection);
                        //clearing items from the cart table view
                        posCartTableView.getItems().clear();

                    } catch (Exception e) {
                        e.getMessage();
                        e.printStackTrace();
                    }


                }
                checkoutPane.setVisible(false);
                posPane.setVisible(true);
                resetInvoice();
                customerNameField.setText("");
                totalAmountTextField.setText("");
                changeLabel.setText("");
                amountPaidTextField.setText("");

                Thread thread = new Thread(() -> {
                    try {
                        JasperDesign jasperDesign = JRXmlLoader.load("receipt.jrxml");
                        JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
                        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);

                        JasperViewer.viewReport(jasperPrint, false);
                        // new Printer(jasperPrint, "EPSON TM-T20II Receipt");
                        System.out.println("printing done");


                        String query = "delete from printinvoice";

                        preparedStatement[0] = connection.prepareStatement(query);

                        preparedStatement[0].executeUpdate();
                        System.out.println("New Sale deleted from print Invoice Table after printing");

                    } catch (Exception ee) {
                        TrayNotification notification = new TrayNotification();
                        notification.setTray("Cannot Locate Report", ee.getMessage(), NotificationType.ERROR);
                        notification.showAndDismiss(Duration.seconds(3));
                        // new PromptDialogController("Cannot Locate Report", "Specify report location");
                        ee.printStackTrace();
                    }

                });
                thread.setDaemon(true);
                thread.start();


            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }


    private void updateStock() {
        String productName = "";
        double quantity, stock = 0, remainingStock = 0;

        try {
            //getting the names of product and quantity from cart

            PreparedStatement preparedStatement = connection.prepareStatement("select * from cart");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                productName = resultSet.getString("productName");
                quantity = resultSet.getDouble("quantity");

                //getting the stock value from the products table
                PreparedStatement getStockStatement = connection.prepareStatement("select * from products where productName=?");
                getStockStatement.setString(1, productName);
                ResultSet stockResult = getStockStatement.executeQuery();
                while (stockResult.next()) {
                    stock = stockResult.getDouble("stock");
                }

                //subtracting the quantity purchased from the available stock
                remainingStock = (stock - quantity);

                //inserting the new stock into database
                //NOTE: the already stock will be replaced with the new one
                PreparedStatement insertNewStockStatement = connection.prepareStatement("UPDATE `products` SET stock=? WHERE productName=?  ");
                insertNewStockStatement.setDouble(1, remainingStock);
                insertNewStockStatement.setString(2, productName);
                insertNewStockStatement.executeUpdate();


            }


        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    public boolean validateInputForChekoutController() {

        String errorMessage = "";


        if (amountPaidTextField.getText() == null || amountPaidTextField.getText().length() <= 0) {
            errorMessage += "Invalid Input!\n";
        } else if (Double.parseDouble(amountPaidTextField.getText()) < Double.parseDouble(totalAmountTextField.getText())) {
            errorMessage += "Insufficient Input!\n";
        }

        if (errorMessage.length() == 0) {
            return true;
        } else {
            /*Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Warning");
            alert.setHeaderText("Please input the valid amount");
            alert.setContentText(errorMessage);
            alert.showAndWait();*/
            changeLabel.setText("invalid amount paid");


            return false;
        }
    }


    private boolean checkFields() {

        if (!amountPaidTextField.getText().isEmpty()) {
            try {

                if (Double.parseDouble(amountPaidTextField.getText()) < Double.parseDouble(totalAmountTextField.getText())) {
                    TrayNotification notification = new TrayNotification();
                    notification.setTray(null, "Amount paid can't be less than Total AMount", NotificationType.ERROR);
                    notification.showAndDismiss(Duration.seconds(3));
                    return false;
                }

            } catch (NumberFormatException e) {
                TrayNotification notification = new TrayNotification();
                notification.setTray(null, "Please Enter a valid Amount", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));
                return false;
            }
        } else {
            TrayNotification notification = new TrayNotification();
            notification.setTray(null, "Amount paid can't be Empty", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            return false;
        }
        return true;

    }


    /**
     * inserting the sale into the print invoice table
     **/

    public void insertIntoPrintInvoice(String productName, double unitPrice, double quantity, double total, double grandTotal, double amountPaid, double balance, String employeeName, String customername) {
        try {

            String query = "insert into printInvoice( productName, unitPrice, quantity, Total,grandTotal,amountPaid,balance,employeeName,customerName) values(?,?,?,?,?,?,?,?,?)";

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, productName);
            preparedStatement.setDouble(2, unitPrice);
            preparedStatement.setDouble(3, quantity);
            preparedStatement.setDouble(4, total);
            preparedStatement.setDouble(5, grandTotal);
            preparedStatement.setDouble(6, amountPaid);
            preparedStatement.setDouble(7, balance);
            preparedStatement.setString(8, employeeName);
            preparedStatement.setString(9, customername);
            preparedStatement.executeUpdate();
            System.out.println("new Sale inserted into invoice success");
        } catch (Exception ee) {
            ee.printStackTrace();
        }

    }


    /**
     * checkout controller ends here
     */


    /**
     * returns start here
     */
public void submitReturnedProducts(){
    //add the products the user is returning into the database
    //delete that particular sale from the sales table
/**
 * TODO: add date of returns
 */

    try{
        PreparedStatement preparedStatement=connection.prepareStatement("INSERT INTO `returns`(`" +
                "invoiceNumber`, `barcode`, `productName`, `price`, `quantity`, `total`, " +
                "`grandTotal`, `amountPaid`, `date`, `customerName`, `soldEmployeeName`, " +
                "`receivingEmployeeName`,`reasonForReturns`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?) ");
        for (SalesModel salesModel:returningProductsTableView.getItems()){
            preparedStatement.setString(1,salesModel.getInvoiceNumber());
            preparedStatement.setString(2,salesModel.getBarcode());
            preparedStatement.setString(3,salesModel.getProductName());
            preparedStatement.setDouble(4,salesModel.getPrice());
            preparedStatement.setDouble(5,salesModel.getQuantity());
            preparedStatement.setDouble(6,salesModel.getTotal());
            preparedStatement.setDouble(7, Double.parseDouble(returnsGrandTotalLabel.getText()));
            preparedStatement.setDouble(8, Double.parseDouble(returnsAmountPaidLabel.getText()));
            preparedStatement.setDate(9, java.sql.Date.valueOf(salesModel.getDateTime()));
            preparedStatement.setString(10,salesModel.getCustomerName());
            preparedStatement.setString(11,salesModel.getEmployeeName());
            preparedStatement.setString(12,LogInController.loggerUsername);
            if (faultyRadioButton.isSelected()){
                preparedStatement.setString(13,"Faulty Product");

            }else if(notNeededRadioButton.isSelected()){
                preparedStatement.setString(13,"Product no longer needed");

            }else if(wrongProductRadioButton.isSelected()){
                preparedStatement.setString(13,"customer bought wrong product");

            }else if(otherReasonRadioButton.isSelected()){
                preparedStatement.setString(13,otherReasonTextArea.getText());

            }
            preparedStatement.executeUpdate();
            TrayNotification notification=new TrayNotification();
            notification.setTray("Returns","Product returns accepted ",NotificationType.SUCCESS);
            notification.showAndDismiss(Duration.seconds(3));

        }

    } catch (SQLException throwables) {
        TrayNotification notification=new TrayNotification();
        notification.setTray("Returns","Unable to accept returns ",NotificationType.ERROR);
        notification.showAndDismiss(Duration.seconds(3));
        throwables.printStackTrace();
    }

}

    public void toggleActions(ActionEvent event) {//if a radio button is selected

        if (event.getSource() == faultyRadioButton) {
            otherReasonTextArea.setVisible(false);
        } else if (event.getSource() == notNeededRadioButton) {
            otherReasonTextArea.setVisible(false);
        } else if (event.getSource() == wrongProductRadioButton) {
            otherReasonTextArea.setVisible(false);
        } else if (event.getSource() == otherReasonRadioButton) {
            otherReasonTextArea.setVisible(true);
        }
    }

    public void setToggleButtons() {

        ToggleGroup groupRadioButtons = new ToggleGroup();
        faultyRadioButton.setToggleGroup(groupRadioButtons);
        notNeededRadioButton.setToggleGroup(groupRadioButtons);
        wrongProductRadioButton.setToggleGroup(groupRadioButtons);
        otherReasonRadioButton.setToggleGroup(groupRadioButtons);


    }


    public void IconsActions(MouseEvent event) {
        if (event.getSource() == pushAllRightIcon) {
            listOfItemsInInvoice = listOfItemsInInvoiceWorkWith;
            returningProductsTableView.getItems().setAll(listOfItemsInInvoiceWorkWith);
        } else if (event.getSource() == pushAllLeftIcon) {
            returningProductsTableView.getItems().clear();

        } else if (event.getSource() == pushSingleRightIcon) {
            returningProductsTableView.getItems().add(productsInInvoiceTableView.getSelectionModel().getSelectedItem());

        } else if (event.getSource() == pushSingleLeftIcon) {

            int index = returningProductsTableView.getSelectionModel().getSelectedIndex();
            returningProductsTableView.getItems().remove(index);

        }
    }


    public void setReturnsBackIcon() {
        returnsPane.setVisible(false);
        allSalesVBox.setVisible(true);
        // returnsBackIcon.setVisible(true);
    }

    public void initializeReturnsTables() {
        productsInInvoiceName.setCellValueFactory(new PropertyValueFactory<>("productName"));
        productsInInvoiceQuantity.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        productsInInvoicePrice.setCellValueFactory(new PropertyValueFactory<>("price"));
        productsInInvoiceTotal.setCellValueFactory(new PropertyValueFactory<>("total"));
        productsInInvoiceDate.setCellValueFactory(new PropertyValueFactory<>("dateTime"));
        returnsBackIcon.setVisible(true);
        returnsBackIcon.setOnMouseClicked(e -> setReturnsBackIcon());
        pushAllRightIcon.setOnMouseClicked(e -> IconsActions(e));
        pushAllLeftIcon.setOnMouseClicked(e -> IconsActions(e));
        pushSingleRightIcon.setOnMouseClicked(e -> IconsActions(e));
        pushSingleLeftIcon.setOnMouseClicked(e -> IconsActions(e));

        //initializing the selected items to return table
        returningProductName.setCellValueFactory(new PropertyValueFactory<>("productName"));
        returningProductPrice.setCellValueFactory(new PropertyValueFactory<>("price"));
        returningProductQuantity.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        returningProductTotal.setCellValueFactory(new PropertyValueFactory<>("total"));
        setToggleButtons();
        otherReasonTextArea.setVisible(false);
        otherReasonRadioButton.setOnAction(e -> toggleActions(e));
        faultyRadioButton.setOnAction(e -> toggleActions(e));
        notNeededRadioButton.setOnAction(e -> toggleActions(e));
        wrongProductRadioButton.setOnAction(e -> toggleActions(e));
        subMitReturnsButton.setOnAction(e->submitReturnedProducts());


    }


    @FXML
    public void setReturnsInvoiceNumberTextField(KeyEvent event) {
        double grandTotal = 0.00, amountPaid = 0.00;
        if (event.getCode() == KeyCode.ENTER) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("select * from sales where invoiceNumber =? ");
                preparedStatement.setString(1, returnsInvoiceNumberTextField.getText());
                ResultSet resultSet = preparedStatement.executeQuery();
                listOfItemsInInvoice.clear();
                while (resultSet.next()) {
                    listOfItemsInInvoice.addAll(new SalesModel(resultSet.getString("invoiceNumber"),
                            resultSet.getString("barcode"),
                            resultSet.getString("productName"),
                            resultSet.getDouble("price"),
                            resultSet.getDouble("quantity"),
                            resultSet.getDouble("total"),
                            resultSet.getString("date"),
                            resultSet.getString("customerName"),
                            resultSet.getString("employeeName")));
                    listOfItemsInInvoiceWorkWith.addAll(new SalesModel(resultSet.getString("invoiceNumber"), resultSet.getString("barcode"),
                            resultSet.getString("productName"), resultSet.getDouble("price"), resultSet.getDouble("quantity"), resultSet.getDouble("total"),
                            resultSet.getString("date"), resultSet.getString("customerName"), resultSet.getString("employeeName")));


                    grandTotal = resultSet.getDouble("grandTotal");
                    amountPaid = resultSet.getDouble("amountPaid");

                }
                returnsGrandTotalLabel.setText(String.valueOf(grandTotal));
                returnsAmountPaidLabel.setText(String.valueOf(amountPaid));
                productsInInvoiceTableView.setItems(listOfItemsInInvoice);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

    }

    /**
     * returns end here
     */
}
