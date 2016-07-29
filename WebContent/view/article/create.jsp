<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>创建新文章</title>
	<style>
        .container1 {
            width: 800px;
        }
        .create_error {
        	width: 100%;
        	background-color: #d9534f;
        	margin-top: 10px;
        }
    </style>
	<script type="text/javascript">
		$(function() {
			$("#article").addClass("active");
		})
	</script>
</head>
<body>
	<%@include file="/view/layout/header.jsp"%>
	
	<div class="content">
		<div class="container container1">
			<form action="/Jsp_blog/article/create.do" method="post">
				<div class="form-group">
					<label><b>标题:</b></label>
					<input type="text" name="title" class="form-control"/>
				</div>
				<div class="form-group">
                    <label><b>内容:</b></label>
                    <textarea name="content" rows="8" class="form-control"></textarea>
				</div>
				<div class="form-group">
                    <label><b>关键字:</b></label>
                    <input type="text" name="key_word" class="form-control">
				</div>
				<input type="submit" value="Submit" class="btn btn-info form-control" id="submit">
				
				<div class="create_error">
                    <c:forEach items="${errors}" var="error">
                    	<span class="glyphicon glyphicon-remove-sign"></span>
                    	&nbsp;${error}</br>
                    </c:forEach>
				</div>
			</form>
		</div>
	</div>
	
	<%@include file="/view/layout/footer.jsp" %>
</body>
</html>