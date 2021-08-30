package main.java.controllers;

import javafx.scene.control.TextArea;

public class ReceiptController {

    TextArea textArea = new TextArea();


    public void addText(String productName, double quantity, double price, double total, double grandTotal, String employee, String customerName) {

        textArea.setText("        Electrical Centre\n" +
                         "      Location:Oyibi-Mensah Bar\n  " +
                         "        Contact:059-699-3434\n  " +
                         "Product\t\t\tQty\t\tPrice\tTotal\n  " +
                         ""+productName+"\t\t\t"+quantity+"\t\t"+price+"\t"+total );







    }
}
