<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style>
			.videos{
				/*border: 1px  solid red;*/
				width : 200px;
				height: 180px;
				position: relative;
				top : 20px ;
				float: left;
				margin: 5px;
			}
		</style>
	</head>

	<body>

	<c:forEach items="${followed_user}" var="cur">
		<div class = "videos">
			<div>
				<a href ="http://47.95.5.140:8080/center?userId=${cur.id}"  target="_blank"><img src = "${cur.head_picture}" width="200px" height="120px"/></a>
			</div>
			<div>
				<font>${cur.name}</font>
			</div>
		</div>
	</c:forEach>

	</body>
</html>
