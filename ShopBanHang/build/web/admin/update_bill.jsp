

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Hóa Đơn</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Sửa Hóa Đơn</h3>

                    <form action="/ShopBanHang/ManagerBillServlet" method="POST">
                        <table width="95%">
                            <tr>
                                <td><b>Mã Người Dùng :</b></td>
                                <td ><input type="text" class="sedang" name="mauser"></td> 
                        </tr> 
                        <tr>
                                <td><b>Date :</b></td>
                                <td ><input type="text" class="sedang" name="date"></td> 
                        </tr> 

                        <tr>
                                <td><b>Tồng Tiền :</b></td>
                                <td ><input type="text" class="sedang" name="totalprice"></td> 
                        </tr> 
                        
                        <tr>
                                <td><b>Payment:</b></td>
                                <td ><input type="text" class="sedang" name="payment"></td> 
                        </tr> 

                        <tr>
                                <td><b>Địa chỉ :</b></td>
                                <td ><input type="text" class="sedang" name="diachi"></td> 
                        </tr> 
                        <tr><td><input type="hidden" name="command" value="update">
                                <input type="hidden" name="bill_id" value="<%=request.getParameter("bill_id")%>">
                                <input type="submit" class="button" value="Lưu Lại"></td></tr>
                    </table>
                </form>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>         
        </div>
    </body>
</html>
