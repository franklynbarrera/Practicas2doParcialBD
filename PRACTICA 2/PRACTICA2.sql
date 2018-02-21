/*

PREGUNTA 1

1.	Cree una consulta para mostrar el apellido y el salario de los empleados que ganan más de $12.000. 

*/

SELECT LAST_NAME, FIRST_NAME, SALARY FROM EMPLOYEE WHERE SALARY>12000;


/*

PREGUNTA 2

2.	Cree una consulta para mostrar el apellido del empleado y el número de departamento para el número de empleado 176.

*/

SELECT FIRST_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID=176;


/*

PREGUNTA 3

3.	Modifique el ejercicio 1 para mostrar el apellido y el salario para todos
los empleados cuyos salarios no están comprendidos entre $5.000 y $12.000.

*/

SELECT LAST_NAME, SALARY  FROM EMPLOYEES WHERE SALARY BETWEEN 5000 AND 12000;

/*

PREGUNTA 4

4.	Muestre el apellido del empleado, el identificador de cargo y la fecha de inicio 
de los empleados contratados entre el 20 de febrero de 1998 y el 1 de mayo de 1998.
Ordene la consulta en orden ascendente por fecha de inicio.

*/

SELECT LAST_NAME, JOB_ID, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '20/02/98' AND '01/05/98' ORDER BY HIRE_DATE ASC;

/*

PREGUNTA 5

5.	Muestre el apellido y el número de departamento de todos los empleados de 
los departamentos 20 y 50 en orden alfabético por 

*/

SELECT LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID=20 OR DEPARTMENT_ID=50  ORDER BY LAST_NAME ASC;


/*

PREGUNTA 6

6.	Modifique el ejercicio 3 para enumerar el apellido y el salario de los 
empleados que ganan entre $5.000 y $12.000, y están en el departamento 
20 ó 50. Etiquete las columnas Employee y Monthly Salary, respectivamente. 

*/


SELECT LAST_NAME, DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE (SALARY BETWEEN 5000 AND 12000) AND (DEPARTMENT_ID=20 OR DEPARTMENT_ID=50) ;


/*

PREGUNTA 7

7.	Muestre el apellido y la fecha de contratación de todos los empleados contratados en 1994. 

NOTA: TODAS LAS FECHAS PROBAR CON OTRO AÑO, LOS 1900 NO SALEN, AQUI POR EJM PROBE EN EL 03

*/

SELECT LAST_NAME, HIRE_DATE FROM EMPLOYEES WHERE (HIRE_DATE BETWEEN '01/01/03' AND '31/12/03'); 


/*

PREGUNTA 8

8.	Muestre el apellido y el cargo de todos los empleados que no tienen director.


*/

SELECT LAST_NAME, JOB_ID FROM EMPLOYEES WHERE MANAGER_ID IS NULL;


/*

PREGUNTA 9

9.	Muestre el apellido, el salario y la comisión para todos los empleados que ganan comisiones. 
Ordene los datos en orden descendente de salarios y comisiones.

*/


SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL ORDER BY SALARY DESC, COMMISSION_PCT DESC;

/*

PREGUNTA 10

10.	Muestre el apellido de todos los empleados que tengan la a como tercera letra.

*/



SELECT LAST_NAME FROM EMPLOYEES ;
SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '__a%';

/*
PREGUNTA 11

11.	Muestre el apellido de todos los empleados que tengan una a y una e en el apellido.

*/


SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '%ae%';

/*
EXTRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

NOTAA: BEWTEEN ES UN RANGO,    AND ES LA UNA Y LA OTRA JIJIJI


ENCONTRAR UNA A Y UNA E EN CUALQUIER LADO 

SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '%e%' AND LAST_NAME LIKE '%a%';


*/




/*
PREGUNTA 12

12.	Muestre el apellido, el cargo y el salario de todos los empleados cuyos cargos sean representantes de 
ventas o encargados de stock y cuyo salario no sean iguales a $2.500, $3.500 ni $7.000.


NOTAAA: ESA PAJA ES COMO EL OR EL UNO O EL OTRO JIIJIJI
METODO3 YOO_:3

SELECT LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE ( JOB_ID IN ('SA_MAN','ST_MAN') ) AND (SALARY <>2500 AND SALARY <>3500 AND SALARY <>7000);


*/




SELECT LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE ( JOB_ID IN ('SA_MAN','ST_MAN') ) AND (SALARY  NOT IN (2500,3500,7000));


/*
PREGUNTA 13

13.	Modifique el ejercicio 6 para mostrar el apellido, el salario y la comisión
para todos los empleados cuyas comisiones son el 20 %. 

*/

SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM EMPLOYEES WHERE COMMISSION_PCT*100 >20;
