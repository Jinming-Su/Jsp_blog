<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<meta http-equiv="refresh" content="60" />
	<title>主页</title>
	<link rel="stylesheet" href="/Jsp_blog/css/welcome.css">
    <script src="/Jsp_blog/js/welcome.js"></script>
</head>
<body>
	<marquee class="welcome_marquee1" direction="left" onmouseover=stop() onmouseout=start()>
		<script type="text/javascript">document.write(word1);</script>
	</marquee>
	<marquee class="welcome_marquee2" direction="right" onmouseover=stop() onmouseout=start()>
		<script type="text/javascript">document.write(word2);</script>
	</marquee>
	<canvas id="canvas">
        当前浏览器不支持酷炫页面的显示，请更换！
    </canvas>
	<a class="btn btn-default welcome_btn" href="/Jsp_blog/article/list/1.do">开启&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;»</a>
	
</body>
</html>