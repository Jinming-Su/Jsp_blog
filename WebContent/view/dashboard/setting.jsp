<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>设置</title>
	<script type="text/javascript">
		$(function() {
			$("#setting").addClass("dashboard_subnav_active");
		})
	</script>
	<style type="text/css">
		.my_box{
			margin-top: 40px;
		}
		body,.content{
            background-color: #d2d6de;
        }
        .container1 {
            width: 500px;
        }
        .signin_box {
        	width: 90%;
        	border-radius: 6px;
       	    box-shadow: 0 2px 16px #888, 0 0 1px #888, 0 0 1px #888;
        }
	</style>
</head>
<body>
	<%@include file="/view/layout/dashboard_header.jsp" %>
	<%@include file="/view/layout/dashboard_nav.jsp" %>
	<div class="dashboard_content">
		<div class="container container1">
        <div class="signin_box my_box">
        	<p class="signin_box_msg">更新信息</p>
            <form action="/Jsp_blog/auth/setting.do" method="post">
            	<div class="form-group signin_box_userbox">
	                <span class="glyphicon glyphicon-envelope signin_box_gly"></span>
	                <input type="email" name="email" class="form-control signin_box_user" value="<%=session.getAttribute("loginEmail") %>" tabindex="1" disabled="disabled">
                </div>
                <div class="form-group signin_box_userbox ">
                    <span class="fa fa-book signin_box_gly"></span>
                    <input type="text" name="education" class="form-control signin_box_user" placeholder="请输入受教育水平" tabindex="2" value="${user.education }">
                </div>
                <div class="form-group signin_box_userbox ">
                    <span class="fa fa-map-marker signin_box_gly"></span>
                    <input type="text" name="address" class="form-control signin_box_user" placeholder="请输入通信地址" tabindex="2" value="${user.address }">
                </div>
				<div class="form-group signin_box_userbox ">
                    <span class="fa fa-pencil signin_box_gly"></span>
                    <input type="text" name="skill1" class="form-control signin_box_user" placeholder="请输入专业技能1" tabindex="2" value="${user.skill1 }">
                </div>
                <div class="form-group signin_box_userbox ">
                    <span class="fa fa-pencil signin_box_gly"></span>
                    <input type="text" name="skill2" class="form-control signin_box_user" placeholder="请输入专业技能2" tabindex="2" value="${user.skill2 }">
                </div>
                <div class="form-group signin_box_userbox ">
                    <span class="fa fa-pencil signin_box_gly"></span>
                    <input type="text" name="skill3" class="form-control signin_box_user" placeholder="请输入专业技能3" tabindex="2" value="${user.skill3 }">
                </div>
               
            	<div class="row signin_box_row">
                    <input id="update" type="submit" value="更新" style="padding-top: 3px" class="btn btn-success pull-right">
                </div>
            </form>
        </div>
        </div>
	</div>
</body>
</html>