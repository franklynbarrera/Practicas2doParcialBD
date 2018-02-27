/*PREGUNTA 1

1.	Ejecute la siguiente sentencia

*/


CREATE TABLE my_employee
(

id NUMBER(4) CONSTRAINT my_employee_id_nn NOT NULL,
last_name VARCHAR2(25),
first_name VARCHAR2(25),
userid VARCHAR2(8),
salary NUMBER(9,2)

);


/*PREGUNTA 2

2.	Describa la estructura de la tabla MY_EMPLOYEE para identificar los nombres de columna.

*/

DESCRIBE MY_EMPLOYEE;

/*PREGUNTA 3

3.	Agregue la primera fila de datos a la tabla MY_EMPLOYEE
 desde los siguientes datos de ejemplo. No enumere las columnas en la cláusula INSERT.



*/

INSERT INTO MY_EMPLOYEE VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);


/*PREGUNTA 4

4.	Rellene la tabla MY_EMPLOYEE con la segunda fila de los
    datos de ejemplo de la lista anterior. Esta vez,
    enumere las columnas explícitamente en la cláusula

*/

INSERT INTO MY_EMPLOYEE (ID, LAST_NAME, FIRST_NAME,USERID,SALARY) VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);


/*PREGUNTA 5

5.	Confirme la adición a la tabla.

*/

SELECT *FROM MY_EMPLOYEE;


/*PREGUNTA 6

6.	Escriba una sentencia INSERT en un archivo de texto llamado loademp.sql para cargar filas en la tabla MY_EMPLOYEE.
Concatene la primera letra del nombre con los primeros siete caracteres del apellido para crear el identificador de usuari

*/

/*
CREATE TABLESPACE testing DATAFILE './testing.dbf' SIZE 50M;

CREATE USER franklyn identified by barreras
TABLESPACE testing;

Grant dba to Franklyn;*/




/*

Para AGREGAR UNA COLUMNA en una tabla, la sintaxis de Oracle ALTER TABLE es:

ALTER TABLE table_name
  ADD column_name column-definition;

*/

