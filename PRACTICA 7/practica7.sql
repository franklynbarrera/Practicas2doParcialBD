/*PREGUNTA 1

1.	Escriba una consulta que muestre el apellido y la fecha de contratación de cualquier empleado 
del mismo departamento que Zlotkey. Excluya a Zlotkey.

*/

/*SIN ZLOTKEY*/
SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE last_name = 'Zlotkey')
AND last_name <> 'Zlotkey' ORDER BY  EMPLOYEE_ID;


/*SIN ZLOTKEY METODO 2*/
SELECT E.LAST_NAME , E.HIRE_DATE FROM EMPLOYEES E

INNER JOIN EMPLOYEES E2 ON ( (E.DEPARTMENT_ID  = E2.DEPARTMENT_ID) AND (E2.LAST_NAME = 'Zlotkey') AND E.LAST_NAME <> 'Zlotkey')

ORDER BY E.EMPLOYEE_ID

;


/*PREGUNTA 2

2.	Cree una consulta para mostrar los números de empleado y los apellidos de todos
los empleados que ganen más del salario medio. Ordene los resultados por salario en orden ascendente.

*/


SELECT EMPLOYEE_ID, LAST_NAME, SALARY

FROM EMPLOYEES

WHERE SALARY > ( SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES )

ORDER BY SALARY ASC;


/*PREGUNTA 3

3.	Escriba una consulta que muestre los números de empleado y los apellidos de todos los empleados 
que trabajen en un departamento con cualquier empleado cuyo apellido contenga una u. 

*/


SELECT EMPLOYEE_ID, LAST_NAME 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE '%u%' )
;


/*PREGUNTA 4

4.	Muestre el apellido, el número de departamento y el identificador 
de cargo de todos los empleados cuyos identificadores de ubicación de departamento sean 1700.

*/

SELECT LAST_NAME, DEPARTMENT_ID, JOB_ID 

FROM EMPLOYEES

WHERE DEPARTMENT_ID IN( SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE LOCATION_ID = 1700);


/*PREGUNTA 5

5.	Muestre el apellido y el salario de todos los empleados que informen a King.

*/

SELECT LAST_NAME, SALARY FROM EMPLOYEES
WHERE MANAGER_ID IN( SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE LAST_NAME='King');

/*PREGUNTA 6

6.	Muestre el número de departamento, el apellido y el identificador de 
cargo de todos los empleados del departamento Executive.

*/

SELECT DEPARTMENT_ID, LAST_NAME , JOB_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME='Executive');


/*PREGUNTA 7


7.	Modifique la consulta 3 para mostrar los números de empleado, los apellidos y los salarios de todos
los empleados que ganan más del salario medio y que trabajan en un departamento con un empleado 
que tenga una u en su apellido

*/

SELECT EMPLOYEE_ID, LAST_NAME, SALARY 
FROM EMPLOYEES
WHERE ( DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE '%u%' ) )


AND SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

