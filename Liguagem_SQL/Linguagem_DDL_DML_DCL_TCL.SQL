-- Language definitions: Language Statements

/*
 The SQL language is divided into four primary language statement typesDML, DDL, DCL and TCL
 Using these statements, we can define the structure of a database by creating and modifying
 database objects, and we can manipulate data in a table by updating or deleting it.
 We can also control which user can read/write data or manage operations
 */

-- DML (Data Manipulation Language)

-- DDL (Data Definition Language)

-- DCL (Data Control Language)

-- TCL (Transaction Control Language)

-- LANGUAGE STATEMENTS

/*  DML         DDL         DCL         TCL
 SELECT      CREATE      GRANT       START TRANSACTION
 INSERT      ALTER       REVOKE      COMMIT      
 INSERT      DROP                    SAVEPOINT
 INSERT      TRUNCATE                ROLLBACK
 */

/*
 SELECT - Retrieve data from the database
 INSERT - Insert existing data into a table
 INSERT - Update existing data in a table
 INSERT - Delete a record from a table
 */

-- DDL table creation exercises

create Table
    FUNCIONARIOS (
        ID INT NOT NULL AUTO_INCREMENT,
        NOME VARCHAR(50) NOT NULL,
        SALARIO DECIMAL(10, 2),
        SETOR VARCHAR(30),
        PRIMARY KEY (id)
    );

-- DML SELECT

-- Example SELECT

SELECT * from `FUNCIONARIOS`;

SELECT nome, setor, `SALARIO` AS depto FROM `FUNCIONARIOS`;

--DML INSERT

INSERT INTO
    `FUNCIONARIOS` (`NOME`, `SALARIO`, `SETOR`)
VALUES ('Edson', 1000, ''), ('Carlos', 2000, ''), ('Alexandra', 3000, '');

-- OR

INSERT INTO `FUNCIONARIOS`(NOME, SALARIO) VALUES ('Lucas', 1000);

--DML UPDATE

UPDATE `FUNCIONARIOS` SET `SALARIO` = 1500 WHERE id=1;

-- OR 50% increase on current salary

UPDATE `FUNCIONARIOS` set `SALARIO`=`SALARIO`*1.5 WHERE id='1';

-- example update with more than one field

UPDATE `FUNCIONARIOS`
set
    `SALARIO` = `SALARIO` * 1.5,
    `SETOR` = 'TI'
WHERE id <> '1';

--DML DELETE

DELETE FROM `FUNCIONARIOS` WHERE id='3';

-- ----------------------------------------------------------------------------------------------------------------

-- DDL (Data Definition Language)

/*
 CREATE  - to create objects in the database, the database itself, tables, indexes, procedures, views, functions and triggers
 ALTER   - Change the structure of the database, the database itself, tables, indexes
 DROP    - Delete objects from the database, the database itself, tables, indexes, views, functions and triggers
 TRUNCATE- Remove all records from a table, including all the spaces allocated for the records are removed 
 */

-- DDL CREATE TABLE

CREATE TABLE
    funcionario (
        matricula INT NOT null AUTO_INCREMENT,
        nome VARCHAR(50) NOT null,
        sobrenome VARCHAR(50) NOT null,
        endereco VARCHAR(50),
        cidade VARCHAR(50),
        pais VARCHAR(25),
        data_nasc DATETIME,
        PRIMARY KEY(matricula)
    );

-- DDL CREATE TABLE WITH KEY FOREIGN

CREATE TABLE
    salario (
        matricula INT NOT NULL,
        salario DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (matricula) REFERENCES funcionario (matricula)
    );

-- DDL CREATE TABLE WITH KEY FOREIGN

CREATE TABLE
    audit_salario (
        transacao INT NOT NULL AUTO_INCREMENT,
        matricula INT NOT NULL,
        data_trans DATETIME NOT NULL,
        sal_antigo DECIMAL(10, 2),
        sal_novo DECIMAL(10, 2),
        Usuario VARCHAR(20) NOT NULL,
        PRIMARY KEY(transacao),
        FOREIGN KEY (matricula) REFERENCES funcionario (matricula)
    );

-- DDL CRIACAO DE INDEX

CREATE INDEX ix_func1 ON funcionario(data_nasc) 

-- DDL CRIACAO DE INDEX

CREATE INDEX ix_func2 ON funcionario(cidade, pais) 

-- ADD NEW FIELD THE TABLE

ALTER TABLE funcionario ADD genero CHAR(1);

-- REMOVING COLUMN FIELD FROM TABLE

ALTER TABLE funcionario CHANGE genero sexo CHAR(1);

-- RETURNED TO PREVIOUS SITUATION

ALTER TABLE funcionario CHANGE sexo genere CHAR(1);

-- RENAME TABLE

RENAME TABLE funcionario TO pessoa;

-- RENAME TABLE

rename TABLE pessoa to funcionario;

-- DDL FOR ADD COLLUN THE TAB SENSO

ALTER TABLE senso ADD ID INT;

-- DDL FOR ADD KEY PRIMARY THE TAB SENSO OUTO_INCREMENT

ALTER TABLE senso MODIFY COLUMN ID INT AUTO_INCREMENT PRIMARY KEY;

-- ALTER TYPE DA COLLUN

ALTER TABLE funcionario MODIFY COLUMN endereco VARCHAR(30);

-- DELETE FIELD COLUMN

ALTER TABLE funcionario DROP COLUMN genero;

-- ALTER ENGINE TABLE

ALTER TABLE senso ENGINE = MyIsam;

-- DDL CREATE DATABASE

CREATE DATABASE TESTE;

-- DELETE DATABASE

DROP DATABASE TESTE;

-- DELETE TABLE

DROP TABLE salario;

-- CREATE THE VIEW

CREATE VIEW V_funcionario as SELECT * from `FUNCIONARIOS`;

-- MODIFYING VIEW VIEW

ALTER VIEW `V_funcionario` AS SELECT ID,NOME FROM FUNCIONARIOS;

-- DROP VIEW

DROP VIEW `V_funcionario`;

-- DROP INDEX

DROP INDEX ix_func1 ON FUNCIONARIOS;

-- CREATE INDEX

CREATE INDEX ix_func1 ON FUNCIONARIOS(NOME) 

-- CREATE PROCEDURE

DELIMITER $$
CREATE PROCEDURE
    proc_quadrado (INOUT numero INT) BEGIN
SET numero = numero * numero;

END $$ DELIMITER;

-- EXECUTED PROCEDURE
SET @valor = 5;
CALL proc_quadrado (@valor);
SELECT @valor;


-- DROP PROCEDURE
DROP PROCEDURE proc_quadrado;
