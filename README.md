# Jsp_blog
A universal blog

## version 2.0

> friend system
   - [x] add
   - [x] show
   - [x] statistics

## version 1.0 : completed
### function  

- [x] index.jsp  

>  article
   - [x] list.jsp
   - [x] detail.jsp
   - [x] add.jsp
   - [x] edit.jsp  
   
> user
   - [x] login.jsp
   - [x] register.jsp
   - [x] validate
   - [x] session
   
> comment
   - [x] add
   - [x] list

> catalgo
   - [x] add
   - [x] edit
   - [x] delete

> dashboard  
   - [x] profile.jsp
   - [x] show_article.jsp
   - [x] show_comment.jsp
   - [x] catalog_manage

> right level
   
   - [x] level 1 all
   - [x] level 2 + create article
   - [x] level 3 read, comment

### manual

* admin, uid = 1, level = 1, new user level = 3
* comment once, add one score, when admin can grant right(level = 2 or level = 1)

### database table  
article:  

|name|type|default|  
|----|----|----|  
|aid|int primary key||  
|title|varchar(256)||  
|content|text||  
|key_word|varchar(256)||  
|father_catalog|varchar(256)||  
|son_catalog|varchar(256)||  
|auther|varchar(256)||  
|created_time|Date|current_timestamp|  
|access_num|int|0|  

user:  

|name|type|default|  
|----|----|----|  
|uid|int pk||  
|email|varchar(256)||  
|password|varchar(256)||  
|score|int|0|  
|level|int|3|  
|created_time|timestamp|current_timestamp|    
|education|varchar(256)||  
|address|varchar(256)||  
|skill1|varchar(256)||  
|skill2|varchar(256)||  
|skill3|varchar(256)||  


comment:

|name| type|default|  
|----|----|----|  
|cid|int pk||  
|content|text||  
|aid|int||  
|uid|int||  
|create_time|timestamp|current_timestamp|  
|like_num|int|0|  

catalog:

|name|type|
|----|----|
|clid|int|
|id|int|
|name|varchar(256)|
|child1|varchar(256)|
|child2|varchar(256)|
|child3|varchar(256)|
|child4|varchar(256)|
|child5|varchar(256)|

friend:

|name|type|  
|----|----|  
|fid|int|  
|source|int|  
|target|int|  
