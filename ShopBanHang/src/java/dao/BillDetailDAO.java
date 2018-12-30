/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.mysql.jdbc.PreparedStatement;
import connect.DBConnect;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BillDetail;

/**
 * Data Assimilation Office - dong hoa du lieu
 *
 * @author tieum
 */
public class BillDetailDAO {

    public void insertBillDetail(BillDetail billDetail) {
        Connection connect = DBConnect.getConnection();
        String sql = "INSERT INTO billdetail VALUES(?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = (PreparedStatement) connect.prepareCall(sql);
            ps.setInt(1, billDetail.getBillDetailID());
            ps.setInt(2, billDetail.getBillID());
            ps.setInt(3, billDetail.getProductID());
            ps.setDouble(4, billDetail.getPrice());
            ps.setInt(5, billDetail.getQuantity());

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        BillDetailDAO test = new BillDetailDAO();
        test.insertBillDetail(new BillDetail(1, 1001, 101, 3000, 26));
    }
}
