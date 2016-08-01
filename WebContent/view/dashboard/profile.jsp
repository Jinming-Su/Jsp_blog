<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>个人主页</title>
	<script type="text/javascript">
		$(function() {
			$("#profile").addClass("dashboard_subnav_active");
		})
	</script>
	<style type="text/css">
		.basic_infomation {
			
			margin: 20px;
			padding: 10px;
			
			font-family: ubuntu-mono;
			
			border-radius: 3px;
			background: #ffffff;
			border-top: 3px solid #d2d6de;
			margin-bottom: 20px;
			box-shadow: 0 1px 1px rgba(0,0,0,0.1);
			border-top-color: #3c8dbc;
			border-top-left-radius: 0;
			border-top-right-radius: 0;
			border-bottom-right-radius: 3px;
			border-bottom-left-radius: 3px;
		}
		.basic_infomation img {
		    width: 100px;
   			height: 100px;
   			margin: 0 auto;
			padding: 3px;
			border: 3px solid #d2d6de;
		}
		.basic_infomation h6 {
			font-size: 18px;
		}
		.my_list_group li {
			border-left: 0;
			border-right: 0;
			font-size: 15px;
			padding: 7px 10px;
		}
		.my_list_group li a {
			color: #72afd2;
			cursor: pointer;
		}
		p {
			margin: 0;
		}
	</style>
</head>
<body>
	<%@include file="/view/layout/dashboard_header.jsp" %>
	<%@include file="/view/layout/dashboard_nav.jsp" %>
	<div class="dashboard_content">
		<div class="col-md-3 basic_infomation">
			<div class="box text-center">
				<img src="/Jsp_blog/img/image/person.png" class="img-circle"/>
				<h6 class="text-center">苏金明</h6>
				<p class="text-center text-muted">NEU Student</p>
				<ul class="list-group my_list_group">
					<li class="list-group-item">
						<b class="pull-left">他关注的</b>
						<a class="pull-right">666</a>
						<div style="clear: both;"></div>
					</li>
					<li class="list-group-item">
						<b class="pull-left">关注他的</b>
						<a class="pull-right">888</a>
						<div style="clear: both;"></div>
					</li>
				</ul>
				<a class="btn btn-info btn-block">添加关注</a>
			</div>
		</div>
	</div>
</body>
</html>