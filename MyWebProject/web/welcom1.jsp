<%--
  Created by IntelliJ IDEA.
  User: 54350
  Date: 2021/6/21
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body>

<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">公司简介</div>
                <div class="layui-card-body">
                    <iframe src="welcom.html" width="100%" height="88%"></iframe>
                </div>
            </div>
        </div>
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">快速入口</div>
                <div class="layui-card-body">
                    <button class="layui-btn layui-btn-normal" style="width: 130px;height: 80px; font-size: 15px"><i
                            class="layui-icon layui-icon-username" style="font-size: 35px; color: white;"></i>
                        <br>
                        用户数量：${counts.userCount}
                    </button>
                    <button class="layui-btn layui-btn-warm" style="width: 130px;height: 80px;font-size: 15px"><i
                            class="layui-icon layui-icon-edit" style="font-size: 35px; color:white;"></i>
                        <br>
                        部门数量：${counts.deptCount}
                    </button>
                    <button class="layui-btn layui-btn-danger" style="width: 130px;height: 80px;font-size: 15px"><i
                            class="layui-icon layui-icon-group" style="font-size: 35px; color:white;"></i>
                        <br>
                        员工数量：${counts.employeeCount}
                    </button>


                </div>
                <div class="layui-card-body">
                    <button class="layui-btn layui-btn-warm" style="width: 130px;height: 80px; font-size: 15px"><i
                            class="layui-icon layui-icon-console" style="font-size: 35px; color: white;"></i>
                        <br>
                        工作数量：${counts.jobCount}
                    </button>
                    <button class="layui-btn layui-btn-danger " style="width: 130px;height: 80px;font-size: 15px"><i
                            class="layui-icon layui-icon-reply-fill" style="font-size: 35px; color: white;"></i>
                        <br>
                        新闻数量：${counts.noticeCount}
                    </button>
                    <button class="layui-btn layui-btn-normal" style="width: 130px;height: 80px;font-size: 15px"><i
                            class="layui-icon layui-icon-download-circle" style="font-size: 35px; color: white;"></i>
                        <br>
                        文件数量：${counts.uploadfileCount}
                    </button>
                </div>
            </div>
            <div>
                <div class="layui-card-header">最新公告</div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="test" lay-filter="test"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<script>
    layui.use(['carousel', 'layer','form','table'], function () {
        var carousel = layui.carousel,
            layer=layui.layer,
            form=layui.form,
            table=layui.table;

        table.render({
            elem: '#test'
            ,url:'selectByTop5Notice.do'
            ,cols:[[
                ,{field:'title',title: '标题',width: '30%'}
                ,{field:'content',title: '内容',width: '70%'}
            ]],
            page:true
        });

        //监听行单击事件（双击行为:rowDouble)
        table.on('row(test)',function (obj){
            var data=obj.data;

            layer.alert(
                //JSON.stringify(data)
                "发布ID:"+data.id+"<br>"+
                "发布人:"+data.username+"<br>"+
                "名称:"+ data.name+"<br>"+
                "标题:"+data.title+"<br>"+
                "内容:"+data.content+"<br>",{
                title:"具体数据"
            });
            //标记选中样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click')
        });


    });
</script>