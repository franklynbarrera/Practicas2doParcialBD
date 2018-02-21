/*TEORICO

1.	Las funciones de grupo pasan por muchas filas para producir un resultado por grupo.
Verdadero/Falso  --> Verdadero

2.	Las funciones de grupo incluyen nulos en los cálculos.
Verdadero/Falso   --> Falso

3.	La cláusula WHERE restringe las filas antes de su inclusión en un cálculo de grupo.
Verdadero/Falso  --> Verdadero


*/


/*PREGUNTA 4

4.	Visualice el salario mayor, el menor, la suma y el salario medio de todos los empleados.
Etiquete las columnas Maximum, Minimum, Sum y Average, respectivamente.
Redondee los resultados hacia el número entero más próximo.

*/


SELECT ROUND(MAX(salary),0) "Maximum",
       ROUND(MIN(salary),0) "Minimum",
       ROUND(SUM(salary),0) "Sum",
       ROUND(AVG(salary),0) "Average"
FROM EMPLOYEES;


/*

5.	Modifique la consulta anterior para visualizar el salario mínimo, 
el máximo, la suma y el salario medio para cada tipo de cargo


NOTA: Al querer mostrar job_id son muchos, sucede que round(max(salary),0)
devuelve una sola columna en general de todo el maximo de los salarios
al igual que los demas, asi que queda inconsistente que por ejemplo
hayan 300 cargos, entonces de los demas 1 y 1 
las filas no van a tener con que llenarse, entonces hago un group by
de job_id, asi no dejara repetir un cargo
y por cada cargo calculara un valor de maximo, de minimo y de todo
asi no tendre inconsistecia 

ejm sin group by:

SA_REP          11500       6100     250500       8350
MK_REP            
ST_CLERK        
HR_REP          


hay mas jobs_id y un solo valor de todo, con group by limita q no sea un solo valor
si no que por cada cargo vaya y calcule todo para ese cargo en especifico de todos
los que se repitan saca un solo valor sin repeticion

SA_REP          11500       6100     250500       8350
MK_REP           6000       6000       6000       6000
ST_CLERK         3600       2100      55700       2785
HR_REP           6500       6500       6500       6500


*/

SELECT JOB_ID,
       ROUND(MAX(salary),0) "Maximum",
       ROUND(MIN(salary),0) "Minimum",
       ROUND(SUM(salary),0) "Sum",
       ROUND(AVG(salary),0) "Average"
FROM EMPLOYEES
GROUP BY JOB_ID
;

/*PREGUNTA 6

6.	Escriba una consulta para visualizar el número de personas con el mismo cargo.

Aqui sucede lo mismo, si dejo sin group by

job_id hay muchos, el count solo da un valor, quedan inconsistentes las lineas
entonces le digo mira hazme todo por grupos de job_id, asi por cada job_id
que consiga, calcula los count para ese solo en especifico (sin repetir el 
se encarga de que nada se repita)

*/

SELECT JOB_ID,COUNT(*) FROM EMPLOYEES GROUP BY JOB_ID;


/*PREGUNTA 7

7.	Determine el número de directores sin enumerarlos. Etiquete la columna como Number of Managers. 
Indicación: Utilice la columna MANAGER_ID para determinar el número de directores.

si lo hago con group by
SELECT COUNT(MANAGER_ID)"Number of Managers" FROM EMPLOYEES GROUP BY MANAGER_ID;

me da por cada tipo de manager las veces que esta, arma grupo de manager
y necesito es una cantidad fija por lo tanto
*/

SELECT COUNT(DISTINCT MANAGER_ID)"Number of Managers" FROM EMPLOYEES;


/*PREGUNTA 8

8.	Escriba una consulta para visualizar la diferencia entre el salario mayor y el menor. 
Etiquete la columna DIFFERENCE.

*/

SELECT ( MAX(SALARY) - MIN(SALARY) ) "DIFFERENCE" FROM EMPLOYEES;


