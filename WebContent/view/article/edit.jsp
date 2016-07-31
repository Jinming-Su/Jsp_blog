<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>管理文章</title>

    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="/Jsp_blog/plugs/bootstrap-markdown-editor/dist/css/bootstrap-markdown-editor.css" rel="stylesheet">
	<style type="text/css">
		.content {
			padding-top: 20px !important;
			padding-bottom: 20px !important;
			background-color: #f3f3f3;
		}
		.create_error {
        	width: 100%;
        	background-color: #d9534f;
        	margin-top: 10px;
        }
	</style>
</head>
<body>
	<div class="content">
	<h1 style="font-size: 30px;" class="text-center">更新文章</h1>
    <div class="container">
        <form id="form" action="/Jsp_blog/article/${article.aid }/edit.do" method="post">
        	<div class="form-group">
				<label><b>标题:</b></label>
				<input type="text" name="title" class="form-control" value=${article.title} >
			</div>
			<div class="form-group">
                <label><b>内容:</b></label>
           		<textarea name="content" id="editor" >${article.content }
           		</textarea>
            </div>
            <div class="form-group">
                    <label><b>关键字:</b></label>
                    <input type="text" name="key_word" class="form-control" value=${article.key_word }>
			</div>
			<input type="submit" value="更新文章" class="btn btn-info form-control" id="submit">
			<div class="create_error">
                   <c:forEach items="${errors}" var="error">
                   	<span class="glyphicon glyphicon-remove-sign"></span>
                   	&nbsp;${error}<br/>
                   </c:forEach>
			</div>
        </form>
    </div>
    </div>

    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/ace/1.1.3/ace.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/marked/0.3.2/marked.min.js"></script>
    <script src="/Jsp_blog/plugs/bootstrap-markdown-editor/dist/js/bootstrap-markdown-editor.js"></script>
    <script>
        jQuery(document).ready(function($) {

            $('#editor').markdownEditor({
                preview: true,
                onPreview: function (content, callback) {
                    callback( marked(content) );
                }
            });

        });

    </script>
</body>
</html>
