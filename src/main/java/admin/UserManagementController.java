package main.java.admin;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.util.Duration;
import main.java.others.DBConnection;
import main.java.admin.usersModel.UsersModel;
import main.java.others.Item;
import tray.notification.NotificationType;
import tray.notification.TrayNotification;

import java.net.URL;
import java.sql.*;
import java.util.Objects;
import java.util.ResourceBundle;


public class UserManagementController implements Initializable {

    @FXML
    private TableView<UsersModel> usersTableView;
    @FXML
    private TableColumn<UsersModel, String> idColumn;
    @FXML
    private TableColumn<UsersModel, String> userFullNameColumn;
    @FXML
    private TableColumn<UsersModel, String> usernameColumn;
    @FXML
    private TableColumn<UsersModel, String> userRoleColumn;
    @FXML
    private TableColumn<UsersModel, String> lastLoginColumn;
    @FXML
    private TableColumn<UsersModel, String> statusColumn;
    @FXML
    private VBox allUsersVBox;

    @FXML
    private TextField searchTextField;
    @FXML
    private Button addNewUserButton;
    @FXML
    private Button newUserBackButton;
    @FXML
    private Button newUserSubmitButton;

    @FXML
    private Button updateButton;
    @FXML
    private Button deleteUserButton;
    @FXML
    private VBox newUserVBox;
    @FXML
    private TextField fullNameField;
    @FXML
    private TextField usernameField;
    @FXML
    private TextField phoneNumberField;
    @FXML
    private ComboBox<String> accessLevelComboBox;
    @FXML
    private ComboBox<String> statusComboBox;

    ObservableList<UsersModel> allUsersList = FXCollections.observableArrayList();


    Connection connection = DBConnection.getConnection();
    String username = "";

    private void updateUserDetails() {

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `user` SET `fullName`=?,`username`=?,`phone`=?,`password`=?,`accessLevel`=?,`status`=? where username=?");
            //   preparedStatement.setString(1, );
            preparedStatement.setString(1, fullNameField.getText());
            preparedStatement.setString(2, usernameField.getText());
            if (phoneNumberField.getText().length() > 10 || phoneNumberField.getText().length() < 10) {
                TrayNotification notification = new TrayNotification();
                notification.setTray("ERROR", fullNameField.getText() + " Phone Number is Incorrect", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));
            } else if (phoneNumberField.getText().length() == 10) {
                preparedStatement.setString(3, phoneNumberField.getText());

            }
            preparedStatement.setString(4, "1234");
            preparedStatement.setString(5, String.valueOf(accessLevelComboBox.getValue()));
            preparedStatement.setString(6, String.valueOf(statusComboBox.getValue()));
            preparedStatement.setString(7, username);
            preparedStatement.executeUpdate();

            TrayNotification notification = new TrayNotification();
            notification.setTray("Success", fullNameField.getText() + " Updated successfully", NotificationType.SUCCESS);
            notification.showAndDismiss(Duration.seconds(3));

