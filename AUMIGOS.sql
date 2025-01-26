/*
O banco de dados a seguir tem como objetivo o armazenamento de informações
da aplicação "ONG AUmigos", uma ONG que busca encontrar um lar para nossos
amigos peludos, o banco de dados é composto pelas tabelas app_user (usuário),
animal (animais resgatados), voluntary (voluntários para a ONG), adoption 
(pessoa que deseja adotar um animal), ademais para melhor organização, as
operações foram armazenadas em pacotes (user_admin, animal_admin, voluntary_admin, 
adoption_admin), cada um respeitando sua responsabilidade de acordo com o objeto.
*/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE adoption CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE animal CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE voluntary CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE app_user CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP SEQUENCE user_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE voluntary_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE animal_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE adoption_seq';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

CREATE TABLE app_user(
     user_id NUMBER(20) PRIMARY KEY,
     user_name VARCHAR2(50) NOT NULL,
     email VARCHAR2(50) NOT NULL,
     user_password VARCHAR2(50) NOT NULL,
     dateOfBirth DATE NOT NULL,
     gender VARCHAR2(20) NOT NULL
);

CREATE TABLE animal (
    animal_id NUMBER(20) PRIMARY KEY,
    animal_name VARCHAR2(20),
    animal_type VARCHAR2(10) NOT NULL,
    breed VARCHAR2(20) NOT NULL,
    gender VARCHAR2(20) NOT NULL,
    animal_size VARCHAR2(10) NOT NULL,
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
/

CREATE OR REPLACE TRIGGER trg_voluntary_id
    BEFORE INSERT ON voluntary
    FOR EACH ROW
BEGIN
    :NEW.voluntary_id := voluntary_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER trg_animal_id
    BEFORE INSERT ON animal
    FOR EACH ROW
BEGIN
    :NEW.animal_id := animal_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER trg_adoption_id
    BEFORE INSERT ON adoption
    FOR EACH ROW
BEGIN
    :NEW.adoption_id := adoption_seq.nextval;
END;
/

CREATE OR REPLACE PACKAGE user_admin AS
    PROCEDURE save_user (
        p_name_user IN VARCHAR2,
        p_email IN VARCHAR2,
        p_password IN VARCHAR2,
        p_dateOfBirth IN DATE,
        p_gender IN VARCHAR2
    );

    PROCEDURE get_user_by_email_and_password (
        p_email IN VARCHAR2,
        p_password IN VARCHAR2,
        p_cursor OUT SYS_REFCURSOR
    );

    FUNCTION user_exists (
        p_user_email IN VARCHAR2
    ) RETURN NUMBER;
END user_admin;
/

CREATE OR REPLACE PACKAGE BODY user_admin AS
    PROCEDURE save_user (
        p_name_user IN VARCHAR2,
        p_email IN VARCHAR2,
        p_password IN VARCHAR2,
        p_dateOfBirth IN DATE,
        p_gender IN VARCHAR2
    ) AS
        v_count NUMBER;
    BEGIN
        v_count := user_exists(p_email);

        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-400, 'UsuÃ¡rio jÃ¡ cadastrado.');
        ELSE
            INSERT INTO app_user(user_name, email, user_password, dateOfBirth, gender)
            VALUES(p_name_user, p_email, p_password, p_dateOfBirth, p_gender);

            DBMS_OUTPUT.PUT_LINE('Usuï¿½rio cadastrado com sucesso.');
        END IF;
    END save_user;

    PROCEDURE get_user_by_email_and_password (
        p_email IN VARCHAR2,
        p_password IN VARCHAR2,
        p_cursor OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_cursor FOR
            SELECT user_id, user_name, email
            FROM app_user
            WHERE email = p_email AND user_password = p_password;
    END get_user_by_email_and_password;

    FUNCTION user_exists (
        p_user_email IN VARCHAR2
    ) RETURN NUMBER IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM app_user
        WHERE email = p_user_email;

        RETURN v_count;
    END user_exists;
END user_admin;
/

CREATE OR REPLACE PACKAGE voluntary_admin AS
    PROCEDURE save_voluntary (
        p_voluntary_name IN VARCHAR2,
        p_email IN VARCHAR2,
        p_phone IN VARCHAR2,
        p_availability IN VARCHAR2,
        p_skills IN CLOB
    );

    FUNCTION voluntary_exists (
        p_voluntary_email IN VARCHAR2
    ) RETURN NUMBER;
END voluntary_admin;
/

CREATE OR REPLACE PACKAGE BODY voluntary_admin AS
    PROCEDURE save_voluntary (
        p_voluntary_name IN VARCHAR2,
        p_email IN VARCHAR2,
        p_phone IN VARCHAR2,
        p_availability IN VARCHAR2,
        p_skills IN CLOB
    ) AS
        v_count NUMBER;
    BEGIN
        v_count := voluntary_exists(p_email);

        IF v_count > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Voluntï¿½rio jï¿½ cadastrado.');
        ELSE
            INSERT INTO voluntary(voluntary_name, email, phone, voluntary_availability, skills)
            VALUES(p_voluntary_name, p_email, p_phone, p_availability, p_skills);

            DBMS_OUTPUT.PUT_LINE('Voluntï¿½rio cadastrado com sucesso.');
        END IF;
    END save_voluntary;

    FUNCTION voluntary_exists (
        p_voluntary_email IN VARCHAR2
    ) RETURN NUMBER IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM voluntary
        WHERE email = p_voluntary_email;

        RETURN v_count;
    END voluntary_exists;
END voluntary_admin;
/

CREATE OR REPLACE PACKAGE animal_admin AS
    PROCEDURE save_animal(
        p_animal_name IN VARCHAR2,
        p_animal_type IN VARCHAR2,
        p_breed IN VARCHAR2,
        p_gender IN VARCHAR2,
        p_animal_size IN VARCHAR2,
        p_age IN INT,
        p_castrated IN NUMBER,
        p_adopted IN NUMBER,
        p_vaccinated IN NUMBER,
        p_dewormed IN NUMBER,
        p_temperament IN CLOB,
        p_socialization IN CLOB,
        p_address IN VARCHAR2,
        p_city IN VARCHAR2,
        p_contactName IN VARCHAR2,
        p_contactEmail IN VARCHAR2,
        p_contactPhone IN VARCHAR2,
        p_image IN CLOB,
        p_fileName IN VARCHAR2,
        p_color IN VARCHAR2,
        p_story IN CLOB,
        p_announcementDate IN DATE
    );

    PROCEDURE set_animal_as_adopted (
        p_animal_id IN NUMBER
    );

    PROCEDURE get_animal_by_id (
        p_animal_id IN NUMBER,
        p_result OUT SYS_REFCURSOR
    );

    PROCEDURE get_animals_by_adopted_status (
        p_adopted IN NUMBER,
        p_result OUT SYS_REFCURSOR
    );
END animal_admin;
/

CREATE OR REPLACE PACKAGE BODY animal_admin AS
    PROCEDURE save_animal (
        p_animal_name IN VARCHAR2,
        p_animal_type IN VARCHAR2,
        p_breed IN VARCHAR2,
        p_gender IN VARCHAR2,
        p_animal_size IN VARCHAR2,
        p_age IN INT,
        p_castrated IN NUMBER,
        p_adopted IN NUMBER,
        p_vaccinated IN NUMBER,
        p_dewormed IN NUMBER,
        p_temperament IN CLOB,
        p_socialization IN CLOB,
        p_address IN VARCHAR2,
        p_city IN VARCHAR2,
        p_contactName IN VARCHAR2,
        p_contactEmail IN VARCHAR2,
        p_contactPhone IN VARCHAR2,
        p_image IN CLOB,
        p_fileName IN VARCHAR2,
        p_color IN VARCHAR2,
        p_story IN CLOB,
        p_announcementDate IN DATE
    ) AS
    BEGIN
        INSERT INTO animal(animal_name, animal_type, breed, gender, animal_size,
                           age, castrated, adopted, vaccinated, dewormed, temperament, socialization,
                           address, city, contactName, contactEmail, contactPhone, image, fileName,
                           color, story, announcementDate)
        VALUES(p_animal_name, p_animal_type, p_breed, p_gender, p_animal_size, p_age,
               p_castrated, p_adopted, p_vaccinated, p_dewormed, p_temperament, p_socialization, p_address,
               p_city, p_contactName, p_contactEmail, p_contactPhone, p_image, p_fileName, p_color,
               p_story, p_announcementDate);

        DBMS_OUTPUT.PUT_LINE('Animal cadastrado com sucesso.');
    END save_animal;

    PROCEDURE set_animal_as_adopted (
        p_animal_id IN NUMBER
    ) AS
    BEGIN
        UPDATE Animal
        SET adopted = 1
        WHERE animal_id = p_animal_id;
    END set_animal_as_adopted;

    PROCEDURE get_animal_by_id (
        p_animal_id IN NUMBER,
        p_result OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_result FOR
            SELECT *
            FROM animal
            WHERE animal_id = p_animal_id;
    END get_animal_by_id;

    PROCEDURE get_animals_by_adopted_status (
        p_adopted IN NUMBER,
        p_result OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_result FOR
            SELECT *
            FROM animal
            WHERE adopted = p_adopted;
    END get_animals_by_adopted_status;
END animal_admin;
/

CREATE OR REPLACE PACKAGE adoption_admin AS
    PROCEDURE save_adoption(
        p_adopterName IN VARCHAR2,
        p_adopterAge IN VARCHAR2,
        p_adopterEmail IN VARCHAR2,
        p_adopterZipcode IN VARCHAR2,
        p_adopterAddress IN VARCHAR2,
        p_adopterPhone IN VARCHAR2,
        p_adopterTypeOfResidence IN VARCHAR2,
        p_adopterHouseHasAutomaticGate IN NUMBER,
        p_adopterHouseHasPool IN NUMBER,
        p_adopterHouseHasNetOnWindows IN NUMBER,
        p_adopterComments IN VARCHAR2,
        p_adopterQtyAnimals IN INT,
        p_adopterExperiences IN VARCHAR2,
        p_animalPlace IN VARCHAR2,
        p_adopterIsResponsible IN NUMBER,
        p_adopterIsAwareOfTheCosts IN NUMBER,
        p_peopleLivingInAdopterHouse IN INT,
        p_peopleIsAwareOfAdoption IN NUMBER,
        p_hasChildrenAtHouse IN NUMBER,
        p_animalAloneTime IN VARCHAR2,
        p_adoptionDate IN DATE,
        p_animalId IN NUMBER
    );

END adoption_admin;
/

CREATE OR REPLACE PACKAGE BODY adoption_admin AS
    PROCEDURE save_adoption(
        p_adopterName IN VARCHAR2,
        p_adopterAge IN VARCHAR2,
        p_adopterEmail IN VARCHAR2,
        p_adopterZipcode IN VARCHAR2,
        p_adopterAddress IN VARCHAR2,
        p_adopterPhone IN VARCHAR2,
        p_adopterTypeOfResidence IN VARCHAR2,
        p_adopterHouseHasAutomaticGate IN NUMBER,
        p_adopterHouseHasPool IN NUMBER,
        p_adopterHouseHasNetOnWindows IN NUMBER,
        p_adopterComments IN VARCHAR2,
        p_adopterQtyAnimals IN INT,
        p_adopterExperiences IN VARCHAR2,
        p_animalPlace IN VARCHAR2,
        p_adopterIsResponsible IN NUMBER,
        p_adopterIsAwareOfTheCosts IN NUMBER,
        p_peopleLivingInAdopterHouse IN INT,
        p_peopleIsAwareOfAdoption IN NUMBER,
        p_hasChildrenAtHouse IN NUMBER,
        p_animalAloneTime IN VARCHAR2,
        p_adoptionDate IN DATE,
        p_animalId IN NUMBER
    ) AS
    BEGIN
        INSERT INTO adoption(adopterName, adopterAge, adopterEmail, adopterZipcode,
                             adopterAddress, adopterPhone, adopterTypeOfResidence,
                             adopterHouseHasAutomaticGate, adopterHouseHasPool,
                             adopterHouseHasNetOnWindows, adopterComments, adopterQtyAnimals,
                             adopterExperiences, animalPlace, adopterIsResponsible,
                             adopterIsAwareOfTheCosts, peopleLivingInAdopterHouse,
                             peopleIsAwareOfAdoption, hasChildrenAtHouse, animalAloneTime,
                             adoptionDate, animalId)
        VALUES(p_adopterName, p_adopterAge, p_adopterEmail, p_adopterZipcode,
               p_adopterAddress, p_adopterPhone, p_adopterTypeOfResidence,
               p_adopterHouseHasAutomaticGate, p_adopterHouseHasPool,
               p_adopterHouseHasNetOnWindows, p_adopterComments, p_adopterQtyAnimals,
               p_adopterExperiences, p_animalPlace, p_adopterIsResponsible,
               p_adopterIsAwareOfTheCosts, p_peopleLivingInAdopterHouse,
               p_peopleIsAwareOfAdoption, p_hasChildrenAtHouse, p_animalAloneTime,
               p_adoptionDate, p_animalId);

        DBMS_OUTPUT.PUT_LINE('AdoÃ§Ã£o cadastrada com sucesso.');
    END save_adoption;

END adoption_admin;
/