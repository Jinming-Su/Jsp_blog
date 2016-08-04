<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>更新文章</title>
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
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
        .select_catalog {
        	width: 300px;
        	float: left;
        	margin-right: 50px;
        	margin-bottom: 30px;
        }
	</style>
	<script type="text/javascript">
		$(function(){
			$("#select_father").val("${article.father_catalog}");
			$("#select_son").val("${article.son_catalog}");
			
			$("#select_father").change(function(){
				$.post(
					"/Jsp_blog/article/create/ajax_select_son.do",
					{select_father: $("#select_father").val()},
					function(data){
						$("#select_son").empty();
						if(data.child1 != null && data.child1!="")
							$("#select_son").append('<option>'+data.child1+'</option>');
						if(data.child1 != null && data.child2!="")
							$("#select_son").append('<option>'+data.child2+'</option>');
						if(data.child1 != null && data.child3!="")
							$("#select_son").append('<option>'+data.child3+'</option>');
						if(data.child1 != null && data.child4!="")
							$("#select_son").append('<option>'+data.child4+'</option>');
						if(data.child1 != null && data.child5!="")
							$("#select_son").append('<option>'+data.child5+'</option>');
					}
				)
			});
		})
		
	</script>
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
			<div class="form-group select_catalog">
                    <label><b>总分类:</b></label>
                    <select class="form-control" id="select_father" name="father_catalog">
                    <c:forEach items="${catalogs }" var="catalog">
                    <c:if test="${catalog.name != null }">
                    	<option>${catalog.name }</option>
                    </c:if>
                    </c:forEach>
                    </select>
			</div>
			<div class="form-group select_catalog">
                    <label><b>子分类:</b></label>
                    <select class="form-control" id="select_son" name="son_catalog">
                    <c:forEach items="${catalogs }" var="catalog">
                    <c:if test="${(article.father_catalog) == (catalog.name) }">
                    	<c:if test="${catalog.child1 != '' }">
                    		<option>${catalog.child1}</option>
                    	</c:if>
                    	<c:if test="${catalog.child2 != '' }">
                    		<option>${catalog.child2}</option>
                    	</c:if>
                    	<c:if test="${catalog.child3 != '' }">
                    		<option>${catalog.child3}</option>
                    	</c:if>
                    	<c:if test="${catalogs[0].child4 != '' }">
                    		<option>${catalogs[0].child4}</option>
                    	</c:if>
                    	<c:if test="${catalog.child5 != '' }">
                    		<option>${catalog.child5}</option>
                    	</c:if>
                    </c:if>
                    </c:forEach>
                    </select>
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
