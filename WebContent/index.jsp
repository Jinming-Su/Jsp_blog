<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<script type="text/javascript">
		$(function() {
			$("#mainPage").addClass("active");
		})
	</script>
</head>
<body>
	<%@include file="/view/layout/header.jsp" %>
	
	<div class="content" style="min-height: 300px"></div>
	
	<%@include file="/view/layout/footer.jsp" %>
</body>
</html>