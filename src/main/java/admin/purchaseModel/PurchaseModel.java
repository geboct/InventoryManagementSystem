package main.java.admin.purchaseModel;

import java.sql.Date;

public class PurchaseModel {

    String invoiceNumber,barcode, productName, category, description;
    Double sellingPrice, purchasedPrice, quantity, total;
    Date dateTime;
    String companyName, employeeName;


    public PurchaseModel(String invoiceNumber, String barcode, String productName, Double sellingPrice, Double purchasedPrice, Double quantity, Double total,String category, String description,  Date dateTime, String companyName, String employeeName) {
        this.invoiceNumber = invoiceNumber;
        this.barcode = barcode;
        this.productName = productName;
        this.category = category;
        this.description = description;
        this.sellingPrice = sellingPrice;
        this.purchasedPrice = purchasedPrice;
        this.quantity = quantity;
        this.total = total;
        this.dateTime = dateTime;
        this.companyName = companyName;
        this.employeeName = employeeName;
    }

    public PurchaseModel(String barcode, String productName, double purchasedPrice, double sellingPrice, double quantity, Date date, String description, String category, String companyName, String employeeName) {
        this.barcode=barcode;
        this.productName=productName;
        this.purchasedPrice=purchasedPrice;
        this.sellingPrice=sellingPrice;
        this.quantity=quantity;
        this.dateTime=date;
        this.description=description;
        this.category=category;
        this.companyName=companyName;
        this.employeeName=employeeName;
    }

    public PurchaseModel(String invoiceNumber, String barcode, String productName, double purchasedPrice, double sellingPrice, double quantity, Date date, String description, String category, String companyName, String employeeName) {
       this.invoiceNumber=invoiceNumber;
        this.barcode=barcode;
        this.productName=productName;
        this.purchasedPrice=purchasedPrice;
        this.sellingPrice=sellingPrice;
        this.quantity=quantity;
        this.dateTime=date;
        this.description=description;
        this.category=category;
        this.companyName=companyName;
        this.employeeName=employeeName;
    }

    public PurchaseModel() {

    }

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
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

    public Double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(Double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public Double getPurchasedPrice() {
        return purchasedPrice;
    }

    public void setPurchasedPrice(Double purchasedPrice) {
        this.purchasedPrice = purchasedPrice;
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

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
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
}
