/*PREGUNTA 1

1.	Enumere los identificadores de departamento para departamentos que 
no contienen el cargo ID ST_CLERK, mediante operadores SET.


A TODOS LOS DEPARTAMENTOS LES QUITO LOS QUE TIENE  ESE CARGO
*/


SELECT DEPARTMENT_ID FROM DEPARTMENTS
MINUS
SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE JOB_ID = 'ST_CLERK'; 



/*PREGUNTA 2

2.	Mediante operadores SET, visualice el identificador de pa�s
y el nombre de los pa�ses que no tengan departamentos ubicados en ellos.

*/

SELECT CO.COUNTRY_ID, CO.COUNTRY_NAME FROM COUNTRIES CO

MINUS(

SELECT C.COUNTRY_ID,C.COUNTRY_NAME

FROM COUNTRIES C

INNER JOIN LOCATIONS L ON C.COUNTRY_ID = L.COUNTRY_ID
INNER JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID

);

/*PREGUNTA 3

3.	Cree una lista de puestos para los
departamentos 10, 50 y 20, en ese orden. Visualice el identificador de cargo y
de departamento, mediante operadores SET.

*/
SELECT *FROM(

  SELECT
     DEPARTMENT_ID,
     JOB_ID
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID = '10'
  UNION(
   SELECT
     DEPARTMENT_ID,
     JOB_ID
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID = '50'
  )
   UNION
   (
     SELECT
       DEPARTMENT_ID,
       JOB_ID
     FROM EMPLOYEES
     WHERE DEPARTMENT_ID = '20'
  )
)

ORDER BY DECODE(DEPARTMENT_ID, 10,0,20,2,50,1)
;


/*PREGUNTA 4

4.	Enumere los identificadores de empleado y de cargo de los
empleados que actualmente tengan el cargo que ocupaban antes de comenzar a trabajar con la compañía.

*/

SELECT EMPLOYEE_ID,JOB_ID FROM EMPLOYEES
INTERSECT
SELECT EMPLOYEE_ID,JOB_ID FROM JOB_HISTORY;


/*PREGUNTA 5

5.	Escriba una consulta compuesta que enumere:

•	Apellidos e identificadores de departamento de todos los empleados de
la tabla EMPLOYEES, independientemente de si pertenecen o no a algún departamento

•	Identificador y nombre de departamento de todos los departamentos
de la tabla DEPARTMENTS, independientemente de si tienen o no empleados trabajando en ellos.


*/

SELECT LAST_NAME, DEPARTMENT_ID, TO_CHAR(null) DEPARTMENT_NAME FROM EMPLOYEES
UNION
SELECT TO_CHAR(null) LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPARTMENTS;