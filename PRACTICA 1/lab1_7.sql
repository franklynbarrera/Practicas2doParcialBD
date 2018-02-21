/*
PREGUNTA 1, ENCONTRAR LOS 4 ERRORES

SELECT employee_id, last_name sal x 12 ANNUAL SALARY FROM employees;

*/

SELECT employee_id, last_name, SALARY*12 "ANNUAL SALARY" FROM employees;


/*

PREGUNTA 2

2.	Muestre la estructura de la tabla DEPARTMENTS. Seleccione todos los datos

*/

SELECT *FROM DEPARTMENTS;


/*

PREGUNTA 3

3.	Muestre la estructura de la tabla EMPLOYEES. Cree una consulta para mostrar el apellido, el código de cargo, 
la fecha de contratación y el número de empleado para cada empleado, con el número de empleado en primer lugar. 
Proporcione un alias para la columna. Guarde la sentencia SQL en un archivo llamado lab1_7.sql.

*/

SELECT  EMPLOYEE_ID "ALIAS DE COLUMNA",LAST_NAME, JOB_ID, HIRE_DATE  FROM EMPLOYEES;

/*

PREGUNTA 5

5.	Cree una consulta para mostrar códigos de cargo únicos de la tabla EMPLOYEES.

*/

SELECT DISTINCT JOB_ID FROM EMPLOYEES;

/*

PREGUNTA 6

6.	Copie la sentencia de lab1_7.sql en la ventana iSQL*Plus Edit. Llame a las
cabeceras de columna Emp #, Employee, Job y Hire Date, respectivamente. 
Vuelva a ejecutar la consulta.

*/

SELECT  EMPLOYEE_ID "Emp #",LAST_NAME "Employee ", JOB_ID "Job", HIRE_DATE "Hire Date"  FROM EMPLOYEES;


/*

PREGUNTA 7

7. Muestre el apellido concatenado con el identificador de cargo, 
separados por una coma y un espacio y llame a la columna Employee and Title.

*/

/*SELECT CONCAT(LAST_NAME, JOB_ID) "Employee And Title" FROM EMPLOYEES;*/

SELECT CONCAT(LAST_NAME, CONCAT(' , ', JOB_ID) ) "Employee And Title" FROM EMPLOYEES;

