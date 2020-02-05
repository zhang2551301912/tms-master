<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>关联角色菜单</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script>
	$(function(){
		$('#select').change(function(){
			var num=$(this).val()
			console.log(num)
				$(".layui-card-body").hide();
				$(".u"+num).show();
		});
	});
</script>
</head>
<body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">菜单管理</a>
            <a>
              <cite>关联菜单</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <!-- 表头选择器 -->
                        <div class="layui-card-header">
                            <button class="layui-btn" onclick="xadmin.open('添加菜单','addRoleMenu',600,400)"><i class="layui-icon"></i>添加</button>
                            <button class="layui-btn" style="">
                            	<select name="" id="select" style="border: 0; background: #009688;color: white;">
	                            	<option value="1" id="manager">管理员</option>
									<option value="2" id="teacher">教师</option>
                                    <option value="3" id="parent">家长</option>
	                            </select>
                            </button>
                        </div>
                        <!-- 管理员 -->
                        <div class="layui-card-body layui-table-body layui-table-main u1" id="1">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>
                                      <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>
                                    <th>ID</th>
                                    <th>角色名</th>              
                                    <th>菜单名</th>
                                    <th>操作</th>
                                  </tr>
                                </thead>
                                <tbody>
                     				<c:forEach items="${admin}" var="admin">
                     					<tr>
                     						<td> <input type="checkbox" value="${admin.menu_id}" lay-filter="check" name="" lay-skin="primary"></td>
                     						<td>${admin.menu_id}</td>
	                     					<td>${admin.role.name}</td>
	                     					<td>${admin.menu.title}</td>
	                     					<td class="td-manage">
		                                      <a title="删除" onclick="member_del(this,'${admin.menu_id}')" href="javascript:;">
		                                        <i class="layui-icon">&#xe640;</i>
		                                      </a>
	                                    	</td>
                                    	</tr>
                     				</c:forEach>	                                                                                     
                                </tbody>
                            </table>
                        </div>
                        
                        <!-- 教师 -->
                        <div class="layui-card-body layui-table-body layui-table-main u2" id="2" style="display: none;">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>
                                      <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>
                                    <th>ID</th>
                                    <th>角色名</th>              
                                    <th>菜单名</th>
                                    <th>操作</th>
                                  </tr>
                                </thead>
                                <tbody>
                     				<c:forEach items="${teacher}" var="teacher">
                     					<tr>
                     						<td> <input type="checkbox" value="${teacher.menu_id}" lay-filter="check" name="" lay-skin="primary"></td>
                     						<td>${teacher.menu_id}</td>
	                     					<td>${teacher.role.name}</td>
	                     					<td>${teacher.menu.title}</td>
	                     					<td class="td-manage">
		                                      <a title="删除" onclick="member_del(this,'${teacher.menu_id}')" href="javascript:;">
		                                        <i class="layui-icon">&#xe640;</i>
		                                      </a>
	                                    	</td>
                                    	</tr>
                     				</c:forEach>	                                                                                     
                                </tbody>
                            </table>
                        </div>

                        <!-- 家长 -->
                        <div class="layui-card-body layui-table-body layui-table-main u3" id="3" style="display: none;">
                            <table class="layui-table layui-form">
                                <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>
                                    <th>ID</th>
                                    <th>角色名</th>
                                    <th>菜单名</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${parent}" var="parent">
                                    <tr>
                                        <td> <input type="checkbox" value="${parent.menu_id}" lay-filter="check" name="" lay-skin="primary"></td>
                                        <td>${parent.menu_id}</td>
                                        <td>${parent.role.name}</td>
                                        <td>${parent.menu.title}</td>
                                        <td class="td-manage">
                                            <a title="删除" onclick="member_del(this,'${parent.menu_id}')" href="javascript:;">
                                                <i class="layui-icon">&#xe640;</i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script>
      layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;

        // 监听全选
        form.on('checkbox(checkall)', function(data){
          if(data.elem.checked){
            $('tbody input').prop('checked',true);
          }else{
            $('tbody input').prop('checked',false);
          }
          form.render('checkbox');
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        })

      });

      /*用户-删除*/
      function member_del(obj,id){
    	  layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
             parm={mr_id:id}
         	 url= "${pageContext.request.contextPath}/admin/deleteRoleMenu";
         	 $.post(url,parm,function(data){
         		 if(data.flag==1){
         			$(obj).parents("tr").remove();
	         		layer.msg('删除成功', {icon: 1,time:500});
         		 }else{
         			layer.msg('删除失败', {icon: 5,time:500});
         		 }
         	 });            
          });
      }

      //批量删除
      function delAll (argument) {
    	  var mr_ids = [];
          // 获取选中的id 
          $('tbody input').each(function(index, el) {
              if($(this).prop('checked')){
                  mr_ids.push($(this).val())
              }
          });
          layer.confirm('确认要删除吗？'+mr_ids.toString(),function(index){
              //捉到所有被选中的，发异步进行删除
               $.ajax({
              	url:"${pageContext.request.contextPath}/admin/delMoreRolemenu",
   			    data:{mr_ids:mr_ids},
   			    type:"Post",
   			    dataType: "json",
   			  	traditional:true,
   			    beforeSend:function () {//ajax处理之前出现spin图标
   			    	loading = layer.load(1, {//等待
   	                    shade: [0.1, '#fff'] //0.1透明度的白色背景
   	                });
                   },
   			    success: function (data) {
   			      	if(data.flag==1){
   			      		layer.msg('删除成功', {icon: 1});
   		                $(".layui-form-checked").not('.header').parents('tr').remove();	
   		             	layer.closeAll('loading');
   			      	}else{
   			      		layer.msg('删除失败!',{icon:5,time:1000});
   			      		layer.closeAll('loading');
   			      	}
   			     }
               })      
          });
        }
    </script>
</html>