<%@page import="java.net.URLEncoder"%>
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
        .panel-group {
        	border-color: white;
        	background-color: white;
        	box-shadow: 0 2px 16px #888, 0 0 1px #888, 0 0 1px #888;
        	
        	position: relative;
        	left: 25px;
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
        .my_panel .panel-body {
			padding: 0;
        }
        .my_panel .panel-body ul {
        	list-style: none;
        	padding: 0;
        	margin: 0;
        }
        .my_panel .panel-body ul li {
        	padding-left: 10px;
        }
        .my_panel .panel-body ul li:hover {
			background-color: #ddd;
		}
		.catalog_son_active {
			background-color: #ddd;
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
        $(function(){
        	$("#collapse${father_clid}").collapse();
        })
        $(function(){
        	$("#${father_name}${son_name}").parent().addClass("catalog_son_active");
        })
    </script>
</head>
<body>
	<%@include file="/view/layout/header.jsp" %>

	<div class="content">
		<div class="col-md-2">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default panel-accordion my_panel">
					<div class="panel-heading">
						<a><b class="text-info">分类导航</b></a>
					</div>
				</div>
				<c:forEach items="${catalogs }" var="catalog">
				<c:if test="${catalog.name != null && catalog.name != '' }">
				<div class="panel panel-default panel-accordion my_panel">
					<div class="panel-heading">
						<a id="${catalog.name}_number"></a>
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse${catalog.clid }" class="collapseSource" id="collapseSource${catalog.clid }" style="float: right;margin-right: 10px;font-size: 17px">+
						<script type="text/javascript">
								$(function() {
									<!--控制加减号-->
									$("#collapseSource${catalog.clid }").click(function(){
										if($("#collapse${catalog.clid }").hasClass("in")) {
											$("#collapseSource${catalog.clid }").html("+");
										} else {
											$(".collapseSource").html("+");
											$("#collapseSource${catalog.clid }").html("--");
										}
									})
									<!--添加总分类和子分类的链接-->
									$("#${catalog.name}_number").attr('href',"/Jsp_blog/catalog/"
											+encodeURI(encodeURI("${catalog.name}"))+"/1.do");
									var sons = $("#collapse${catalog.clid} .son_catalog");
									for(var i=0;i<sons.length;i++){
										sons[i].href = "/Jsp_blog/catalog/"
												+encodeURI(encodeURI("${catalog.name}"))+"/"
											    +encodeURI(encodeURI(sons[i].innerHTML))+"/"
											 	+"1.do";
										
									}
									
									
									
									<!--异步获取总分类文章数-->
									$.post(
										"/Jsp_blog/catalog/ajax_get_num1.do",
										{name: "${catalog.name}" },
										function(data){
											$("#${catalog.name}_number").html("${catalog.name }"+'('+data+')');
										}
									);
								})
							</script>
						</a>
					</div>
					<div class="panel-collapse collapse" id="collapse${catalog.clid }">
						<div class="panel-body">
							<ul>
							<c:if test="${catalog.child1 != '' }">
								<li><a id="${catalog.name}${catalog.child1 }" class="son_catalog">${catalog.child1 }</a></li>
								<!--异步获取子分类文章数-->
								<script>
									$(function(){
										$.post(
												"/Jsp_blog/catalog/ajax_get_num2.do",
												{father_name: "${catalog.name}",
												 son_name: "${catalog.child1}"},
												function(data){
													 $("#${catalog.name}${catalog.child1 }").html("${catalog.child1}"+"("+data+")");
												 }
										);
									});
								</script>
							</c:if>
							<c:if test="${catalog.child2 != '' }">
								<li><a id="${catalog.name}${catalog.child2 }" class="son_catalog">${catalog.child2 }</a></li>
								<script>
									$(function(){
										$.post(
												"/Jsp_blog/catalog/ajax_get_num2.do",
												{father_name: "${catalog.name}",
												 son_name: "${catalog.child2}"},
												function(data){
													 $("#${catalog.name}${catalog.child2 }").html("${catalog.child2}"+"("+data+")");
												 }
										);
									});
								</script>
							</c:if>
							<c:if test="${catalog.child3 != '' }">
								<li><a id="${catalog.name}${catalog.child3 }" class="son_catalog">${catalog.child3 }</a></li>
								<script>
									$(function(){
										$.post(
												"/Jsp_blog/catalog/ajax_get_num2.do",
												{father_name: "${catalog.name}",
												 son_name: "${catalog.child3}"},
												function(data){
													 $("#${catalog.name}${catalog.child3 }").html("${catalog.child3}"+"("+data+")");
												 }
										);
									});
								</script>
							</c:if>
							<c:if test="${catalog.child4 != '' }">
								<li><a id="${catalog.name}${catalog.child4 }" class="son_catalog">${catalog.child4 }</a></li>
								<script>
									$(function(){
										$.post(
												"/Jsp_blog/catalog/ajax_get_num2.do",
												{father_name: "${catalog.name}",
												 son_name: "${catalog.child4}"},
												function(data){
													 $("#${catalog.name}${catalog.child4 }").html("${catalog.child4}"+"("+data+")");
												 }
										);
									});
								</script>
							</c:if>
							<c:if test="${catalog.child5 != '' }">
								<li><a id="${catalog.name}${catalog.child5 }" class="son_catalog">${catalog.child5 }</a></li>
								<script>
									$(function(){
										$.post(
												"/Jsp_blog/catalog/ajax_get_num2.do",
												{father_name: "${catalog.name}",
												 son_name: "${catalog.child5}"},
												function(data){
													 $("#${catalog.name}${catalog.child5 }").html("${catalog.child5}"+"("+data+")");
												 }
										);
									});
								</script>
							</c:if>
							</ul>
						</div>
					</div>
					</c:if>
				</div>
				</c:forEach>
			</div>
		</div>
	
		<div class="table-responsive col-md-10">
			<table class="table table-striped table-hover my_table">
				<caption class="text-muted" style="text-align: left;">${father_name} > ${son_name }</caption>
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