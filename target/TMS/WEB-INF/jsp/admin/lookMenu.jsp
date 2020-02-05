<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>查看菜单</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<script>
            // 是否开启刷新记忆tab功能
            // var is_remember = false;
        </script>
</head>
<body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">菜单管理</a>
            <a>
              <cite>查看菜单</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                            <button class="layui-btn" onclick="xadmin.open('添加菜单','addMenu',600,400)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>
                                      <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>
                                    <th>ID</th>
                                    <th>菜单名</th>              
                                    <th>地址</th>
                                    <th>菜单等级</th>
                                    <th>父级菜单ID</th>
                                    <th>排序编号</th>
                                    <th>备注</th>
                                    <th>操作</th>
                                  </tr>
                                </thead>
                                <tbody>
                     				<c:forEach items="${menu}" var="m">
                     					<tr>
                     						<td> <input type="checkbox" value="${m.menu_id}" lay-filter="check" name="" lay-skin="primary"></td>
                     						<td>${m.menu_id}</td>
	                     					<td>${m.title}</td>
	                     					<td>${m.url}</td>
	                     					<td>${m.grade}</td>
	                     					<td>${m.p_id}</td>
	                     					<td>${m.sort}</td>
	                     					<td>${m.remark}</td>
	                     					
	                     					<td class="td-manage">
		                                      <a title="编辑"  onclick="xadmin.open('编辑','updateMenu?menu_id=${m.menu_id}',600,400)" href="javascript:;">
		                                        <i class="layui-icon">&#xe642;</i>
		                                      </a>
		                                      <a title="删除" onclick="member_del(this,'${m.menu_id}')" href="javascript:;">
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
        });


      });

      

      /*用户-删除*/
      function member_del(obj,id){
    	  layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
             parm={menu_id:id}
         	 url= "${pageContext.request.contextPath}/admin/deleteMenu";
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
    	  var menu_ids = [];
          // 获取选中的id 
          $('tbody input').each(function(index, el) {
              if($(this).prop('checked')){
                  menu_ids.push($(this).val())
              }
          });
          layer.confirm('确认要删除吗？'+menu_ids.toString(),function(index){
              //捉到所有被选中的，发异步进行删除
               $.ajax({
              	url:"${pageContext.request.contextPath}/admin/batchDeleteMenu",
   			    data:{menu_ids:menu_ids},
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