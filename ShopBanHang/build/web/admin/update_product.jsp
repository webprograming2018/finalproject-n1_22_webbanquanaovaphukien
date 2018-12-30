
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Sản Phẩm</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<Category> listCategory = categoryDAO.getListCategory();

            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
        %>

        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Sửa Sản Phẩm</h3>

                    <form action="/ShopBanHang/ManagerProductServlet" method="POST">
                        <table width="95%">
                            <tr>
                                <td><b>Tên sản phẩm :</b></td>
                                <td ><input type="text" class="sedang" name="tensanpham"><%=error%></td> 
                            </tr> 

                            <tr><td><b>Danh mục sản phẩm:</b></td><td>
                                    <select name="danhmucsp">
                                        <option selected> </option>
                                    <%
                                        for (Category c : listCategory) {
                                    %>
                                    <option value="<%=c.getCategoryID()%>"><%=c.getCategoryName()%></option>
                                    <%}%>
                                </select>
                            </td></tr>

                        <tr><td><b>Hình ảnh sản phẩm :</b></td>
                            <td ><input type="text" class="sedang" name="hinhanhsp"><%=error%></td></tr> 
                        <tr><td><b>Thông tin sản phẩm:</b></td><td><textarea name="thongtinsp"></textarea><%=error%></td></tr>                           
                        <tr><td><b>Giá sản phẩm :</b></td>
                            <td ><input type="text" class="sedang" name="giasanpham"></td></tr> 

                        <tr><td><input type="hidden" name="command" value="update">
                                <input type="hidden" name="product_id" value="<%=request.getParameter("product_id")%>">
                                <input type="submit" class="button" value="Lưu Lại"></td></tr>
                    </table>
                </form>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>         
        </div>
    </body>
</html>
