<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>关联课程教师</title>
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
            <a href="">课程教师</a>
            <a>
              <cite>关联课程教师</cite></a>
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
                                        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                                        <button class="layui-btn" onclick="xadmin.open('课程教师','addCourseTeacher',600,400)"><i class="layui-icon"></i>添加</button>
                                    </div>
                                    <!-- 教师课程 -->
                                    <div class="layui-card-body layui-table-body layui-table-main">
                                        <table class="layui-table layui-form">
                                            <thead>
                                              <tr>
                                                <th>
                                                  <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                                </th>
                                                <th>ID</th>
                                                <th>课程ID</th>
                                                <th>课程名</th>
                                                <th>教师ID</th>
                                                <th>教师名</th>
                                                <th>操作</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${courseUsers}" var="cu">
                                                    <tr>
                                                        <td> <input type="checkbox" value="${cu.cu_id}" lay-filter="check" name="" lay-skin="primary"></td>
                                                        <td>${cu.cu_id}</td>
                                                        <td>${cu.course.course_id}</td>
                                                        <td>${cu.course.name2}</td>
                                                        <td>${cu.user.user_id}</td>
                                                        <td>${cu.user.name}</td>
                                                        <td class="td-manage">
                                                          <a title="删除" onclick="member_del(this,'${cu.cu_id}')" href="javascript:;">
                                                            <i class="layui-icon">&#xe640;</i>
                                                          </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
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
             parm={cu_id:id}
         	 url= "${pageContext.request.contextPath}/admin/deleteCourseTea";
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
    	  var cu_ids = [];
          // 获取选中的id
          $('tbody input').each(function(index, el) {
              if($(this).prop('checked')){
                  cu_ids.push($(this).val())
              }
          });
          layer.confirm('确认要删除吗？'+cu_ids.toString(),function(index){
              //捉到所有被选中的，发异步进行删除
               $.ajax({
              	url:"${pageContext.request.contextPath}/admin/batchDeleteCourseTea",
   			    data:{cu_ids:cu_ids},
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