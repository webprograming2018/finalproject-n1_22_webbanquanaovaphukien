/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Bill;
import model.Category;

/**
 *
 * @author tieum
 */
public class ManagerBillServlet extends HttpServlet {

    BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String bill_id = request.getParameter("bill_id");
         
        String url = "";
        try {
            switch (command) {

                case "delete":
                    billDAO.deleteBill(Integer.parseInt(bill_id));
                    url = "/admin/bill_manager.jsp";
                    break;
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String command = request.getParameter("command");

        String maNguoiDung = request.getParameter("mauser");
        String date = request.getParameter("date");
        String totalPrice = request.getParameter("totalprice");
        String payment = request.getParameter("payment");
        String diaChi = request.getParameter("diachi");

        String url = "";
        String error = "";

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        billDAO.insertBill(new Bill((int) new Date().getTime(),Integer.parseInt(maNguoiDung), new Timestamp(new Date().getTime()) , Integer.parseInt(totalPrice), payment, diaChi));
                        url = "/admin/bill_manager.jsp";
                        break;
                    case "update":
                        billDAO.updateBill(new Bill(Integer.parseInt(request.getParameter("bill_id")), Integer.parseInt(maNguoiDung), new Timestamp(new Date().getTime()), Integer.parseInt(totalPrice), payment, diaChi));
                        url = "/admin/bill_manager.jsp";
                        break;
                }
            } else {
                url = "/admin/insert_category.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
