use  curso_sql;

select * from funcionarios;
select * from veiculos;

select * from funcionarios inner join veiculos;
select * from funcionarios f inner join veiculos on veiculos.funcionario_id = f.id;	
select * from funcionarios f left join veiculos on veiculos.funcionario_id = f.id;	
select * from funcionarios f right join veiculos on veiculos.funcionario_id = f.id;	

select * from funcionarios f left join veiculos on veiculos.funcionario_id = f.id
union
select * from funcionarios f right join veiculos on veiculos.funcionario_id = f.id;	

insert into veiculos(funcionario_id, veiculo, placa) values(null, 'Moto', 'SB-0003');

create table cpfs(
	id int unsigned not null,
    cpf varchar(14) not null,
    primary key (id),
    constraint fk_cpf foreign key (id) references funcionarios(id)
);
insert into cpfs(id, cpf) values(1 ,'111.111.111-11');
insert into cpfs(id, cpf) values(2 ,'222.222.222-22');
insert into cpfs(id, cpf) values(3 ,'333.333.333-33');
insert into cpfs(id, cpf) values(5 ,'555.555.555-55');
select * from cpfs;

select * from funcionarios inner join cpfs on funcionarios.id = cpfs.id;
select * from funcionarios inner join cpfs using(id);

create table clientes(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    quem_indicou int unsigned,
    primary key (id),
    constraint fk_quem_indicou foreign key (quem_indicou) references clientes(id)
);
insert into clientes(id, nome, quem_indicou) values(1, 'André', null);
insert into clientes(id, nome, quem_indicou) values(2, 'Samuel', 1);
insert into clientes(id, nome, quem_indicou) values(3, 'Carlos', 2);
insert into clientes(id, nome, quem_indicou) values(4, 'Rafael', 1);
select * from clientes;

select a.nome as 'Ciente', b.nome as 'Quem indicou' from clientes a join clientes b on a.quem_indicou = b.id;

select * from funcionarios f
 inner join veiculos on veiculos.funcionario_id = f.id
 inner join cpfs on cpfs.id = f.id;	
 
 create view funcionarios_a as select * from funcionarios where funcionarios.salario >= 2500;
 select * from funcionarios_a;
 drop view funcionarios_a;
 create view funcionarios_a as select * from funcionarios where funcionarios.salario >= 2100;
 select * from funcionarios_a;