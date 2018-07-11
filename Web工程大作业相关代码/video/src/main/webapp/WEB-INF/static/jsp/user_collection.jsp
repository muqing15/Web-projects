<%@ page import="cn.video.constants.UserConstant" %>
<%@ page import="cn.video.pojo.User" %>
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
    <c:forEach items="${my_collection_video}" var="cur">
        <div class = "videos">
            <div>     ${show_user_id}
                <a href="http://47.95.5.140:8080/video?videoid=${cur.id}" target="_blank"><img src = "${cur.picture}" width="200px" height="120px"/></a>
            </div>
            <div>
                <font>作者：${cur.vname}</font>
            </div>
        </div>
    </c:forEach>
  		
	</body>
</html>