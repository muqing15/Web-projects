<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Perleft</title>
		<style>
			#collection{
				/*border : 1px solid red;*/
				width : 100px;
				height: 100px;
				position: relative;
				top : 70px ;
				left :120px;
				margin: 10px;
				
			}
			#update{
				/*border : 1px solid black ;*/
				position : relative ; 
				width : 100px ; 
				height: 100px;
				top : 70px ;
				left : 120px;
				margin: 10px;
				
			}
			
			#attention{
				position : relative ; 
				width : 100px ; 
				height: 100px;
				top : 70px ;
				left : 120px;
				margin: 10px;
			}
			
			a {font-size:16px} 
			a:link {color: #000000; text-decoration:none;}
			a:active:{color : #FF0000; }
			a:visited {color : purple;text-decoration:none;}
			a:hover {color: red; text-decoration:underline;}
		</style>
	</head>
	<body bgcolor="#EEEEEE">
       	<div id = "collection">
       		<a href = "http://47.95.5.140:8080/my_collection" target="right"><font size = "5" color="#000000">我的收藏</font></a>
       	</div>
       	<div id = "update">
       		<a href = "http://47.95.5.140:8080/my_upload" target="right"><font size = "5" color="#000000">我的上传</font></a>
       	</div>
       	<div id = "attention">
       		<a href = "http://47.95.5.140:8080/my_attention" target="right"><font size = "5" color="#000000">我的关注</font></a>
       	</div>	
	</body>
</html>
