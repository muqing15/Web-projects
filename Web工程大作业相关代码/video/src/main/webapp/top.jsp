<%@ page import="cn.video.pojo.User" %>
<%@ page import="cn.video.constants.UserConstant" %>
<%@ page import="cn.video.service.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style>
			.logo{
				/*border: 1px solid  red;*/
				width : 1000px;
				height: 90px;
				position: relative;
				left : 150px;
			}
			.background{
				/*border : 1px solid  black;*/
				width:1500px ;
				height: 150px;
				position: relative;
				top: 90px;
				
			}
			#uavatar{
				/*border : 1px solid blue ;*/
				width : 70px ;
				height: 70px;
				position : relative ;
				top : 60px ;
				left : 160px;	
			}
			#uavatar img{
				width: 60px;
				height: 60px;
				border-radius: 50%;
			}
			#uname{
				/*border : 1px solid yellow ;*/
				width : 70px ;
				height: 30px ;
				position: relative;
				top : 25px;
				left : 170px;
			}
			
			.uinfomation{
				/*border: 1px solid red ;*/
				width : 300px ;
				height: 25px ;
				position: relative;
				top : 35px;
				left : 250px;
			}
	/*		.content {
			    background-position: center top;
			    background-size: cover;
			}
			.content::after {
			    background-image: url(xxx.jpg);
			    background-position: center top;
			    background-size: cover;
			    background-attachment: fixed;
			    -webkit-filter: blur(20px);
			    -moz-filter: blur(20px);
			    -ms-filter: blur(20px);
			    -o-filter: blur(20px);
			    filter: blur(20px);
			}*/
			#Perhead{
				/*border: 1px solid red;*/
				height: 30px;
				background-position: center top;
			    background-size: cover;
			}
			#Perhead::after {
			    background-image: url(WEB-INF/static/images/16.jpg);
			    background-position: center top;
			    background-size: cover;
			    background-attachment: fixed;
			    -webkit-filter: blur(20px);
			    -moz-filter: blur(20px);
			    -ms-filter: blur(20px);
			    -o-filter: blur(20px);
			    filter: blur(20px);
			}
			.right{
				position: relative;
				left : 750px;
			}
			.left{
				position: relative;
				left : 150px;
			}
			.Span{
				/*border : 1px solid black;*/
				margin: 10px;
			}
			#allBG{
				width: 1500px;
				height: 280px;
			}
			a {font-size:16px} 
			a:link {color: #000000; text-decoration:none;}
			a:active:{color : #FF0000; }
			a:visited {color : purple;text-decoration:none;}
			a:hover {color: red; text-decoration:underline;}
		</style>
	</head>
	<body>
		<%
			User user = (User) session.getAttribute(UserConstant.CURRENT_USER);
			Integer integer = (Integer) session.getAttribute("for_id");
			System.out.println(integer.intValue());
			if (integer != null && integer.intValue() != user.getId()) {
				user.setId(integer.intValue());
			}
		%>
        <div style = "background-image: url(/person_images/BackGround.png);" id = "allBG">
		<div id = "Perhead" >
			<span class = "left">
				<span class = "Span"><a href = "http://47.95.5.140:8080/" target="_blank"><font size = "2" >网站首页</font></a></span>
				<span class = "Span"><a href = "http://47.95.5.140:8080/column?type=1" target="_blank"><font size = "2" >篮球</font></a></span>
				<span class = "Span"><a href = "../index.html" target="_blank"><font size = "2" >足球</font></a></span>
				<span class = "Span"><a href = "../index.html" target="_blank"><font size = "2" >乒乓球</font></a></span>
				<span class = "Span"><a href = "../index.html" target="_blank"><font size = "2" >羽毛球</font></a></span>
			</span>
			<span class = "right">


				<span class = "Span"><a href = "../index.html" ><font size = "2" >欢迎<c:if test="${user !=null}"><font size="5">${user.name}</font></c:if></font></a></span>
				<span class = "Span"><a href = "../index.html" target="_blank"><font size = "2" >退出登录</font></a></span>
			</span>
		</div>
		<div id = "Pbody" >
			<!--<div class = "logo" style = "background-color: white;">
				<div>
					<a href = "../index.html" target = "_blank"><img src = "../images/logosamll.jpg"></a>
				</div>
			</div>-->
			<div class = "background"> <!--style = "background-color: #28AADC; color: #ffffff;-->
				<div id = "ubasic">
					<span id = "uavatar" >
						<img src = "${user.head_picture}" >
					</span>
					<span id = "uname">
						<c:if test="${user ==null}">
							<font size="5">请登录</font>
						</c:if>
						<c:if test="${user !=null}">
							<font size="5">${user.name}</font>
						</c:if>

					</span>
				</div>
				<div class = "uinfomation">
					<input id = "usign" type = "text" placeholder = "编辑个人信息" maxlength="60" 
						style = "background-color: transparent; border: 0px;">
				</div>
			</div>
			</div>
		</div>
		</div>
	</body>
</html>
