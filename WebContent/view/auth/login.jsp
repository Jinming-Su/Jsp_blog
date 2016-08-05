<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
        <title>高仿淘宝拖动验证码</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script type="text/javascript" src="/Jsp_blog/plugs/QapTcha/jquery.js"></script>
        <script type="text/javascript" src="/Jsp_blog/plugs/QapTcha/jquery-ui.js"></script>
        <script type="text/javascript" src="/Jsp_blog/plugs/QapTcha/jquery.ui.touch.js"></script>
        <script type="text/javascript" src="/Jsp_blog/plugs/QapTcha/QapTcha.jquery_taobao.js"></script>
        <link rel="stylesheet" href="/Jsp_blog/plugs/QapTcha/QapTcha.jquery_taobao.css" type="text/css">
        <link rel="stylesheet" href="/Jsp_blog/plugs/QapTcha/loading.css" type="text/css">

        <style type="text/css">
            form{margin:30px;width:300px}
            label{float:left;clear:both;width:100px;margin-top:10px}
            select, input{float:left;margin-top:10px}

      
        </style>
    </head>
    <body>
        <div class="container">
            <h1>高仿淘宝拖动验证码插件</h1>
            <form method="post" action="service.aspx">
                <fieldset>
                    <label>姓名</label> <input name="username" type="text">
                    <div class="clr"></div>

                    <div id="QapTcha" class="QapTcha"></div>
                    
                    <input name="submit" value="提交表单" type="submit">
                </fieldset>
            </form>
        </div>
        
        <script type="text/javascript">
            $(document).ready(function () {
                $('.QapTcha').QapTcha({ 
                	disabledSubmit: true,
                	autoSubmit:false, 
                	autoRevert: true, 
                	txtLock: "请按住滑块，拖动到最右侧", 
                	txtUnlock: '验证通过', 
                	JSPfile: 'test.java' });
            });
        </script>

    

</body></html>