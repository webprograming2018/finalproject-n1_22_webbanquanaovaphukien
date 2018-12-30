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
public class Category {

    private int categoryID;
    private int categoryParent;
    private String categoryName;

    public Category() {
    }

    public Category(int categoryID, int categoryParent, String categoryName) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryParent = categoryParent;
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
     * @return the categoryName
     */
    public String getCategoryName() {
        return categoryName;
    }

    /**
     * @param categoryName the categoryName to set
     */
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "id : " + this.categoryID + " - " + "parent : " + this.categoryParent +  " - " + "name : " + this.categoryName;
    }

    /**
     * @return the categoryParent
     */
    public int getCategoryParent() {
        return categoryParent;
    }

    /**
     * @param categoryParent the categoryParent to set
     */
    public void setCategoryParent(int categoryParent) {
        this.categoryParent = categoryParent;
    }

}
