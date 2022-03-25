<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Li
  Date: 2022/3/22
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
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
                        <dd><a href="javascript:;">新建文章</a></dd>
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
        <div class="pwd">
            <form action="javascript:void(0)"  class="form-box">
                <div class="layui-inline">
                    <label class="layui-form-label">当前密码</label>
                    <div class="layui-input-inline" >
                        <input type="password" id="pwd" autocomplete="off"  class="layui-input" onblur="check()" required>
                    </div>
                    <span class="sp" id="info"></span>
                </div>
                <br>
                <br>
                <div class="layui-inline">
                    <label class="layui-form-label">新密码</label>
                    <div class="layui-input-inline">
                        <input type="password" id="newpwd" autocomplete="off" class="layui-input" onblur="check2()"  required>
                    </div>
                </div>
                <br>
                <br>
                <div class="layui-inline">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-inline" >
                        <input type="password" id="newpwd2" autocomplete="off" class="layui-input" onblur="check2()" required>
                    </div>
                    <span class="sp2" id="info2"></span>
                </div>
                    <br>
                    <br>
                <div>
                <input type="submit"  id="bnt" onclick="subSave()" value="重置密码"  >
                    <input style="display: none;" type="submit" id="sub" value="submit" />
                </div>
        </form>
    </div>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
    </div>
</div>
<script>
    //JS
    var m1,m2;
    var UserName="${sessionScope.userInfo}"
    function check() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/admin/login",
            data:{
                Username: UserName.valueOf(),
                UserPWD: $('#pwd').val()
            },
            success: function (data) {
                let html
                if(data==="right")
                {
                    m1="ok";
                    html="<i class=\"layui-icon layui-icon-face-smile\" style=\"font-size: 30px; color: #35ff1e;\">OK</i>"

                }
                else
                {
                    m1="no"
                  html="<i class=\"layui-icon layui-icon-face-cry\" style=\"font-size: 30px; color: #ff1e1e;\">NO</i>"
                }
                $("#info").html(html)
            }
        });
    }
    function check2(){
        let html
        if($('#newpwd').val()===$("#newpwd2").val()&&$("#newpwd2").val()!="")
        {
            m2="ok"
            html="<i class=\"layui-icon layui-icon-face-smile\" style=\"font-size: 30px; color: #35ff1e;\">OK</i>"
        }
        else{
            m2="on"
            html="<i class=\"layui-icon layui-icon-face-cry\" style=\"font-size: 30px; color: #ff1e1e;\">NO</i>"
        }
        $("#info2").html(html)
    }
    function subSave(){
        document.getElementById ('sub').click ();
    }
    $(function () {
        $("#sub").click(function () {
            if(m1!=m2||m1!="ok"){
                console.log("出错");
                return false;
            }
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/admin/change",
                data:{
                    UserName: UserName.valueOf(),
                    UserPWD: $('#newpwd2').val()
                },
                success: function (data) {
                    if(data==="ok") {
                        alert("修改成功！");
                    }
                    else
                    {
                        alert("修改成功！");
                    }
                }
            });
        });
    });
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
<style>
    .pwd{
        position: absolute;
        top:50%;
        left: 50%;
        transform: translate(-50%,-50%);
        width: 400px;
        padding: 40px;
    }
    .pwd input[type='password']{
        width: 200px;
        height: 40px;
    }
    .pwd input[type='submit']{
        position: absolute;
        background-color: rgb(255, 255, 255);
        color: rgba(0, 0, 0, 0.89);
        padding: 10px 20px;
        border-radius: 30px;
        cursor: pointer;
        top: 85%;
        left: 40%;

    }
</style>
</html>
