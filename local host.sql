DROP USER AUMIGOS CASCADE;

CREATE USER AUMIGOS IDENTIFIED BY aumigospass;

ALTER USER AUMIGOS DEFAULT TABLESPACE users QUOTA UNLIMITED ON users;

ALTER USER AUMIGOS TEMPORARY TABLESPACE TEMP;

GRANT CONNECT TO AUMIGOS;

GRANT CREATE SESSION, CREATE VIEW, CREATE TABLE, ALTER SESSION, CREATE SEQUENCE TO AUMIGOS;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE, UNLIMITED TABLESPACE TO AUMIGOS;