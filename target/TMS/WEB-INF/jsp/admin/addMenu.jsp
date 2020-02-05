<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>添加菜单</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="form">
                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>菜单名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="title" name="title" required="" lay-verify="" autocomplete="off" class="layui-input"></div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>地址</label>
                        <div class="layui-input-inline">
                            <input type="text" id="url" name="url" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    
                     <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>菜单等级</label>
                        <div class="layui-input-inline">
                        	<select name="grade">
                        		<option value="1">1</option>
                        		<option value="2">2</option>                       			
                        	</select> 
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>父级菜单</label>
                        <div class="layui-input-inline">
                        	<select name="p_id">
       							<option value="0">无父级</option>
                        		<c:forEach items="${parent}" var="parent">
                        			<option value="${parent.menu_id}">${parent.title}</option>
                        		</c:forEach>
                        	</select>   
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>顺序</label>
                        <div class="layui-input-inline">
                            <input type="text" id="sort" name="sort" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>备注</label>
                        <div class="layui-input-inline">
                            <input type="text" id="remark" name="remark" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                 
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn" type="button" lay-filter="add" lay-submit="" >增加</button></div>
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
                
                //自定义验证规则
                //监听提交
              	
               	url= "${pageContext.request.contextPath}/admin/addMenuSubmit";
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