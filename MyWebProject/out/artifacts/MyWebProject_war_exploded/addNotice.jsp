<%--
  Created by IntelliJ IDEA.
  User: 54350
  Date: 2021/7/11
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加公告</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"></script>
</head>

<body style="padding: 10px 15px 0px 15px">
<div>
    <form class="layui-form layui-form-pane" id="demo1" action="" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">类型</label>
            <div class="layui-input-inline">
                <select name="type">
                    <option value="通知">通知</option>
                    <option value="新闻">新闻</option>
                    <option value="文章">文章</option>
                    <option value="小说">小说</option>
                </select>
            </div>

            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" lay-verify="required" placeholder="请输入文章标题" autocomplete="off" class="layui-input">
            </div>

            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="请输入文章来源名称" autocomplete="off" class="layui-input">
            </div>

        </div>
        <label class="layui-form-label">备注</label>
        <div class="layui-input-inline">
            <input type="text" name="remake" lay-verify="required" placeholder="备注可输可不输入" autocomplete="off" class="layui-input">
        </div>
        <textarea id="container" name="content" style="margin-top: 150px;height: 300px"></textarea>
        <div >
            <label class="layui-input-inline" style="margin-top: 15px">
                <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width: 310px;margin-right: 90px">提交</button>
            </label>
        </div>
    </form>
</div>
</body>

<script>

    var ue=UE.getEditor("container");

    layui.use(['form', 'layer','jquery'], function(){
        var $=layui.jquery
            ,form = layui.form
            ,layer = layui.layer;


        //监听提交
        form.on('submit(demo1)', function(data){
         /*   layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })*/

            var json={"json":JSON.stringify(data.field)};
            //设置ajax同步
            //$.ajaxSettings.async = true;
            $.post("addNotice.do",json,function (data) {
                if(data!=0){
                    layer.msg("添加成功",{icon:1});
                }else {
                    layer.msg("添加失败",{icon:5});
                }
            })
            return false;
        });
    });
</script>
</html>
