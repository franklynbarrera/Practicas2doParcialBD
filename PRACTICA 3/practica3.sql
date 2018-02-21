/*
select extract(month from sysdate) from dual;
 
select to_char('10/10/2007')from dual;
 


PARA FECHAS Y HORAS

*/
  
  /*SOLO FECHA , PARA SOLO HORA ES
  
   SELECT current_timestamp FROM dual;
  */
  

/*PREGUNTA 1

1.	Escriba una consulta para mostrar la fecha actual. Etiquete la columna como Date.

*/

SELECT current_date "Date" FROM dual; /*O PONGO SYSDATE POR CURRENT_DATE*/

/*PREGUNTA 2

2.	Para cada empleado, visualice su número, apellido, salario y salario incrementado en el 15 % 
y expresado como número entero. Etiquete la columna como New Salary. 

*/


SELECT EMPLOYEE_ID, LAST_NAME,SALARY, SALARY + (SALARY*15)/100 "NEW SALARY" FROM EMPLOYEES;


/*PREGUNTA 3

3.	Modifique la consulta del ejercicio 2 para agregar una columna que reste el salario antiguo 
del nuevo. Etiquete la columna como Increase. 

*/

SELECT EMPLOYEE_ID, LAST_NAME,SALARY, SALARY + (SALARY*15)/100 "NEW SALARY" , (SALARY*15/100) "Increase" FROM EMPLOYEES;

/*PREGUNTA 4

4.	Escriba una consulta que muestre los apellidos de los empleados con la primera letra en mayúsculas
y todas las demás en minúsculas, así como la longitud de los nombres,
para todos los empleados cuyos nombres comienzan por J, A o M. Asigne a
cada columna la etiqueta correspondiente.
Ordene los resultados según los apellidos de los empleados.

*/

SELECT initcap(LAST_NAME)"PRIMERA LETRA MAYUSCULA", length(LAST_NAME)"LONGITUD" FROM EMPLOYEES WHERE (LAST_NAME LIKE 'A%' OR LAST_NAME LIKE 'J%' OR LAST_NAME LIKE 'M%') ORDER BY LAST_NAME ASC;


/*PREGUNTA 5

5.	Para cada empleado, muestre su apellido y calcule el número de meses entre el día de 
hoy y la fecha de contratación. Etiquete la columna como MONTHS_WORKED. Ordene los resultados
según el número de meses trabajados. Redondee el número de meses
hacia arriba hasta el número entero más próximo.


CEIL; REDONDEA PARA QUE NO DE QUE SI 2,2
*/

SELECT LAST_NAME, CEIL (MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) MONTHS_WORKED FROM EMPLOYEES ORDER BY MONTHS_WORKED DESC;

/*

PREGUNTA 6

6.	Escriba una consulta que produzca lo siguiente para cada empleado: <employee last name> 
earns <salary> monthly but wants<3 times salary>. Etiquete la columna como Dream Salaries.

metodo pro:

SELECT (LAST_NAME || ' EARNS ' || SALARY || ' monthly but wants <3 times salary') AS DREAM_SALARY FROM EMPLOYEES;
*/

SELECT CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT('<', LAST_NAME), '>') , ' earns'), ' <' ), SALARY ) ,'>' ), ' monthly but wants <'), SALARY*3), '>') DREAM_SALARY  FROM EMPLOYEES;


/*PREGUNTA 7

7.	Cree una consulta para mostrar el apellido y el salario de todos los empleados. 
Formatee el salario para que tenga 15 caracteres, 
rellenando a la izquierda con $. Etiquete la columna como SALARY.

NOTA: LPAD(EXPR1, N, EXPRE2);
      RPAD ES POR LA DERECHA

LA EXPR1 LA RELLENA POR LA IZQUIERDA CON EXPRE2, N CANTIDAD DE VECES
SI N ES 15 LO HACE HASTA FORMAR UNA LONGITUD DE 15 EN TOTAL

*/

SELECT LAST_NAME,LPAD(SALARY, 15, '$') SALARY FROM EMPLOYEES;


/*PREGUNTA 8

8.	Muestre el apellido de cada empleado, así como la fecha de contratación y la fecha de 
revisión de salario, que es el primer lunes después de cada seis meses de servicio.
Etiquete la columna REVIEW. Formatee las 
fechas para que aparezca en un formato similar a Monday, the Thirty-First of July, 2000”.

*/

/*SELECT hire_date, TO_CHAR( ADD_MONTHS(hire_date,1), 'DD-MON-YYYY') "Next month" FROM employees;
1 mes despues de la fecha
*/

/*DDSPTH es formato de dia con ordina, que si "treina-uno

to_char: transforma una fecha en algun tipo de formato que quiera (fecha, formato)
next_day: una fecha proxima a lo que le diga ('31-10-2007', 2).. devuelve el martes mas cercano a esa fecha
            2: martes
            
add_months: recibe una fecha y meses a subir (fecha, 6) .. una fecha le subo 6 meses 
*/
SELECT LAST_NAME, HIRE_DATE, TO_CHAR(NEXT_DAY(ADD_MONTHS(HIRE_DATE,6),1),'DAY," the" DDSPTH "of" MONTH ,YYYY') REVIEW FROM EMPLOYEES;



