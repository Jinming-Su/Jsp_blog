<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="dashboard_nav">
	<div class="text-center">
		<img class="img-circle" alt="加载中...">
		<p class="custom-word"><%=session.getAttribute("loginEmail") %></p>
		<hr>
	</div>
	<ul class="nav nav-stacked" id="dashbaord-subnav">
		<li><a href="/dashboard/profile">Profile</a></li>
	</ul>
</div>