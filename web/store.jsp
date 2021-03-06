<%@ page import="controller.PetsController" %>
<%@ page import="module.Pet" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Store</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<%--<link href='http://fonts.useso.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>--%>
<!--//fonts-->
<!--//slider-script-->
<script>$(document).ready(function(c) {
	$('.alert-close').on('click', function(c){
		$('.message').fadeOut('slow', function(c){
	  		$('.message').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.alert-close1').on('click', function(c){
		$('.message1').fadeOut('slow', function(c){
	  		$('.message1').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.alert-close2').on('click', function(c){
		$('.message2').fadeOut('slow', function(c){
	  		$('.message2').remove();
		});
	});	  
});
</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
					jQuery(document).ready(function($) {
						$(".scroll").click(function(event){		
							event.preventDefault();
							$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
						});
					});
				</script>
				<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>		
</head>
<body> 
<!--header-->
	<div class="container">
		<div class="header-top">
			<div class="logo">
				<a href="index.jsp"><img src="images/logo.png" alt="" ></a>
			</div>
			<div class="clearfix"> </div>
		</div>
		<div class="header-bottom">
			<div class="top-nav">
				<ul class="megamenu skyblue">
					<li class="grid"><a  href="index.jsp">主页</a>
					<li class="active grid"><a>分类</a>
						<div class="megapanel">
							<div class="h_nav">
								<ul>
									<li><a href="store.jsp?species=1">狗狗</a></li>
									<li><a href="store.jsp?species=2">猫咪</a></li>
									<li><a href="store.jsp?species=3">鸟类</a></li>
									<li><a href="store.jsp?species=4">水族</a></li>
									<li><a href="store.jsp?species=5">兔兔</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li><a class="pink"  href="store.jsp?species=All">宝贝</a></li>
                    <%
                        if(session.getAttribute("username") != null){
                    %>
                    <li><a class="my"  href="collection.jsp">我的收藏</a></li>
                    <li><a class="my" href="publish.jsp">我的发布</a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
            <div class="cart icon1 sub-icon1">
                <%
                    String username = (String)session.getAttribute("username");
                    if(username != null){
                %>
                <div class="check_button">
                    <a><%=username%></a>
                    <a href="LogoutServlet">注销</a>
                </div>

                <%
                }
                else{
                %>
                <div class="check_button"><a href="account.jsp">登录</a></div>
                <%
                    }
                %>
            </div>
			<div class="clearfix"> </div>
		</div>
		<div class="content">

		
            <div class="content-bottom store">
                <h3>宠物列表</h3>
                <div class="bottom-grid">
                    <%
                        String species = request.getParameter("species");
                        List<Pet> pets = PetsController.getPets(species);
                        for(Pet pet:pets){
                    %>
                    <div class="col-md-3 store-top">
                        <div class="bottom-grid-top">
                            <a href="single.jsp?id=<%=pet.getPetId()%>"><img style="height:250px;" class="img-responsive" src="images/<%=pet.getPetImagePath()[0]%>" alt="" >
                            <div class="pre">
                                <p><%=pet.getPetName()%></p>
                                <span>￥<%=pet.getPetPrice()%></span>
                                <div class="clearfix"> </div>
                            </div></a>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
	</div>
</body>
</html>