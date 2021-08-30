package main.java.entity;



public class Sale  {


    private String date,productName,customerName,employeeName;
    Double quantity, salePrice,total,amountPaid;
    Long id;
    String invoiceID;

    public Sale() {
    }

    public Sale(String productName, Double quantity, Double salePrice, Double total,String date,  String employeeName) {
        this.date = date;
        this.productName = productName;
        this.employeeName = employeeName;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.total = total;
    }

    public Sale( String productName, double quantity, double salePrice, double total, String date) {
        this.id = id;
        this.productName = productName;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.total = total;
        this.date = date;
    }

    public Sale(String productName, double quantity, double salePrice, double total) {
        this.productName = productName;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.total = total;
    }

    public Sale(String date, String customerName, String employeeName, Double quantity, Double amountPaid, String invoiceID) {
        this.date = date;
        this.customerName = customerName;
        this.employeeName = employeeName;
        this.quantity = quantity;
        this.amountPaid = amountPaid;
        this.invoiceID = invoiceID;
    }

    public Sale( String customerName, String productName, double quantity, double salePrice,double total ,double amountPaid, String date, String employeeName) {
        this.invoiceID=invoiceID;
        this.customerName=customerName;
        this.productName=productName;
        this.quantity=quantity;
        this.salePrice = salePrice;
        this.total=total;
       this.amountPaid=amountPaid;
       this.date=date;
       this.employeeName=employeeName;
    }



    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Double salePrice) {
        this.salePrice = salePrice;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Double getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(Double amountPaid) {
        this.amountPaid = amountPaid;
    }

    public String getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(String invoiceID) {
        this.invoiceID = invoiceID;
    }
}
