<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="/Jsp_blog/plugs/bootstrap-markdown-editor/dist/css/bootstrap-markdown-editor.css" rel="stylesheet">
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
        .panel-body {
        	padding: 0;
        }
        .panel-footer {
            font-size: 13px;
            text-align: right;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
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
        	var time = new Date(parseInt($("#created_time").html()));
        	$("#created_time").html(time.format('yyyy-MM-dd h:m:s'));
        })
	</script>
</head>
<body>
	
	 <div class="content">
        <div class="panel panel-default articles_index_panel">
            <div class="panel-heading">
                <b>${article.title }</b>
            </div>
            <div class="panel-body">
            	<textarea id="editor" >${article.content}</textarea>
            </div>
            <div class="panel-footer">
            	<span>${article.auther}</span>&nbsp;&nbsp;&nbsp;&nbsp;
            	<span id="created_time">${article.created_time}</span>
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