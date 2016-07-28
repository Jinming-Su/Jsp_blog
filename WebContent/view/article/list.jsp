<%@page import="java.util.List"%>
<%@page import="com.sjming.model.ArticleVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>文章</title>
    <style>
        .table {
            width: 80%;
            margin: 0;
            margin-left: 10%;
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
        .table thead {
            background-color: #d2d6de;
            opacity: 0.8;
        }
        .new_btn {
        	
        }
    </style>
    <script>
        $(function() {
            $('#article').addClass('active');
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
        	var time = new Date(parseInt($("#created_time").html()));
        	$("#created_time").html(time.format('yyyy-MM-dd h:m:s'));
        	
        })
    </script>
</head>
<body>
	<%@include file="/view/layout/header.jsp" %>
	
	<div class="content">
		<div class="table-responsive col-md-10">
			<table class="table table-striped table-hover table-bordered">
				<thead>
                    <tr>
                        <td class="text-center" style="width: 15%">标题</td>
                        <td class="text-center" style="width: 20%">关键字</td>
                        <td class="text-center" style="width: 20%">作者</td>
                        <td class="text-center" style="width: 30%">创建时间</td>
                    </tr>
				</thead>
				<c:forEach items="${articles}" var="article">
					<tr>
                        <td class="text-center my_ellipsis">
                            <a href="/article/">${article.title}</a>
                        </td>
                        <td class="text-center my_ellipsis">${article.content}</td>
                        <td class="text-center my_ellipsis">
                          	 	<a href="/profile/">${article.auther}</a>
                       	</td>
                        <td class="text-center" id="created_time">${article.created_time}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-md-2">
			<a href="/Jsp_blog/article/create.do" class="btn btn-info new_btn"><i class="fa fa-file-text-o"></i> New Article</a>
		</div>
	</div>
	
	<%@include file="/view/layout/footer.jsp" %>
</body>
</html>