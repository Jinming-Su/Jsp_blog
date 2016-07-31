<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>创建新文章</title>

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
	<h1 style="font-size: 30px;" class="text-center">新文章</h1>
    <div class="container">
        <form id="form" action="/Jsp_blog/article/create.do" method="post">
        	<div class="form-group">
				<label><b>标题:</b></label>
				<input type="text" name="title" class="form-control"/>
			</div>
			<div class="form-group">
                <label><b>内容:</b></label>
           		<textarea name="content" id="editor" ># Header Level 1
标题
------

#一级标题
##二级标题
###三级标题
####四级标题
#####五级标题
######六级标题


文本
------
###普通文本
这是一段普通的文本
###单行文本

    Hello,大家好，我是果冻虾仁。

在一行开头加入1个Tab或者4个空格。
###文本块
####语法1
在连续几行的文本开头加入1个Tab或者4个空格。

    欢迎到访
    很高兴见到您
    祝您，早上好，中午好，下午好，晚安

####语法2
使用一对各三个的反引号：
```
欢迎到访
我是C++码农
你可以在知乎、CSDN、简书搜索【果冻虾仁】找到我
```
该语法也可以实现代码高亮，见[代码高亮](#代码高亮)
###文字高亮
文字高亮功能能使行内部分文字高亮，使用一对反引号。
语法：
```
`linux` `网络编程` `socket` `epoll` 
```
效果：`linux` `网络编程` `socket` `epoll`

也适合做一篇文章的tag
####换行
直接回车不能换行，  
可以在上一行文本后面补两个空格，  
这样下一行的文本就换行了。

或者就是在两行文本直接加一个空行。

也能实现换行效果，不过这个行间距有点大。
####斜体、粗体、删除线
|语法|效果|
|----|-----
|`*斜体1*`|*斜体1*
|`_斜体2_`|_斜体2_
|`**粗体1**`|**粗体1**
|`__粗体2__`|__粗体2__
|`这是一个 ~~删除线~~`|这是一个 ~~删除线~~
|`***斜粗体1***`|***斜粗体1***
|`___斜粗体2___`|___斜粗体2___
|`***~~斜粗体删除线1~~***`|***~~斜粗体删除线1~~***
|`~~***斜粗体删除线2***~~`|~~***斜粗体删除线2***~~

斜体、粗体、删除线可混合使用

图片
------
基本格式：
```
![alt](URL title)
```
alt和title即对应HTML中的alt和title属性（都可省略）：
- alt表示图片显示失败时的替换文本
- title表示鼠标悬停在图片时的显示文本（注意这里要加引号）

URL即图片的url地址，如果引用本仓库中的图片，直接使用**相对路径**就可了，如果引用其他github仓库中的图片要注意格式，即：`仓库地址/raw/分支名/图片路径`，如：
```
https://github.com/guodongxiaren/ImageCache/raw/master/Logo/foryou.gif
```

|#|语法|效果|
|---|---|----
|1|`![baidu](http://www.baidu.com/img/bdlogo.gif "百度logo")`|![baidu](http://www.baidu.com/img/bdlogo.gif "百度logo")
|2|`![][foryou]`|![][foryou]

注意例2的写法使用了**URL标识符**的形式，在[链接](#链接)一节有介绍。
>在文末有foryou的定义：
```
[foryou]:https://github.com/guodongxiaren/ImageCache/raw/master/Logo/foryou.gif
```

链接
------
###链接外部URL
|#|语法|效果|
|---|----|-----
|1|`[我的博客](http://blog.csdn.net/guodongxiaren "悬停显示")`|[我的博客](http://blog.csdn.net/guodongxiaren "悬停显示")
|2|`[我的知乎][zhihu] `|[我的知乎][zhihu] 
|2|`[zhihu]:https://www.zhihu.com/people/jellywong "我的知乎，欢迎关注"`|   

语法2由两部分组成：
- 第一部分使用两个中括号，[ ]里的标识符（本例中zhihu），可以是数字，字母等的组合，标识符上下对应就行了（**姑且称之为URL标识符**）
- 第二部分标记实际URL。

>使用URL标识符能达到复用的目的，一般把全文所有的URL标识符统一放在文章末尾，这样看起来比较干净。
>>URL标识符是我起的名字，不知道是否准确。囧。。

###链接本仓库里的URL
|语法|效果|
|----|-----
|`[我的简介]|(/example/profile.md)`|[我的简介](/example/profile.md)
|`[Book]|(./Book)`|[Book](/Book)

###图片链接
给图片加链接的本质是混合图片显示语法和普通的链接语法。普通的链接中[ ]内部是链接要显示的文本，而图片链接[ ]里面则是要显示的图片。  
直接混合两种语法当然可以，但是十分啰嗦，为此我们可以使用URL标识符的形式。

|#|语法|效果|
|---|----|:---:
|1|`[![weibo-logo]](http://weibo.com/linpiaochen)`|[![weibo-logo]](http://weibo.com/linpiaochen)
|2|`[![](/img/zhihu.png "我的知乎，欢迎关注")][zhihu]`|[![](/img/zhihu.png "我的知乎，欢迎关注")][zhihu]|
|3|`[![csdn-logo]][csdn]`|[![csdn-logo]][csdn]

因为图片本身和链接本身都支持URL标识符的形式，所以图片链接也可以很简洁（见例3）。  
注意，此时鼠标悬停时显示的文字是图片的title，而非链接本身的title了。

           		</textarea>
            </div>
            <div class="form-group">
                    <label><b>关键字:</b></label>
                    <input type="text" name="key_word" class="form-control">
			</div>
			<input type="submit" value="发布文章" class="btn btn-info form-control" id="submit">
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