/*PREGUNTA 9
9.	Muestre el apellido, la fecha de contratación y el día de la semana en el que comenzó el empleado. Etiquete la columna DAY. 
Ordene los resultados por día de la semana, comenzando por el lunes.

D: NUMERO DE DIA
DAY: NOMBRE DEL DIA
YY: AÑO
YEAR: NOMBRE DEL AÑO
MM: NUMERO DEL MES
MONTH: NOMBRE DEL MES

ordenar normalmente empieza en domingo, debo validar eso para ordenar

aqui el problema es que la semana empieza en domingo, entomces hay que ver como poner al lunes de primero
*/

SELECT LAST_NAME "APELLIDO", HIRE_DATE, TO_CHAR(HIRE_DATE, 'DAY') "DAY" FROM EMPLOYEES
                                                                        ORDER BY
                                                                        
                                                                        CASE(TO_CHAR(HIRE_DATE, 'D'))
                                                                        
/*Si el dia es 0 es domingo, lo ando a 8 para que este de ultimo*/      WHEN '0' THEN '8' 
                                                                        
/*Si no fue domingo, lo muestro normal*/                                ELSE TO_CHAR(HIRE_DATE, 'D')
                                                                        
                                                                        END
                                                                        
                                                                        ;

/*
SELECT LAST_NAME  "Apellido", HIRE_DATE, TO_CHAR(HIRE_DATE,'DAY') "Day" 
from employees
order by 
  (CASE TO_NUMBER(TO_CHAR(HIRE_DATE,'D')) WHEN 0 then 8 else TO_NUMBER(TO_CHAR(HIRE_DATE,'D')) END )
  asc;*/



/*PREGUNTA 10

10.	Cree una consulta que muestre el apellido y las comisiones de los empleados. 
Si un empleado no gana comisión, ponga “No Commission”. Etiquete la columna COMM.

NOTA: 
NVL2(expr1, expr2, expr3)) //DEBEN SER STRING, TRANSFORMO CON TO_CHAR

Si expr1 no es nulo, devuelve expr2. Si expr1 es nulo, devuelve expr3. Los argumentos pueden ser de cualquier tipo.


*/

SELECT LAST_NAME, COMMISSION_PCT, NVL2(COMMISSION_PCT, TO_CHAR(COMMISSION_PCT), 'No Commission' ) COMM FROM EMPLOYEES;


/*
PREGUNTA 11

11.	Cree una consulta que muestre el apellido de los empleados y que indique las cantidades de sus salarios anuales con 
asteriscos. Cada asterisco significa mil dólares. Ordene los datos por salario en orden descendente. Etiquete la columna 
EMPLOYEES_AND_THEIR_SALARIES.


VACIO PARA METER AHI LOS ASTERISCOS, CADA ASTERISCO ES UN 1000, LO DIVIDO YA QUE MI N ES UN ASTERISCO POR CADA MIL
+1 POR QUE COMIENZA EN 0*/

SELECT LAST_NAME, SALARY, LPAD(' ', SALARY/1000 +1, '*') "EMPLOYEES_AND_THEIR_SALARIES" FROM EMPLOYEES ORDER BY SALARY DESC;


/*

PREGUNTA 12

12.	Utilizando la función DECODE, escriba una consulta que muestre el grado de todos los empleados basándose 
en el valor de la columna JOB_ID, según los datos siguientes:

Cargo 				Grado
AD_PRES			 	A
ST_MAN 				B
IT_PROG 				C
SA_REP				D
ST_CLERK 				E
Ninguno de los anteriores		0


*/


SELECT FIRST_NAME, LAST_NAME, JOB_ID, DECODE (JOB_ID,'AD_PRES','A',  'ST_MAN', 'B','IT_PROG','C','SA_REP','D', 'ST_CLERK','E','0') "GRADO" 
FROM EMPLOYEES;


/*

PREGUNTA 13

13.	Vuelva a escribir la sentencia de la pregunta anterior utilizando la sintaxis CASE.

WHEN: CUANDO
THEN: PONLE

EJM:
WHEN 'WAO' THEN 'W'
ENTONCES CUANDO SEA WAO PONLE W

ELSE: SI NO ES NINGUNO TOME TAL
*/


SELECT FIRST_NAME, LAST_NAME, JOB_ID,
                                           CASE (JOB_ID)
                                           
                                           WHEN 'AD_PRES'  THEN 'A'
                                           WHEN 'ST_MAN'   THEN 'B'
                                           WHEN 'IT_PROG'  THEN 'C'
                                           WHEN 'SA_REP'   THEN 'D'
                                           WHEN 'ST_CLERK' THEN 'E'
                                           
                                           ELSE '0' /*SI NO FUE NINGUNO DE AQUELLOS CASOS*/
                                           
                                           END "GRADO" 
                                           
                                           FROM EMPLOYEES;
                                           