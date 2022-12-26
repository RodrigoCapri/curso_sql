use curso_sql;

/* numero de registros */
select count(*) from funcionarios;
select count(*) from funcionarios where funcionarios.salario >= 2100;
select count(*) from funcionarios where funcionarios.salario >= 2100 and funcionarios.departamento = 'Juridico';

/* realiza a soma*/
select sum(salario) from funcionarios;
select sum(salario) from funcionarios where departamento = 'TI';
/* realiza a media*/
select avg(salario) from funcionarios;
/* maximo do campo*/
select max(salario) from funcionarios;
/* mimimo do campo*/
select min(salario) from funcionarios;

/* lista registros de um campo sem repetições*/
select distinct(departamento) from funcionarios;

/*ordenar os registros*/
select * from funcionarios order by nome;
select * from funcionarios order by nome asc;
select * from funcionarios order by nome desc;
select * from funcionarios order by salario;
select * from funcionarios order by departamento;
select * from funcionarios order by departamento, salario;

select * from funcionarios;
select * from funcionarios limit 2;
/*pula registro*/
select * from funcionarios limit 2 offset 1;
select * from funcionarios limit 1, 2;

/* operações com agrupamentos*/
select departamento, avg(salario) from funcionarios group by departamento;
select departamento, avg(salario) from funcionarios group by departamento having avg(salario) > 2200;

select nome from funcionarios where departamento in ('TI', 'Juridico');
select nome from funcionarios where departamento in ('Juridico');
select nome from funcionarios where departamento in (
	select departamento from funcionarios group by departamento having avg(salario) > 2200 
);