<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="dashboard_nav">
	<div class="text-center" id="dashboard_nav_avatar">
		<img class="img-circle" src="/Jsp_blog/img/image/person.png" alt="加载中...">
		<p><%=session.getAttribute("loginEmail") %></p>
		<hr>
	</div>
	<ul class="nav nav-stacked" id="dashboard_subnav">
		<li id="blog_manage"><a href="/Jsp_blog/article/list/1.do"><i class="fa fa-th-large"></i><span>博客</span></a></li>
		<% if((session.getAttribute("loginLevel")).toString().equals("2") || (session.getAttribute("loginLevel")).toString().equals("1")) { %>
		<li id="article_manage"><a href="/Jsp_blog/article/manage.do"><i class="fa fa-th-list"></i><span>文章管理</span></a></li>
		<% if((session.getAttribute("loginLevel")).toString().equals("1")) {%>
		<li id="catalog_manage"><a href="/Jsp_blog/catalog/manage.do"><i class="fa fa-th"></i><span>分类管理</span></a></li>
		<li id="comment_manage"><a href="/Jsp_blog/comment/manage.do"><i class="fa fa-comment"></i><span>评论管理</span></a></li>
		<li id="user_manage"><a href="/Jsp_blog/auth/user_manage.do"><i class="fa fa-users"></i><span>用户管理</span></a></li>
		<%} %>
		<%} %>
		<hr>
		<li id="profile"><a href="/Jsp_blog/auth/profile.do"><i class="fa fa-user"></i><span>个人信息</span></a>
		<li id="setting"><a href=""><i class="fa fa-cog"></i><span>设置</span></a></li>
	</ul>
</div>