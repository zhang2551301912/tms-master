<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>选课报名</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="no-siteapp"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    </head>
    <body>
    <% User u=(User)session.getAttribute("user"); %>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="form">

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>课程编号</label>
                        <div class="layui-input-inline">
                            <select name="course_id" id="course_id" name="course_id">
                                <c:forEach items="${course}" var="c">
                                    <option value="${c.course_id}">${c.name2 }
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>教师编号</label>
                        <div class="layui-input-inline">
                            <select name="teacher_id" id="teacher_id" name="teacher_id">
                                <c:forEach items="${teacher}" var="t">
                                    <option value="${t.user_id}">${t.name }
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn" type="button" lay-filter="add" lay-submit="" >报名</button></div>
                </form>
            </div>
        </div>
        <script>
        var isTrue=false;
        layui.use(['form', 'layer','jquery'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                form.verify({
                    //将用户名是否可用作为验证条件  表单提交时触发
                        course_id:function(value){
                        var datas={"course_id": value};
                        var message='';
                        $.ajax({
                            type:"POST",
                            url:"${pageContext.request.contextPath}/student/findStudentCourse",
                            async: false, //改为同步请求
                            contentType:'application/json;charset=UTF-8',
                            data:JSON.stringify(datas),
                            dataType:'json',
                            success:function(data){
                                if(data){

                                }else {
                                    message ="亲，此课程已经报过名了，选择其他课程吧"
                                    return false;
                                }
                            }
                        });
                        //需要注意  需要将返回信息写在ajax方法外
                        if (message!==''){
                            return message;
                        }
                    }
                });

                //自定义验证规则
                //监听提交
               	url= "${pageContext.request.contextPath}/student/addStudentCourseSubmit";
               	form.on('submit(add)',function(sub){
               		var param = $("#form").serialize();
               		$.post(url,param,function(data){
               			if(data.flag==1){
               				layer.confirm('报名成功', {
               				  btn: ['继续','退出'] //按钮
               				}, function(){
               					window.location.reload();
               				}, function(){
               				  	xadmin.close();//关闭当前frame
               				  	xadmin.father_reload();//刷新父窗口
               				});

               			}else{
               				layer.alert("报名失败",{
           						icon:5
           					},
           					function(){
           						window.location.reload();
           					});
               			}

               		});

               	})
            });
        </script>
        <script>
        	var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
    </body>

</html>