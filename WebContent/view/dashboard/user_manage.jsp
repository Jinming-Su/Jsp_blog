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
	<style type="text/css">
		.manage_table {
			margin-top: 5%;
			margin-left: 3%;
			margin-right: 3%;
		}
		.table {
			background-color: white;
			table-layout: fixed;
		}
		.table > thead > tr > th,
        .table > tbody > tr > th,
        .table > tfoot > tr > th,
        .table > thead > tr > td,
        .table > tbody > tr > td,
        .table > tfoot > tr > td {
            padding: 5px;
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

			<table class="table table-hover table-bordered my_table">
				<thead>
                    <tr>
                    	<td class="text-center" style="width: 10%">编号</td>
                        <td class="text-center" style="width: 15%">Email</td>
                        <td class="text-center"　style="width: 10%">积分</td>
                        <td class="text-center"　style="width: 10%">权限等级</td>
                        <td class="text-center" style="width: 20%">创建时间</td>
                        <td class="text-center" style="width: 10%">文章数</td>
                        <td class="text-center" style="width: 10%">评论数</td>
                        <td class="text-center"　style="width: 20%">操作</td>
                    </tr>
				</thead>
				<c:forEach items="${users}" var="user">
					<tr>
						<td class="text-center">${user.uid}</td>
                        <td class="text-center my_ellipsis">
                            <a href="/Jsp_blog/auth/${user.uid}.do">${user.email}</a>
                        </td>
                        <td class="text-center">
                          	 	<a href="/profile/">${user.score}</a>
                       	</td>
                       	<td class="text-center">${user.level}</td>
                        <td class="text-center created_time">${user.created_time}</td>
                        <td class="text-center">test1</td>
                        <td class="text-center">test1</td>
                        <td class="text-center">
                        	<a href="#mymodal${user.uid}" data-toggle="modal" class="btn btn_grey" id="btn_edit">编辑</a>
                        	<div class="modal fade" id="mymodal${user.uid}" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	                        	<div class="modal-dialog">
	                        		<div class="modal-content">
	                        			<div class="modal-header">
	                        				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                        				<h6 class="modal-title">用户编辑</h6>
	                        			</div>
	                        			<div class="modal-body">
	                        				<form action="" method="post" class="form-group">
	                        					<div class="row">
	                        						<label class="col-md-3">编号：</label>
	                        						<input id="uid${user.uid}" type="text" class="col-md-8" value="${user.uid}" disabled="disabled"/>
	                        					</div>
	                        					
												<div class="row">
	                        						<label class="col-md-3">Email：</label>
	                        						<input id="email${user.uid}" type="text" class="col-md-8" value="${user.email}"/>
	                        					</div>
	                        					<div class="row">
	                        						<label class="col-md-3">积分：</label>
	                        						<input id="score${user.score}" type="text" class="col-md-8" value="${user.score}"/>
	                        					</div>
	                        					<div class="row">
	                        						<label class="col-md-3">权限等级：</label>
	                        						<input id="level${user.level}" type="text" class="col-md-8" value="${user.level}"/>
	                        					</div>
	                        				</form>
	                        			</div>
	                        			<div class="modal-footer">
											<a type="button" class="btn btn-default" data-dismiss="modal">关闭</a>
											<a id="update_catalog${user.uid}" type="button" class="btn btn-primary">更新</a>
											<script type="text/javascript">
											$("#update_catalog${user.uid}").click(function() {
												$.post(
													"/Jsp_blog/auth/ajaxupdate.do",
													{uid: $("#uid${user.uid}").val(),
													 email: $("#email${user.uid}").val(),
													 score: $("#score${user.score}").val(),
													 level: $("#level${user.level}").val()},
													function(){}
												)
												window.location.reload();
											});
											</script>
										</div>
	                        		</div>
	                        	</div>
	                        </div>
                        	
                        	<form action="/Jsp_blog/auth/${user.uid }/delete.do" method="post">
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