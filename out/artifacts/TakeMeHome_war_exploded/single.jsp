<%@ page import="module.Pet" %>
<%@ page import="controller.PetsController" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Single</title>
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
    <script type="application/x-javascript">
    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

    function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <!--fonts-->
    <%--<link href='http://fonts.useso.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>--%>
    <!--//fonts-->
    <!--//slider-script-->
    <script>
    $(document).ready(function(c) {
        $('.alert-close').on('click', function(c) {
            $('.message').fadeOut('slow', function(c) {
                $('.message').remove();
            });
        });
    });
    </script>
    <script>
    $(document).ready(function(c) {
        $('.alert-close1').on('click', function(c) {
            $('.message1').fadeOut('slow', function(c) {
                $('.message1').remove();
            });
        });
    });
    </script>
    <script>
    $(document).ready(function(c) {
        $('.alert-close2').on('click', function(c) {
            $('.message2').fadeOut('slow', function(c) {
                $('.message2').remove();
            });
        });
    });
    </script>
    <link rel="stylesheet" href="css/etalage.css">
    <script src="js/jquery.etalage.min.js"></script>
    <script>
    jQuery(document).ready(function($) {

        $('#etalage').etalage({
            thumb_image_width: 300,
            thumb_image_height: 400,
            source_image_width: 900,
            source_image_height: 1200,
            show_hint: true,
            click_callback: function(image_anchor, instance_id) {
                alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
            }
        });

    });
    </script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event) {
            event.preventDefault();
            $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
        });
    });
    </script>
    <!-- start menu -->
    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>
    $(document).ready(function() { $(".megamenu").megamenu(); });
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
            <%
                String petId = request.getParameter("id");
                Pet pet = PetsController.getPetById(petId);
                if(pet==null){
            %>
            <div style="text-align: center; margin-top: 250px; margin-bottom: 250px"><h1>404: 宠物不存在</h1></div>
            <%
                }
                else{
            %>
            <div class="col-md-9">
                <div class="col-md-5 single-top">
                    <ul id="etalage">
                        <%
                            for(String img : pet.getPetImagePath()){
                                String[] temp = img.split("[.]");
                                String format = temp[temp.length-1];
                                StringBuilder name = new StringBuilder();
                                name.append(temp[0]);
                                for (int i =1;i<temp.length-1;i++) {
                                    name.append(".");
                                    name.append(temp[i]);
                                }
                        %>
                        <li>
                            <img class="etalage_thumb_image img-responsive" src="images/<%=name%>.<%=format%>" alt="" >
                            <img class="etalage_source_image img-responsive" src="images/<%=name%>-l.<%=format%>" alt="" >
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
                <div class="col-md-7 single-top-in">
                    <div class="single-para">
                        <h4><%=pet.getPetName()%></h4>
                        <div class="para-grid">
                            <span class="add-to">￥<%=pet.getPetPrice()%></span>
                            <%
                                if(session.getAttribute("username")!=null){
                                    List<String> collection = (List<String>) session.getAttribute("collection");
                                    if(collection!=null && collection.contains(pet.getPetId())){
                            %>
                            <a id="collect" href="javascript:removeFromCollection(<%=pet.getPetId()%>)" class=" cart-to">取消收藏</a>
                            <%
                                    }
                                    else{
                            %>
                            <a id="collect" href="javascript:addToCollection(<%=pet.getPetId()%>)" class=" cart-to">添加到收藏</a>
                            <%
                                    }
                                }
                            %>
                            <div class="clearfix"></div>
                        </div>
                        <h5>联系人姓名: <%=pet.getOwnerName()%></h5>
                        <h5>联系人电话: <%=pet.getPhoneNumber()%></h5>
                        <div class="available">
                            <h6>简介: <%=pet.getPetDetails()%></h6>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
                <ul id="flexiselDemo1">
                    <%
                        List<Pet> pets = PetsController.getPets(pet.getSpecies());
                        for (Pet _pet: pets) {
                    %>
                    <li><a href="single.jsp?id=<%=_pet.getPetId()%>"><img style="height:80px;" src="images/<%=_pet.getPetImagePath()[0]%>" /></a>
                        <div class="grid-flex"><a href="single.jsp?id=<%=pet.getPetId()%>"><%=_pet.getPetName()%></a>
                            <p><%=_pet.getPetPrice()%></p>
                        </div>
                    </li>
                    <%
                        }
                    %>>
                </ul>
                <script type="text/javascript">
                $(window).load(function() {
                    $("#flexiselDemo1").flexisel({
                        visibleItems: 5,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint: 480,
                                visibleItems: 1
                            },
                            landscape: {
                                changePoint: 640,
                                visibleItems: 2
                            },
                            tablet: {
                                changePoint: 768,
                                visibleItems: 3
                            }
                        }
                    });

                });
                </script>
                <script type="text/javascript" src="js/jquery.flexisel.js"></script>
            </div>
            <%
                }
            %>
            <div class="clearfix"> </div>
        </div>
    </div>
    <%
        if(session.getAttribute("username")!=null){
    %>
    <script>
        function addToCollection(id){
            $.ajax({
                url:"/AddToCollectionServlet",
                dataType:"text",
                data:{
                    "id":id
                },
                success:function () {
                    $("#collect").html("取消收藏");
                    $("#collect").attr("href","javascript:removeFromCollection("+id+")");
                },
                error:function (jqXHR) {
                    alert("添加失败(500:"+jqXHR.status+")")
                }
            });
        }
        function removeFromCollection(id){
            $.ajax({
                url:"/RemoveFromCollectionServlet",
                dataType:"text",
                data:{
                    "id":id
                },
                success:function () {
                    $("#collect").html("添加到收藏");
                    $("#collect").attr("href","javascript:addToCollection("+id+")");
                },
                error:function (jqXHR) {
                    alert("取消收藏失败(500:"+jqXHR.status+")")
                }
            });
        }
    </script>
    <%
        }
    %>
</body>
</html>