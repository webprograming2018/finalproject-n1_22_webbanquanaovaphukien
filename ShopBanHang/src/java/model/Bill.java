/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author tieum
 */
public class Bill {

    private int billID;
    private int userID;
    private Timestamp date;
    private double totalPrice;
    private String payment;
    private String address;

    public Bill() {
    }

    public Bill(int billID, int userID, Timestamp date, double totalPrice, String payment, String address) {
        this.billID = billID;
        this.userID = userID;
        this.date = date;
        this.totalPrice = totalPrice;
        this.payment = payment;
        this.address = address;
    }

    /**
     * @return the billID
     */
    public int getBillID() {
        return billID;
    }

    /**
     * @param billID the billID to set
     */
    public void setBillID(int billID) {
        this.billID = billID;
    }

    /**
     * @return the userID
     */
    public int getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }

    /**
     * @return the date
     */
    public Timestamp getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Timestamp date) {
        this.date = date;
    }

    /**
     * @return the totalPrice
     */
    public double getTotalPrice() {
        return totalPrice;
    }

    /**
     * @param totalPrice the totalPrice to set
     */
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    /**
     * @return the payment
     */
    public String getPayment() {
        return payment;
    }

    /**
     * @param payment the payment to set
     */
    public void setPayment(String payment) {
        this.payment = payment;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "id : " + this.billID + " -- "
                + "user id : " + this.userID + " -- "
                + "Date : " + this.date + " -- "
                + "total price : " + this.totalPrice + " -- "
                + "payment : " + this.payment + " -- "
                + "address : " + this.address;
    }

}
