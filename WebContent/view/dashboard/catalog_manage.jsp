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
							$(".my_table").append('<tr><td class="text-center">'+data+'</td><td class="text-center">0</td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center my_ellipsis"><a href=""></a></td><td class="text-center"><a href="#mymodal'+data+'" data-toggle="modal" class="btn btn_grey" id="btn_edit">编辑</a><div class="modal fade" id="mymodal'+data+'" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><h6 class="modal-title">目录编辑</h6></div><div class="modal-body"><form action="" method="post" class="form-group"><div class="row"><label class="col-md-3">编号：</label><input id="clid'+data+'" type="text" class="col-md-8" value="'+data+'" disabled="disabled"/></div><div class="row"><label class="col-md-3">顺序：</label><input id="id'+data+'" type="text" class="col-md-8" value=""/></div><div class="row"><label class="col-md-3">名称：</label><input id="name'+data+'" type="text" class="col-md-8" value=""/></div><div class="row"><label class="col-md-3">child1：</label><input id="child1'+data+'" type="text" class="col-md-8" value=""/></div><div class="row"><label class="col-md-3">child2：</label><input id="child2'+data+'" type="text" class="col-md-8" value=""/></div><div class="row"><label class="col-md-3">child3：</label><input id="child3'+data+'" type="text" class="col-md-8" value=""/></div><div class="row"><label class="col-md-3">child4：</label><input id="child4'+data+'" type="text" class="col-md-8" value=""/></div><div class="row"><label class="col-md-3">child5：</label><input id="child5'+data+'" type="text" class="col-md-8" value=""/></div></form></div><div class="modal-footer"><a type="button" class="btn btn-default" data-dismiss="modal">关闭</a><a id="update_catalog'+data+'" type="button" class="btn btn-primary">更新</a><script type="text/javascript">$("#update_catalog'+data+'").click(function() {$.post("/Jsp_blog/catalog/ajaxupdate.do",{clid: $("#clid'+data+'").val(), id: $("#id'+data+'").val(), name: $("#name'+data+'").val(),child1: $("#child1$'+data+'").val(), child2: $("#child2'+data+'").val(), child3: $("#child3'+data+'").val(),child4: $("#child4'+data+'").val(),child5: $("#child5'+data+'").val()},function(){})window.location.reload();});<\/script></div></div></div></div><form action="/Jsp_blog/catalog/'+data+'/delete.do" method="post"><input class="btn btn_grey" id="btn_delete" type="submit" value="删除"/></form></td></tr>');
						}
					
					);
				window.location.reload();
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
			<a class="btn btn_grey" id="create_catalog">创建新目录</a>
			<table class="table table-hover table-bordered my_table">
				<thead>
                    <tr>
                    	<td class="text-center" style="width: 5%">编号</td>
                    	<td class="text-center" style="width: 5%">顺序</td>
                        <td class="text-center" style="width: 15%">名称</td>
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
                            <span href="">${catalog.name}</span>
                        </td>
                        <td class="text-center my_ellipsis">
                            <span href="">${catalog.child1}</span>
                        </td>
                        <td class="text-center my_ellipsis">
                            <span href="">${catalog.child2}</span>
                        </td>
                        <td class="text-center my_ellipsis">
                            <span href="">${catalog.child3}</span>
                        </td>
                        <td class="text-center my_ellipsis">
                            <span href="">${catalog.child4}</span>
                        </td>
                        <td class="text-center my_ellipsis">
                            <span href="">${catalog.child5}</span>
                        </td>
                        <td class="text-center">
                        	<a href="#mymodal${catalog.clid }" data-toggle="modal" class="btn btn_grey" id="btn_edit">编辑</a>
                        	<div class="modal fade" id="mymodal${catalog.clid }" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	                        	<div class="modal-dialog">
	                        		<div class="modal-content">
	                        			<div class="modal-header">
	                        				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                        				<h6 class="modal-title">目录编辑</h6>
	                        			</div>
	                        			<div class="modal-body">
	                        				<form action="" method="post" class="form-group">
	                        					<div class="row">
	                        						<label class="col-md-3">编号：</label>
	                        						<input id="clid${catalog.clid}" type="text" class="col-md-8" value="${catalog.clid }" disabled="disabled"/>
	                        					</div>
	                        					<div class="row">
	                        						<label class="col-md-3">顺序：</label>
	                        						<input id="id${catalog.clid}" type="text" class="col-md-8" value="${catalog.id }"/>
	                        					</div>
												<div class="row">
	                        						<label class="col-md-3">名称：</label>
	                        						<input id="name${catalog.clid}" type="text" class="col-md-8" value="${catalog.name }"/>
	                        					</div>
	                        					<div class="row">
	                        						<label class="col-md-3">child1：</label>
	                        						<input id="child1${catalog.clid}" type="text" class="col-md-8" value="${catalog.child1 }"/>
	                        					</div>
	                        					<div class="row">
	                        						<label class="col-md-3">child2：</label>
	                        						<input id="child2${catalog.clid}" type="text" class="col-md-8" value="${catalog.child2 }"/>
	                        					</div>
	                        					<div class="row">
	                        						<label class="col-md-3">child3：</label>
	                        						<input id="child3${catalog.clid}" type="text" class="col-md-8" value="${catalog.child3 }"/>
	                        					</div>
	                        					<div class="row">
	                        						<label class="col-md-3">child4：</label>
	                        						<input id="child4${catalog.clid}" type="text" class="col-md-8" value="${catalog.child4 }"/>
	                        					</div>
	                        					<div class="row">
	                        						<label class="col-md-3">child5：</label>
	                        						<input id="child5${catalog.clid}" type="text" class="col-md-8" value="${catalog.child5 }"/>
	                        					</div>
	                        				</form>
	                        			</div>
	                        			<div class="modal-footer">
											<a type="button" class="btn btn-default" data-dismiss="modal">关闭</a>
											<a id="update_catalog${catalog.clid}" type="button" class="btn btn-primary">更新</a>
											<script type="text/javascript">
											$("#update_catalog${catalog.clid}").click(function() {
												$.post(
													"/Jsp_blog/catalog/ajaxupdate.do",
													{clid: $("#clid${catalog.clid}").val(), id: $("#id${catalog.clid}").val(), name: $("#name${catalog.clid}").val(),
														child1: $("#child1${catalog.clid}").val(), child2: $("#child2${catalog.clid}").val(), child3: $("#child3${catalog.clid}").val(),
														child4: $("#child4${catalog.clid}").val(), child5: $("#child5${catalog.clid}").val()},
													function(){}
												)
												window.location.reload();
											});
											</script>
										</div>
	                        		</div>
	                        	</div>
	                        </div>
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