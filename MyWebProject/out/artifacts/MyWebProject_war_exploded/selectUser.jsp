<%--
  Created by IntelliJ IDEA.
  User: 54350
  Date: 2021/6/6
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>查找用户</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
</head>
<body>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <form action="post" class="layui-form">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
            <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        </div>
    </form>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['table','form','jquery'], function(){
        var table = layui.table;
        var form=layui.form;
        var $ = layui.jquery;
        table.render({
            elem: '#test'
            ,url:'findUsers'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'number', title:'账号', width:'10%'}
                ,{field:'password', title:'密码', width:'10%', edit: 'text'}
                ,{field:'roleId', title:'角色', width:'10%', sort: true}
                ,{field:'phone', title:'手机', width:'10%'}
                ,{field:'createdate', title:'注册时间', width: '10%'}
                ,{field:'username', title:'昵称', width:'10%', sort: true,edit: 'text'}
                ,{field:'remark', title:'备注', width:'10%',edit: 'text'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    //构建json数据
                    var json={"number":data.number};
                    //完成ajax操作
                    $.post("deleteByNumber.do",json,function (data) {
                        //判断结果
                        if(data!="0"){
                            //修改成功
                            layer.msg("删除成功!",{icon:1});
                        }
                        else{
                            //修改失败
                            layer.msg("删除失败!",{icon:5});
                        }
                    })
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.confirm('确定要修改吗?',function(index) {
                    //完成修改的功能
                    //使用ajax完成
                    var json={"json":JSON.stringify(data)}
                    $.post("updateUser.do",json,function (data) {
                        //判断结果
                        if(data!="0"){
                            //修改成功
                            layer.msg("修改成功!",{icon:1});
                        }
                        else{
                            //修改失败
                            layer.msg("修改失败!",{icon:5});
                        }
                    });
                    layer.close(index);
                });
            }
        });
    });
</script>

</body>
</html>