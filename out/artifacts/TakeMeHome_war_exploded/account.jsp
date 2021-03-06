<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Account</title>
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
	<script>
        function verify() {
            if(verifyusername()==false)return false;
            else if(verifypassword()==false)return false;
            return true;
        }
        function verifyusername() {
            if($("#username").val()==""){
                alert("昵称不能为空");
                return false;
            }
            return true;
        }
        function verifypassword(){
            if($("#password").val()==""){
                alert("密码不能为空");
                return false;};
            return true;
        }
	</script>
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
			<div class="account-in">
				<h2>登陆</h2>
				<div class="col-md-7 account-top">
					<div>
						<span>昵称*</span>
						<input id="username" name="username" type="text">
					</div>
					<div>
						<span >密码*</span>
						<input id="password" name="password" type="password">
					</div>
						<input id="submit" type="submit" value="登陆">
						<a href="register.jsp" class="create">注册</a>
				</div>
				<div class="clearfix"> </div>
			</div>	
		</div>
	</div>
<script>
	$("#submit").click(function () {
        if(verify()){
            var username = $("#username").val();
            var password = $("#password").val();
            $.ajax({
                url:"/LoginServlet",
                dataType:"text",
                data:{
                    "username":username,
                    "password":password
                },
                success:function (data) {
                    if(data=="success"){
                        $(window).attr("location","index.jsp");
                    }
                    else{
                        alert("用户名或密码错误");
                    }
                },
                error:function (XHR) {
                    alert("服务器内部错误（500:"+XHR.status);
                }
            });
        }
    });
</script>
</body>
</html>