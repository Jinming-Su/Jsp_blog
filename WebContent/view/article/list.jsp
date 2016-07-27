<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>文章</title>
    <style>
        .table {
            width: 900px;
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
    </style>
    <script>
        $(function() {
            $('#article').addClass('active');
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
	                        <td class="text-center" style="width: 30%">创建时间</td>
	                        <td class="text-center" style="width: 20%">作者</td>
	                    </tr>
				</thead>
						<tr>
	                        <td class="text-center my_ellipsis">
	                            <a href="/article/{{$article->id}}">标题</a>
	                        </td>
	                        <td class="text-center my_ellipsis">关键字</td>
	                        <td class="text-center">时间</td>
	                        <td class="text-center my_ellipsis">
                           	 	<a href="/profile/{{$article->user->id}}">作者</a>
                        	</td>
						</tr>
			</table>
		</div>
	</div>
	
	<%@include file="/view/layout/footer.jsp" %>
</body>
</html>