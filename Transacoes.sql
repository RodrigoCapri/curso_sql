use curso_sql;

/* mecanismos de armazenamento disponiveis*/
show engines;

/* Cria uma tabela definindo o mecanismo de armazenamento */
create table contas_bancarias(
	id int unsigned not null auto_increment,
    titular varchar(45) not null,
    saldo double not null,
    primary key (id)
) engine = InnoDB;

insert into contas_bancarias(titular, saldo) values('Andre', 1000);
insert into contas_bancarias(titular, saldo) values('Carlos', 2000);

select * from contas_bancarias;

start transaction;
	update contas_bancarias set saldo = saldo - 100 where id = 1;
	update contas_bancarias set saldo = saldo + 100 where id = 2;
rollback;  /* ultima forma na transação */

start transaction;
	update contas_bancarias set saldo = saldo - 100 where id = 1;
	update contas_bancarias set saldo = saldo + 100 where id = 2;
commit;  /* finaliza uma transação */