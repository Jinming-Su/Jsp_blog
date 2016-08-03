<%@page import="java.util.List"%>
<%@page import="com.sjming.model.ArticleVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<script src="/Jsp_blog/js/extendPagination.js"></script>
	<title>文章</title>
    <style>
        .table {
            width: 90%;
            margin: 0;
            margin-left: 5%;
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
        .pagination li {
        	margin-right: -1px;
        }
        .my_panel {
        	font-size: 15px;
        	margin-top: 0 !important;
        	border-radius: 0 !important;
        }
        .my_panel .panel-heading {
        	margin: 0;
        	padding: 1px;
        	padding-left: 5%;
        }
        .my_panel .panel-heading a {
        	color: #e8554e !important;
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
        	var times = $(".created_time");
        	for(var i =0;i<times.length;i++) {
        		var time = new Date(parseInt(times[i].innerHTML));
        		times[i].innerHTML = time.format('yyyy-MM-dd hh:mm:ss');
        	}
        })
        $(function() {
        	var targetHerf = "/Jsp_blog/article/list/";
			$("#callBackPager").extendPagination({
				totalPage : ${page_num},
				showPage : 5,
				pageNumber : ${page_id}
			},targetHerf);
        })
    </script>
</head>
<body>
	<%@include file="/view/layout/header.jsp" %>

	<div class="content">
		<div class="table-responsive col-md-10">
			<table class="table table-striped table-hover my_table">
				<thead>
                    <tr>
                        <td style="width: 20%">标题</td>
                        <td class="text-center" style="width: 20%">关键字</td>
                        <td class="text-center" style="width: 20%">作者</td>
                        <td class="text-center" style="width: 15%">创建时间</td>
                    </tr>
				</thead>
				<c:forEach items="${articles}" var="article">
					<tr>
                        <td class="my_ellipsis">
                            <a href="/Jsp_blog/article/${article.aid}.do">${article.title}</a>
                        </td>
                        <td class="text-center my_ellipsis">${article.key_word}</td>
                        <td class="text-center my_ellipsis">
                          	 	<a href="/profile/">${article.auther}</a>
                       	</td>
                        <td class="text-center created_time">${article.created_time}</td>
					</tr>
				</c:forEach>
			</table>
			<div class="text-center" id="callBackPager"></div>
		</div>
		<div class="col-md-2">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default panel-accordion my_panel">
					<div class="panel-heading">
						<a><b class="text-info">分类导航</b></a>
					</div>
				</div>
				<c:forEach items="${catalogs }" var="catalog">
				<div class="panel panel-default panel-accordion my_panel">
					<div class="panel-heading">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse${catalog.clid }">${catalog.name }</a>
					</div>
					<div class="panel-collapse collapse" id="collapse${catalog.clid }">
						<div class="panel-body">
							<c:if test="${catalog.child1 != '' }">
								${catalog.child1 }<br>
							</c:if>
							<c:if test="${catalog.child2 != '' }">
								${catalog.child2 }<br>
							</c:if>
							<c:if test="${catalog.child3 != '' }">
								${catalog.child3 }<br>
							</c:if>
							<c:if test="${catalog.child4 != '' }">
								${catalog.child4 }<br>
							</c:if>
							<c:if test="${catalog.child5 != '' }">
								${catalog.child5 }<br>
							</c:if>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<!--div class="col-md-2 text-center">
		<% if(session.getAttribute("loginUid") != null) {%>
			<a href="/Jsp_blog/article/create.do" class="btn btn-info new_btn"><i class="fa fa-file-text-o"></i>&nbsp;&nbsp;&nbsp;创建新文章</a>
		<%} else { %>
			<a>登录后有更多权限</a>
		<%} %>
		</div-->
		<div style="clear: both;"></div>
	</div>
	
	<%@include file="/view/layout/footer.jsp" %>
</body>
</html>