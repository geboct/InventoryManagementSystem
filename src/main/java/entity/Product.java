package main.java.entity;

import java.util.Date;

public class Product {


    String productName, description, category,barcode;
    Double price, quantity,total;
    Date date;

    public Product() {
    }

    public Product(String productName) {
        this.productName=productName;

    }
    public Product(String itemName, double unitPrice, double quantity, double total) {
        this.productName = itemName;
        this.price = unitPrice;
        this.quantity = quantity;
        this.total = total;
    }
    public Product(String productName, Double sold, Double quantity) {
        this.productName = productName;
        this.quantity = quantity;
        this.total = sold;
    }
    public Product(String productName, Double quantity,Date date) {
        this.productName = productName;
        this.quantity = quantity;
        this.date = date;
    }

    public Product(String barcode, String itemName,  double salePrice,Double stock,  String category,String description) {

        this.barcode = barcode;
        this.productName = itemName;
        this.quantity = stock;
        this.price = salePrice;
        this.category = category;
        this.description=description;
    }

    public Product(String productName, double price,double quantity, String description, String category) {
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.category = category;
    }

    public Product(String productName, double salePrice, Double quantity,double total) {
        this.productName = productName;
        this.price = salePrice;
        this.quantity = quantity;
        this.price = salePrice;
        this.total = total;
    }


    public Product( String barcodeField, String productName, double salePrice, Double stock, String category) {
       this.barcode=barcodeField;
        this.productName = productName;
        this.category = category;
        this.price = salePrice;
        this.quantity = stock;

    }

    public Product(String productName, double quantity) {

        this.productName=productName;
        this.quantity=quantity;
    }


    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
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

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
