<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title></title>
    <style>
    	body,.content{
            background-color: #d2d6de;
        }
        #loading i{
        	font-size: 50px;
        	margin-top: 5%;
        }
    </style>
    <script type="text/javascript">
		function countDown(secs, surl){
			var jump = document.getElementById("jumpTo");
			jumpTo.innerHTML = secs;
			if(--secs>0) {
				setTimeout("countDown("+secs+",'"+surl+"')", 1000);
			} else {
				location.href = surl;
			}
		}
	</script>
</head>
<body>
	<div class="content">
		<div class="text-center" id="loading">
			<i class="fa fa-spinner fa-pulse"></i><br><br>
			${info1}, <span id="jumpTo">5</span>秒后, 自动跳转到${info2}
			<script type="text/javascript">countDown(5, "${url}");</script>
		</div>
	</div>
	
	
</body>
</html>