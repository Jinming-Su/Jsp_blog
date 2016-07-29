# Jsp_blog
A universal blog

## version 0.1
### function  

- [x] index.jsp  

>  article
   - [x] list.jsp
   - [ ] detail.jsp
   - [x] add.jsp
   - [ ] edit.jsp  
   
> user
   - [x] login.jsp
   - [x] register.jsp
   - [x] validate
   - [ ] session
   - [ ] profile.jsp  


### database table  
article:  

|name|type|
|----|----|
|aid|int primary key|
|title|varchar(20)|
|content|varchar(1000)|
|key_word|varchar(50)|
|auther|varchar(20)|
|created_time|Date|

user:  

|name|type|
|----|----|
|uid|int pk|
|email|varchar(20)|
|password|varchar(20)|
|created_time|timestamp|
|score|int|
