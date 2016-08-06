<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			
			font-family: "微软雅黑" !important;
			font-size: 15px;
			
			border-radius: 3px;
			background: #ffffff;
			border-top: 3px solid #d2d6de;
			margin: 10px;
			box-shadow: 0 1px 1px rgba(0,0,0,0.1);
			border-top-color: #3c8dbc;
			border-top-left-radius: 0;
			border-top-right-radius: 0;
			border-bottom-right-radius: 3px;
			border-bottom-left-radius: 3px;
		}
		.basic_infomation1 {
			
			margin: 20px;
			padding: 10px;
			
			font-family: "微软雅黑" !important;
			font-size: 15px;
			
			border-radius: 0;
			background: #ffffff;
			border-top: 1px solid #ccc;
			margin: 10px;
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
		.p1 {
			overflow: hidden;
		  	text-overflow: ellipsis;
		  	display: -webkit-box;
		  	-webkit-line-clamp: 2;
		  	-webkit-box-orient: vertical;
		}
	</style>
	<script type="text/javascript">
		$(function() {
			$("#article").addClass("active");
		})
		Date.prototype.format = function(format) {
	      	var date = {
	              "M+": this.getMonth() + 1,
	              "d+": this.getDate(),
	              "h+": this.getHours(),
	              "m+": this.getMinutes(),
	              "s+": this.getSeconds(),
	              "q+": Math.floor((this.getMonth() + 3) / 3),
	              "S+": this.getMilliseconds()
			};
			if (/(y+)/i.test(format)) {
			       format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
			}
	        for (var k in date) {
	              if (new RegExp("(" + k + ")").test(format)) {
	                     format = format.replace(RegExp.$1, RegExp.$1.length == 1
	                            ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
	              }
	        }
	        return format;
		}
        $(function(){
        	var times = $(".created_time");
        	for(var i =0;i<times.length;i++) {
        		var time = new Date(parseInt(times[i].innerHTML));
        		times[i].innerHTML = time.format('yyyy-MM-dd hh:mm:ss');
        	}
        })
	</script>
</head>
<body>
	<%@include file="/view/layout/dashboard_header.jsp" %>
	<%@include file="/view/layout/dashboard_nav.jsp" %>
	<div class="dashboard_content">
		<div class="col-md-3 ">
			<div class="basic_infomation">
				<div class="box text-center">
					<img src="/Jsp_blog/img/image/person.png" class="img-circle"/>
					<h6 class="text-center">${user.email}</h6>
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
			<div style="height: 5px;"></div>
			<div class="basic_infomation">
				<div class="box">
					<h6 class="text-center"><b>关于他</b></h6>
					<ul class="list-group my_list_group">
						<li class="list-group-item">
							<i class="fa fa-book"> 教育水平</i>
							<br><div class="text-muted">${user.education }</div>
						</li>
						<li class="list-group-item">
							<i class="fa fa-map-marker"> 通信地址</i>
							<br><div class="text-muted">${user.address }</div>
						</li>
						<li class="list-group-item">
							<i class="fa fa-pencil"> 专业技能</i>
							<br>
							<c:if test="${user.skill1 != null && user.skill1 != '' }">
								<span class="label label-info">${user.skill1 }</span>
							</c:if>
							<c:if test="${user.skill2 != null && user.skill2 != '' }">
								<span class="label label-success">${user.skill2 }</span>
							</c:if>
							<c:if test="${user.skill3 != null && user.skill3 != '' }">
								<span class="label label-primary">${user.skill3 }</span>
							</c:if>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
		<div class="col-md-9">
			<div class="basic_infomation1">
				<div class="box">
					<h6 class="text-center"><b>发布的文章</b></h6>
					<ul class="list-group my_list_group">
						<c:forEach items="${articles }" var="article">
							<li class="list-group-item">
								<div>${article.title}</div>
								<div class="p1 text-muted" style="font-size: 12px;">${article.content }</div>
								<div class="created_time" style="text-align: right; font-size: 12px;">${article.created_time }</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div style="height: 5px;"></div>
			<div class="basic_infomation1">
				<div class="box">
					<h6 class="text-center"><b>发布的评论</b></h6>
					<ul class="list-group my_list_group">
						<c:forEach items="${comments }" var="comment">
							<li class="list-group-item">
								<div class="p1 text-muted" style="font-size: 12px;">${comment.content }</div>
								<div class="created_time" style="text-align: right; font-size: 12px;">${comment.created_time }</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
</body>
</html>