/*PREGUNTA 1

1.	Agregue una restricción PRIMARY KEY de nivel de tabla a la tabla EMP en la columna ID.
    Debe asignar el nombre my_emp_id_pk a la restricción en el momento de su creación.
    Indicación: La restricción se activa tan pronto como se ejecuta el comando ALTER TABLE correctamente.

ELIMINAR UNA CONSTRAIN

ALTER TABLE EMP DROP CONSTRAINT my_emp_id_pk;
*/

ALTER TABLE EMP ADD CONSTRAINT my_emp_id_pk PRIMARY KEY (ID);


/*PREGUNTA 2

2.	Cree una restricción PRIMARY KEY en la tabla DEPT utilizando la columna ID. Debe asignar el nombre my_dept_id_pk
  a la restricción en el momento de su creación.
 Indicación: La restricción se activa tan pronto como se ejecuta el comando ALTER TABLE correctamente.


*/

ALTER TABLE DEP ADD CONSTRAINT my_dept_id_pk PRIMARY KEY (ID);



/*PREGUNTA 3

3.	Agregue una columna DEPT_ID a la tabla EMP. Agregue una referencia de clave ajena en la tabla EMP que
asegure que no se asigna el empleado a un departamento no existente. Llame a la restricción my_emp_dept_id_fk.

*/

ALTER TABLE EMP ADD CONSTRAINT my_emp_dept_id_fk FOREIGN KEY (DEPT_ID)  REFERENCES DEP (ID);

/*PREGUNTA 4

4.	Confirme que se agregaron las restricciones consultando la vista USER_CONSTRAINTS.
Anote los tipos y los nombres de las restricciones

*/


SELECT *FROM USER_CONSTRAINTS;


/*PREGUNTA 5

5.	Visualice los nombres y los tipos de objeto de la vista USER_OBJECTS del diccionario
de datos para las tablas EMP y DEPT. Observe que se crearon las nuevas tablas y un nuevo índice.

*/

SELECT *FROM USER_OBJECTS WHERE OBJECT_NAME='EMP' OR OBJECT_NAME='DEP';

/*PREGUNTA 6


6.	Modifique la tabla EMP. Agregue una columna COMMISSION del tipo de dato NUMBER, precisión 2, escala 2.
    Agregue una restricción a la columna COMMISSION que asegure que el valor de la comisión sea mayor que cero.

number(2,2) 2 con 2 decimales . ejemplo 44,44
*/

ALTER TABLE EMP ADD COMISSION NUMBER(2,2);

ALTER TABLE EMP ADD CONSTRAINT  COMMISION_NOT_CERO CHECK (COMISSION>0);

