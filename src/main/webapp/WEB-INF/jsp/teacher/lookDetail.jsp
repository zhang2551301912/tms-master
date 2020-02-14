<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>查看出勤明细</title>
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
            <a href="">出勤明细管理</a>
            <a>
              <cite>查看明细</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
<%--                        <div class="layui-card-header">--%>
<%--                            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>--%>
<%--                            <button class="layui-btn" onclick="xadmin.open('添加出勤明细','addAttendDetail',600,400)"><i class="layui-icon"></i>添加</button>--%>
<%--                        </div>--%>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
<%--                                    <th>--%>
<%--                                      <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">--%>
<%--                                    </th>--%>
                                    <th>ID</th>
                                    <th>出勤起始时间</th>
                                    <th>出勤结束时间</th>
                                    <th>出勤人ID</th>
                                    <th>出勤人姓名</th>
<%--                                    <th>操作</th>--%>
                                  </tr>
                                </thead>
                                <tbody>
                     				<c:forEach items="${attendanceDetail}" var="attendanceDetail">
                     					<tr>
<%--                     						<td> <input type="checkbox" value="${attendanceDetail.detail_id}" lay-filter="check" name="" lay-skin="primary"></td>--%>
                                            <td>${attendanceDetail.detail_id}</td>
                                            <td>${attendanceDetail.start_date}</td>
                                            <td>${attendanceDetail.end_date}</td>
	                     					<td>${attendanceDetail.user.user_id}</td>
                                            <td>${attendanceDetail.user.name}</td>
<%--	                     					<td class="td-manage">--%>
<%--		                                      <a title="删除" onclick="member_del(this,'${attendanceDetail.detail_id}')" href="javascript:;">--%>
<%--		                                        <i class="layui-icon">&#xe640;</i>--%>
<%--		                                      </a>--%>
<%--	                                    	</td>--%>
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


    </script>
</html>