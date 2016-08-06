create table user(
uid int auto_increment primary key,
email varchar(256) not null ,
password varchar(256) not null ,
score int default 0,
level int default 3,
created_time timestamp default current_timestamp,
education varchar(256),
address varchar(256),
skill1 varchar(256),
skill2 varchar(256),
skill3 varchar(256))
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;