<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cn.video.constants.UserConstant" %>
<%@ page import="cn.video.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title>LoveP.E.</title>
	<meta name="description" content="Free Responsive Html5 Css3 Templates | zerotheme.com">
	<meta name="author" content="www.zerotheme.com">
	
    <!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <!-- CSS
  ================================================== -->
  	<link rel="stylesheet" href="../css/zerogrid.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/menu.css">
	<!-- Owl Carousel Assets -->
	<link href="../css/owl.carousel.css" rel="stylesheet">
    <link href="../css/owl.theme.css" rel="stylesheet">
	<!-- Custom Fonts -->
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<style>
		.item wrap-vid{
			float: right;
		}
	</style>
	
	<!--&lt;!&ndash;[if lt IE 8]>-->
       <!--<div style=' clear: both; text-align:center; position: relative;'>-->
         <!--<a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">-->
           <!--<img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />-->
        <!--</a>-->
      <!--</div>-->
    <!--<![endif]&ndash;&gt;-->
    <!--&lt;!&ndash;[if lt IE 9]>-->
		<!--<script src="js/html5.js"></script>-->
		<!--<script src="js/css3-mediaqueries.js"></script>-->
	<!--<![endif]&ndash;&gt;-->
   	
</head>
<body id="wrapper" >
<div class="wrap-body">
	
	<!--////////////////////////////////////Header-->
	<header>
		<div class="wrap-header">
			<div class="zerogrid" >
				<div class="row" >
					<%
						User user = (User) session.getAttribute(UserConstant.CURRENT_USER);
					%>
					<c:if test="${user !=null}">
						<ul class="quick-link">

							<li><a href="http://47.95.5.140:8080/center?userId=${user.id}" title="${user.name}"><i class="fa fa-user"></i></a></li>

						</ul>
					</c:if>
					<a href="index.jsp" class="logo"><img src="../images/logosamll.jpg" system = "width :200px ; height : 100px;"/></a>
					<c:if test="${user ==null}">
					<ul class="social">
						<br />
						<li><a href="http://47.95.5.140:8080/to_login" title = "登录"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="http://47.95.5.140:8080/to_register" title = "注册"><i class="fa fa-user"></i></a></li>
						<!--<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-instagram"></i></a></li>-->
					</ul>
					</c:if>
				</div>
			</div>
		</div>
    </header>
    <!--<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>-->
	<!--////////////////////////////////////Menu-->
	<a href="#" class="nav-toggle">Toggle Navigation</a>
    <nav class="cmn-tile-nav">
		<ul class="clearfix">
			<!-- 使用get方法，传返回的类型数值，url要对应成 gallery\basketball(football...).html -->
			<li id="basketball" class="colour-1"><a href="http://47.95.5.140:8080/column?type=1">篮球</a></li>
			<li id="football" class="colour-2"><a href="http://47.95.5.140:8080/column??type=2">足球</a></li>
			<li class="colour-3"><a href="http://47.95.5.140:8080/column??type=3">乒乓球</a></li>
			<li class="colour-4"><a href="http://47.95.5.140:8080/column??type=4">羽毛球</a></li>
			<li class="colour-5"><a href="http://47.95.5.140:8080/column??type=5">网球</a></li>
			<li class="colour-6"><a href="http://47.95.5.140:8080/column??type=6">冰球</a></li>
			<li class="colour-7"><a href="http://47.95.5.140:8080/column??type=7">台球</a></li>
			<li class="colour-8"><a href="http://47.95.5.140:8080/column??type=8">其它</a></li>
		</ul>
    </nav>
	<!--////////////////////////////////////Container-->
	<section id="container" class="index-page">
		<div class="wrap-container zerogrid">
			<!------------------------------------->
			<div class="row">
				<div class="header">
					<h2>最多人喜欢</h2>
				</div>
				<div class="row" >
				<div class="most-viewed">
					<div class="col-2-4">
						<div class="wrap-col">
							<div class="zoom-container">
								<a href="http://47.95.5.140:8080/video?videoid=1">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
									<img style="height: 325px" src="http://file.littlepanda.top:81/basketball/3.jpg" />
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="extra">
					<div class="col-1-4">
						<div class="wrap-col">
							<div class="zoom-container">
								<a href="single.jsp">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
									<img  src="../images/1.jpg" />
								</a>
							</div>
							<div class="zoom-container">
								<a href="single.jsp">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
									<img  src="../images/2.jpg" />
								</a>
							</div>
						</div>
					</div>
					<div class="col-1-4">
						<div class="wrap-col">
							<div class="zoom-container">
								<a href="single.jsp">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
									<img  src="../images/5.jpg" />
								</a>
							</div>
							<div class="zoom-container">
								<a href="single.jsp">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
									<img  src="../images/14.jpg" />
								</a>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
			<div class="row">
				<div id="main-content" class="col-2-3">
					<div class="wrap-content">
						<section class="vid-tv">
							<div class="header">
								<h2>篮球</h2>
							</div>
							<div class="row">
								<div id="owl-demo-1" class="owl-carousel">
									<div  class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="http://file.littlepanda.top:81/basketball/1.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="http://file.littlepanda.top:81/basketball/7.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="http://file.littlepanda.top:81/basketball/6.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="http://file.littlepanda.top:81/basketball/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/14.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
								</div>
							</div>
						</section>

						<section class="vid-sport">
							<div class="header">
								<h2>足球</h2>
							</div>
							<div class="row"><!--Start Box-->
								<div id="owl-demo-2" class="owl-carousel">
									<div class="item wrap-vid">
										<div class="zoom-container">
											<!-- get方法传视频id -->
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/1.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/2.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/4.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/14.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
								</div>
							</div>
						</section>

						<section class="vid-music">
							<div class="header">
								<h2>网球</h2>
							</div>
							<div class="row"><!--Start Box-->
								<div id="owl-demo-3" class="owl-carousel">
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/1.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/2.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/4.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/14.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.jsp">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="../images/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span>
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
				<div id="sidebar" class="col-1-3">
					<form id="form-container" action="http://47.95.5.140:8080/search"  accept-charset="UTF-8">
						<!--<input type="submit" id="searchsubmit" value="" />-->
						<a class="search-submit-button" href="javascript:void(0)">
							<i class="fa fa-search"></i>
						</a>
						<div id="searchtext">
							<input  type="text" id="s" name="kw" placeholder="请输入关键词" >
						</div>
					</form>
					<!---- Start Widget ---->
					<div class="widget wid-post">
						<div class="wid-header">
							<h5>推荐</h5>
						</div>
						<div class="wid-content">
							<div class="post wrap-vid">
								<div class="zoom-container">
									<a href="single.jsp">
										<span class="zoom-caption">
											<i class="icon-play fa fa-play"></i>
										</span>
										<img src="../images/4.jpg" />
									</a>
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="post wrap-vid">
								<div class="zoom-container">
									<a href="single.jsp">
										<span class="zoom-caption">
											<i class="icon-play fa fa-play"></i>
										</span>
										<img src="../images/14.jpg" />
									</a>
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="post wrap-vid">
								<div class="zoom-container">
									<a href="single.jsp">
										<span class="zoom-caption">
											<i class="icon-play fa fa-play"></i>
										</span>
										<img src="../images/3.jpg" />
									</a>
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!---- Start Widget ---->
					<div class="widget wid-news">
						<div class="wid-header">
							<h5>最多人喜欢</h5>
						</div>
						<div class="wid-content">
							<div class="row">
								<div class="wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img src="../images/1.jpg" />
										</a>
									</div>
									<h3 class="vid-name">Video's Name</h3>
									<div class="info">
										<!-- 根据用户id跳到个人主页 -->
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img src="../images/2.jpg" />
										</a>
									</div>
									<h3 class="vid-name">Video's Name</h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img src="../images/4.jpg" />
										</a>
									</div>
									<h3 class="vid-name">Video's Name</h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Slider -->
	<script src="../js/jquery-2.1.1.js"></script>
	<script src="../js/demo.js"></script>
	<script src="../js/classie.js"></script>
	<!-- 功能 -->
	<%--<script type="text/javascript" src="js/ajaxindex.js"></script>--%>
	<!-- Carousel -->
	<script src="../js/owl.carousel.js"></script>
    <script>
    $(document).ready(function() {

      $("#owl-demo-1").owlCarousel({
        items : 4,
        lazyLoad : true,
        navigation : true
      });
	  $("#owl-demo-2").owlCarousel({
        items : 4,
        lazyLoad : true,
        navigation : true
      });
	  $("#owl-demo-3").owlCarousel({
        items : 4,
        lazyLoad : true,
        navigation : true
      });
    });
    </script>
</div>
</body></html>