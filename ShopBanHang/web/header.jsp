
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page import="model.User"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/clothes.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=1233445500009503";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
</head>
<body>

    <%
        CategoryDAO category = new CategoryDAO();
        User user = null;
        if (session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
        }
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        int count = 0;

    %>


    <!--header-->
    <div class="header" style="background-image:url('images/home/cover.jpg')">
        <div class="header-top">
            <div class="container" >	
                <div class="header-top-in">			
                    <div class="logo">
                        <a href="index.jsp"><img src="images/logo.jpg" style="position: absolute ; z-index: 10; width: 10%"></a>
                    </div>
                    <div class="header-in" >
                        <ul class="icon1 sub-icon1">

                            <%                                    if (user != null) {
                            %>

                            <li><a href="wishlist.html">Hello! <%=user.getUserEmail()%></a> </li>

                            <%
                                }
                            %>

                            <li><a href="wishlist.html">WISH LIST (0)</a> </li>

                            <%
                                if (user != null) {
                            %>
                            <li><a href="account.html">  MY ACCOUNT</a></li>
                                <%
                                    }
                                %>

                            <li><a href="#"> SHOPPING CART</a></li>
                            <li><a href="checkout.html" >CHECKOUT</a> </li>	

                            <%
                                if (user != null) {
                            %>
                            <li><a href="LogoutServlet">  LOGOUT</a></li>
                                <%
                                } else {
                                %>

                            <li><a href="login.jsp">  LOGIN</a></li>
                            <li><a href="register.jsp">  REGISTER</a></li>
                                <%
                                    }
                                %>
                            <li><div class="cart">
                                    <a href="#" class="cart-in"> </a>
                                    <span> <%=cart.countItem()%></span>
                                </div>
                                <ul class="sub-icon1 list">
                                    <h3>Recently added items</h3>
                                    <div class="shopping_cart">

                                        <%for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {
                                                count++;
                                        %>


                                        <div class="cart_box">
                                            <div class="message">
                                                <div class="alert-close"><a href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>"></a> </div> 
                                                <div class="list_img"><img src="<%=list.getValue().getProduct().getProductImage()%>" class="img-responsive" alt=""></div>
                                                <div class="list_desc"><h4><a href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>"><%=list.getValue().getProduct().getProductName()%></a></h4>
                                                    <%=list.getValue().getQuantity()%> x<span class="actual"> $<%=list.getValue().getProduct().getProductPrice()%></span>
                                                </div>
                                                <div class="clearfix"></div>

                                            </div>
                                        </div>
                                        <%}%>

                                    </div>
                                    <div class="total">
                                        <div class="total_left">Cart Subtotal: </div>
                                        <div class="total_right">$<%=cart.total()%></div>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <div class="login_buttons">
                                        <%
                                            if (count > 0) {
                                        %>     
                                        <div class="check_button"><a href="checkout.jsp">Check out</a></div>

                                        <%
                                            }
                                        %>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="clearfix"></div>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <div class="header-bottom">
            <div class="container">
                <div class="h_menu4">
                    <a class="toggleMenu" href="#">Menu</a>
                    <ul class="nav">
                        <li class="active"><a href="index.jsp"><i> </i> Trang Chủ</a></li>
                        <li><a> Thời Trang</a>
                            <ul class="drop" style="height: auto; max-height: 250px; overflow-x: hidden;">

                                <%
                                    for (Category c : category.getListCategory()) {
                                        if (c.getCategoryParent() == 1) {
                                %>
                                <li><a href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1">  <%=c.getCategoryName()%>  </a></li>
                                    <%
                                            }
                                        }
                                    %>
                            </ul>
                        </li> 	

                        <li><a href="#" > ĐIỆN TỬ</a>
                            <ul class="drop" style="height: auto; max-height: 250px; overflow-x: hidden;" >
                                <%
                                    for (Category c : category.getListCategory()) {
                                        if (c.getCategoryParent() == 2) {
                                %>
                                <li><a href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1">  <%=c.getCategoryName()%>  </a></li>
                                    <%
                                            }
                                        }
                                    %>
                            </ul>
                        </li>            
                        <li><a href="#" > NHÀ CỬA</a>
                            <ul class="drop" style="height: auto; max-height: 250px; overflow-x: hidden;" >
                                <%
                                    for (Category c : category.getListCategory()) {
                                        if (c.getCategoryParent() == 3) {
                                %>
                                <li><a href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1">  <%=c.getCategoryName()%>  </a></li>
                                    <%
                                            }
                                        }
                                    %>
                            </ul>
                        </li>						  				 
                        <li><a href="#" > SỨC KHỎE</a>
                            <ul class="drop" style="height: auto; max-height: 250px; overflow-x: hidden;" >
                                <%
                                    for (Category c : category.getListCategory()) {
                                        if (c.getCategoryParent() == 4) {
                                %>
                                <li><a href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1">  <%=c.getCategoryName()%>  </a></li>
                                    <%
                                            }
                                        }
                                    %>
                            </ul>
                        </li>
                        <li><a href="#" > THỂ THAO VÀ DU LỊCH</a>
                            <ul class="drop" style="height: auto; max-height: 250px; overflow-x: hidden;" >
                                <%
                                    for (Category c : category.getListCategory()) {
                                        if (c.getCategoryParent() == 5) {
                                %>
                                <li><a href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1">  <%=c.getCategoryName()%>  </a></li>
                                    <%
                                            }
                                        }
                                    %>
                            </ul>
                        </li>
                       
                        <li><a href="contact.jsp" >Liên Hệ </a></li>
                        <li><div class="search">
                                <form>
                                    <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = '';
                                        }" >
                                    <input type="submit" value="">
                                </form>
                            </div>
                        </li>
                    </ul>
                    <script type="text/javascript" src="js/nav.js"></script>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
