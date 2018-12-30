/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.mysql.jdbc.PreparedStatement;
import connect.DBConnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 * Data Assimilation Office - dong hoa du lieu
 *
 * @author tieum
 */
public class CategoryDAO {

    public ArrayList<Category> getListCategory() {
        Connection connect = DBConnect.getConnection();
        String sql = "SELECT * FROM category";
        ArrayList<Category> list = new ArrayList<>();

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ResultSet result = ps.executeQuery();

            while (result.next()) {
                Category category = new Category();
                category.setCategoryID(result.getInt("category_id"));
                category.setCategoryParent(result.getInt("category_father"));
                category.setCategoryName(result.getString("category_name"));
                list.add(category);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    //insert
    // them moi category.
    public boolean insertCategory(Category category) {
        Connection connect = DBConnect.getConnection();
        String sql = "INSERT INTO category VALUES(?, ?, ?)";

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ps.setInt(1, category.getCategoryID());
            ps.setInt(2, category.getCategoryParent());
            ps.setString(3, category.getCategoryName());

            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    // update
    // sua doi category.
    public boolean updateCategory(Category category) {
        Connection connect = DBConnect.getConnection();
        String sql = "UPDATE category SET category_name = ?, category_father = ? WHERE category_id = ?";

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);

            ps.setString(1, category.getCategoryName());
            ps.setInt(2, category.getCategoryParent());
            ps.setInt(3, category.getCategoryID());

            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    //delete
    //xoa 1 category.
    public boolean deleteCategory(int categoryID){
         Connection connect = DBConnect.getConnection();
        String sql = "DELETE FROM category WHERE category_id = ?";
        
        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ps.setInt(1, categoryID);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    
    public static void main(String[] args) {
        CategoryDAO test = new CategoryDAO();
//        for (Category c : test.getListCategory()) {
//            System.out.println(c);
//        }

        System.out.println(test.insertCategory(new Category(9, 2, "Loa")));
        //System.out.println(test.updateCategory(new Category(9, 2, "Loa")));
        //System.out.println(test.deleteCategory(9));
    }
}
