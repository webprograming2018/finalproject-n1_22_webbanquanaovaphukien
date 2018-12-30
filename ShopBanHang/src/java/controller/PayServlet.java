/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BillDAO;
import dao.BillDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.BillDetail;
import model.Cart;
import model.Item;
import model.User;
import tools.SendMails;

/**
 *
 * @author tieum
 */
public class PayServlet extends HttpServlet {

    private final BillDAO billDAO = new BillDAO();
    private final BillDetailDAO billDetailDAO = new BillDetailDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String payment = request.getParameter("payment");
        String address = request.getParameter("address");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");

        String detail = "";

        try {
            int id = (int) new Date().getTime();
            Bill bill = new Bill();
            bill.setBillID(id);
            bill.setAddress(address);
            bill.setPayment(payment);
            bill.setUserID(user.getUserID());
            bill.setDate(new Timestamp(new Date().getTime()));
            bill.setTotalPrice(cart.total());
            billDAO.insertBill(bill);
            for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {
                billDetailDAO.insertBillDetail(new BillDetail(0, id, list.getValue().getProduct().getProductID(), list.getValue().getProduct().getProductPrice(), list.getValue().getQuantity()));
                detail += "product id : " + list.getValue().getProduct().getProductID() + " --- product name : " + list.getValue().getProduct().getProductName() + " --- price : " 
                        + list.getValue().getProduct().getProductPrice() + " ---  quantity : " + list.getValue().getQuantity() + "\n\n";
            }
            // send mail.
            SendMails.sendMail(user.getUserEmail(), "Hoa Don : " + bill.getBillID(), "Thanks for Purchase ! \n" + "total : " + bill.getTotalPrice()  + "\n" + detail);  // liet ke san pham da mua trong hoa don.

            // reset lai cart.
            cart = new Cart();
            session.setAttribute("cart", cart);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("/ShopBanHang/index.jsp");

    }
}
