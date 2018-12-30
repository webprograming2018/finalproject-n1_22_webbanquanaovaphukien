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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Bill;

/**
 * Data Assimilation Office - dong hoa du lieu
 *
 * @author tieum
 */
public class BillDAO {

    public boolean insertBill(Bill bill) {
        Connection connect = DBConnect.getConnection();
        String sql = "INSERT INTO bill VALUES(?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ps.setInt(1, bill.getBillID());
            ps.setInt(2, bill.getUserID());
            ps.setTimestamp(3, bill.getDate());
            ps.setDouble(4, bill.getTotalPrice());
            ps.setString(5, bill.getPayment());
            ps.setString(6, bill.getAddress());

            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Bill> getListBill() {
        Connection connect = DBConnect.getConnection();
        String sql = "SELECT * FROM bill";
        ArrayList<Bill> listBill = new ArrayList<>();

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Bill b = new Bill();
                b.setBillID(rs.getInt("bill_id"));
                b.setUserID(rs.getInt("user_id"));
                b.setDate(rs.getTimestamp("date"));
                b.setTotalPrice(rs.getDouble("total_price"));
                b.setPayment(rs.getString("payment"));
                b.setAddress(rs.getString("address"));

                listBill.add(b);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listBill;
    }

    // update
    public boolean updateBill(Bill b) {
        Connection connect = DBConnect.getConnection();
        String sql = "UPDATE bill SET user_id = ?, date = ?, total_price = ?, payment= ?, address = ?  WHERE bill_id = ?";
        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ps.setInt(1, b.getUserID());
            ps.setTimestamp(2, b.getDate());
            ps.setDouble(3, b.getTotalPrice());
            ps.setString(4, b.getPayment());
            ps.setString(5, b.getAddress());
            ps.setInt(6, b.getBillID());

            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    // delete.
    public boolean deleteBill(int bill_id) {
        Connection connect = DBConnect.getConnection();
        String sql = "DELETE FROM bill WHERE bill_id = ?";
        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ps.setInt(1, bill_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        BillDAO test = new BillDAO();

        // chu y rang buoc.
        // test.insertBill(new Bill(1001, 625421097, new Timestamp(new Date().getTime()), 1000, "Paypal", "VietNam"));
        for (Bill b : test.getListBill()) {
            System.out.println(b);
        }
    }
}
