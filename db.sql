create database aumigos;

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

create table Animal
(
    id bigint(20) primary key auto_increment,
    name varchar(20) not null,
    type varchar(10) not null,
    breed varchar(20) not null,
    gender varchar(20) not null,
    size varchar(10) not null,
    age int not null,
    castrated boolean not null
) engine = InnoDB
  default charset = utf8;