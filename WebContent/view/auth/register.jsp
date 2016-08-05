<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<!-- jQuery ui -->
	<link href="/Jsp_blog/plugs/sliderLock/css/jquery-ui-1.10.4.min.css" rel="stylesheet" media="screen">
	<script src="/Jsp_blog/plugs/sliderLock/js/jquery-ui-1.10.4.min.js"></script>
	<!-- SliderLock -->
	<link href="/Jsp_blog/plugs/sliderLock/css/sliderlock.css" rel="stylesheet" media="screen">
	<script src="/Jsp_blog/plugs/sliderLock/js/sliderlock.js"></script>
	<title>注册</title>
    <style>
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
        #ckb {
        	border-style: none;
        	width: 20px;
			height: 20px;
        	margin-right: 8px;
        }
        #slider {
        	border-radius: 0;
        }
        #slider a{
        	margin-top: 5px;
        	height: 30px;
        	width: 30px;
        	font-size: 20px;
        	text-align: center;
        	margin-left: 0;
        	padding-top: 2px;
        	border-radius: 0;
        }
    </style>
</head>
<body>

	<div class="content">
        <div class="container container1">
        <div class="signin_box">
        	<p class="signin_box_msg">注册新用户</p>
            <form action="/Jsp_blog/auth/register.do" method="post">
            	<div class="form-group signin_box_userbox">
	                <span class="glyphicon glyphicon-envelope signin_box_gly"></span>
	                <input type="email" name="email" class="form-control signin_box_user" placeholder="请输入注册的邮箱" tabindex="1">
                </div>
                <div class="form-group signin_box_userbox ">
                    <span class="glyphicon glyphicon-lock signin_box_gly"></span>
                    <input type="password" name="password" class="form-control signin_box_user" placeholder="请输入密码" tabindex="2">
                </div>
                <div class="form-group signin_box_userbox ">
                    <span class="glyphicon glyphicon-log-in signin_box_gly"></span>
                    <input type="password" name="password_confirmation" class="form-control signin_box_user" placeholder="请重复输入密码" tabindex="2">
                </div>
                
                <div class="row signin_box_row">
           			<div id="slider" class="sliderLock" style="height: 30px;margin: 0;padding: 0;">
             			<p style="font-family: Lato,Helvetica,Arial,sans-serif;
    font-size: 15px;padding-left: 40px;" class="text-muted">请先滑动解锁</p>
          			</div>
          		</div>
                <br>
                <div class="row signin_box_row">
                	<input type="checkbox" id="ckb"/><span>我同意<a href="https://github.com/su526664687/Jsp_blog" class="login_register_bottom">＜Sjming博客协议＞</a></span>
                </div>
            	<div class="row signin_box_row">
                    <input type="submit" value="注册" style="padding-top: 3px" class="btn btn-success pull-right">
                </div>
            </form>
            <div class="row signin_box_row">
            	<br/>
                <a href="/Jsp_blog/article/list/1.do" class="pull-left login_register_bottom">已有账户，立即登录</a>
            </div>
        </div>
        </div>
	</div>
</body>
</html>