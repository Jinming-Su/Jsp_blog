<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<link href="/Jsp_blog/plugs/sliderLock/css/jquery-ui-1.10.4.min.css" rel="stylesheet" media="screen">
	<script src="/Jsp_blog/plugs/sliderLock/js/jquery-ui-1.10.4.min.js"></script>
	<!-- SliderLock -->
	<script src="/Jsp_blog/plugs/sliderLock/js/sliderlock2.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#about_me").addClass("active");
		})
	</script>
	<style type="text/css">
		#slider {
        	border-radius: 0;
        }
        #slider a{
        	margin-top: 5px;
        	height: 30px;
        	width: 30px;
        	font-size: 20px;
        	text-align: center;
        	margin-left: 0;
        	padding-top: 2px;
        	border-radius: 0;
        }
	</style>
</head>
<body>
	<%@include file="/view/layout/header.jsp" %>
	
	<div class="content">
		<h1>Do you want to know me?</h1>
	</div>
	
	<%@include file="/view/layout/footer.jsp" %>
</body>
</html>