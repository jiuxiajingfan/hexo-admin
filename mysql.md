 create database hexoadmin;


create table user
(
    UserID       int auto_increment,
    UserName varchar(16) not null,
    UserPWD varchar(30) not null,
    primary key (UserID)
);


create table article
(
    articleID       int auto_increment,
    articleTitle text not null,
    articleBody longtext not null,
    articleTime date  ,
    articleTip text ,
    articleTag text,
    uuid        varchar(50),
    primary key (articleID)

);


insert into user(UserID,UserName,UserPWD)
values(1,"admin","1475549985");
