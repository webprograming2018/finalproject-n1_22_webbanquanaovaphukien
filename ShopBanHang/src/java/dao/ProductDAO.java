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
import model.Product;

/**
 * Data Assimilation Office - dong hoa du lieu
 *
 * @author tieum
 */
public class ProductDAO {

    public ArrayList<Product> getListProductByCategory(int category_id) {
        ArrayList<Product> listProduct = new ArrayList<>();
        Connection connect = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "'";

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ResultSet result = ps.executeQuery();

            while (result.next()) {
                Product p = new Product();
                p.setProductID(result.getInt("product_id"));
                p.setCategoryID(result.getInt("category_id"));
                p.setProductImage(result.getString("product_image"));
                p.setProductName(result.getString("product_name"));
                p.setProductInfo(result.getString("product_info"));
                p.setProductPrice(result.getDouble("product_price"));

                listProduct.add(p);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listProduct;
    }
    
    public ArrayList<Product> getListProduct(){
        Connection connect = DBConnect.getConnection();
        String sql = "SELECT * FROM product";
        ArrayList<Product> list = new ArrayList<>();

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ResultSet result = ps.executeQuery();

            while (result.next()) {
                Product p = new Product();
                p.setProductID(result.getInt("product_id"));
                p.setCategoryID(result.getInt("category_id"));
                p.setProductImage(result.getString("product_image"));
                p.setProductName(result.getString("product_name"));
                p.setProductInfo(result.getString("product_info"));
                p.setProductPrice(result.getDouble("product_price"));

                list.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    

    public ArrayList<Product> getListProductByPages(int categoryID, int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE category_id = '" + categoryID + "' limit ?,?";
        PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getInt("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductPrice(rs.getDouble("product_price"));
            product.setProductInfo(rs.getString("product_info"));
            list.add(product);
        }
        return list;
    }

    // lay tong so product cua 1 category.
    public int countProductByCategory(int categoryID) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(product_id) FROM product WHERE category_id = '" + categoryID + "'";
        PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);

        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }

    public Product getProduct(int product_id) {
        Connection connect = DBConnect.getConnection();
        Product product = new Product();
        String sql = "SELECT * FROM product WHERE product_id=" + product_id;
        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ResultSet result = ps.executeQuery();
            while (result.next()) {
                product.setProductID(result.getInt("product_id"));
                product.setCategoryID(result.getInt("category_id"));
                product.setProductImage(result.getString("product_image"));
                product.setProductName(result.getString("product_name"));
                product.setProductInfo(result.getString("product_info"));
                product.setProductPrice(result.getDouble("product_price"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return product;
    }

    //insert
    // them moi product.
    public boolean insertProduct(Product product) {
        Connection connect = DBConnect.getConnection();
        String sql = "INSERT INTO product VALUES(?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ps.setInt(1, product.getProductID());
            ps.setInt(2, product.getCategoryID());
            ps.setString(3, product.getProductName());
            ps.setString(4, product.getProductImage());
            ps.setString(5, product.getProductInfo());
            ps.setDouble(6, product.getProductPrice());

            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    // update
    // sua doi product.
    public boolean updateProduct(Product product) {
        Connection connect = DBConnect.getConnection();
        String sql = "UPDATE product SET category_id = ?, product_name = ?, product_image = ?, product_info = ?, product_price = ? WHERE product_id = ?";

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ps.setInt(1, product.getCategoryID());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getProductImage());
            ps.setString(4, product.getProductInfo());
            ps.setDouble(5, product.getProductPrice());
            ps.setInt(6, product.getProductID());

            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    //delete
    //xoa 1 product.
    public boolean deleteProduct(int productID) {
        Connection connect = DBConnect.getConnection();
        String sql = "DELETE FROM product WHERE product_id = ?";

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ps.setInt(1, productID);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        ProductDAO test = new ProductDAO();
//        try {
//            System.out.println(test.countProductByCategory(3));  //overide toString
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }

        //System.out.println(test.updateProduct(new Product(100, "product after update", "images/8.png", 1000, "info product", 2)));
        // System.out.println(test.insertProduct(new Product(121, "Túi Xách Nữ Đeo Chéo Nắp Chữ A", "images/137.jpg", 135000, "Hàng nhập khẩu từ Quảng Châu", 13)));
        //System.out.println(test.deleteProduct(100));
        // System.out.println(test.insertProduct(new Product(100, "product after update", "images/8.png", 1000, "info product", 1)));
    }
}