            fullNameField.clear();
            usernameField.clear();
            phoneNumberField.clear();
            accessLevelComboBox.getSelectionModel().clearSelection();
            statusComboBox.getSelectionModel().clearSelection();
            allUsersVBox.setVisible(true);
            newUserSubmitButton.setVisible(true);
            newUserVBox.setVisible(false);
            updateButton.setVisible(false);

        } catch (SQLException e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Error", "Unable to update user", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            e.printStackTrace();

        }
    }

    public void editUser(MouseEvent e) {


        if (e.getClickCount() == 2) {
            if (usersTableView.getSelectionModel().getSelectedItem() != null) {
                allUsersVBox.setVisible(false);
                newUserVBox.setVisible(true);
                fullNameField.setText(usersTableView.getSelectionModel().getSelectedItem().getName());
                usernameField.setText(usersTableView.getSelectionModel().getSelectedItem().getUsername());
                phoneNumberField.setText(usersTableView.getSelectionModel().getSelectedItem().getPhoneNumber());
                accessLevelComboBox.getSelectionModel().select(usersTableView.getSelectionModel().getSelectedItem().getRole());
                statusComboBox.getSelectionModel().select(usersTableView.getSelectionModel().getSelectedItem().getStatus());
                username = usersTableView.getSelectionModel().getSelectedItem().getUsername();

                newUserSubmitButton.setVisible(false);
                updateButton.setVisible(true);


            }else {
                TrayNotification notification=new TrayNotification();
                notification.setTray(null,"No user is Selected",NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));
            }



        }

    }

    @FXML
    private void setDeleteUserButton() {
        if (usersTableView.getSelectionModel().getSelectedItem() == null) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Error", "Please select user to delete", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
        } else {
            Connection connection = DBConnection.getConnection();
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("delete from user where userID=?");
                preparedStatement.setString(1, usersTableView.getSelectionModel().getSelectedItem().getId());
                preparedStatement.executeUpdate();
                selectAllUsers();
            } catch (SQLException e) {

                e.printStackTrace();
            }
        }
    }


    private void setNewUserSubmitButton() {


        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `user`(/*`userID`,*/ `fullName`, `username`, `phone`, `password`, `accessLevel`, `status`) VALUES (?,?,?,?,?,?)");
            //   preparedStatement.setString(1, );
            preparedStatement.setString(1, fullNameField.getText());
            preparedStatement.setString(2, usernameField.getText());
            if (phoneNumberField.getText().length() > 10 || phoneNumberField.getText().length() < 10) {
                TrayNotification notification = new TrayNotification();
                notification.setTray("ERROR", fullNameField.getText() + " Phone Number is Incorrect", NotificationType.ERROR);
                notification.showAndDismiss(Duration.seconds(3));
            } else if (phoneNumberField.getText().length() == 10) {
                preparedStatement.setString(3, phoneNumberField.getText());

            }
            preparedStatement.setString(4, "1234");
            preparedStatement.setString(5, String.valueOf(accessLevelComboBox.getValue()));
            preparedStatement.setString(6, String.valueOf(statusComboBox.getValue()));
            preparedStatement.executeUpdate();

            TrayNotification notification = new TrayNotification();
            notification.setTray("Success", fullNameField.getText() + " added successfully", NotificationType.SUCCESS);
            notification.showAndDismiss(Duration.seconds(3));

            fullNameField.clear();
            usernameField.clear();
            phoneNumberField.clear();
            accessLevelComboBox.getSelectionModel().clearSelection();
            statusComboBox.getSelectionModel().clearSelection();
        } catch (SQLException e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Error", "Unable to add user", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            e.printStackTrace();

        }
    }


    private void addNewUser() {

        allUsersVBox.setVisible(false);
        newUserVBox.setVisible(true);
        //newUserSubmitButton.setOnAction(e -> addNewUser());
    }


    private void selectAllUsers() {

        Connection connection = DBConnection.getConnection();
        try {
            /**
             * creating delete and edit icons
             */

            PreparedStatement preparedStatement = connection.prepareStatement("select * from user");
            ResultSet resultSet = preparedStatement.executeQuery();
            allUsersList.clear();
            while (resultSet.next()) {
                allUsersList.addAll(new UsersModel(resultSet.getString("userID"),
                        resultSet.getString("fullName"),
                        resultSet.getString("username"),
                        resultSet.getString("phone"),
                        resultSet.getString("accessLevel"),
                        resultSet.getString("lastLogin"),
                        resultSet.getString("status")));
            }
            usersTableView.setItems(allUsersList);

        } catch (SQLException e) {
            TrayNotification notification = new TrayNotification();
            notification.setTray("Error", "Unable to load users", NotificationType.ERROR);
            notification.showAndDismiss(Duration.seconds(3));
            /// e.printStackTrace();
        }
    }

    @FXML
    public void onUserSearch() {


        FilteredList<UsersModel> searchedData = new FilteredList<>(allUsersList, e -> true);

        searchTextField.setOnKeyReleased(e -> {
            searchTextField.textProperty().addListener((observable, oldValue, newValue) -> {
                searchedData.setPredicate(product -> {
                    if (newValue == null || newValue.isEmpty()) {
                        return true;
                    }
                    String lowerCaseFilter = newValue.toLowerCase();
                    if (product.getName().toLowerCase().contains(lowerCaseFilter)) {
                        return true;
                    } else return product.getName().toLowerCase().contains(lowerCaseFilter);
                });
            });

            SortedList<UsersModel> sortedData = new SortedList<>(searchedData);
            sortedData.comparatorProperty().bind(usersTableView.comparatorProperty());
            usersTableView.setItems(sortedData);
        });

    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        idColumn.setCellValueFactory(new PropertyValueFactory<>("id"));
        userFullNameColumn.setCellValueFactory(new PropertyValueFactory<>("name"));
        usernameColumn.setCellValueFactory(new PropertyValueFactory<>("username"));
        userRoleColumn.setCellValueFactory(new PropertyValueFactory<>("role"));
        lastLoginColumn.setCellValueFactory(new PropertyValueFactory<>("lastLogin"));
        statusColumn.setCellValueFactory(new PropertyValueFactory<>("status"));


        ObservableList<String> levels = FXCollections.observableArrayList("Admin", "Employee");
        accessLevelComboBox.setItems(levels);

        ObservableList<String> statuses = FXCollections.observableArrayList("Active", "Deactive");
        statusComboBox.setItems(statuses);

        usersTableView.setTooltip(new Tooltip("Double click to edit user"));
        selectAllUsers();
        addNewUserButton.setOnAction(e -> addNewUser());
        newUserBackButton.setOnAction(e -> {
            allUsersVBox.setVisible(true);
            newUserVBox.setVisible(false);
            selectAllUsers();
        });

        newUserSubmitButton.setOnAction(ee -> setNewUserSubmitButton());
        updateButton.setOnAction(e -> updateUserDetails());
        usersTableView.setOnMouseClicked(e -> {
            editUser(e);

        });

    }
}
