create table article(
aid int auto_increment primary key,
title varchar(256),
content text,
key_word varchar(256),
father_catalog varchar(256),
son_catalog varchar(256),
auther varchar(256),
created_time timestamp not null default current_timestamp,
access_num int default 0)
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;