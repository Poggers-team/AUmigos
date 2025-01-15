drop database aumigos;
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

create table Animal (
    id bigint(20) primary key auto_increment,
    name varchar(20),
    type varchar(10) not null,
    breed varchar(20) not null,
    gender varchar(20) not null,
    size varchar(10) not null,
    age int not null,
    castrated boolean not null,
    adopted boolean not null,
    vaccinated boolean not null,
    dewormed boolean not null,
    temperament varchar(255) not null,
    socialization varchar(255) not null,
    address varchar(100) not null,
    city varchar(50) not null,
    contactName varchar(50) not null,
    contactEmail varchar(100) not null,
    contactPhone varchar(20) not null,
    image longtext not null,
    fileName varchar(50) not null,
    color varchar(20),
    story text,
    announcementDate date not null
) engine = InnoDB
  default charset = utf8;


create table Voluntary (
    id bigint(20) auto_increment primary key,
    name varchar(50) not null,
    email varchar(50) not null,
    phone varchar(20) not null,
    availability varchar(50) not null,
    skills varchar(255)
) engine = InnoDB
  default charset = utf8;

create table Adoption (
    id bigint(20) auto_increment primary key,
    adopterName varchar(50) not null,
    adopterAge varchar(50) not null,
    adopterEmail varchar(50) not null,
    adopterZipcode varchar(50) not null,
    adopterAddress varchar(100) not null,
    adopterPhone varchar(20) not null,
    adopterTypeOfResidence varchar(50) not null,
    adopterHouseHasAutomaticGate boolean not null,
    adopterHouseHasPool boolean not null,
    adopterHouseHasNetOnWindows boolean not null,
    adopterComments varchar(255),
    adopterQtyAnimals int not null,
    adopterExperiences varchar(255),
    animalPlace varchar(20) not null,
    adopterIsResponsible boolean not null,
    adopterIsAwareOfTheCosts boolean not null,
    peopleLivingInAdopterHouse int not null,
    peopleIsAwareOfAdoption boolean not null,
    hasChildrenAtHouse boolean not null,
    animalAloneTime varchar (20) not null,
    adoptionDate date not null,
    animalId bigint(20) not null,

    foreign key (animalId) references Animal(id)
) engine = InnoDB
  default charset = utf8;