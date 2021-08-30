package main.java.admin;


import main.java.others.DBConnection;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Print{


   /* public void printNow(String productName,double quantity,double price){
        try {
            FileWriter myWriter = new FileWriter("invoice.txt");
            myWriter.write("\t\t\t      Electrical Centre\n");
            myWriter.write("\t\t    Location:Oyibi-Mensah Bar\n");
            myWriter.write("\t\t    Contact:059-699-3434\n");
            myWriter.write("\t\t-------------------------------------\n");
            myWriter.write("\t\t    Product\t\t\tQty\t\tPrice\tTotal\n");
            myWriter.write("\t\t-------------------------------------\n");
            myWriter.write("\t\t   "+productName+"\t\t"+quantity+"\t\t"+price);
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
    */

    public void print(){
        Connection connection= DBConnection.getConnection();
        List data=new ArrayList();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select * from printinvoice");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()) {
                String productName = resultSet.getString("productName");
                double unitPrice = resultSet.getDouble("unitPrice");
                double quantity = resultSet.getDouble("quantity");
                double total = resultSet.getDouble("total");
                double grandTotal= resultSet.getDouble("grandTotal"); ;
                double amountPaid =resultSet.getDouble("amountPaid");
                double change = resultSet.getDouble("balance");
                System.out.print("\t\t\t      Electrical Centre\n");
                System.out.print("\t\t    Location:Oyibi-Mensah Bar\n");
                System.out.print("\t\t       Contact:059-699-3434\n");
                System.out.print("\t\t-------------------------------------\n");
                System.out.print("\t\t    Product\t\t\tQty\t\tPrice\tTotal\n");
                System.out.print("\t\t-------------------------------------\n");
                System.out.print("\t\t   "+productName+"\t\t"+quantity+"\t\t"+unitPrice+"\t\t"+grandTotal+"\n");

            }
            writeToFile(data,"invoice.txt");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public static void writeToFile(List list,String path){
        BufferedWriter writer=null;
        try{
            File file=new File(path);
            writer=new BufferedWriter(new FileWriter(file,true));
            for (Object s: list){
                writer.write(String.valueOf(s));
                writer.newLine();
            }
            writer.close();
        }catch (IOException e){

        }

    }

}