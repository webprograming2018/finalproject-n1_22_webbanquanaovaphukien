

<%@page import="model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BillDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý hóa đơn</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>

        <%
            BillDAO billDAO = new BillDAO();
            ArrayList<Bill> listBill = billDAO.getListBill();
            int count = 0;
        %>


        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Quản Lý Hóa Đơn</h3>

                    <table width="95%">
                        <tr>
                            <td style="float: left">
                                <a href="${root}/admin/insert_bill.jsp"><input type="button" class="button" value="Thêm Hóa Đơn"></a>
                        </td></tr>
                </table>


                <table class="data">
                    <tr class="data">
                        <th class="data" width="30px">STT</th>
                        <th class="data">Mã Hóa Đơn</th>
                        <th class="data">Mã Người Dùng</th>
                        <th class="data">Date</th>
                        <th class="data">Tổng Tiền</th>
                        <th class="data">Payment</th>
                        <th class="data">Địa Chỉ</th>
                        <th class="data" width="70px">Tùy chọn</th>
                    </tr>
                    <%
                        for (Bill b : listBill) {
                            count++;
                    %>
                    <tr class="data">
                        <td class="data" width="30px"><%=count%></td>
                        <td class="data"><%=b.getBillID()%></td>
                        <td class="data"><%=b.getUserID()%></td>
                        <td class="data"><%=b.getDate()%></td>
                        <td class="data"><%=b.getTotalPrice()%></td>
                        <td class="data"><%=b.getPayment()%></td>
                        <td class="data"><%=b.getAddress()%></td>
                        <td class="data" width="70px">
                    <center>
                        <a href="${root}/admin/update_bill.jsp?command=update&bill_id=<%=b.getBillID()%>">Sửa</a>&nbsp;|&nbsp;
                        <a href="/ShopBanHang/ManagerBillServlet?command=delete&bill_id=<%=b.getBillID()%>">Xóa</a>
                    </center>
                    </td>
                    </tr>
                    <% }%>
                </table>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>         
        </div>

    </body>
</html>
