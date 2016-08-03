# Jsp_blog
A universal blog

## version 0.1
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

> dashboard  
   - [ ] profile.jsp
   - [x] show_article.jsp
   - [x] show_comment.jsp
   - [x] catalog_manage

### database table  
article:  

|name|type|
|----|----|
|aid|int primary key|
|title|varchar(256)|
|content|text|
|key_word|varchar(256)|
|father_catalog|varchar(256)|
|son_catalog|varchar(256)|
|auther|varchar(256)|
|created_time|Date|

user:  

|name|type|
|----|----|
|uid|int pk|
|email|varchar(256)|
|password|varchar(256)|
|created_time|timestamp|
|score|int|

comment:

|name| type|
|----|----|
|cid|int pk|
|content|text|
|aid|int|
|uid|int|
|create_time|timestamp|

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
