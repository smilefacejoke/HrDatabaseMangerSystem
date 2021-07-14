<%--
  Created by IntelliJ IDEA.
  User: 54350
  Date: 2021/6/9
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人事-后台登录</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>

    <script src="loginstyle/js/jquery-1.8.2.min.js"></script>
    <script src="loginstyle/js/supersized.3.2.7.min.js"></script>



    <style>
        *{
            margin: 0 auto;
        }

        .bg1{
            width: 100%;
            height: 100%;
        }

        .login_div1{
            position: absolute;
            top: 150px;
            right: 250px;
            width:500px;
            height: 400px;
            background-color: white;
            border-radius: 10px;
            text-align: center;
        }

        .login_p1{
            margin-top: 30px;
            color:#009688;
            font-size: 25px;
            font-weight: bold;
        }

        #demo1{
            margin-left: 100px;
            margin-top: 30px;
        }

        .login_top{
            margin-top: 30px ;
        }
    </style>

</head>
<body>
<img class="bg1" src="imags/bg1.JPG">
<div class="login_div1 ">
    <p class="login_p1">人事-后台登录</p>
    <form class="layui-form layui-form-pane" id="demo1" action="login" method="post">
        <div class="layui-form-item login_top">
            <label class="layui-form-label">
                <i class="layui-icon layui-icon-username" style="font-size: 25px; color: #009688;font-weight: bold"></i>
            </label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" placeholder="请输入账号或手机号" autocomplete="off"
                       class="layui-input"style="width: 220px">
            </div>
        </div>
        <div class="layui-form-item login_top">
            <label class="layui-form-label">
                <i class="layui-icon layui-icon-password" style="font-size: 25px; color: #009688;font-weight: bold"></i>
            </label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off"
                       class="layui-input"style="width: 220px">
            </div>
        </div>

        <div class="layui-form-item login_top">
            <label class="layui-form-label">
                <i class="layui-icon layui-icon-vercode" style="font-size: 25px; color: #009688;font-weight: bold"></i>
            </label>
            <div class="layui-input-inline" style="width: 110px;">
                <input type="text" name="checkcode" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input" style="width: 110px">
            </div>
            <div class="layui-input-label">
                <a href="javascript:void(0)" id="checkcode" >
                    <img id="imgcode" src="${pageContext.request.contextPath}/CheckCode" width="80px" height="38px" alt="" style="margin-left:-80px ;border: 1px #000000 solid ">
                </a>
            </div>
        </div>

        <div >
            <label class="layui-input-inline" style="margin-top: 15px">
                <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width: 310px;margin-right: 90px">登录</button>
            </label>
        </div>
    </form>
    <div class="layui-form-item" id="layerDemo"  style="margin-top: 15px;">
        <label class="layui-input-inline">
            <button data-method="notice" style="width: 310px;margin-left: 100px" class="layui-btn">注册</button>
        </label>
    </div>

</div>

</body>

<script>
    $(function () {
        $("#checkcode").click(function () {

            $("#imgcode").attr("src","${pageContext.request.contextPath}/CheckCode?time"+new Date().getTime());
        })
    })




    layui.use(['form', 'layer','layedit', 'laydate','jquery'], function(){
            var $=layui.jquery
                ,form = layui.form
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;


            //获取登录的数据
            var login="${loginInfo}";
            if(login!=""){
             }


            //触发事件
        var active = {
            notice: function(){
                //示范一个公告层
                layer.open({
                    type: 2
                    ,title: "<span style='font-size: 25px;font-weight: bold;color: #009688'>注册用户</span>"
                    ,closeBtn: false
                    ,area: ['500px','500px']
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['取消注册']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content:'register.html'
                });
            }

        };

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });



        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });



        //监听提交
        form.on('submit(demo1)', function(data){

            return true;
        });



        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });


    });
</script>
</html>
