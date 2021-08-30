package main.java.entity;

import java.util.Date;

public class Purchases {

    private String invoiceNumber;
    private String barcode;
    private Double purchasedPrice;
    private String companyName;
    private String productName;
    private String employeeName;
    private Date date;
    private Double quantity, total;


    public Purchases(String invoiceNumber, String barcode, String companyName, String productName, String employeeName, Date date, Double quantity, Double total) {
        this.invoiceNumber = invoiceNumber;
        this.barcode = barcode;
        this.companyName = companyName;
        this.productName = productName;
        this.employeeName = employeeName;
        this.date = date;
        this.quantity = quantity;
        this.total = total;
    }


    public Purchases(String barcode, String productName, Double quantity, Double PurchasedPrice, Double total, Date date, String companyName, String employeeName) {
        this.barcode = barcode;
        purchasedPrice = PurchasedPrice;
        this.companyName = companyName;
        this.productName = productName;
        this.employeeName = employeeName;
        this.date = date;
        this.quantity = quantity;
        this.total = total;
    }


    public Purchases(String invoiceNumber, String barcode, String productName, Double quantity, Double PurchasedPrice, Double total, Date date, String companyName, String employeeName) {
        this.invoiceNumber = invoiceNumber;
        this.barcode = barcode;
        purchasedPrice = PurchasedPrice;
        this.companyName = companyName;
        this.productName = productName;
        this.employeeName = employeeName;
        this.date = date;
        this.quantity = quantity;
        this.total = total;
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

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

    public Double getPurchasedPrice() {
        return purchasedPrice;
    }

    public void setPurchasedPrice(Double purchasedPrice) {
        this.purchasedPrice = purchasedPrice;
    }
}