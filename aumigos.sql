create database aumigos;

use aumigos;

create table User
(
    id bigint(20) primary key auto_increment,
    name varchar(50) not null,
    email varchar(50) not null,
    password varchar(50) not null,
    dateOfBirth date not null,
    gender varchar(20) not null,
    active boolean not null
) engine = InnoDB
  default charset = utf8;