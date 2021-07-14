<%--
  Created by IntelliJ IDEA.
  User: 54350
  Date: 2021/7/13
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>拖拽上传</title>
</head>
<link rel="stylesheet" href="./layui/css/layui.css">
<script src="./layui/layui.js"></script>
<script src="./js/jquery.min.js"></script>
<body>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>上传文件</legend>
    </fieldset>

    <div class="layui-upload-drag" id="test10">
        <i class="layui-icon"></i>
        <p>点击上传，或将文件拖拽到此处</p>
        <div class="layui-hide" id="uploadDemoView">
            <hr>
            <img src="" alt="上传成功后渲染" style="max-width: 196px">
        </div>
    </div>
</body>
<script>
    layui.use(['upload', 'element', 'layer'], function(){
        var $ = layui.jquery
            ,upload = layui.upload
            ,element = layui.element
            ,layer = layui.layer;


        //拖拽上传
        upload.render({
            elem: '#test10'
            ,multiple: true  //支持多文件上传
            ,accept:'file'  //可以上传所以的文件类型
            ,size: 2097152  //文件大小不可以超过2g
            ,url : 'upload.do'
            ,done: function(res){
                if (res.code==200)
                    layer.msg('上传成功',{icon:1});
                else
                    layer.msg('上传失败',{icon:5});
                console.log(res)
            }
        });

    });
</script>
</html>
