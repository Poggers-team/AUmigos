/*
O banco de dados a seguir tem como objetivo o armazenamento de informa��es
da aplica��o "ONG AUmigos", uma ONG que busca encontrar um lar para nossos
amigos peludos, o banco de dados � composto pelas tabelas app_user (usu�rio),
animal (animais resgatados), voluntary (volunt�rios para a ONG), adoption 
(pessoa que deseja adotar um animal), ademais para melhor organiza��o, as
opera��es foram armazenadas em pacotes (user_admin, animal_admin, voluntary_admin, 
adoption_admin), cada um respeitando sua responsabilidade de acordo com o objeto.
*/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE adoption CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE animal CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE voluntary CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE app_user CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE app_user_log CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP SEQUENCE user_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE voluntary_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE animal_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE adoption_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE app_user_log_seq';
    EXECUTE IMMEDIATE 'DROP PACKAGE user_admin';
    EXECUTE IMMEDIATE 'DROP PACKAGE voluntary_admin';
    EXECUTE IMMEDIATE 'DROP PACKAGE animal_admin';
    EXECUTE IMMEDIATE 'DROP PACKAGE adoption_admin';
    EXECUTE IMMEDIATE 'DROP TRIGGER trg_app_user_id';
    EXECUTE IMMEDIATE 'DROP TRIGGER trg_voluntary_id';
    EXECUTE IMMEDIATE 'DROP TRIGGER trg_animal_id';
    EXECUTE IMMEDIATE 'DROP TRIGGER trg_adoption_id';
    EXECUTE IMMEDIATE 'DROP TRIGGER trg_set_animal_as_adopted';
    EXECUTE IMMEDIATE 'DROP TRIGGER trg_app_user_log_id';
    EXECUTE IMMEDIATE 'DROP TRIGGER trg_app_user_log';
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
    color VARCHAR2(20) NOT NULL,
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

CREATE TABLE app_user_log (
    log_id NUMBER(20),
    user_id NUMBER(20),
    action_type VARCHAR2(10),
    action_timestamp TIMESTAMP,
    old_user_name VARCHAR2(50),
    old_email VARCHAR2(50),
    old_user_password VARCHAR2(50),
    old_dateOfBirth DATE,
    old_gender VARCHAR2(20),
    new_user_name VARCHAR2(50),
    new_email VARCHAR2(50),
    new_user_password VARCHAR2(50),
    new_dateOfBirth DATE,
    new_gender VARCHAR2(20)
);

CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE voluntary_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE animal_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE adoption_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE app_user_log_seq START WITH 1 INCREMENT BY 1;

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
-- Procedimento para salvar usu�rio
    PROCEDURE save_user (
        p_name_user IN VARCHAR2,
        p_email IN VARCHAR2,
        p_password IN VARCHAR2,
        p_dateOfBirth IN DATE,
        p_gender IN VARCHAR2
    ) AS
        v_count NUMBER; -- vari�vel para saber se o usu�rio j� existe
    BEGIN
        -- Chamando a fun��o user_exists e passando para a vari�vel v_count
        v_count := user_exists(p_email);

        /* Caso o usu�rio exista, � lan�ado uma exce��o,
        caso contr�rio o usu�rio � criado. */
        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-400, 'Usuário já cadastrado.');
        ELSE
            INSERT INTO app_user(user_name, email, user_password, dateOfBirth, gender)
            VALUES(p_name_user, p_email, p_password, p_dateOfBirth, p_gender);

            DBMS_OUTPUT.PUT_LINE('Usu�rio cadastrado com sucesso.');
        END IF;
    END save_user;

/* Procedimento que verifica se email e senha passados corresponde as informa��es
no banco para autenticar o login de um usu�rio */
    PROCEDURE get_user_by_email_and_password (
        p_email IN VARCHAR2,
        p_password IN VARCHAR2,
        p_cursor OUT SYS_REFCURSOR
    ) IS
    BEGIN
        -- Verifica por todo o banco verificando as credenciais
        OPEN p_cursor FOR
            SELECT user_id, user_name, email
            FROM app_user
            WHERE email = p_email AND user_password = p_password;
    END get_user_by_email_and_password;

-- Fun��o que procura se um usu�rio existe
    FUNCTION user_exists (
        p_user_email IN VARCHAR2
    ) RETURN NUMBER IS
        v_count NUMBER;
    BEGIN
        /* Se j� houver um email cadastrado ele retorna o contador,
        para confirmar que j� existe um usu�rio usando aquele email */
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
-- Procedimento para salvar um voluntário
    PROCEDURE save_voluntary (
        p_voluntary_name IN VARCHAR2,
        p_email IN VARCHAR2,
        p_phone IN VARCHAR2,
        p_availability IN VARCHAR2,
        p_skills IN CLOB
    ) AS
        v_count NUMBER;
    BEGIN
        -- Chamando a função voluntary_exists e passando para a variável v_count
        v_count := voluntary_exists(p_email);

        /* Caso o usuário exista, é lançado uma mensagem,
        caso contrário o voluntário é registrado. */
        IF v_count > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Volunt�rio j� cadastrado.');
        ELSE
            INSERT INTO voluntary(voluntary_name, email, phone, voluntary_availability, skills)
            VALUES(p_voluntary_name, p_email, p_phone, p_availability, p_skills);

            DBMS_OUTPUT.PUT_LINE('Volunt�rio cadastrado com sucesso.');
        END IF;
    END save_voluntary;

