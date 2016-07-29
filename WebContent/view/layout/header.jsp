<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar navbar-default header navabar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand">GOOD LUCK</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="/Jsp_blog/" id="mainPage">主页</a></li>
		<li><a href="/Jsp_blog/article/list.do" id="article">文章</a></li>
		<li><a href="/Jsp_blog/aboutMe.do" id="about_me">关于</a></li>
	</ul>
	
	<ul class="nav navbar-nav navbar-right">
		<li><a href="/Jsp_blog/auth/login.do">登录</a></li>
		<li><a href="/Jsp_blog/auth/register.do">注册</a></li>
	</ul>
	
	<form class="navbar-form" role="search" action="#">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="请输入要搜索的内容"/>
		</div>
		<button type="submit" class="btn btn-success">搜索</button>
	</form>
</div>