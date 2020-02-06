<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>修改绩效</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
        <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="form">

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>绩效评价</label>
                        <div class="layui-input-inline">
                            <input type="text" id="achi_content" value="${achievement.achi_content}" name="achi_content" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>绩效等级</label>
                        <div class="layui-input-inline">
                            <select name="achi_grade">
                                <c:choose>
                                    <c:when test="${achievement.achi_grade=='A'}">
                                        <option value="A" selected="selected">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </c:when>
                                    <c:when test="${achievement.achi_grade=='B'}">
                                        <option value="A">A</option>
                                        <option value="B" selected="selected">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </c:when>
                                    <c:when test="${achievement.achi_grade=='C'}">
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C" selected="selected">C</option>
                                        <option value="D">D</option>
                                    </c:when>
                                    <c:when test="${achievement.achi_grade=='D'}">
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D" selected="selected">D</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                    </div>

                    <input type="hidden" name="achi_id" value="${achievement.achi_id}">
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn" type="button" lay-filter="add" lay-submit="" >修改</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            var isTrue=false;
            layui.use(['form', 'layer','jquery'],
                function() {
                    $ = layui.jquery;
                    var form = layui.form,
                        //自定义验证规则
                        //监听提交
                        url= "${pageContext.request.contextPath}/admin/updateAchievementSubmit";
                    form.on('submit(add)',function(sub){
                        var param = $("#form").serialize();
                        $.post(url,param,function(data){
                            if(data.flag==1){
                                layer.alert('修改成功',{
                                        icon:6
                                    },
                                    function(){
                                        xadmin.close();//关闭当前frame
                                        xadmin.father_reload();//刷新父窗口
                                    });
                            }else{
                                layer.alert("修改失败",{
                                        icon:5
                                    },
                                    function(){
                                        xadmin.close();//关闭当前frame
                                        xadmin.father_reload();//刷新父窗口
                                    });
                            }

                        });

                    })
                });
        </script>

    </body>
</html>