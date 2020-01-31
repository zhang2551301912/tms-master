<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
       	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    </head>
    <body>
    	<% User u=(User)session.getAttribute("user"); %>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <blockquote class="layui-elem-quote">欢迎：
                                <span class="x-red"><%=u.getName() %></span>！
                                	当前时间:<div id="mydate" class="mydate">XXXX-XX-XX 00:00:00 XXX</div>
                                <script type="text/javascript">
									function date(){
										function p(s) {
							       			 return s < 10 ? '0' + s: s;
							    		}
										var mydate = new Date();
										var d = mydate.getDay();
										var weekly=["星期天","星期一","星期二","星期三","星期四","星期五","星期六"]
										var yyyy = mydate.getFullYear();
										var mm = mydate.getMonth()+1;
										var da = mydate.getDate();
										var h = mydate.getHours();
										var m = mydate.getMinutes();
										var s = mydate.getSeconds();
										document.getElementById("mydate").innerHTML=p(yyyy)+"-"+p(mm)+"-"+p(da)+" "+p(h)+':'+p(m)+":"+p(s)+" "+weekly[d];
									}
									setInterval('date()','1000');
									date();
								</script>
                            </blockquote>
                        </div>
                    </div>
                </div>
                <style id="welcome_style"></style>
                
            </div>
            <div class="t_mid_main">
                <h1>教师管理系统</h1>
            </div>
        </div>
        </div>
    </body>
</html>