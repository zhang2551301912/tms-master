<%--
  Created by IntelliJ IDEA.
  User: zgw
  Date: 2020/1/27
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <title>基于SSM框架的教师管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<div class="loginForm">
    <div class="sys_title">教师管理系统</div>
    <form method="post" id="formLogin">
        <input name="username" placeholder="用户名"  type="text" class="username" id="username">
        <input name="password" placeholder="密码"  type="password" class="pwd" id="pwd">
        <select class="op">
            <option name="role" value="1">管理员</option>
            <option name="role" value="2">教师</option>
        </select>
        <div class="btn">
            <input id="submit" value="登录" class="login_btn" type="button"/>
        </div>
    </form>
</div>
<script type="text/javascript">
    layui.use('layer',function () {
        $("#submit").on('click',function () {
            var user_id=$("#username").val();
            var pwd=$("#pwd").val();
            var role_id=$('option[name="role"]:checked').val();
            if(user_id==''||pwd==''){
                layer.msg('账号或密码不能为空');
            }else {
                var param={user_id:user_id,pwd:pwd,role_id:role_id};
                var url="${pageContext.request.contextPath}/loginSubmit";
                $.get(url,param, function (data) {
                        if(data.flag==1){
                            layer.msg("登录成功");
                            if(role_id==1){
                                location.href="${pageContext.request.contextPath}/admin/index";
                            }else if(role_id==2){
                                location.href="${pageContext.request.contextPath}/teacher/index";
                            }
                        }else {
                            AjaxErro(data.content);
                        }
                    }
                );
            }
            // if ($("#username").val()==''||$("#pwd").val()==''){
            //     layer.msg("账号或密码不能为空");
            // }
        });
    });


</script>
</body>
</html>