-- Função que procura se um volunt�rio existe
    FUNCTION voluntary_exists (
        p_voluntary_email IN VARCHAR2
    ) RETURN NUMBER IS
        v_count NUMBER;
    BEGIN
        /* Se já houver um email cadastrado ele retorna o contador,
        para confirmar que já existe um voluntário usando aquele email */
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

    FUNCTION get_animal (
        p_animal_id IN NUMBER
    );
    
    PROCEDURE get_animal_by_id (
        p_animal_id IN NUMBER,
        p_result OUT SYS_REFCURSOR
    );

/*
    PROCEDURE get_animal_by_id (
        p_animal_id IN NUMBER,
        p_result OUT SYS_REFCURSOR
    );
*/

    PROCEDURE get_animals_by_adopted_status (
        p_adopted IN NUMBER,
        p_result OUT SYS_REFCURSOR
    );
END animal_admin;
/

CREATE OR REPLACE PACKAGE BODY animal_admin AS
-- Procedimento para salvar um animal
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
        -- Para cadastrar um animal não é necessário validações
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

-- Procedimento que recupera um animal pelo seu id
    PROCEDURE get_animal_by_id (
        p_animal_id IN NUMBER,
        p_result OUT SYS_REFCURSOR
    ) AS
    BEGIN
        -- Chamada da fun��o get_animal para realizar a verifica��o
        p_result := get_animal(p_animal_id);
    END get_animal_by_id;
    
-- Fun��o para recuperar o animal
    FUNCTION get_animal (
        p_animal_id IN NUMBER
    ) RETURN SYS_REFCURSOR AS
        -- Cursor para armazenar o resultado da consulta
        v_cursor SYS_REFCURSOR;
    BEGIN
        /* Select na tabela animal para verificar se h� um
        animal com aquele id */
        OPEN v_cursor FOR
            SELECT * FROM animal WHERE animal_id = p_animal_id;
            
            IF NOT EXISTS (SELECT 1 FROM animal WHERE id = p_animal_id) THEN
                DBMS_OUTPUT.PUT_LINE('Animal n�o encontrado.');
            END IF;
        -- Retorna o cursor para o procedimento get_animal_by_id
        RETURN v_cursor;
    END get_animal;

/*
    PROCEDURE get_animal_by_id (
        p_animal_id IN NUMBER,
        p_result OUT SYS_REFCURSOR
    ) IS
    BEGIN
        -- Verifica por todo o banco se há um animal com o id passado
        OPEN p_result FOR
            SELECT *
            FROM animal
            WHERE animal_id = p_animal_id;
    END get_animal_by_id;
*/

-- Procedimento que verifica o status de adoção do animal
    PROCEDURE get_animals_by_adopted_status (
        p_adopted IN NUMBER,
        p_result OUT SYS_REFCURSOR
    ) IS
    BEGIN
        -- Verifica por todo o banco os animais já adotados
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
-- Procedimento para salvar as informações do responsável pelo animal
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
        -- Para cadastrar as informações do responsável não é necessário validações
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

        DBMS_OUTPUT.PUT_LINE('Adoção cadastrada com sucesso.');
    END save_adoption;
END adoption_admin;
/

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

CREATE OR REPLACE TRIGGER trg_set_animal_as_adopted
    AFTER INSERT ON adoption
    FOR EACH ROW
BEGIN
    UPDATE Animal
        SET adopted = 1
        WHERE animal_id = :NEW.animalId;
END;
/

CREATE OR REPLACE TRIGGER trg_app_user_log_id
    BEFORE INSERT ON app_user_log
    FOR EACH ROW
BEGIN
    :NEW.log_id := app_user_log_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER trg_app_user_log
AFTER INSERT OR UPDATE OR DELETE ON app_user
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO app_user_log (
            user_id, action_type, action_timestamp,
            new_user_name, new_email, new_user_password, new_dateOfBirth, new_gender
        ) VALUES (
            :NEW.user_id, 'CREATE', SYSTIMESTAMP,
            :NEW.user_name, :NEW.email, :NEW.user_password, :NEW.dateOfBirth, :NEW.gender
        );

    ELSIF UPDATING THEN
        INSERT INTO app_user_log (
            user_id, action_type, action_timestamp,
            old_user_name, old_email, old_user_password, old_dateOfBirth, old_gender,
            new_user_name, new_email, new_user_password, new_dateOfBirth, new_gender
        ) VALUES (
            :OLD.user_id, 'UPDATE', SYSTIMESTAMP,
            :OLD.user_name, :OLD.email, :OLD.user_password, :OLD.dateOfBirth, :OLD.gender,
            :NEW.user_name, :NEW.email, :NEW.user_password, :NEW.dateOfBirth, :NEW.gender
        );

    ELSIF DELETING THEN
        INSERT INTO app_user_log (
            user_id, action_type, action_timestamp,
            old_user_name, old_email, old_user_password, old_dateOfBirth, old_gender
        ) VALUES (
            :OLD.user_id, 'DELETE', SYSTIMESTAMP,
            :OLD.user_name, :OLD.email, :OLD.user_password, :OLD.dateOfBirth, :OLD.gender
        );
    END IF;
END;
/
