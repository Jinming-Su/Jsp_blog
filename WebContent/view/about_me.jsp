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
		<div class="container">
			<div class="panel panel-default" style="width: 600px; text-align: center;margin: 0 auto;margin-top: 10%;">
				<div class="panel-body">
					本项目长期处于push中，了解更多请移步：<a class="text-info" href="https://github.com/su526664687/Jsp_blog"><b>github</b></a>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="/view/layout/footer.jsp" %>
</body>
</html>