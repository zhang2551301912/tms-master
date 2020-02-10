<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>修改学生信息</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="form">

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>账号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="user_id" value="${user.user_id}" name="user_id" disabled="disabled" required="" lay-verify="nikename" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>密码</label>
                        <div class="layui-input-inline">
                            <input type="text" id="pwd" value="${user.pwd}" name="pwd" required="" lay-verify="nikename" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>电话号码</label>
                        <div class="layui-input-inline">
                            <input type="text" id="phone_no" value="${user.phone_no}" name="phone_no" required="" lay-verify="nikename" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>角色</label>
                        <div class="layui-input-inline">
                            <select name="role_id">
                                <c:choose>
                                    <c:when test="${user.role_id==1}">
                                        <option value="1" selected="selected">管理员</option>
                                        <option value="2">教师</option>
                                        <option value="3">家长</option>
                                        <option value="4">学生</option>
                                    </c:when>
                                    <c:when test="${user.role_id==2}">
                                        <option value="1">管理员</option>
                                        <option value="2" selected="selected">教师</option>
                                        <option value="3">家长</option>
                                        <option value="4">学生</option>
                                    </c:when>
                                    <c:when test="${user.role_id==3}">
                                        <option value="1">管理员</option>
                                        <option value="2">教师</option>
                                        <option value="3" selected="selected">家长</option>
                                        <option value="4">学生</option>
                                    </c:when>
                                    <c:when test="${user.role_id==4}">
                                        <option value="1">管理员</option>
                                        <option value="2">教师</option>
                                        <option value="3">家长</option>
                                        <option value="4" selected="selected">学生</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="1">管理员</option>
                                        <option value="2">教师</option>
                                        <option value="3">家长</option>
                                        <option value="4">学生</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                    </div>
                    <input type="hidden" name="id" value="${user.id}">
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn" type="button" lay-filter="update" lay-submit="" >修改</button>
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
                
                //自定义验证规则
                //监听提交
              	
               	url= "${pageContext.request.contextPath}/admin/updateUserSubmit";
               	form.on('submit(update)',function(sub){
               		var param = $("#form").serialize();
               		$.post(url,param,function(data){
               			if(data.flag==1){
               				layer.msg('修改成功',{
           						icon:6
           					},
           					function(){
               				  	xadmin.close()//关闭当前frame
               				  	xadmin.father_reload();//刷新父窗口
               				});              				
               			}else{
               				layer.msg("修改失败",{
           						icon:5
           					},
           					function(){
           						xadmin.close();//关闭当前frame
               				  	xadmin.father_reload();//刷新父窗口
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