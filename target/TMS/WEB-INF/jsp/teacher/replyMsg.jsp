<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>留言回复</title>
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
              <cite>留言回复</cite></a>
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
                            <button class="layui-btn" onclick="xadmin.open('课程教师','addReplyMsg',600,400)"><i class="layui-icon"></i>留言回复</button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>
                                      <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>
                                    <th>留言ID</th>
                                    <th>留言内容</th>
                                    <th>留言人ID</th>
                                    <th>留言人姓名</th>
                                    <th>回复ID</th>
                                    <th>回复内容</th>
                                    <th>操作</th>
                                  </tr>
                                </thead>
                                <tbody>
                     				<c:forEach items="${replyMsg}" var="r">
                     					<tr>
                     						<td> <input type="checkbox" value="${r.repmsg_id}" lay-filter="check" name="" lay-skin="primary"></td>
                                            <td>${r.msg_id}</td>
                                            <td>${r.message.msg_content}</td>
	                     					<td>${r.message.parent_id}</td>
                                            <td>${r.user.name}</td>
                                            <td>${r.repmsg_id}</td>
                                            <td>${r.repmsg_content}</td>
                                            <td class="td-manage">
                                                <a title="删除" onclick="member_del(this,'${r.repmsg_id}')" href="javascript:;">
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
              parm={repmsg_id:id}
              url= "${pageContext.request.contextPath}/teacher/deleteReplyMsg";
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
    </script>
</html>