/*PREGUNTA 9

9.	Visualice el número de director y el salario del empleado de menor sueldo para dicho director.

NOTA: group by debe tener los mismos atributos que los grupos que quiero armar, que no se repitan
en este caso yo queria qe por cada nombre(director) mostrara un solo sueldo menor
al yo poner que queria saber el id del director ese tambien tiene que ser parte del grupo
para que sea uno solo y no varios

*/

SELECT E.FIRST_NAME||' '||E.LAST_NAME"NOMBRE DEL DIRECTOR", E.EMPLOYEE_ID"ID DIRECTOR", MIN(E2.SALARY)"EMPLEADO CON MENOR SUELDO" FROM EMPLOYEES E

INNER JOIN EMPLOYEES E2 ON E.EMPLOYEE_ID = E2.MANAGER_ID

GROUP BY E.FIRST_NAME||' '||E.LAST_NAME, E.EMPLOYEE_ID

ORDER BY E.EMPLOYEE_ID

;


/*PREGUNTA 10

10.	Excluya a todas las personas con director desconocido. 
Excluya los grupos donde el salario mínimo sea $6.000 o inferior.
Ordene el resultado en orden descendente de salario.


TOCO USAR HAVING Y NO TODO EN EL WHERE YA QUE POR EL GROUP BY MOLESTA
ENTONCES VALIDO UNA CONDICION CON WHERE Y OTRA CON HAVING (TENIENDO)
*/

SELECT MANAGER_ID, MIN(SALARY) 

FROM EMPLOYEES

WHERE (MANAGER_ID IS NOT NULL)

GROUP BY MANAGER_ID

HAVING MIN(SALARY) > 6000

ORDER BY MIN(SALARY) DESC
;


/*PREGUNTA 11

11.	Escriba una consulta para visualizar el nombre, la ubicación, el número de empleados
y el salario medio de todos los empleados de cada departamento. Etiquete las columnas como Name, Location, Number of People y Salary, 
respectivamente. Redondee el salario medio en dos posiciones decimales.

*/


SELECT D.DEPARTMENT_NAME "Name", D.LOCATION_ID  "Location" ,COUNT(E.EMPLOYEE_ID) "Number of People" ,ROUND(AVG(E.SALARY),2)"Salary" FROM DEPARTMENTS D

INNER JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 

GROUP BY D.DEPARTMENT_NAME, D.LOCATION_ID




;

/*PREGUNTA 12

12.	Cree una consulta que muestre el número total de empleados y, de ese total, el número de 
empleados contratados en 1995, 1996, 1997 y 1998. Cree las cabeceras de columna adecuadas.

*/

/*EJM, suma . si hire_date es 2005 suma 1, si no suma 0

con to_char extraigo el solo año para asi compararlo y ver si es el qe quiero y sumarlo
*/
SELECT COUNT(*) TOTAL,
       SUM(DECODE(TO_CHAR(hire_date,'YYYY'),2005,1,0))"2005",
       
       SUM(DECODE(TO_CHAR(hire_date,'YYYY'),2006,1,0))"2006",
       
       SUM(DECODE(TO_CHAR(hire_date,'YYYY'),2007,1,0))"2007",
       
       SUM(DECODE(TO_CHAR(hire_date,'YYYY'),2008,1,0))"2008"

FROM EMPLOYEES;


/*PREGUNTA 13


13.	Cree una consulta matriz para visualizar el cargo, el salario para dicho cargo basado en el número de departamento
y el salario total para dicho cargo, para los departamentos 20, 50, 80 y 90, asignando a cada columna la cabecera apropiada

*/

SELECT JOB_ID "CARGO",

       SUM(DECODE(DEPARTMENT_ID, 20, SALARY,0)) "Departamento 20",
       SUM(DECODE(DEPARTMENT_ID, 50, SALARY,0)) "Departamento 50",
       SUM(DECODE(DEPARTMENT_ID, 80, SALARY,0)) "Departamento 80",
       SUM(DECODE(DEPARTMENT_ID, 90, SALARY,0)) "Departamento 90",
       SUM(SALARY) "TOTAL"
       
FROM EMPLOYEES

GROUP BY JOB_ID;