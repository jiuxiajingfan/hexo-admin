<%--
  Created by IntelliJ IDEA.
  User: Li
  Date: 2022/3/21
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
  <title>登录</title>
  <script>
    function subSave(){
      document.getElementById ('sub').click ();
    }
    $(function () {
      $("#sub").click(function () {
        if(!$('#UserName').val()||!$('#UserPWD').val()){
          console.log("出错");
          return false;
        }
        $.ajax({
          type: "POST",
          url: "${pageContext.request.contextPath}/admin/login",
          data:{
            Username: $('#UserName').val(),
            UserPWD: $('#UserPWD').val()
          },
          success: function (data) {
            if(data==="right")
            {location.href="${pageContext.request.contextPath}/admin/index";}
            else
            {
              $('#message').attr("style","display:block;");
              setTimeout(()=>{
                $('#message').attr("style","display:none;");
              },1000)

            }
          }
        });
      });
    });

  </script>
</head>
<body>
<div class="box" >
  <h2>Login</h2>
  <form action="javascript:void(0)"  class="form-box">
    <div class="inputBox">
      <input type="text" id="UserName" required >
      <label>Username</label>
    </div>
    <div class="inputBox">
      <input type="password"  id="UserPWD"  required>
      <label>Password</label>
    </div>
    <input type="submit"  id="bnt" onclick="subSave()" value="登录"  >
  </form>
  <div class="msg" id="message" style="display: none">
    <label>用户名或密码错误</label>
  </div>
  <input style="display: none;" type="submit" id="sub" value="submit" />
</div>
<style>
  body{
    margin: 0;
    padding: 0;
    background: url("https://hello7762.coding.net/p/jd/d/hello/git/raw/master/bg25.png");
    width:100%;
    font-family: sans-serif;
    background-size: cover;
  }
  .box{
    position: absolute;
    top:50%;
    left: 50%;
    transform: translate(-50%,-50%);
    width: 400px;
    padding: 40px;
    box-sizing: border-box;
    box-shadow: 0 15px 25px rgba(0,0,0,.5);
    border-radius: 30px;

  }
  .box:before{
    content: '';
    position: absolute;
    filter: blur(10px);

  }
  .box h2{
    margin: 0 0 30px;
    padding: 0;
    color: #fff;
    text-align: center;
  }
  .box .inputBox{
    position: relative;
  }
  .box .inputBox input{
    width: 100%;
    padding: 10px 0;
    font-size: 16px;
    color: #fff;
    margin-bottom: 30px;
    border-bottom: 1px solid #fff;
    outline: none;
    background: transparent;

  }
  .box .inputBox label{
    position: absolute;
    top:0;
    left: 0;
    padding: 10px 0;
    font-size: 16px;
    color: #fff;
    pointer-events: none;
    transition: .5s;
  }

  .box .inputBox input:focus ~ label,
  .box .inputBox input:valid ~label{
    top:-18px;
    left: 0;
    color: #03a9f4;
    font-size: 12px;
  }
  .box input[type='submit']{
    background-color: rgba(255, 255, 255, 0.67);
    border: none;
    outline: none;
    color: #03a9f4;
    padding: 10px 20px;
    border-radius: 30px;
    cursor: pointer;
    top: 50%;
    margin-left: 40%;

  }
  .box input[type='submit']:active{
    background: #000;
  }
  .msg {

    color: #de2828;
    top: 50%;
    margin-left: 30%;
  }

</style>

</body>
</html>
