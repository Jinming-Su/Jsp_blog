<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="navbar navbar-default header navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand">GOOD LUCK</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="/Jsp_blog/" id="mainPage">主页</a></li>
		<li><a href="/Jsp_blog/article/list/1.do" id="article">文章</a></li>
		<li><a href="/Jsp_blog/aboutMe.do" id="about_me">关于</a></li>
	</ul>
	
	<ul class="nav navbar-nav navbar-right" style="text-align: right;">
	<% if(session.getAttribute("loginUid") == null) {%>
		<li>
			<a id="btn_login" href="#login_modal" data-toggle="modal">登录</a>
		</li>
		
		<li><a href="/Jsp_blog/auth/register.do">注册</a></li>
	<% } else { %>
		<li class="dropdown">
                <a href="#" style="width: 300px;" class="dropdown-toggle my_ellipsis" data-toggle="dropdown" role="button" aria-expanded="false">
                    <%=session.getAttribute("loginEmail") %><span class="caret"></span>
                </a>
                <ul class="dropdown-menu header_dropdown_menu" role="menu">
                    <li>
                        <a href="/Jsp_blog/auth/profile.do" class="text-center"><img src="/Jsp_blog/img/image/person.png" width="80px" height="80px"></a>
                    </li>
                    <li>
                        <a href="/Jsp_blog/auth/logout.do">
                            <i class="fa fa-btn fa-sign-out">Logout</i>
                        </a>
                    </li>
                </ul>
		</li>
	<%} %>
	</ul>
	
	<form class="navbar-form" role="search" action="#">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="请输入要搜索的内容"/>
		</div>
		<button type="submit" class="btn btn-success">搜索</button>
	</form>
</div>
<!-- 模态登录框 -->
<div class="modal fade" id="login_modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h6 class="modal-title text-center">账号登录</h6>
            </div>
            <div class="modal-body">
                <form action="/Jsp_blog/auth/login.do" method="POST">
	                <div class="form-group signin_box_userbox">
                        <span class="glyphicon glyphicon-envelope signin_box_gly"></span>
                        <input id="ipt_login_email" type="email" name="email" class="form-control signin_box_user" placeholder="请输入邮箱" tabindex="1">
                    </div>
	                <div class="form-group signin_box_userbox ">
                        <span class="glyphicon glyphicon-lock signin_box_gly"></span>
                        <input id="ipt_login_password" type="password" name="password" class="form-control signin_box_user" placeholder="请输入密码" tabindex="2">
                    </div>
                    
                    <div class="row signin_box_row">
	           			<div id="slider" class="sliderLock" style="height: 30px;margin: 0;padding: 0;">
	             			<p style="font-family: Lato,Helvetica,Arial,sans-serif;
	    font-size: 15px;padding-left: 40px;" class="text-muted">请先滑动解锁</p>
	          			</div>
          			</div>
                    
	                <div class="row signin_box_row">
                        <input type="submit" value="登录" style="padding-top: 3px" class="btn btn-info pull-right">
	                </div>
	            </form>
	            <br>
	            <div class="row signin_box_row">
	                    <a href="#" class="pull-left login_register_bottom">忘记密码?</a>
	                    <br/>
	                    <a href="/Jsp_blog/auth/register.do" class="pull-left login_register_bottom">注册新用户</a>
	            </div>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->