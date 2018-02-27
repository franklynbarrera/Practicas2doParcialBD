
/*PREGUNTA 1

1.	Cree una tabla DEPT basándose en el siguiente gráfico de
instancias de tabla. Confirme que se ha creado la tabla.

*/

CREATE TABLE DEP(

  id NUMBER(7),
  name VARCHAR2(25)



);

/*PREGUNTA 2


2.	Rellene la tabla DEPT con datos de la tabla DEPARTMENTS.
Incluya sólo columnas que necesite.

*/


INSERT INTO DEP SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM HR.DEPARTMENTS;

/*SELECT *FROM DEP;*/



/*PREGUNTA 3

3.	Cree una tabla EMP basándose en el siguiente gráfico
de instancias de tabla. Confirme que se ha creado la tabla.

*/

CREATE TABLE EMP (

  ID NUMBER(7),
  LAST_NAME VARCHAR2(25),
  FIRST_NAME VARCHAR2(25),
  DEPT_ID NUMBER(7)


);


/*PREGUNTA 4

4.	Modifique la tabla EMP para permitir un apellido de empleado más largo. Confirme la modificación.

*/

ALTER TABLE EMP MODIFY LAST_NAME VARCHAR2(30);



/*PREGUNTA 5

5.	Confirme que las tablas DEPT y EMP se almacenan en el diccionario de datos. (Indicación: USER_TABLES)

*/


SELECT *FROM USER_TABLES WHERE TABLE_NAME='EMP' OR TABLE_NAME='DEP';


/*PREGUNTA 6

6.	Cree la tabla EMPLOYEES2 basándose en la estructura de la tabla EMPLOYEES.
 Incluya solo las columnas EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY y DEPARTMENT_ID.
 Llame a las columnas de la nueva tabla ID, FIRST_NAME, LAST_NAME, SALARY y DEPT_ID, respectivamente.

*/


CREATE TABLE EMPLOYEES2 AS SELECT EMPLOYEE_ID ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID DEPT_ID FROM HR.EMPLOYEES;


/*PREGUNTA 7

7.	Borre la tabla EMP

*/

DROP TABLE EMP;


/*PREGUNTA 8

8.	Cambie el nombre de la tabla EMPLOYEES2 a EMP.

*/

RENAME EMPLOYEES2 TO EMP;


/*PREGUNTA 9

9.	Agregue un comentario a las definiciones
 de las tablas DEPT y EMP que describa las tablas. Confirme las adiciones en el diccionario de datos.


Para obtener datos de una o varias tablas en Oracle, ya sea columnas, tipos de dato, comentarios, largo máximo, etc. se pueden consultar a las siguientes tablas de sistema :

ALL_TABLES : para obtener datos de las tablas.
ALL_TAB_COLUMNS : para obtener datos de las columnas.
ALL_COL_COMMENTS : para obtener los comentarios ingresados a las columnas

EN EL *FROM PUEDO HACER CON Y VER ATRIBUTOS A CONSULTAR:

ALL_COL_COMMENTS, USER_COL_COMMENTS, ALL_TAB_COMMENTS, USER_TAB_COMMENTS
*/


COMMENT ON TABLE EMP IS 'Tabla de Empleados de la Empresa';

COMMENT ON TABLE DEP IS 'Tabla de Departamentos de la Empresa';

SELECT *FROM ALL_TAB_COMMENTS WHERE TABLE_NAME='EMP' OR TABLE_NAME='DEP';