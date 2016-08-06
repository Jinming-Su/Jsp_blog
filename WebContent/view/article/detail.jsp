<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="/Jsp_blog/plugs/bootstrap-markdown-editor/dist/css/bootstrap-markdown-editor.css" rel="stylesheet">
    <!-- Loading Font Awesome -->
	<link href="/Jsp_blog/css/vendor/awesome/css/font-awesome.css" rel="stylesheet">
	<title>${article.title }</title>
    <style>
    	.content {
            min-height: 650px;
            padding-top: 30px !important;
			padding-bottom: 50px !important;
			background-color: #f7f7ee;
        }
        .articles_index_panel {
            width: 70%;
            margin: 0 auto;
            margin-top: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 16px #888, 0 0 1px #888, 0 0 1px #888;   
        }
        .panel-heading {
            font-size: 25px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .extra_h {
        	font-size: 13px !important;
        	text-align: right;
        }
        .extra_h span {
        	margin-right: 10px;
        }
        .panel-body {
        	padding: 0;
        }
        .panel-footer {
            font-size: 13px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }
      	.list-group-item2 {
      		position: relative;
		    display: block;
		    padding: 10px 0;
		    margin-bottom: -1px;
      	}
      	.user_information {
      		padding: 0;
      	}
       	.user_information img {
       		width: 50px;
			height: 50px;
			padding: 0; 	
			margin-bottom: 10px;	
       	}
       	.user_information span {
       		color: #e8554e;
       	}
       	.user_content p {
       		padding-top: 10px;
       		min-height: 50px;
       	}
       	.user_content form {
       		text-align: right;
       	}
       	.user_content form a {
       		margin-left: 7px;
       	}
       	.user_content form a:hover {
       		text-decoration: none;
       		cursor: pointer;
       	}
       	#form_comment{
       		text-align: right;
       	}
       	#form_comment input{
       		font-size: 12px;
       		color: #e8554e;
       	}
        .md-preview {
        	padding: 20px !important;
        }
    </style>
	<script type="text/javascript">
		$(function() {
			$("#article").addClass("active");
		})
		Date.prototype.format = function(format) {
	      	var date = {
	              "M+": this.getMonth() + 1,
	              "d+": this.getDate(),
	              "h+": this.getHours(),
	              "m+": this.getMinutes(),
	              "s+": this.getSeconds(),
	              "q+": Math.floor((this.getMonth() + 3) / 3),
	              "S+": this.getMilliseconds()
			};
			if (/(y+)/i.test(format)) {
			       format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
			}
	        for (var k in date) {
	              if (new RegExp("(" + k + ")").test(format)) {
	                     format = format.replace(RegExp.$1, RegExp.$1.length == 1
	                            ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
	              }
	        }
	        return format;
		}
        $(function(){
        	var times = $(".created_time");
        	for(var i =0;i<times.length;i++) {
        		var time = new Date(parseInt(times[i].innerHTML));
        		times[i].innerHTML = time.format('yyyy-MM-dd hh:mm:ss');
        	}
        })
	</script>
</head>
<body>
	
	 <div class="content">
        <div class="panel panel-default articles_index_panel">
            <div class="panel-heading">
                <b style="word-wrap : break-word; word-break:break-all;">${article.title }</b>
                <span class="label label-primary" style="font-size: 13px">${article.father_catalog }</span>
                <span class="label label-info" style="font-size: 13px">${article.son_catalog}</span>
                <br/>
                <div class="extra_h">
               	 	<span id="auther">${article.auther}</span>
            		<span class="created_time">${article.created_time}</span>
            	</div>
            </div>
            <div class="panel-body">
            	<textarea id="editor" >${article.content}</textarea>
            </div>
            
            <div class="panel-footer">
            	<ul class="list-group">
            	<c:forEach items="${comments}" var="comment">
            		<li class="list-group-item2">
            			<div class="text-center col-md-1 user_information">
            				<img class="img-circle" src="/Jsp_blog/img/image/person.png"/><br/>
          					<span class="my_ellipsis" id="username${comment.cid }${comment.uid }">${comment.uid }</span>
          					<script type="text/javascript">
          						$(function(){
          							$.post(
          								"/Jsp_blog/auth/ajax_getname_by_uid.do",
          								{uid: "${comment.uid}"},
          								function(data){
          									$("#username${comment.cid }${comment.uid }").html(data)
          								}
          							)
          						})
          					</script>
            			</div>
            			<div class="user_content col-md-11">
            				<p>
            					${comment.content}
            				</p>
            				<form action="" method="post">
            					<span class="text-muted created_time">${comment.created_time}</span>
          						<a class="text-muted"><i class="fa fa-trash-o"></i>删除</a>
          						<a class="text-muted"><i class="fa fa-reply"></i>回复</a>
          						<a class="text-muted"><i class="fa fa-thumbs-o-up"></i>赞</a><br/>
          					</form>
            			</div>
            			<div style="clear: both;"></div>
            		</li>
            		</c:forEach>
            	</ul>
            	<form action="/Jsp_blog/article/${article.aid}/comment/create.do" method="post" id="form_comment">
            		<textarea type="text" class="form-control" rows="3" name="content" placeholder="在这里输入你想说的0.0"></textarea>
          			<input type="submit" class="btn btn-default" value="评论"/>
            	</form>
            </div>
            
        </div>
	</div>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/ace/1.1.3/ace.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/marked/0.3.2/marked.min.js"></script>
    <script src="/Jsp_blog/plugs/bootstrap-markdown-editor/dist/js/bootstrap-markdown-editor.js"></script>
    <script>
        jQuery(document).ready(function($) {

            $('#editor').markdownEditor({
           		width: '100%',
                height: '100%',
                fontSize: '14px',
                theme: 'tomorrow',
                softTabs: false,
                fullscreen: false,
                imageUpload: false,
                uploadPath: '',
                preview: true,
                onPreview: function (content, callback) {
                    callback( marked(content) );
                },
                label: {
                    btnHeader1: 'Header 1',
                    btnHeader2: 'Header 2',
                    btnHeader3: 'Header 3',
                    btnBold: 'Bold',
                    btnItalic: 'Italic',
                    btnList: 'Unordered list',
                    btnOrderedList: 'Ordered list',
                    btnLink: 'Link',
                    btnImage: 'Insert image',
                    btnUpload: 'Upload image',
                    btnEdit: 'Edit',
                    btnPreview: 'Preview',
                    btnFullscreen: 'Fullscreen',
                    loading: 'Loading'
                }
            });
			$('.md-toolbar').hide();
			$('.btn-preview').click();
			$('.md-container').css('height','100%');
			$('.md-preview').css('overflow-y','hidden');
        });
    </script>
</body>
</html>