/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

/**
 *
 * @author tieum
 */
public class ManagerCategoryServlet extends HttpServlet {

    CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String category_id = request.getParameter("category_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    categoryDAO.deleteCategory(Integer.parseInt(category_id));
                    url = "/admin/categories_manager.jsp";
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
        String tenDanhMuc = request.getParameter("tendanhmuc");
        String danhMucCha = request.getParameter("danhmuccha");
        int category_fa = 0;

        String url = "";
        String error = "", error2 = "";

        if (tenDanhMuc.equals("")) {
            error = "Vui lòng nhập tên danh mục!";
        }

        switch (danhMucCha) {
            case "Thời Trang":
                category_fa = 1;
                break;
            case "Điện Tử":
                category_fa = 2;
                break;
            case "Nhà Cửa":
                category_fa = 3;
                break;
            case "Sức Khỏe":
                category_fa = 4;
                break;
            case "Thể Thao Và Du Lịch":
                category_fa = 5;
                break;
            case "Trẻ Em Và Đồ Chơi":
                category_fa = 6;
                break;
            default:
                error2 = "Vui lòng chọn danh mục cha !!!";
                break;
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        categoryDAO.insertCategory(new Category((int) new Date().getTime(), category_fa, tenDanhMuc));
                        url = "/admin/categories_manager.jsp";
                        break;
                    case "update":
                        categoryDAO.updateCategory(new Category(Integer.parseInt(request.getParameter("category_id")), category_fa, tenDanhMuc));
                        url = "/admin/categories_manager.jsp";
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
