
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liên Hệ</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>


            <div class="container">
                <div class="contact">
                    <h2 class=" contact-in">Liên Hệ</h2>

                    <div class="col-md-6 contact-top">
                        <h3>Info</h3>
                        <div style="width: 100%">
                            <div id="googleMap" style="width:100%;height:400px;"></div>

                        </div>
                        <br />

                        <p> Mọi thắc mắc hay phản hồi xin liên hệ với chúng tôi </p>
                        <p> Chúng tôi sẽ giải quyết yêu cầu hay thắc mắc của bạn sớm nhất có thể </p>				
                        <ul class="social ">
                            <li><span><i > </i>10 tran phu steet, ha dong ha noi. </span></li>
                            <li><span><i class="mes"> </i>+ 84 1234 567 8910</span></li>
                            <li><a href="mailto:info@example.com"><i class="down"> </i>abc@gmail.com</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 contact-top">
                        <h3>Thông tin</h3>
                        <div>
                            <span>Tên</span>		
                            <input type="text" value="" >						
                        </div>
                        <div>
                            <span>Email </span>		
                            <input type="text" value="" >						
                        </div>
                        <div>
                            <span>Tiêu đề</span>		
                            <input type="text" value="" >	
                        </div>
                        <div>
                            <span>Tin nhắn</span>		
                            <textarea> </textarea>	
                        </div>
                        <input type="submit" value="SEND" >	
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        
<script>
function myMap() {
var mapProp= {
  center:new google.maps.LatLng(20.979162, 105.786333),
  zoom:16,
};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBo5W_cTd7UISjdEJG1V6Jwdd-Gpu0E928&callback=myMap"></script>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
