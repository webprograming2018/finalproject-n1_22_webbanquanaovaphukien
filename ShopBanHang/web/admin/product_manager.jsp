

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Sản Phầm</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>

        <%
            ProductDAO productDAO = new ProductDAO();
            ArrayList<Product> listProduct = productDAO.getListProduct();
            int count = 0;
        %>

        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Quản Lý Sản Phẩm</h3>

                    <table width="95%">
                        <tr>
                            <td style="float: left">
                                <a href="${root}/admin/insert_product.jsp"><input type="button" class="button" value="Thêm mới sản phẩm"></a>
                        </td></tr>
                </table>


                <table class="data">
                    <tr class="data">
                        <th class="data" width="30px">STT</th>
                        <th class="data">Mã sản phẩm</th>
                        <th class="data">Mã danh mục</th>
                        <th class="data">Tên Sản phẩm</th>
                        <th class="data">Hình ảnh sản phẩm</th>
                        <th class="data">Thông tin sản phẩm</th>
                        <th class="data">Giá sản phẩm</th>
                        <th class="data" width="70px">Tùy chọn</th>
                    </tr>

                    <%
                        for (Product p : listProduct) {
                            count++;
                    %>

                    <tr class="data">
                        <td class="data" width="30px"><%=count%></td>
                        <td class="data"><%=p.getProductID()%></td>
                        <td class="data"><%=p.getCategoryID()%></td>
                        <td class="data"><%=p.getProductName()%></td>
                        <td class="data"><%=p.getProductImage()%></td>
                        <td class="data"><%=p.getProductInfo()%></td>
                        <td class="data"><%=p.getProductPrice()%></td>
                        <td class="data" width="70px">
                    <center>
                        <a href="${root}/admin/update_product.jsp?command=update&product_id=<%=p.getProductID()%>">Sửa</a>&nbsp;|&nbsp;
                        <a href="/ShopBanHang/ManagerProductServlet?command=delete&product_id=<%=p.getProductID()%>">Xóa</a>
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
