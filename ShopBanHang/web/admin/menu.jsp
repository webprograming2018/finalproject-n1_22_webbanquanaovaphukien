
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>
        <div id="leftBar">
	<ul>
		<li><a href="${pageContext.request.contextPath}/admin/index.jsp">Trang Chủ</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/categories_manager.jsp">Danh Mục</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/product_manager.jsp">Sản Phẩm</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/bill_manager.jsp">Hóa Đơn</a></li>
	</ul>
	</div>
    </body>
</html>
