<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>评论管理</title>
	<script type="text/javascript">
		$(function() {
			$("#comment_manage").addClass("dashboard_subnav_active");
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
                        <td class="text-center" style="width: 35%">内容</td>
                        <td class="text-center" style="width: 10%">文章</td>
                        <td class="text-center" style="width: 10%">作者</td>
                        <td class="text-center" style="width: 20%">评论时间</td>
                        <td class="text-center"　style="width: 10%">操作</td>
                    </tr>
				</thead>
				<c:forEach items="${comments}" var="comment">
					<tr>
						<td class="text-center">${comment.cid}</td>
                        <td class="text-center my_ellipsis">
                            <span>${comment.content}</span>
                        </td>
                        <td class="text-center my_ellipsis">
                          	 	<a href="/Jsp_blog/article/${comment.aid}.do">${comment.aid}</a>
                       	</td>
                       	<td class="text-center my_ellipsis">
                          	 	<a href="/Jsp_blog/auth/profile/${comment.uid}.do">${comment.uid}</a>
                       	</td>
                        <td class="text-center created_time">${comment.created_time}</td>
                        <td class="text-center">
                        	<a href="#mymodal${comment.cid}" data-toggle="modal" class="btn btn_grey" id="btn_edit">编辑</a>
                        	<div class="modal fade" id="mymodal${comment.cid}" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	                        	<div class="modal-dialog">
	                        		<div class="modal-content">
	                        			<div class="modal-header">
	                        				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                        				<h6 class="modal-title">评论编辑</h6>
	                        			</div>
	                        			<div class="modal-body">
	                        				<form action="" method="post" class="form-group">
	                        					<div class="row">
	                        						<label class="col-md-3">编号：</label>
	                        						<input id="cid${comment.cid}" type="text" class="col-md-8" value="${comment.cid}" disabled="disabled"/>
	                        					</div>
	                        					
												<div class="row">
	                        						<label class="col-md-3">内容：</label>
	                        						<textarea id="content${comment.content}" rows="5" class="col-md-8">${comment.content}</textarea>
	                        					</div>
	                        				</form>
	                        			</div>
	                        			<div class="modal-footer">
											<a type="button" class="btn btn-default" data-dismiss="modal">关闭</a>
											<a id="update_catalog${comment.cid}" type="button" class="btn btn-primary">更新</a>
											<script type="text/javascript">
											$("#update_catalog${comment.cid}").click(function() {
												$.post(
													"/Jsp_blog/comment/ajaxupdate.do",
													{cid: $("#cid${comment.cid}").val(), 
													 content: $("#content${comment.content}").val()},
													function(){}
												)
												window.location.reload();
												window.location.reload();
											});
											</script>
										</div>
	                        		</div>
	                        	</div>
	                        </div>
                        	<form action="/Jsp_blog/comment/${comment.cid}/delete.do" method="post">
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