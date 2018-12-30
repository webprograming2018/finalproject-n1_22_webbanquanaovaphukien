/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author tieum
 */
public class ManagerProductServlet extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        String command = request.getParameter("command");
        String product_id = request.getParameter("product_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    productDAO.deleteProduct(Integer.parseInt(product_id));
                    url = "/admin/product_manager.jsp";
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
        String tenSanPham = request.getParameter("tensanpham");
        String danhMucSP = request.getParameter("danhmucsp"); // categoryID.
        String hinhAnhSP = request.getParameter("hinhanhsp");
        String thongTinSP = request.getParameter("thongtinsp");
        String giaSP = request.getParameter("giasanpham");

        String url = "";
        String error = "", error2 = "";

        if (tenSanPham.equals("") || hinhAnhSP.equals("") || thongTinSP.equals("")) {
            error = "Vui lòng hoàn thiện các trường còn trống!";
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        productDAO.insertProduct(new Product((int) new Date().getTime(), tenSanPham, hinhAnhSP, Double.parseDouble(giaSP), thongTinSP, Integer.parseInt(danhMucSP)));
                        url = "/admin/product_manager.jsp";
                        break;
                    case "update":
                        productDAO.updateProduct(new Product(Integer.parseInt(request.getParameter("product_id")), tenSanPham, hinhAnhSP, Double.parseDouble(giaSP), thongTinSP, Integer.parseInt(danhMucSP)));
                        url = "/admin/product_manager.jsp";
                        break;
                }
            } else {
                url = "/admin/insert_product.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

}
