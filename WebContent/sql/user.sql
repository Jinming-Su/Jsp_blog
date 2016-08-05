create table user(
uid int auto_increment primary key,
email varchar(256) not null ,
password varchar(256) not null ,
score int default 0,
level int default 3,
created_time timestamp default current_timestamp)
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;