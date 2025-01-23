DROP TABLE app_user;
DROP TABLE animal;
DROP TABLE voluntary;
DROP TABLE adoption;

CREATE TABLE app_user(
    user_id NUMBER(20) PRIMARY KEY,
    user_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    user_password VARCHAR2(50) NOT NULL,
    dateOfBirth DATE NOT NULL,
    gender VARCHAR2(20) NOT NULL,
    active NUMBER(1) NOT NULL
);

CREATE TABLE animal (
    animal_id NUMBER(20) PRIMARY KEY,
    name_animal VARCHAR2(20),
    type_animal VARCHAR2(10) NOT NULL,
    breed VARCHAR2(20) NOT NULL,
    gender VARCHAR2(20) NOT NULL,
    size_animal VARCHAR2(10) NOT NULL,
    age INT NOT NULL,
    castrated NUMBER(1) NOT NULL,
    adopted NUMBER(1) NOT NULL,
    vaccinated NUMBER(1) NOT NULL,
    dewormed NUMBER(1) NOT NULL,
    temperament CLOB NOT NULL,
    socialization CLOB NOT NULL,
    address VARCHAR2(100) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    contactName VARCHAR2(50) NOT NULL,
    contactEmail VARCHAR2(100) NOT NULL,
    contactPhone VARCHAR2(20) NOT NULL,
    image CLOB NOT NULL,
    fileName VARCHAR2(50) NOT NULL,
    color VARCHAR2(20),
    story CLOB,
    announcementDate DATE NOT NULL
);

CREATE TABLE voluntary (
    voluntary_id NUMBER(20) PRIMARY KEY,
    voluntary_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone VARCHAR2(20) NOT NULL,
    voluntary_availability VARCHAR2(50) NOT NULL,
    skills CLOB
);

CREATE TABLE adoption (
    adoption_id NUMBER(20) PRIMARY KEY,
    adopterName VARCHAR2(50) NOT NULL,
    adopterAge VARCHAR2(50) NOT NULL,
    adopterEmail VARCHAR2(50) NOT NULL,
    adopterZipcode VARCHAR2(50) NOT NULL,
    adopterAddress VARCHAR2(100) NOT NULL,
    adopterPhone VARCHAR2(20) NOT NULL,
    adopterTypeOfResidence VARCHAR2(50) NOT NULL,
    adopterHouseHasAutomaticGate NUMBER(1) NOT NULL,
    adopterHouseHasPool NUMBER(1) NOT NULL,
    adopterHouseHasNetOnWindows NUMBER(1) NOT NULL,
    adopterComments VARCHAR2(255),
    adopterQtyAnimals INT NOT NULL,
    adopterExperiences VARCHAR2(255),
    animalPlace VARCHAR2(20) not null,
    adopterIsResponsible NUMBER(1) NOT NULL,
    adopterIsAwareOfTheCosts NUMBER(1) NOT NULL,
    peopleLivingInAdopterHouse INT NOT NULL,
    peopleIsAwareOfAdoption NUMBER(1) NOT NULL,
    hasChildrenAtHouse NUMBER(1) NOT NULL,
    animalAloneTime VARCHAR2(20) NOT NULL,
    adoptionDate DATE NOT NULL,
    animalId NUMBER(20) NOT NULL,

    CONSTRAINT fk_animal FOREIGN KEY (animalId) REFERENCES animal(animal_id)
);

CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE voluntary_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE animal_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE adoption_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_app_user_id
BEFORE INSERT ON app_user
FOR EACH ROW
BEGIN
  :NEW.user_id := user_seq.nextval;
END;

CREATE OR REPLACE TRIGGER trg_voluntary_id
BEFORE INSERT ON voluntary
FOR EACH ROW
BEGIN
  :NEW.voluntary_id := voluntary_seq.nextval;
END;

CREATE OR REPLACE TRIGGER trg_animal_id
BEFORE INSERT ON animal
FOR EACH ROW
BEGIN
  :NEW.animal_id := animal_seq.nextval;
END;

CREATE OR REPLACE TRIGGER trg_adoption_id
BEFORE INSERT ON adoption
FOR EACH ROW
BEGIN
  :NEW.adoption_id := adoption_seq.nextval;
END;