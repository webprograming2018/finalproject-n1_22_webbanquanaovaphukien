
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Danh Mục</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>

        <%
            String error = "";
            if (request.getParameter("error") != null) {
                 error = (String)request.getParameter("error");
            }
        %>


        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Thêm danh mục</h3>

                    <form action="/ShopBanHang/ManagerCategoryServlet" method="POST">
                        <table width="95%">
                            <tr>
                                <td><b>Tên danh mục :</b></td>
                                <td ><input type="text" class="sedang" name="tendanhmuc"><%=error%></td> 
                            </tr> 
                            <tr><td><b>Danh mục cha</b></td><td>
                                    <select name="danhmuccha">
                                        <option selected> </option>

                                        <option value="Thời Trang">Thời Trang</option>
                                        <option value="Điện Tử">Điện Tử</option>
                                        <option value="Nhà Cửa">Nhà Cửa</option>
                                        <option value="Sức Khỏe">Sức Khỏe</option>
                                        <option value="Thể Thao Và Du Lịch">Thể Thao Và Du Lịch</option>
                                        <option value="Trẻ Em Và Đồ Chơi">Trẻ Em Và Đồ Chơi</option>
                                    </select>
                                </td></tr>

                            <tr><td>
                                    <input type="hidden" name="command" value="insert">
                                    <input type="submit" class="button" value="Lưu Lại">
                                </td></tr>
                        </table>
                    </form>
                </div>
                <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>         
        </div>
    </body>
</html>
