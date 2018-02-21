/*PREGUNTA 1

1.	Escriba una consulta para visualizar el apellido del empleado, el número y 
el nombre de departamento para todos los empleados.

*/


SELECT E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


/*PREGUNTA 2

2.	Cree un listado único de todos los cargos que haya en el departamento 80. 
Incluya la ubicación del departamento en el resultado.


DISTINCT : PARA QUE LOS DATOS NO SE REPITAN, SE PONE AL LADO DEL QUE QUIERO QUE NO SE REPITA
           EN ESTE CASO EL CARGO JAMAS SE REPETIRA POR ESO ESTA AL LADO DEL CARGO
*/

SELECT DISTINCT E.JOB_ID "CARGO",D.DEPARTMENT_ID,D.LOCATION_ID, L.CITY FROM EMPLOYEES E 
                                                         INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID =D.DEPARTMENT_ID
                                                         INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
                                                         WHERE D.DEPARTMENT_ID = 80;
                                                         
                                                    
/*PREGUNTA 3

3.	Escriba una consulta para mostrar el apellido del empleado, el nombre de departamento, 
el identificador de ubicación y la ciudad de todos los empleados que perciben comisión.

*/

SELECT E.LAST_NAME,D.DEPARTMENT_NAME, D.LOCATION_ID,L.CITY, E.COMMISSION_PCT
                                    FROM EMPLOYEES E 
                                    INNER JOIN DEPARTMENTS D ON D.DEPARTMENT_ID=E.DEPARTMENT_ID  /*Ò INNER JOIN DEPARTMENTS D USING (DEPARTMENT_ID) */    
                                    INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
                                    WHERE E.COMMISSION_PCT IS NOT NULL ;
                                    
                                    
/*PREGUNTA 4

4.	Visualice el apellido del empleado y el nombre de departamento para todos los
empleados que tengan una a (minúsculas) en el apellido. 

*/

SELECT E.LAST_NAME, D.DEPARTMENT_NAME FROM EMPLOYEES E
                                      INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                                      WHERE E.LAST_NAME LIKE '%a%'; 
                                    
/*PREGUNTA 5

5.	Escriba una consulta para visualizar el apellido, el cargo, el número 
y el nombre de departamento para todos los empleados que trabajan en Toronto.

*/


SELECT E.LAST_NAME, E.JOB_ID,J.JOB_TITLE, E.DEPARTMENT_ID, D.DEPARTMENT_NAME , L.CITY
                                                FROM EMPLOYEES E
                                                INNER JOIN DEPARTMENTS D ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
                                                INNER JOIN LOCATIONS L ON L.LOCATION_ID = D.LOCATION_ID
                                                INNER JOIN JOBS J ON E.JOB_ID = J.JOB_ID
                                                WHERE L.CITY = 'Toronto';
                                            
/*PREGUNTA 6

6.	Visualice el apellido y el número del empleado junto con el apellido y el número de su director.
Etiquete las columnas como Employee, Emp#, Manager y Mgr#, respectivamente.


*/

SELECT E.LAST_NAME "EMPLOYEE",E.EMPLOYEE_ID "EMP#", MANAGER.EMPLOYEE_ID "MANAGER_ID", MANAGER.LAST_NAME "MANAGER"
                                        FROM EMPLOYEES E
                                        INNER JOIN EMPLOYEES MANAGER ON  E.MANAGER_ID=MANAGER.EMPLOYEE_ID;
                                        
/*PREGUNTA 7

7.	Modifique la consulta anterior para visualizar a todos los empleados incluyendo a King, 
que no tiene director. Ordene los resultados por número de empleado.

POR LA IZQUIERDA YA QUE STEVEN KING NO TIENE JEFE(null), ENTONCES ASI NO TENGA LO TOMO
INNER ES COMUN, LEFT ES EN ESTE CASO ES QUE EL EMPLEADO EXISTA ASI NO EXISTA JEFE

EMPLEADO ES LA IZQUIERDA, JEFE LA DERECHA COMO DIGRAMA DE VEEN A Y B
INNER COMUN INTERSECCION, LEFT ES IZQUIERDA A intersectado B'

POR LO TANTO CON INNER JAMAS ENCONTRARA EN COMUN UN ID DE MANAGER Y EMPLEADO
*/

SELECT CONCAT(E.FIRST_NAME, CONCAT(' ',E.LAST_NAME)) "EMPLOYEE",E.EMPLOYEE_ID "EMP#", E.MANAGER_ID"MANAGER_ID", MANAGER.LAST_NAME "MANAGER"
                                        FROM EMPLOYEES E
                                        LEFT JOIN EMPLOYEES MANAGER ON  E.MANAGER_ID=MANAGER.EMPLOYEE_ID
                                        ORDER BY E.EMPLOYEE_ID; 
                                        
                                        
/* PREGUNTA 8 OJOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO

8.	Cree una consulta que muestre apellidos de empleado, números de departamento y todos los empleados 
que trabajan en el mismo departamento que un empleado dado. Asigne a cada columna la etiqueta adecuada.

*/


SELECT E.LAST_NAME "EMPLEADO DADO",E.EMPLOYEE_ID, E2.LAST_NAME "<--MISMO DEPARTAMENTO QUE", E.DEPARTMENT_ID"NUMERO DEPARTAMENTO" 
                    FROM EMPLOYEES E 
                    INNER JOIN EMPLOYEES E2 ON (E.DEPARTMENT_ID = E2.DEPARTMENT_ID) AND E.LAST_NAME<>E2.LAST_NAME
                    
                    ORDER BY E.LAST_NAME ASC
                    ;
                    
                    
/*PREGUNTA 9

9.	Visualice la estructura de la tabla JOB_GRADES. Cree una consulta en la que pueda visualizar el nombre, 
el cargo, el nombre de departamento, el salario y el grado de todos los empleados.

*/

SELECT E.FIRST_NAME||' '|| E.LAST_NAME "NOMBRE",J.JOB_TITLE"CARGO", D.DEPARTMENT_NAME"NOMBRE DEL DEPARTAMENTO",E.SALARY"SALARIO"
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
INNER JOIN JOBS J ON (J.JOB_ID = E.JOB_ID) 
ORDER BY E.DEPARTMENT_ID;


/*PREGUNTA 10

10.	Cree una consulta para visualizar el apellido y la fecha de contratación 
de cualquier empleado contratado después del empleado Davies.

*/

SELECT E2.LAST_NAME,E2.HIRE_DATE 
FROM EMPLOYEES E 
INNER JOIN EMPLOYEES E2 ON (E2.HIRE_DATE>E.HIRE_DATE) AND E.LAST_NAME= 'Davies'
ORDER BY E2.HIRE_DATE;

/*PREGUNTA 11

11.	Visualice los nombres y las fechas de contratación de todos los empleados
contratados antes que sus directores, junto con los nombres y las fechas de contratación de estos últimos.
Etiquete las columnas como Employee, Emp Hired, Manager y Mgr Hired, respectivamente.

*/

SELECT E.FIRST_NAME || ' ' || E.LAST_NAME "NOMBRE EMPLEADO", E.HIRE_DATE"CONTRATACION EMPLEADO",
DIR.FIRST_NAME || ' ' || DIR.LAST_NAME "NOMBRE DIRECTOR",  DIR.HIRE_DATE"CONTRATACION DIRECTOR"

FROM EMPLOYEES E
INNER JOIN EMPLOYEES DIR ON (E.MANAGER_ID = DIR.EMPLOYEE_ID ) AND (E.HIRE_DATE < DIR.HIRE_DATE) 
ORDER BY E.HIRE_DATE;


;

