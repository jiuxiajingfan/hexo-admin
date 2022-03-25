<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Li
  Date: 2022/3/20
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>主页</title>
  <!-- 引入 layui.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/css/layui.min.css">
  <!-- 引入 layui.js -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/layui/2.6.8/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>
<body>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black">欢迎</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item layui-hide layui-show-md-inline-block">
        <a href="javascript:;">
          <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
          ${sessionScope.userInfo}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="${pageContext.request.contextPath}/admin/logout">注销</a></dd>
        </dl>
      </li>
    </ul>
  </div>

  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">文章管理</a>
          <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/admin/allarticles">全部文章</a></dd>
            <dd><a href="${pageContext.request.contextPath}/admin/addarticle">新建文章</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">账号管理</a>
          <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/admin/updatepwd">修改密码</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>

  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;"></div>
  </div>

  <div class="layui-footer">
    <!-- 底部固定区域 -->
  </div>
</div>
<script>
  //JS
  layui.use(['element', 'layer', 'util'], function(){
    var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

    //头部事件
    util.event('lay-header-event', {
      //左侧菜单事件
      menuLeft: function(othis){
        layer.msg('展开左侧菜单的操作', {icon: 0});
      }
      ,menuRight: function(){
        layer.open({
          type: 1
          ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
          ,area: ['260px', '100%']
          ,offset: 'rt' //右上角
          ,anim: 5
          ,shadeClose: true
        });
      }
    });

  });
</script>
</body>
</html>
