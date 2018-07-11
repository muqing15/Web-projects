<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/6/16
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎登陆</title>
</head>
<body>
<%--确认登陆之后到主页面中--%>
    <h1>${errorMessage}</h1>
    <form  action="http://47.95.5.140:8088/mainPage">
    <input type="text" name="phone" >请输入手机号<br>
    <input type="password" name="password" >输入密码<br>
     <input type="submit" value="点击登陆">
    </form>
</body>
</html>
