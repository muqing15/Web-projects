<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        .videos {
            /*border: 1px  solid red;*/
            width: 200px;
            height: 180px;
            float: left;
            margin: 25px;
            position: relative;
            top: 0px;


        }

        #updatearea{
            /*border : 1px solid blue;*/
            width : 200px;
            height : 150px;
            float : left;
            margin: 25px;
            position: relative;
            top : 0px;
            left: 40px;
        }

        #textup {
            /*border : 1px solid black;*/
            position: relative;
            top : 5px;
            left: 70px;
            height: 30px;
            width: 100px;
        }

        .fileInputContainer{
            /*border: 1px solid red;*/
            height: 117px;
            width : 100%;
            background:url(../../../person_images/UpdateImg.png);
            position:relative;
            top : 0px;
            left: 0px;
        }
        .fileInput{
            height:100%;
            width: 100px;
            overflow: hidden;
            font-size: 300px;
            position:absolute;
            right:0;
            top:0;
            opacity: 0;
            filter:alpha(opacity=0);
            cursor:pointer;
        }

        #submitButton{
            position: relative;
            left: 65px;

        }

    </style>
</head>
<body>
<div id="updatearea">

    <div id = "imgup">
        <form action = "http://47.95.5.140:8080/upload" method = "post" enctype = "multipart/form-data">
            <div class="fileInputContainer"><input class="fileInput"  type="file" name="file" accept="video/*" multiple="multiple"></div>
            <input type="submit" value="上传视频" id = "submitButton">
        </form>
    </div>
    <%--<div id = "textup">
        <font>上传视频</font>
    </div>--%>
</div>

<c:forEach items="${my_upload_video}" var="cur">
    <div class="videos">
        <div>
            <a href="http://47.95.5.140:8080/video?videoid=${cur.id} " target="_blank"><img src="${cur.picture}"
                                                                                          width="200px" height="120px"/></a>
        </div>
        <div id = "updater">
            <font>作者：${cur.vname}</font>
        </div>
    </div>
</c:forEach>

</body>
</html>