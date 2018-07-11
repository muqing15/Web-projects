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
	<title>播放视频</title>
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
		.clickToRed{
			color: red;
		}
	</style>

	<!-- DPlayer的相关设置 -->
	<link rel="stylesheet" type="text/css" href="../css/DPlayer.min.css">
	<style type="text/css">
		.dplayer {width: 100%,height=100px}
	</style>

	<script type="text/javascript" src="../js/DPlayer.min.js"></script>

	<%--<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
		<script src="js/html5.js"></script>
		<script src="js/css3-mediaqueries.js"></script>
	<![endif]-->--%>

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
							<%--<li><a href="#" title="Upload Video"><i class="fa fa-upload"></i></a></li>--%>
							<li><a href="http://47.95.5.140:8080/center?userId"+${user.id} title="${user.name}"><i class="fa fa-user"></i></a></li>
							<%--<li><a href="#" title="Warning"><i class="fa fa-bell"></i></a></li>--%>
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
			<li class="colour-1"><a href="http://47.95.5.140:8080/column?type=1">篮球</a></li>
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
					<div class="wrap-vid" id="dplayer"   >

						<!-- <iframe id="dplayer" width="100%" height="400" src="http://file.littlepanda.top:81/xinsuan.mp4
" frameborder="0" allowfullscreen></iframe> -->

					</div>
					<script type="text/javascript">
                        dp = new DPlayer({
                            container: document.getElementById('dplayer'),
                            screenshot:true,
                            video:{
                                // url:'http://file.littlepanda.top:81/xinsuan.mp4'
                                url:'${video.url}'
                            },
                            danmaku:{
                                id:'${video.vname}',
                                api:'https://api.prprpr.me/dplayer/'
                            }
                        });
					</script>
					<div class="row">
						<div class="share">
							<div class="col-1-4">
								<div class="wrap-col">
									<div class="box-share">
										<a href="#area-comment">
											<i class="fa fa-comments"></i>
											<span>评论</span>
										</a>
									</div>
								</div>
							</div>
							<%--<div class="col-1-4">--%>
								<%--<div class="wrap-col">--%>
									<%--<div class="box-share">--%>
										<%--<a href="#">--%>
											<%--<i class="fa fa-twitter"></i>--%>
											<%--<span>Twitter </span>--%>
										<%--</a>--%>
									<%--</div>--%>
								<%--</div>--%>
							<%--</div>--%>
							<div class="col-1-4">
								<div class="wrap-col">
									<div class="box-share">

											<i id="collection" class="fa fa-heart"></i>
											<span>收藏</span>

									</div>
								</div>
							</div>
							<div class="col-1-4">
								<div class="wrap-col">
									<div class="box-share" >
											<i class="fa fa-thumbs-up"></i>
											<span>点赞</span>
									</div>
								</div>
							</div>
							<%--<div class="col-1-4">--%>
								<%--<div class="wrap-col">--%>
									<%--<div class="box-share" >--%>
										<%--&lt;%&ndash;<a href="#">&ndash;%&gt;--%>
											<%--<i class="fa fa-plus"></i>--%>
											<%--<span>Add</span>--%>
										<%--&lt;%&ndash;</a>&ndash;%&gt;--%>
									<%--</div>--%>
								<%--</div>--%>
							<%--</div>--%>
						</div>
					</div>
					<h1 class="vid-name">视频名称</h1>
					<div class="info">
						<h5>By<a href="#">XXX</a></h5>
						<span><i class="fa fa-calendar"></i>25/3/2015</span>
						<span><i class="fa fa-heart"></i>${likeCounts}</span>
					</div>
					<%--<p>视频简介</p>
					<font size = "7">NBA精彩集锦</font>--%>
					<%--<div class="tags">
						<a href="#">标签1</a>
						<a href="#">标签2</a>
						<a href="#">标签3</a>
						<a href="#">标签4</a>
						<a href="#">标签5</a>
					</div>--%>
					<section class="vid-related">
						<div class="header">
							<h2>相关视频</h2>
						</div>
						<div class="row"><!--Start Box-->
							<div id="owl-demo-1" class="owl-carousel">
								<div class="item wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img style="height: 140px" src="http://file.littlepanda.top:81/basketball/1.jpg" />
										</a>
									</div>
									<h3 class="vid-name"><a href="#">Video's Name</a></h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span>
										<span><i class="fa fa-heart" id="thump_1"></i>100<%--${likeCounts}--%></span>
									</div>
								</div>
								<div class="item wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img style="height: 140px" src="http://file.littlepanda.top:81/basketball/2.jpg" />
										</a>
									</div>
									<h3 class="vid-name"><a href="#">Video's Name</a></h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span>
										<span><i class="fa fa-heart"></i>${likeCounts}</span>
									</div>
								</div>
								<div class="item wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img  style="height: 140px" src="http://file.littlepanda.top:81/basketball/3.jpg" />
										</a>
									</div>
									<h3 class="vid-name"><a href="#">Video's Name</a></h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span>
										<span><i class="fa fa-heart"></i>${likeCounts}</span>
									</div>
								</div>
				<%--				<div class="item wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img src="http://file.littlepanda.top:81/basketball/9.jpg" />
										</a>
									</div>
									<h3 class="vid-name"><a href="#">Video's Name</a></h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span>
										<span><i class="fa fa-heart"></i>${likeCounts}</span>
									</div>
								</div>--%>
								<div class="item wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img  style="height: 140px" src="../images/5.jpg" />
										</a>
									</div>
									<h3 class="vid-name"><a href="#">Video's Name</a></h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span>
										<span><i id="likecount" class="fa fa-heart"></i>${likeCounts}</span>
									</div>
								</div>
								<div class="item wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img  style="height: 140px" src="http://file.littlepanda.top:81/basketball/6.jpg" />
										</a>
									</div>
									<h3 class="vid-name"><a href="#">Video's Name</a></h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span>
										<span><i class="fa fa-thumbs-up"></i></span>
									</div>
								</div>
								<div class="item wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img  style="height: 140px" src="http://file.littlepanda.top:81/basketball/7.jpg" />
										</a>
									</div>
									<h3 class="vid-name"><a href="#">Video's Name</a></h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span>
										<span><i class="fa fa-heart"></i>${likeCounts}</span>
									</div>
								</div>
								<div class="item wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img  style="height: 140px" src="http://file.littlepanda.top:81/basketball/8.jpg" />
										</a>
									</div>
									<h3 class="vid-name"><a href="#">Video's Name</a></h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span>
										<span><i class="fa fa-heart"></i>${likeCounts}</span>
									</div>
								</div>
							</div>
						</div>
					</section>
					<div class="col-1-3" style="background-color: #ffffff;height: auto;width: 100%;">
						<br>
						<h1 style="margin-left: 20px">评论区</h1>
						<br>
					</div>
					<br>
					<br>
					<br>
					<br>
					<div id="area-comment" class="col-1-3" style="background-color: #ffffff;height: auto;width: 100%;">

						<form id="ff" >
							<!-- <input type="text" name="input-text" style="height: 50px;width: 100%;"> -->
							<textarea class="ipt-txt" required cols="90" name="msg" rows="3"
									  placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论" onload="javascript:this.value=''" onfocus="javascript:this.value=''"></textarea>
							<input class="sendButton" type="button" name="Submit" value="发送">
							<!-- <button class="sendButton" type="submit">发送</button> -->
						</form>

				<input style="display: none"  id="video-id" name="videoId" value="${video.id}">

				<c:forEach  items="${comments}" var="vo">
					<div class="item-comment">
						<div class="area-comment-left">
							<a class="thumb" target="_blank" href="#">
								<%--用户头像--%>
								<img class="avatar" src="${vo.userHeadPic}">
							</a>
						</div>
						<div class="area-comment-right">
							<div class="author-comment last">
								<%--<span class="index-comment">#1</span>--%>
								<a class="name" target="_blank" href="#">${vo.userName}</a>
								<span class="time_">${vo.dateStr}</span>
							</div>
							<div class="content-comment">${vo.content}</div>
							<div class="author-comment"></div>
						</div>
						<div class="area-comment-divider"></div>
					</div>
				</c:forEach>


						<%--<div class="navigation">
							<ul>
								<li><a style="background-color: #5CC1EF;" href="#">&lt;</a></li>
								<li><a style="background-color: #5CC1EF;" href="#">1</a></li>
								<li><a style="background-color: #5CC1EF;" href="#">2</a></li>
								<li><a style="background-color: #5CC1EF;" href="#">3</a></li>
								<li><a style="background-color: #5CC1EF;" href="#">4</a></li>
								<li><a style="background-color: #5CC1EF;" href="#">&gt;</a></li>
							</ul>
						</div>--%>

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
							<h5>最新视频</h5>
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
										<span><i class="fa fa-heart"></i>${likeCounts}</span>
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
										<span><i class="fa fa-heart"></i>${likeCounts}</span>
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
										<span><i class="fa fa-heart"></i>${likeCounts}</span>
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
										<span><i class="fa fa-heart"></i>${likeCounts}</span>
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
										<span><i class="fa fa-heart"></i>${likeCounts}</span>
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
										<span><i class="fa fa-heart"></i>0</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%--comment--%>
	<%--<script src="../js/commentJs.js"></script>--%>
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
		$(document).ready(function(){
		    $(".fa fa-plus").click(function(){
		        $.get("http://47.95.5.140:8080/like",
					{videoid:$('#video-id').val(),
					},
					function(){
		            	$(".fa fa-plus").css("background-color","red");
					}
					);
			});
		});
	</script>
    <script>
        $(document).ready(function(){
            $(".sendButton").click(
                function(){
                    $.post("http://47.95.5.140:8080/comment",
                        {content:$(".ipt-txt").val(),
                            videoid:$('#video-id').val()},
                        function(data){
                            if ($(".ipt-txt").val()!="") {
                                $("#ff").after("<div class=\"item-comment\"><div class=\"area-comment-left\"><a class=\"thumb\" target=\"_blank\" href=\"#\"><img class=\"avatar\" src=\"" + data.user_head + "\"></a></div><div class=\"area-comment-right\"><div class=\"author-comment last\"><span class=\"index-comment\">" + "" + "</span>\n<a class=\"name\" target=\"_blank\" href=\"#\">" + data.user_name + "</a>\n<span class=\"time_\">发表于 " + data.date + "</span>\n</div><div class=\"content-comment\">" + $(".ipt-txt").val() + "</div><div class=\"author-comment\"></div></div><div class=\"area-comment-divider\"></div></div>");
                            }
                        });
                });
        });
	</script>
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
	<script type="text/javascript">
        $(document).ready(function(){
            $(".fa-thumbs-up").click(function(){
                // alert('1');
                $(".fa-thumbs-up").css("color","#ff0011");
                // var counts= $('#likecount').text();
                // var count = parseInt(counts);
                // count++;
                // // $('#likecount').text(count.toString());
                // $('#likecount').innerText(count.toString());
                $.post("http://47.95.5.140:8080/like",
                    { <%--userid:${user.id},--%>
                        videoid: $("#video-id").val()},
                    function(data){

                        // var counts= $('#likecount').text();
                        // var count = parseInt(counts);
                        // count++;
                        // $('#likecount').text('count');
                        // $(".fa-thumbs-up").css("color","#ff0011");
                        // $("#thump_1").innerText(data.count)
                    });
            });
        });
	</script>
	<script type="text/javascript">
        $(document).ready(function(){
            $("#collection").click(function(){
                $("#collection").css("color","#ff0011");
                $.post("http://47.95.5.140:8080/collection",
                    {
                        <%--userid:${user.id},--%>
                        videoId: $("#video-id").val()},
                    function(){

                    });
            });
        });
	</script>
</div>
</body></html>