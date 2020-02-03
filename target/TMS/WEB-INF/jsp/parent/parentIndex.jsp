<%--
  Created by IntelliJ IDEA.
  User: zgw
  Date: 2020/1/28
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>基于SSM框架的教师管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
</head>
<body class="index">
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo">
            <a href="./index.html">教师管理系统</a>
        </div>

        <ul class="layui-nav right" lay-filter="">
            <% User u=(User)session.getAttribute("user"); %>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    欢迎&nbsp;<%=u.getName() %>&nbsp;！
                </a>
                <dl class="layui-nav-child">
                    <!-- 二级菜单 -->
                    <dd>
                        <a href="../login">退出</a>
                    </dd>
                </dl>
            </li>
<%--             <li class="layui-nav-item to-index"><a href="${pageContext.request.contextPath}/login">切换用户</a></li>--%>
        </ul>
    </div>
    <!-- 顶部结束 -->

<%--    <!-- 左侧菜单开始 -->--%>
<%--    <div class="left-nav">--%>
<%--        <div id="side-nav">--%>
<%--            <ul id="nav">--%>
<%--                <c:forEach items="${menuRole}" var="menuRole">--%>
<%--                    <li>--%>
<%--                        <a href="javascript:;">--%>
<%--                            <i class="iconfont left-nav-li"lay-tips="66"></i>--%>
<%--                            <cite>${menuRole.menu.title}</cite>--%>
<%--                            <i class="iconfont nav_right">&#xe697;</i>--%>
<%--                        </a>--%>
<%--                        <c:forEach items="${menu}" var="menu">--%>
<%--                            <c:if test="${menu.pId==menuRole.menuId}">--%>
<%--                                <ul class="sub-menu">--%>
<%--                                    <li>--%>
<%--                                        <a onclick="xadmin.add_tab('${menu.title}','${menu.url}')">--%>
<%--                                            <i class="iconfont">&#xe6a7;</i>--%>
<%--                                            <cite>${menu.title }</cite>--%>
<%--                                        </a>--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                            </c:if>--%>
<%--                        </c:forEach>--%>
<%--                    </li>--%>
<%--                </c:forEach>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->




    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
            <ul class="layui-tab-title">
                <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
            </ul>
            <div class="layui-unselect layui-form-select layui-form-selected"
                 id="tab_right">
                <dl>
                    <dd data-type="this">关闭当前</dd>
                    <dd data-type="other">关闭其它</dd>
                    <dd data-type="all">关闭全部</dd>
                </dl>
            </div>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <iframe src='welcome' frameborder="0" scrolling="yes"
                            class="x-iframe"></iframe>
                </div>
            </div>
            <div id="tab_show"></div>
        </div>
    </div>

    <div class="page-content-bg"></div>
    <style id="theme_style"></style>
    <!-- 右侧主体结束 -->
</body>
</html>
