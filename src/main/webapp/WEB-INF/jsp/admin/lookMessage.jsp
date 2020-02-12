<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>查看留言</title>
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
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">留言管理</a>
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
                            <button class="layui-btn" onclick="xadmin.open('添加学生','addMsg',600,400)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>
                                      <input type="checkbox" lay-filter="checkall" name="id" lay-skin="primary">
                                    </th>
                                    <th>留言ID</th>
                                    <th>留言内容</th>
                                    <th>被留言教师ID</th>
                                    <th>留言家长ID</th>
                                    <th>留言家长姓名</th>
                                    <th>操作</th>
                                  </tr>
                                </thead>
                                <tbody>
                     				<c:forEach items="${message}" var="m">
                     					<tr>
                     						<td><input type="checkbox" value="${m.msg_id}" lay-filter="check" name="id" lay-skin="primary"></td>
                                            <td>${m.msg_id}</td>
                                            <td>${m.msg_content}</td>
                                            <td>${m.teacher_id}</td>
                                            <td>${m.user.user_id}</td>
                                            <td>${m.user.name}</td>
	                     					<td class="td-manage">
		                                      <a title="删除" onclick="member_del(this,'${m.msg_id}')" href="javascript:;">
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
      });

      /*用户-删除*/
      function member_del(obj,id){
    	  layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
             parm={msg_id:id}
         	 url= "${pageContext.request.contextPath}/admin/deleteMsg";
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
          var msg_ids = [];
          // 获取选中的id
          $('tbody input[name="id"]').each(function(index, el) {
              if($(this).prop('checked')){
                  msg_ids.push($(this).val())
              }
          });
          layer.confirm('确认要删除吗？'+msg_ids.toString(),function(index){
              //捉到所有被选中的，发异步进行删除
              $.ajax({
                  url:"${pageContext.request.contextPath}/admin/batchDeleteMsg",
                  data:{msg_ids:msg_ids},
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
                      }
                      else{
                          layer.msg('删除!',{icon:5,time:1000});
                          layer.closeAll('loading');
                      }
                  }
              })
          });
      }

    </script>
</html>