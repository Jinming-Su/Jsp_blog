create table comment(
cid int auto_increment not null primary key,
content text,
aid int,
uid int,
like_num int default 0,
created_time timestamp default current_timestamp)
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;