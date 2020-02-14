<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>添加课表</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="no-siteapp"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="form">

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>班级</label>
                        <div class="layui-input-inline">
                            <select name="class_id" id="select" name="select">
                                <c:forEach items="${cla}" var="cla">
                                    <option value="${cla.class_id}">${cla.class_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>课程</label>
                        <div class="layui-input-inline">
                            <select name="course_id" id="select1" name="select">
                                <c:forEach items="${course}" var="c">
                                    <option value="${c.course_id}">${c.name2 }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>教师</label>
                        <div class="layui-input-inline">
                            <select name="user_id" id="select2" name="select">
                                <c:forEach items="${teacher}" var="t">
                                    <option value="${t.user_id}">${t.name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期</label>
                        <div class="layui-input-inline">
                            <select name="week" id="select3" name="select">
                                <c:forEach items="${wk}" var="wk">
                                    <option value="${wk.w_id}">${wk.w_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>节次</label>
                        <div class="layui-input-inline">
                            <select name="jieci" id="select4" name="select">
                                <c:forEach items="${jie}" var="j">
                                    <option value="${j.j_id}">${j.j_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>上课教室</label>
                        <div class="layui-input-inline">
                            <select name="address" id="select5" name="select">
                                <c:forEach items="${addr}" var="ad">
                                    <option value="${ad.addr_id}">${ad.addr_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn" type="button" lay-filter="add" lay-submit="" >增加</button>
                    </div>
                </form>
            </div>
        </div>
        <script>
        var isTrue=false;
        layui.use(['form', 'layer','jquery'],
            function() {
                $ = layui.jquery;
                var form = layui.form;
                layer = layui.layer;

                //自定义验证规则
                //监听提交

               	url= "${pageContext.request.contextPath}/admin/addCourseTableSubmit";
               	form.on('submit(add)',function(sub){

               		var param = $("#form").serialize();
               		$.post(url,param,function(data){
               			if(data.flag==1){
               				layer.confirm('添加成功', {
               				  btn: ['继续','退出'] //按钮
               				}, function(){
               					window.location.reload();
               				}, function(){
               				  	xadmin.close();//关闭当前frame
               				  	xadmin.father_reload();//刷新父窗口
               				});

               			}else{
               				layer.alert("添加失败",{
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