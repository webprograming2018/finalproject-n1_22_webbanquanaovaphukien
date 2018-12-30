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
import model.User;

/**
 * Data Assimilation Office - dong hoa du lieu
 * @author tieum
 */
public class UserDAO {

    public ArrayList<User> getAllUser() {
        Connection connect = DBConnect.getConnection();
        ArrayList<User> listUser = new ArrayList<>();
        String sql = "SELECT * FROM user";

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ResultSet result = ps.executeQuery();

            while (result.next()) {
                User u = new User();
                u.setUserAddress(result.getString("user_address"));
                u.setUserEmail(result.getString("user_email"));
                u.setUserID(result.getInt("user_id"));
                u.setUserName(result.getString("user_name"));
                u.setUserPassword(result.getString("user_pass"));
                u.setUserPhoneNumber(result.getString("user_phone"));
                u.setUserRole(result.getBoolean("user_role"));

                listUser.add(u);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listUser;
    }

    // kiem tra email
    public boolean CheckEmail(String email) {
        Connection connect = DBConnect.getConnection();
        String sql = "SELECT * FROM user WHERE user_email = '" + email + "'";
        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ResultSet result = ps.executeQuery();

            while (result.next()) {
                connect.close();
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    // method them user.
    public boolean insertUser(User u) {
        Connection connect = DBConnect.getConnection();
        String sql = "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ps.setInt(1, u.getUserID());
            ps.setString(2, u.getUserName());
            ps.setString(3, u.getUserEmail());
            ps.setString(4, u.getUserPhoneNumber());
            ps.setString(5, u.getUserAddress());
            ps.setString(6, u.getUserPassword());
            ps.setBoolean(7, u.isUserRole());

            ps.executeUpdate();
            return true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public User login(String user_email, String user_pass) {
        System.out.println("pass : " +user_pass + " user_email :"+user_email);
        Connection con = DBConnect.getConnection();
        String sql = "SELECT * FROM user WHERE user_email='" + user_email + "' AND user_pass='" + user_pass + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserAddress(rs.getString("user_address"));
                user.setUserEmail(rs.getString("user_email"));
                user.setUserID(rs.getInt("user_id"));
                user.setUserName(rs.getString("user_name"));
                user.setUserPassword(rs.getString("user_pass"));
                user.setUserPhoneNumber(rs.getString("user_phone"));
                user.setUserRole(rs.getBoolean("user_role"));
                
                con.close();
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
