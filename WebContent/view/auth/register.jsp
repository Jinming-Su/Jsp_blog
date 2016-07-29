<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>注册</title>
    <style>
        .container1 {
            width: 500px;
        }
    </style>
</head>
<body>
	<%@include file="/view/layout/header.jsp" %>
	
	<div class="content">
        <div class="container container1">
            <form action="/Jsp_blog/auth/register.do" method="post">
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="email" class="form-control">
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <div class="form-group">
                    <label>Password Confirmation:</label>
                    <input type="password" name="password_confirmation" class="form-control">
                </div>
                <input type="submit" value="Register" class="btn btn-success form-control">
            </form>
        </div>
	</div>
	
	<%@include file="/view/layout/footer.jsp" %>
</body>
</html>