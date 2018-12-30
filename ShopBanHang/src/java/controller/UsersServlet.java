/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import tools.MD5;
import tools.SendMails;

/**
 *
 * @author tieum
 */
public class UsersServlet extends HttpServlet {

    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "";
        String command = request.getParameter("command");
        User u = new User();
        HttpSession session = request.getSession();

        switch (command) {

            case "insert":
                u.setUserID((int) new java.util.Date().getTime());
                u.setUserName(request.getParameter("name"));
                u.setUserEmail(request.getParameter("email"));
                u.setUserPhoneNumber(request.getParameter("phone"));
                u.setUserAddress(request.getParameter("address"));
                u.setUserPassword(MD5.encryption(request.getParameter("pass")));
                u.setUserRole(false);
                userDAO.insertUser(u);

                // insert xong ta gui mail thong bao.
                SendMails.sendMail(u.getUserEmail(), "Congrats!", "Account Creation Successfull! Welcome to AMAZON, " + u.getUserName() + "!");
                
                
                session.setAttribute("user", u);
                url = "/index.jsp";
                break;
            case "login":
                u = userDAO.login(request.getParameter("email"), MD5.encryption(request.getParameter("pass")));
                if (u != null) {
                    session.setAttribute("user", u);
                    url = "/index.jsp";
                } else {
                    request.setAttribute("error", "Error email or password!");
                    url = "/login.jsp";
                }
                break;
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
