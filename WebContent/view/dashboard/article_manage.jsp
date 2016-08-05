<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>文章管理</title>
	<script type="text/javascript">
		$(function() {
			$("#article_manage").parent().addClass("dashboard_subnav_active");
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
			<a class="btn btn_grey" href="/Jsp_blog/article/create.do">创建新文章</a>
			<table class="table table-hover table-bordered my_table">
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
                        	<a href="/Jsp_blog/article/${article.aid}/edit.do" class="btn btn_grey" id="btn_edit">编辑</a>
                        	<form action="/Jsp_blog/article/${article.aid }/delete.do" method="post">
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