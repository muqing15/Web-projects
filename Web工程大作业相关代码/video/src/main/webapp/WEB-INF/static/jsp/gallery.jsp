<%@ page import="cn.video.utils.JedisUtil" %>
<%@ page import="cn.video.pojo.User" %>
<%@ page import="cn.video.constants.UserConstant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>视频列表</title>
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
	
	<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
		<script src="js/html5.js"></script>
		<script src="js/css3-mediaqueries.js"></script>
	<![endif]-->
    
</head>
<body id="wrapper" >
<div class="wrap-body">
	
	<!--////////////////////////////////////Header-->
	<header>
		<div class="wrap-header">
			<div class="zerogrid">
				<div class="row">
					<%
						User user = (User) session.getAttribute(UserConstant.CURRENT_USER);
					%>
					<c:if test="${user !=null}">
						<ul class="quick-link">
							<%--<li><a href="#" title="Upload Video"><i class="fa fa-upload"></i></a></li>--%>
							<li><a href="http://47.95.5.140:8080/center?userId=${user.id}" title="${user.name}"><i class="fa fa-user"></i></a></li>
							<%--<li><a href="#" title="Warning"><i class="fa fa-bell"></i></a></li>--%>
						</ul>
					</c:if>
					<a href="http://47.95.5.140:8080/index" class="logo"><img src="../images/logosamll.jpg" system = "width :200px ; height : 100px;"/></a>
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
		<!--<div class="bottom">
			<div class="zerogrid">
				<div class="row">
					<span>Welcome to Us - Contact Us at <a href="register.jsp">HERE</a></span>
				</div>
			</div>
		</div>-->
    </header>
	<!--////////////////////////////////////Menu-->
	<a href="#" class="nav-toggle">Toggle Navigation</a>
    <nav class="cmn-tile-nav">
		<ul class="clearfix">
			<li class="colour-1"><a href="gallery.jsp">篮球</a></li>
			<li class="colour-2"><a href="gallery.jsp">足球</a></li>
			<li class="colour-3"><a href="gallery.jsp">乒乓球</a></li>
			<li class="colour-4"><a href="gallery.jsp">羽毛球</a></li>
			<li class="colour-5"><a href="gallery.jsp">网球</a></li>
			<li class="colour-6"><a href="gallery.jsp">冰球</a></li>
			<li class="colour-7"><a href="gallery.jsp">台球</a></li>
			<li class="colour-8"><a href="gallery.jsp">其它</a></li>
		</ul>
    </nav>
	<!--////////////////////////////////////Container-->
	<section id="container" class="index-page">
		<div class="wrap-container zerogrid">
			<div class="row">
				<div id="main-content" class="col-2-3">
					<section class="all">
						<div class="header">
							<h2>所有视频</h2>
						</div>
						<div class="row">


							<c:forEach items="${videos}" var="singleVideo"  >
							<div class="col-1-4">
								<div class="wrap-col">
									<div class="wrap-vid">
										<div class="zoom-container">
											<%--   !!!!!!!!!!!!!!!--%>
											<%--<a href="http://47.95.5.140:8080/video?videoid">--%>
											<a href="http://47.95.5.140:8080/video?videoid=${singleVideo.id}">
												<span class="zoom-caption">
													<i style="margin-top: 50px" class="icon-play fa fa-play"></i>
												</span>
												<img style="width: 300px;height: 140px" src="${singleVideo.picture}" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">${singleVideo.vname}</a></h3>
										<div class="info">
											<%--***********************--%>
											<h5>由<a href="#">${singleVideo.creatorName}</a>创作</h5>
											<span><i class="fa fa-calendar">${singleVideo.dateStr}</i></span>
												<%--播放次数 下面这是通过redis做的--%>
											<span><i class="fa fa-heart">${singleVideo.playbackTimes}</i>次播放</span>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>


						</div>
					</section>
					<%--<div class="navigation">
						<ul>
							<li><a href="#"><</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">></a></li>
						</ul>
					</div>--%>
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
							<h5>最近更新</h5>
						</div>
						<div class="wid-content">
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
	
	<!--////////////////////////////////////Footer-->
	

	<!-- Slider -->
	<script src="../js/jquery-2.1.1.js"></script>
	<script src="../js/demo.js"></script>
	<!-- Search -->
	<script src="js/modernizr.custom.js"></script>
	<script src="../js/classie.js"></script>
	<script src="js/uisearch.js"></script>
	<script>
		new UISearch( document.getElementById( 'sb-search' ) );
	</script>
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

    });
    </script>
</div>
</body></html>