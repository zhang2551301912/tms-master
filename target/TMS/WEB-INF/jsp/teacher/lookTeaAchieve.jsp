<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>查看绩效</title>
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
            <a href="">绩效管理</a>
            <a>
              <cite>查看绩效</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>绩效ID</th>
                                    <th>绩效评价</th>
                                    <th>绩效等级</th>
                                    <th>教师编号</th>
                                    <th>教师姓名</th>
                                    <th>教师号码</th>
                                  </tr>
                                </thead>
                                <tbody>
                     				<c:forEach items="${achievement}" var="achievement">
                     					<tr>
                                            <td>${achievement.achi_id}</td>
                                            <td>${achievement.achi_content}</td>
	                     					<td>${achievement.achi_grade}</td>
                                            <td>${achievement.user.user_id}</td>
	                     					<td>${achievement.user.name}</td>
                                            <td>${achievement.user.phone_no}</td>
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

</html>