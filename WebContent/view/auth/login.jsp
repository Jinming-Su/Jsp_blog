<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>登录</title>
    <style>
        body,.content{
            background-color: #d2d6de;
        }
    </style>
</head>
<body>
	<div class="content">
        <div class="signin_box">
            <p class="signin_box_msg">账号登录</p>
            <form action="/Jsp_blog/auth/login.do" method="POST">
                <div class="form-group signin_box_userbox">
                        <span class="glyphicon glyphicon-user signin_box_gly"></span>
                        <input type="email" name="email" class="form-control signin_box_user" placeholder="请输入邮箱" tabindex="1">
                    </div>
                <div class="form-group signin_box_userbox ">
                        <span class="glyphicon glyphicon-lock signin_box_gly"></span>
                        <input type="password" name="password" class="form-control signin_box_user" placeholder="请输入密码" tabindex="2">
                    </div>
                <div class="row signin_box_row">
                        <input type="submit" value="登录" style="padding-top: 3px" class="btn btn-info pull-right">
                </div>
            </form>
            <br>
            <div class="row signin_box_row">
                    <a href="#" class="pull-left">忘记密码?</a>
                    <br/>
                    <a href="/Jsp_blog/auth/register.do" class="pull-left">注册新用户</a>
            </div>
        </div>
	</div>
</body>
</html>