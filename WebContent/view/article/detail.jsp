<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%@include file="/view/layout/reference.jsp" %>
	<title>${article.title }</title>
    <style>
        .articles_index_panel {
            width: 70%;
            margin: 0 auto;
            margin-top: 20px;
        }
        .content {
            min-height: 650px;
            padding-bottom: 100px;
        }
        .panel-heading {
            font-size: 25px;
            font-style: oblique;
        }
        .panel-body {
            font-style: oblique;
        }
        .panel-footer {
            font-size: 13px;
            text-align: right;
        }
        .article_show_edit_btn {
            margin-top: 5px;
            padding: 5px 15px;
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
	<%@include file="/view/layout/header.jsp" %>
	
	 <div class="content">
        <div class="panel panel-default articles_index_panel">
            <div class="panel-heading">
                <b>${article.title }</b>
                <%if(session.getAttribute("loginUid") != null) {%>
                    <a href="/article/{{$article->id}}/edit" class="btn btn-warning pull-right article_show_edit_btn">Edit</a>
                <%} %>
            </div>
            <div class="panel-body">${article.content }</div>
            <div class="panel-footer">
            	<span>${article.auther}</span>&nbsp;&nbsp;&nbsp;&nbsp;
            	<span id="created_time">${article.created_time}</span>
            </div>
            
        </div>
	</div>
	
	<%@include file="/view/layout/footer.jsp" %>
</body>
</html>