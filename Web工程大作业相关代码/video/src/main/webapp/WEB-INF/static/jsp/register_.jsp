<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/6/15
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>足球篮球视频</title>
</head>
<body>
    <h2>${errorMessage}</h2>
    <form  action="http://47.95.5.140:8088/register">
        <input type="text" name="phone" >请输入手机号<br>
        <input type="password" name="password" >输入密码<br>
        <input type="password" name="verify_password" >确认密码<br>
        <input id="smsCode_id" type="text" name="smsCode" >请输入短信验证码
        <input type="button"  onclick="sms_verify()"  value="点我发送" href="http://47.95.5.140:8088/sms_verify"> <br>
    </form>

    <a href="http://47.95.5.140:8088/login">已经有账号了? 点我登陆</a>
</body>

<script src="http://code.jquery.com/jquery-latest.js">
    function sms_verify() {
        // $.ajax({
        //     url:'http://47.95.5.140:8088/sms_verify',
        //     type:'post',
        //     dataType:'JSON',
        //     success: function (msg) {
        //         if (msg.errorCode == '1') {
        //             alert("验证码正确")
        //         }
        //     }
        //     }
        // )


    }

</script>

</html>
