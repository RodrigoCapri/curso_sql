use curso_sql;

create user 'andre'@'200.200.190.190' identified by 'milani123456';
/* libera acesso de ao usuario de qualquer máquina*/
create user 'andre'@'%' identified by 'milani123456';

create user 'andre'@'localhost' identified by 'milani123456';

/* dando acesso total para todas as tabelas de um database a um usuario */
grant all on curso_sql.* to 'andre'@'localhost';

create user 'andre'@'%' identified by 'andreviagem';
grant select on curso_sql.* to 'andre'@'%';
grant insert on curso_sql.funcionarios to 'andre'@'%';

/* removendo acessos */
revoke insert on curso_sql.funcionarios from 'andre'@'%';
revoke select on curso_sql.* from 'andre'@'%';

revoke all on curso_sql.* from 'andre'@'localhost';

drop user 'andre'@'%';
drop user 'andre'@'localhost';

select user from mysql.user;
show grants for 'andre'@'%';