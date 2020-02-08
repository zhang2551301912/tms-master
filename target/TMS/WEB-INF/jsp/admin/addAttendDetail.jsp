<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>添加出勤明细</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="no-siteapp"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="form">

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                        <span class="x-red">*</span>起始时间</label>
                        <div class="layui-input-inline">
                            <input type="text" id="start_date" name="start_date" required="" lay-verify="" autocomplete="off" class="layui-input datetime" placeholder="yyyy-MM-dd HH:mm:ss">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                        <span class="x-red">*</span>结束时间</label>
                        <div class="layui-input-inline">
                            <input type="text" id="end_date" name="end_date" required="" lay-verify="" autocomplete="off" class="layui-input datetime" placeholder="yyyy-MM-dd HH:mm:ss">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                        <span class="x-red">*</span>出勤人</label>
                        <div class="layui-input-inline">
                            <select name="user_id" id="user_id">
                                <c:forEach items="${teacher}" var="teacher">
                                    <option value="${teacher.user_id}">${teacher.name}
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn" type="button" lay-filter="add" lay-submit="" >增加</button>
                    </div>
                </form>
            </div>
        </div>
        <script>
            layui.use(['form', 'laydate','jquery'],
                function() {
                    $ = layui.jquery;
                    var form = layui.form;
                    var laydate = layui.laydate;
                    var nowTime = new Date().valueOf();
                    var max = null;

                    var start = laydate.render({
                        elem: '#start_date',
                        type: 'datetime',
                        trigger:'click',
                        format:'yyyy-MM-dd HH:mm:ss',
                        done: function(value, date){
                            endMax = end.config.max;
                            end.config.min = date; //最大时间为结束时间的开始值
                            end.config.min.month = date.month -1;
                        }
                    });
                    var end = laydate.render({
                        elem: '#end_date',
                        type: 'datetime',
                        trigger:'click',
                        format:'yyyy-MM-dd HH:mm:ss',
                        done: function (value, date) {
                            if ($.trim(value) == '') {
                                var curDate = new Date();
                                date = { 'date': curDate.getDate(), 'month': curDate.getMonth() + 1, 'year': curDate.getFullYear() };
                            }
                            start.config.max = date;
                            start.config.max.month = date.month - 1;
                        }
                    });

                    //自定义验证规则
                    //监听提交
                    url= "${pageContext.request.contextPath}/admin/addAttendDetailSubmit";
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
    </body>

</html>