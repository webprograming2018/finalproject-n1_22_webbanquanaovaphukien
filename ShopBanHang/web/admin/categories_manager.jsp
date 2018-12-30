

<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
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
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<Category> listCategory = categoryDAO.getListCategory();
            int i = 0;

        %>

        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Quản Lý Danh Mục</h3>

                    <table width="95%">
                        <tr>
                            <td style="float: left">
                                <a href="${root}/admin/insert_category.jsp"><input type="button" class="button" value="Thêm mới danh mục"></a>
                        </td></tr>
                </table>


                <table class="data">
                    <tr class="data">
                        <th class="data" width="30px">STT</th>
                        <th class="data">Mã danh mục</th>
                        <th class="data">Mã danh mục cha</th>
                        <th class="data">Tên danh mục</th>
                        <th class="data" width="90px">Tùy chọn</th>
                    </tr>

                    <%                       
                        for (Category c : listCategory) {
                            i++;
                    %>

                    <tr class="data">
                        <td class="data" width="30px"><%=i%></td>
                        <td class="data"><%=c.getCategoryID()%></td>
                        <td class="data"><%=c.getCategoryParent()%></td>
                        <td class="data"><%=c.getCategoryName()%></td>
                        <td class="data" width="90px">
                    <center>
                        <a href="${root}/admin/update_category.jsp?command=update&category_id=<%=c.getCategoryID()%>">Sửa</a>&nbsp;|&nbsp;
                        <a href="/ShopBanHang/ManagerCategoryServlet?command=delete&category_id=<%=c.getCategoryID()%>">Xóa</a>
                    </center>
                    </td>
                    </tr>

                    <%
                        }
                    %>
                </table>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>         
        </div>
    </body>
</html>
