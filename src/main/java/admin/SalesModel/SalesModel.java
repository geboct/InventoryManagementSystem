package main.java.admin.SalesModel;

import java.util.Date;

public class SalesModel {
    String barcode,productName;
    Double price,quantity,total;
    String dateTime;
    String customerName,employeeName;


    public SalesModel(String barcode, String productName, Double price, Double quantity, Double total, String dateTime, String customerName, String employeeName) {
        this.barcode = barcode;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
        this.dateTime = dateTime;
        this.customerName = customerName;
        this.employeeName = employeeName;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }
}
