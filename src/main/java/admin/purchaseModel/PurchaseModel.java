package main.java.admin.purchaseModel;

import java.sql.Date;

public class PurchaseModel {

    String barcode,productName,category,description;
    Double sellingPrice,purchasedPrice,quantity,total;
    String dateTime;
    Date dateAdded;
    String companyName,employeeName;


    public PurchaseModel(String barcode, String productName, Double sellingPrice, Double quantity, Double total, String dateTime, String companyName, String employeeName) {
        this.barcode = barcode;
        this.productName = productName;
        this.sellingPrice = sellingPrice;
        this.quantity = quantity;
        this.total = total;
        this.dateTime = dateTime;
        this.companyName = companyName;
        this.employeeName = employeeName;
    }

    public PurchaseModel(String barcodeField, String productName, double salePrice, double purchasedPrice, double stock, String category, String description, Date dateAdded) {

        this.barcode = barcodeField;
        this.productName = productName;
        this.sellingPrice = salePrice;
        this.purchasedPrice=purchasedPrice;
        this.quantity = stock;
        this.category = category;
        this.description = description;
        this.dateAdded = dateAdded;


    }

    public PurchaseModel(String barcodeField, String productName, double purchasedPrice, double stock, double total,String date,String companyName, String employeeName) {

        this.barcode = barcodeField;
        this.productName = productName;
        this.purchasedPrice=purchasedPrice;
        this.quantity = stock;
        this.total=total;
        this.dateTime=date;
        this.companyName = companyName;
        this.employeeName = employeeName;


    }

    public PurchaseModel(String barcodeField, String productName, double salePrice, double purchasedPrice, double stock, String category, String description) {

        this.barcode = barcodeField;
        this.productName = productName;
        this.sellingPrice = salePrice;
        this.purchasedPrice=purchasedPrice;
        this.quantity = stock;
        this.category = category;
        this.description = description;


    }

    public PurchaseModel(String barcode, String productName, double stock, double purchasedPrice, double sellingPrice, Date date,String description, String category, String companyName, String employeeName ) {

        this.barcode = barcode;
        this.productName = productName;
        this.purchasedPrice=purchasedPrice;
        this.sellingPrice = sellingPrice;
        this.quantity = stock;
        this.dateAdded = date;
        this.companyName = companyName;
        this.employeeName = employeeName;
        this.description=description;
        this.category=category;

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

    public Double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(Double sellingPrice) {
        this.sellingPrice = sellingPrice;
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

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPurchasedPrice() {
        return purchasedPrice;
    }

    public void setPurchasedPrice(Double purchasedPrice) {
        this.purchasedPrice = purchasedPrice;
    }

    public Date getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Date dateAdded) {
        this.dateAdded = dateAdded;
    }

}
