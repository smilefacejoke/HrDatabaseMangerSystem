<%--
  Created by IntelliJ IDEA.
  User: 54350
  Date: 2021/7/7
  Time: 2:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404</title>
    <style>
        *{
            margin:0 auto;
            padding: 0;
        }
    </style>
</head>
<link rel="stylesheet" href="./layui/css/layui.css">
<script src="./layui/layui.js"></script>
<body>
<div style="text-align: center;width: 80%;height: 80%">
    <img src="${pageContext.request.contextPath}/imags/czx.JPG" alt="图片有自己的想法" >
    <br><br>
    <a href="${pageContext.request.contextPath}/index.jsp" class="layui-btn layui-btn-danger">返回首页</a>
</div>
</body>
</html>
