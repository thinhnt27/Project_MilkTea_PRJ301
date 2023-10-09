/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Date;

/**
 *
 * @author Cicca
 */
public class OrderDTO {
    private String orderID;
    private String userID;
    
    private Date date;
    private double total;
    private String adress;
    private String phone;
    

    public OrderDTO() {
    }

    public OrderDTO(String orderID, String userID, Date date, double total, String adress, String phone) {
        this.orderID = orderID;
        this.userID = userID;
        this.date = date;
        this.total = total;
        this.adress = adress;
        this.phone = phone;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    
}
