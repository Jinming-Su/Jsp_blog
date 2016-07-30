<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>用户管理</title>
	<script type="text/javascript">
		$(function() {
			$("#user_manage").addClass("dashboard_subnav_active");
		})
	</script>
	<style type="text/css">
		.manage_table {
			margin-top: 5%;
			margin-left: 3%;
			margin-right: 3%;
		}
		.table {
			background-color: white;
		}
		.btn_grey {
			float: left;
		}
		#btn_edit,#btn_delete {
			margin: 0;
			padding: 3px;
			margin-left: 12%;
		}
		
	</style>
</head>
<body>
	<%@include file="/view/layout/dashboard_header.jsp" %>
	<%@include file="/view/layout/dashboard_nav.jsp" %>
	<div class="dashboard_content col-md-10">
		<div class="manage_table">
			<a class="btn btn_grey" href="/Jsp_blog/article/create.do">创建新文章</a>
			<table class="table table-hover table-bordered">
				<thead>
                    <tr>
                    	<td class="text-center" style="width: 10%">编号</td>
                        <td class="text-center" style="width: 15%">标题</td>
                        <td class="text-center" style="width: 20%">作者</td>
                        <td class="text-center" style="width: 20%">创建时间</td>
                        <td class="text-center" style="width: 10%">访问量</td>
                        <td class="text-center" style="width: 10%">评论数</td>
                        <td class="text-center"　style="width: 20%">操作</td>
                    </tr>
				</thead>
				<c:forEach items="${articles}" var="article">
					<tr>
						<td class="text-center">${article.aid}</td>
                        <td class="text-center my_ellipsis">
                            <a href="/Jsp_blog/article/${article.aid}.do">${article.title}</a>
                        </td>
                        <td class="text-center my_ellipsis">
                          	 	<a href="/profile/">${article.auther}</a>
                       	</td>
                        <td class="text-center created_time">${article.created_time}</td>
                        <td class="text-center">test1</td>
                        <td class="text-center">test1</td>
                        <td class="text-center">
                        	<a class="btn btn_grey" id="btn_edit">编辑</a>
                        	<form action="" method="post" id="">
                        		<input class="btn btn_grey" id="btn_delete" type="submit" value="删除"/>
                        	</form>
                        </td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>