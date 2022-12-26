use curso_sql;

create table pedidos(
	id int unsigned not null auto_increment,
    descricao varchar(100) not null,
    valor double not null default '0',
    pago varchar(3) not null default 'Não',
    primary key (id)
) engine = InnoDB;

insert into pedidos(descricao, valor) values('TV', 3000);
insert into pedidos(descricao, valor) values('Geladeira', 1400);
insert into pedidos(descricao, valor) values('DVD Player', 300);

update pedidos set  pago = 'Sim' where id = 8;

call limpa_pedidos();
select * from pedidos;


create table estoque(
	id int unsigned not null auto_increment,
    descricao varchar(50) not null,
    quantidade int unsigned not null,
    primary key (id)
) engine = InnoDB;

/* cria um gatilho que chama o gatilho antes do comando INSERT ser executado na tabela estoque - BEFORE*/
create trigger gatilho_limpa_pedidos
before insert
on estoque
for each row /* para cada linha faça */
call limpa_pedidos();

select * from estoque;
select * from pedidos;

/* agora quando um comando de insert for executado, o gatilho sera acionado */	
insert into estoque(descricao, quantidade) values('Fogão', 5);
insert into estoque(descricao, quantidade) values('Forno', 3);