<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>查看学生班级</title>
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
            <a href="">返班管理</a>
            <a>
              <cite>查看学生班级</cite></a>
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
                            <button class="layui-btn" onclick="xadmin.open('添加绩效','addStudentClass',600,400)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>
                                      <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>
                                    <th>学生ID</th>
                                    <th>学生姓名</th>
                                    <th>密码</th>
                                    <th>学生号码</th>
                                    <th>班级ID</th>
                                    <th>班级名称</th>
                                    <th>是否启用</th>
                                    <th>操作</th>
                                  </tr>
                                </thead>
                                <tbody>
                     				<c:forEach items="${stu_class}" var="stu_class">
                     					<tr>
                     						<td><input type="checkbox" value="${stu_class.user_id}" lay-filter="check" name="" lay-skin="primary"></td>
                                            <td>${stu_class.user_id}</td>
                                            <td>${stu_class.name}</td>
                                            <td>${stu_class.pwd}</td>
                                            <td>${stu_class.phone_no}</td>
	                     					<td>${stu_class.cla.class_id}</td>
                                            <td>${stu_class.cla.class_name}</td>
                                            <td><input id="${stu_class.user_id}" value="${stu_class.user_id}" type="checkbox" name="status" lay-skin="switch" lay-filter="status"${stu_class.status=='1' ? 'checked' : '0'} lay-text="ON|OFF"></td>
	                     					<td class="td-manage">
	                     					  <a title="编辑"  onclick="xadmin.open('编辑','updateStudentClass?user_id=${stu_class.user_id}',600,400)" href="javascript:;">
		                                        <i class="layui-icon">&#xe642;</i>
		                                      </a>
		                                      <a title="删除" onclick="member_del(this,'${stu_class.user_id}')" href="javascript:;">
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

          form.on('switch(status)', function (data) {
              var swithcData = data;
              var user_id = data.value;// 获取要修改的ID
              var status = this.checked ? '1' : '0';// 当前状态值
              $.ajax({
                  type:"Post",
                  url: "${pageContext.request.contextPath}/admin/updateStatus",
                  data: {
                      "user_id": user_id,
                      "status": status
                  },
                  error: function (data) {
                      console.log(data);
                      layer.msg(data);
                      layer.msg('数据异常，操作失败！');
                  },
                  // 修改失败，请填写对应的参数
                  success: function (data) {
                      if (data.data) {
                          layer.msg('操作成功！');
                      } else {
                          layer.msg(data.msg);
                          var em = $(swithcData.othis[1]);
                          swithcData.othis[1].classList.remove('layui-form-onswitch');
                          em.children('em').text('OFF');
                      }
                  }
              });
          });
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
             parm={user_id:id}
         	 url= "${pageContext.request.contextPath}/admin/deleteStudentClass";
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
          var user_ids = [];
          // 获取选中的id
          $('tbody input').each(function(index, el) {
              if($(this).prop('checked')){
                  user_ids.push($(this).val())
              }
          });
          layer.confirm('确认要删除吗？'+user_ids.toString(),function(index){
              //捉到所有被选中的，发异步进行删除
              $.ajax({
                  url:"${pageContext.request.contextPath}/admin/batchDeleteAttendDetail",
                  data:{user_ids:user_ids},
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