CREATE DATABASE IF NOT EXISTS BDDepartamentos;
            
USE BDDepartamentos;

CREATE TABLE IF NOT EXISTS DEPART(
TDEPT_NO int ,DNOMBRE varchar(14) ,LOC varchar(14)  );

CREATE TABLE IF NOT EXISTS EMPLE(
EMP_NO int ,APELLIDO varchar(10) ,OFICIO varchar(10) ,DIR int ,FECHA_ALT date ,SALARIO int ,COMISION int ,DEPT_NO int  );

CREATE TABLE IF NOT EXISTS GRADO(
GRADO int ,SALARIO_MAS_BAJO int ,SALARIO_MAS_ALTO int  );

