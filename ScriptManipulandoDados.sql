use curso_sql;

insert into funcionarios(id, nome, salario, departamento) values(1, 'Fernando', 1400, 'TI');
insert into funcionarios(id, nome, salario, departamento) values(2, 'Guilherme', 2500, 'Juridico');
insert into funcionarios(nome, salario, departamento) values('Fabio', 1700, 'TI');
insert into funcionarios(nome, salario, departamento) values('Jose', 1800, 'Marketing');
insert into funcionarios(nome, salario, departamento) values('Isabela', 2200, 'Jurídico');

select * from funcionarios;
select * from funcionarios where funcionarios.salario > 2000;
select * from funcionarios where funcionarios.nome = 'Jose';

update funcionarios set salario = salario * 1.1 where id = 1;
set SQL_SAFE_UPDATES = 0;
update funcionarios set salario = round(salario * 1.1, 2);
set SQL_SAFE_UPDATES = 1;

delete from funcionarios where id = 4;

select * from veiculos;
insert into veiculos(funcionario_id, veiculo, placa) values(1, 'Carro', 'SB-0001');
insert into veiculos(funcionario_id, veiculo, placa) values(1, 'Carro', 'SB-0002');
update veiculos set funcionario_id = 5 where id = 2;

select * from salarios;
insert into salarios(faixa, inicio, fim) values('Analista Junior', 1000, 2000);
insert into salarios(faixa, inicio, fim) values('Analista Pleno', 2000, 4000);

select * from funcionarios f where f.salario > 2500;
select nome as 'Funcionario', salario from funcionarios f where f.salario > 2500;

select * from funcionarios where nome = 'Guilherme'
union
select * from funcionarios where id = 5;

select * from funcionarios where nome = 'Guilherme'
union all
select * from funcionarios where nome = 'Guilherme';