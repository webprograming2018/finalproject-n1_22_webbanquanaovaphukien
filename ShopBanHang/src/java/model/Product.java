/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author tieum
 */
public class Product {

    private int productID;
    private int categoryID;
    private String productName;
    private String productImage;
    private double productPrice;
    private String productInfo;

    public Product() {
    }

    public Product(int productID, String productName, String productImage, double productPrice, String productInfo, int categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.productImage = productImage;
        this.productPrice = productPrice;
        this.productInfo = productInfo;
        this.categoryID = categoryID;
    }

    /**
     * @return the productID
     */
    public int getProductID() {
        return productID;
    }

    /**
     * @param productID the productID to set
     */
    public void setProductID(int productID) {
        this.productID = productID;
    }

    /**
     * @return the categoryID
     */
    public int getCategoryID() {
        return categoryID;
    }

    /**
     * @param categoryID the categoryID to set
     */
    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    /**
     * @return the productName
     */
    public String getProductName() {
        return productName;
    }

    /**
     * @param productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * @return the productImage
     */
    public String getProductImage() {
        return productImage;
    }

    /**
     * @param productImage the productImage to set
     */
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    /**
     * @return the productPrice
     */
    public double getProductPrice() {
        return productPrice;
    }

    /**
     * @param productPrice the productPrice to set
     */
    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    /**
     * @return the productInfo
     */
    public String getProductInfo() {
        return productInfo;
    }

    /**
     * @param productInfo the productInfo to set
     */
    public void setProductInfo(String productInfo) {
        this.productInfo = productInfo;
    }

    @Override
    public String toString() {
        return "id : " + this.productID + " - "
                + "name : " + this.productName + " - "
                + "link image : " + this.productImage + " - "
                + "price : " + this.productPrice + " - "
                + "infomation : " + this.productInfo + " - "
                + "category id : " + this.categoryID;
    }
}
