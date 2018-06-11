<%@ page import="controller.PetsController" %>
<%@ page import="module.Pet" %><%--
  Created by IntelliJ IDEA.
  User: duulewhite
  Date: 6/11/18
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!--fonts-->
    <%--<link href='http://fonts.useso.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>--%>
    <!--//fonts-->
    <!--//slider-script-->
    <script>$(document).ready(function (c) {
        $('.alert-close').on('click', function (c) {
            $('.message').fadeOut('slow', function (c) {
                $('.message').remove();
            });
        });
    });
    </script>
    <script>$(document).ready(function (c) {
        $('.alert-close1').on('click', function (c) {
            $('.message1').fadeOut('slow', function (c) {
                $('.message1').remove();
            });
        });
    });
    </script>
    <script>$(document).ready(function (c) {
        $('.alert-close2').on('click', function (c) {
            $('.message2').fadeOut('slow', function (c) {
                $('.message2').remove();
            });
        });
    });
    </script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
    <!-- start menu -->
    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>$(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>
</head>
<body>
<%
    String petId = request.getParameter("id");
    Pet pet = new Pet();
    if(petId!=null) {
        pet = PetsController.getPetById(petId);
        pet.setPetId(petId);
    }
%>
<div class="container">
    <div class="header-top">
        <div class="logo">
            <a href="index.jsp"><img src="images/logo.png" alt=""></a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="header-bottom">
        <div class="top-nav">
            <ul class="megamenu skyblue">
                <li class="grid"><a href="index.jsp">主页</a>
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
                <li><a class="pink" href="store.jsp?species=All">宝贝</a></li>
                <%
                    if (session.getAttribute("username") != null) {
                %>
                <li><a class="my" href="collection.jsp">我的收藏</a></li>
                <li><a class="my" href="publish.jsp">我的发布</a></li>
                <%
                    }
                %>
            </ul>
        </div>
        <div class="cart icon1 sub-icon1">
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
            %>
            <div class="check_button">
                <a><%=username%>
                </a>
                <a href="LogoutServlet">注销</a>
            </div>

            <%
            } else {
            %>
            <div class="check_button"><a href="account.jsp">登录</a></div>
            <%
                }
            %>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="content">
        <form action="/PublishServlet" method="post">
        <div class="content-bottom store">
            <h3>我的发布</h3>
            <div class="bottom-grid container">

                <table class="pet-info">
                    <%
                        if(petId!=null){
                    %>
                    <tr style="display: none">
                        <td></td>
                        <td><input name="petId" value="<%=pet.getPetId()%>"></td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td>宠物名称</td>
                        <td><input name="petName" type="text" value="<%=pet.getPetName()%>"></td>
                    </tr>
                    <tr>
                        <td>宠物分类</td>
                        <td><select name="petSpecies">
                            <option <%if(pet.getSpecies().equals("1")){%>selected="selected"<%}%> value="1">狗狗</option>
                            <option <%if(pet.getSpecies().equals("2")){%>selected="selected"<%}%> value="2">猫猫</option>
                            <option <%if(pet.getSpecies().equals("3")){%>selected="selected"<%}%> value="3">鸟类</option>
                            <option <%if(pet.getSpecies().equals("4")){%>selected="selected"<%}%> value="4">水族</option>
                            <option <%if(pet.getSpecies().equals("5")){%>selected="selected"<%}%> value="5">兔兔</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>宠物价格</td>
                        <td><input name="petPrice" type="number" value="<%=pet.getPetPrice()%>"></td>
                    </tr>
                    <tr>
                        <td>上传图片</td>
                        <td><input name="petImage" type="file"></td>
                    </tr>
                    <tr>
                        <td>联系人</td>
                        <td><input name="ownerName" type="text" value="<%=pet.getOwnerName()%>"></td>
                    </tr>
                    <tr>
                        <td>联系电话</td>
                        <td><input name="ownerPhone" type="number" value="<%=pet.getPhoneNumber()%>"></td>
                    </tr>
                    <tr>
                        <td>宠物介绍</td>
                        <td><textarea name="petDetails" cols="60" rows="6" style="resize:none"><%=pet.getPetDetails()%></textarea></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="website-buttons" style="padding-left: 20px;">
            <input id="publish" type="submit" value="发布">
        </div>
        </form>
    </div>
</div>
</body>
</html>
