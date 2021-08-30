package main.java.others;


import java.sql.Date;

public class Item {
    int id;
    String name,barcode;
    Double stock;

    double salePrice,purchasedPrice;
    String photo;
    String category, description;
    Date dateAdded;


    public Item(String barcode, String itemName, double salePrice, Double stock, String category) {

        this.barcode = barcode;
        this.name = itemName;
        this.stock = stock;
        this.salePrice = salePrice;
        this.category = category;
    }
    public Item(int itemID, String itemName,  double salePrice,Double stock,  String category,String description) {

        this.id = itemID;
        this.name = itemName;
        this.stock = stock;
        this.salePrice = salePrice;
        this.category = category;
        this.description=description;
    }

    public Item(String barcodeField, String productName, double salePrice, Double stock, String category, String description) {
        this.barcode=barcodeField;
        this.name=productName;
        this.salePrice=salePrice;
        this.stock=stock;
        this.category=category;
        this.description=description;
    }

    public Item(String barcodeField, String productName, double salePrice, double purchasedPrice, double stock, String category, String description) {
        this.barcode=barcodeField;
        this.name=productName;
        this.salePrice=salePrice;
        this.purchasedPrice=purchasedPrice;
        this.stock=stock;
        this.category=category;
        this.description=description;

    }

    public Item(String barcodeField, String productName, double salePrice, double purchasedPrice, double stock, String category, String description, Date dateAdded) {

        this.barcode=barcodeField;
        this.name=productName;
        this.salePrice=salePrice;
        this.purchasedPrice=purchasedPrice;
        this.stock=stock;
        this.category=category;
        this.description=description;
        this.dateAdded=dateAdded;



    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public Double getStock() {
        return stock;
    }

    public void setStock(Double stock) {
        this.stock = stock;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public double getPurchasedPrice() {
        return purchasedPrice;
    }

    public void setPurchasedPrice(double purchasedPrice) {
        this.purchasedPrice = purchasedPrice;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
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

    public Date getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Date dateAdded) {
        this.dateAdded = dateAdded;
    }
}
