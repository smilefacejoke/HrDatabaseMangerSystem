<%--
  Created by IntelliJ IDEA.
  User: 54350
  Date: 2021/6/4
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>首页</title>
  </head>
  <link rel="stylesheet" href="./layui/css/layui.css">
  <script src="./layui/layui.js"></script>
  <script src="./js/jquery.min.js"></script>
  <body>
  <div class="layui-layout layui-layout-admin">
    <div class="layui-header layui-bg-green">
      <div class="layui-logo layui-hide-xs" style="font-weight: bold ;color: white" >华南理工广州学院</div>
      <!-- 头部区域（可配合layui 已有的水平导航） -->
      <ul class="layui-nav layui-layout-left">
        <!-- 移动端显示 -->
        <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
          <i class="layui-icon layui-icon-spread-left"></i>
        </li>
        <img style="width: 90px;height: 30px" src="imags/logo1.png">
        <li class="layui-nav-item layui-hide-xs"><a href="" style="margin-left: -60px">华南理工广州学院欢迎你！</a></li>
      </ul>
      <ul class="layui-nav layui-layout-right">

        <li class="layui-nav-item" style="font-weight: bold; font-size: 16px">
          <i class="layui-icon layui-icon-time" style="color: white;">&nbsp;</i><span id="timeText"></span>
        </li>

        <li class="layui-nav-item layui-hide-xs"><a href="${pageContext.request.contextPath}/logout">
          <i class="layui-icon layui-icon-logout" style="font-size: 15px;font-weight: bold; color: red;"></i>退出登陆 </a>
        </li>
        <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
          <a href="javascript:;">
            <i class="layui-icon layui-icon-more-vertical"></i>
          </a>
        </li>
      </ul>
    </div>

    <div class="layui-side layui-bg-black">
      <div class="layui-side-scroll">
        <div style="text-align: center">
          <li class="layui-nav-item layui-hide layui-show-md-inline-block">
            <a href="javascript:;" data-method="setTop" id="myInfo">
              <img src="./imags/Str.GIF" class="layui-nav-img" style="width: 120px;height: 100px">
            </a>
            <p style="margin-top: 10px">${user.username}，欢迎你！</p>
          </li>
        </div>

        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
          <li class="layui-nav-item layui-bg-green" style="margin-top: 10px;text-align: center;font-weight: bold;font-size: 17px">人事信息管理</li>

          <li class="layui-nav-item ">
            <a class="" href="javascript:;">
              <i class="layui-icon layui-icon-user" style="font-size: 18px; color: #01AAED;"></i>用户管理</a>
            <dl class="layui-nav-child">
              <dd style="padding-left: 40px"><a href="javascript:;"
                                                data-url="addUser.html"
                                                data-type="tabAdd"
                                                data-id="addUser"
                                                data-title="<i class='layui-icon layui-icon-add-1' style='font-size: 17px; color: #01AAED;'></i>添加用户"
                                                class="site-demo-active">
                                                <i class="layui-icon layui-icon-add-1" style="font-size: 17px; color: #01AAED;"></i>&nbsp;添加用户</a></dd>
              <dd style="padding-left: 40px"><a href="javascript:"
                                                data-url="selectUser.jsp"
                                                data-type="tabAdd"
                                                data-id="selectUser"
                                                data-title="<i class='layui-icon layui-icon-search' style='font-size: 17px; color: #01AAED;'></i>查询用户"
                                                class="site-demo-active">
                                                <i class="layui-icon layui-icon-search" style="font-size: 17px; color: #01AAED;"></i>&nbsp;查询用户</a></dd>
            </dl>
          </li>

          <li class="layui-nav-item ">
            <a class="" href="javascript:;">
              <i class="layui-icon layui-icon-edit" style="font-size: 18px; color: #01AAED;"></i>部门管理</a>
            <dl class="layui-nav-child">
              <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-add-1" style="font-size: 17px; color: #01AAED;"></i>&nbsp;添加部门</a></dd>
              <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 17px; color: #01AAED;"></i>&nbsp;查询部门</a></dd>
            </dl>
          </li>

          <li class="layui-nav-item ">
            <a class="" href="javascript:;">
              <i class="layui-icon layui-icon-console" style="font-size: 18px; color: #01AAED;"></i>职位管理</a>
            <dl class="layui-nav-child">
              <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-add-1" style="font-size: 17px; color: #01AAED;"></i>&nbsp;添加职位</a></dd>
              <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 17px; color: #01AAED;"></i>&nbsp;查询职位</a></dd>
            </dl>
          </li>

          <li class="layui-nav-item ">
            <a class="" href="javascript:;">
              <i class="layui-icon layui-icon-group" style="font-size: 16px; color: #01AAED;"></i>员工管理</a>
            <dl class="layui-nav-child">
              <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-add-1" style="font-size: 17px; color: #01AAED;"></i>&nbsp;添加员工</a></dd>
              <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 17px; color: #01AAED;"></i>&nbsp;查询员工</a></dd>
            </dl>
          </li>

          <li class="layui-nav-item ">
            <a class="" href="javascript:;">
              <i class="layui-icon layui-icon-list" style="font-size: 18px; color: #01AAED;"></i>角色管理</a>
            <dl class="layui-nav-child">
              <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-add-1" style="font-size: 17px; color: #01AAED;"></i>&nbsp;添加角色</a></dd>
              <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 17px; color: #01AAED;"></i>&nbsp;查询角色</a></dd>
            </dl>
          </li>

          <li class="layui-nav-item ">
            <a class="" href="javascript:;">
              <i class="layui-icon layui-icon-reply-fill" style="font-size: 18px; color: #01AAED;"></i>公告管理</a>
            <dl class="layui-nav-child">
              <dd style="padding-left: 40px"><a href="javascript:;"
                                                data-url="addNotice.jsp"
                                                data-type="tabAdd"
                                                data-id="addNotice"
                                                data-title="<i class='layui-icon layui-icon-add-1' style='font-size: 17px; color: #01AAED;'></i>添加公告"
                                                class="site-demo-active">
                                                <i class="layui-icon layui-icon-add-1" style="font-size: 17px; color: #01AAED;"></i>&nbsp;添加公告</a></dd>
              <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 17px; color: #01AAED;"></i>&nbsp;公告查询</a></dd>
            </dl>
          </li>

          <li class="layui-nav-item ">
            <a class="" href="javascript:;">
              <i class="layui-icon layui-icon-download-circle" style="font-size: 20px; color: #01AAED;"></i>下载中心</a>
            <dl class="layui-nav-child">
              <dd style="padding-left: 40px"><a href="javascript:;"
                                                data-url="upload.jsp"
                                                data-type="tabAdd"
                                                data-id="uploadFile"
                                                data-title="<i class='layui-icon layui-icon-upload-drag' style='font-size: 17px; color: #01AAED;'></i>文件上传"
                                                class="site-demo-active">
              <i class="layui-icon layui-icon-upload-drag" style="font-size: 17px; color: #01AAED;"></i>&nbsp;文件上传</a></dd>
              <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-download-circle" style="font-size: 17px; color: #01AAED;"></i>&nbsp;文件下载</a></dd>
            </dl>
          </li>

        </ul>
      </div>
    </div>

    <div class="layui-body">
      <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-card" lay-filter="demo" lay-allowclose="true">
          <ul class="layui-tab-title">
            <li class="layui-this"><i class="layui-icon layui-icon-home" style="font-size: 14px; color: #009688;"></i>&nbsp;欢迎首页</li>
          </ul>

          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
              <iframe src="welcom1.jsp" style="width: 98%;height: 85%"></iframe>
            </div>
          </div>
        </div>
      </div>

    <div class="layui-footer" style="text-align: center">
      <!-- 底部固定区域 -->
      @2021-2100 华南理工广州学院 计算机科学与技术5班
    </div>
  </div>

  <script>
    //页面加载完成事件
    $(function () {
      //创建一个定时器
      var mytime=setInterval(function () {
        //自定义一个方法，用来获取时间字符串
        getTime();
      },1000);
    });

    //获取时间的方法
    function getTime(){
      //获取当前时间对象
      var date=new Date();
      //分别用这些时间对象获取具体的时分秒
      var y=date.getFullYear();
      var M=(date.getMonth()+1)<10?('0'+(date.getMonth()+1)):(date.getMonth()+1);
      var D=date.getDate()<10?('0'+(date.getDate())):(date.getDate());
      var H=date.getHours();
      var m=date.getMinutes()<10?('0'+(date.getMinutes())):(date.getMinutes());
      var s=date.getSeconds()<10?('0'+(date.getSeconds())):(date.getSeconds());

      //将获取到的数据拼接起来
      var dateString=y+"年"+M+"月"+D+"日"+"&nbsp;&nbsp;"+H+":"+m+":"+s+"秒"+"&nbsp;&nbsp;星期"+"日一二三四五六".charAt(date.getDate()+1);
      $("#timeText").html(dateString);
    }



    //JS
    layui.use(['element', 'layer', 'util','jquery'], function(){
      var element = layui.element
              ,layer = layui.layer
              ,util = layui.util
              ,$ = layui.jquery;

      //头部事件
      util.event('lay-header-event', {
        //左侧菜单事件
        menuLeft: function(othis){
          layer.msg('展开左侧菜单的操作', {icon: 0});
        }
        ,menuRight: function(){
          layer.open({
            type: 1,
            title:"<img style='width: 90px;height: 30px' src='imags/logo1.png'>华广简介"
            ,content: '<iframe src="leftpage.html" width="240px" height="100%"></iframe>'
            ,area: ['260px', '100%']
            ,offset: 'rt' //右上角
            ,anim: 5
            ,shadeClose: true
          });
        }
      });

      //触发事件
      var active = {
        setTop:function(){
          var  that=this;
          //多窗口模式，层叠置顶
          layer.open({
            type:2,
            title:"个人资料",
            area: ['390px','560px'],
            shade:0,
            maxmin:true,
            content:"myInfo.jsp",
            zIndex:layer.zIndex,
          })
        },

        tabAdd: function(url,id,title){
          //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
          //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
          element.tabAdd('demo', {
            title: title,
            content: '<iframe data-frameid="' + id
                    + '" scrolling="auto" frameborder="0" src="'
                    + url + '" style="width:100%;height: 730px"></iframe>',
            id: id
            //规定好的id
          })
          element.render('tab');
        },
        tabChange: function (id) {
          //切换到指定Tab项
          element.tabChange('demo', id); //根据传入的id传入到指定的tab项
        },
        tabDelete: function (id) {
          element.tabDelete("demo", id);//删除
        },
        tabDeleteAll: function (ids) {//删除所有
          $.each(ids, function (i, item) {
            element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
          })
        }
      };
      $("#myInfo").click(function () {
        var othis=$(this), method=othis.data('method');
        active[method] ? active[method].call(this,othis): '';
      });

        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
      $('.site-demo-active').on(
              'click',
              function () {
                var dataid = $(this);

                //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
                if ($(".layui-tab-title li[lay-id]").length <= 0) {
                  //如果比零小，则直接打开新的tab项
                  active
                          .tabAdd(dataid.attr("data-url"), dataid
                                  .attr("data-id"), dataid
                                  .attr("data-title"));
                } else {
                  //否则判断该tab项是否以及存在

                  var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                  $.each($(".layui-tab-title li[lay-id]"),
                          function () {
                            //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                            if ($(this).attr("lay-id") == dataid
                                    .attr("data-id")) {
                              isData = true;
                            }
                          })
                  if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                  }
                }
                //最后不管是否新增tab，最后都转到要打开的选项页面上
                active.tabChange(dataid.attr("data-id"));
              });


    });
  </script>
  </body>
</html>
