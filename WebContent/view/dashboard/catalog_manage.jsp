<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>分类管理</title>
	<script type="text/javascript">
		$(function() {
			$("#catalog_manage").addClass("dashboard_subnav_active");
			
			$("#create_catalog").click(function(){
				$.post(
						"/Jsp_blog/catalog/ajaxcreate.do",
						{},
						function(data) {
							$(".my_table").append('<tr><td class="text-center">'+data+'</td><td class="text-center"></td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center"><a href="/Jsp_blog/catalog/${catalog.clid}/edit.do" class="btn btn_grey" id="btn_edit">编辑</a><form action="/Jsp_blog/catalog/${catalog.clid }/delete.do" method="post"><input class="btn btn_grey" id="btn_delete" type="submit" value="删除"/></form></td></tr>');
						}
					);
				
				
				
			});
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
			<a class="btn btn_grey" id="create_catalog">创建新目录</a>
			<table class="table table-hover table-bordered my_table">
				<thead>
                    <tr>
                    	<td class="text-center" style="width: 5%">编号</td>
                    	<td class="text-center" style="width: 5%">顺序</td>
                        <td class="text-center" style="width: 20%">名称</td>
                        <td class="text-center" style="width: 10%">子目录1</td>
                        <td class="text-center" style="width: 10%">子目录2</td>
                        <td class="text-center" style="width: 10%">子目录3</td>
                        <td class="text-center" style="width: 10%">子目录4</td>
                        <td class="text-center" style="width: 10%">子目录5</td>
                        <td class="text-center" style="width: 10%">操作</td>
                    </tr>
				</thead>
				<c:forEach items="${catalogs}" var="catalog">
					<tr>
						<td class="text-center">${catalog.clid}</td>
						<td class="text-center">${catalog.id}</td>
                        <td class="text-center my_ellipsis">
                            <a href="">${catalog.name}</a>
                        </td>
                        <td class="text-center my_ellipsis">
                            <a href="">${catalog.child1}</a>
                        </td>
                        <td class="text-center my_ellipsis">
                            <a href="">${catalog.child2}</a>
                        </td>
                        <td class="text-center my_ellipsis">
                            <a href="">${catalog.child3}</a>
                        </td>
                        <td class="text-center my_ellipsis">
                            <a href="">${catalog.child4}</a>
                        </td>
                        <td class="text-center my_ellipsis">
                            <a href="">${catalog.child5}</a>
                        </td>
                        <td class="text-center">
                        	<a href="/Jsp_blog/catalog/${catalog.clid}/edit.do" class="btn btn_grey" id="btn_edit">编辑</a>
                        	<form action="/Jsp_blog/catalog/${catalog.clid }/delete.do" method="post">
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