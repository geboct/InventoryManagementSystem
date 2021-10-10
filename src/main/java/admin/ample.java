package main.java.admin;

import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import de.jensd.fx.glyphs.fontawesome.FontAwesomeIconView;
import javafx.fxml.FXML;
import javafx.scene.control.*;

public class ample {
    @FXML
    private JFXTextField returnsInvoiceNumberTextField;

    @FXML
    private TableView<?> productsInInvoiceTableView;

    @FXML
    private TableColumn<?, ?> productsInInvoiceName;

    @FXML
    private TableColumn<?, ?> productsInInvoiceQuantity;

    @FXML
    private TableColumn<?, ?> productsInInvoicePrice;

    @FXML
    private TableColumn<?, ?> productsInInvoiceTotal;

    @FXML
    private TableColumn<?, ?> productsInInvoiceDate;

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
    private TableView<?> returningProductsTableView;

    @FXML
    private TableColumn<?, ?> returningProductName;

    @FXML
    private TableColumn<?, ?> returningProductPrice;

    @FXML
    private TableColumn<?, ?> returningProductQuantity;

    @FXML
    private TableColumn<?, ?> returningProductTotal;

    @FXML
    private FontAwesomeIconView pushAllrightIcon;

    @FXML
    private FontAwesomeIconView pushAllLeftIcon;

    @FXML
    private FontAwesomeIconView pushSingleRightIcon;

    @FXML
    private FontAwesomeIconView pushSingleLeftIcon;

    @FXML
    private Button subMitReturnsButton;
}
