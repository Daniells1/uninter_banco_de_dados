show databases;
create database aula_pratica3;
use aula_pratica3;
-- qual banco de dados estou utilizando?Usa-se o comando abaixo
/* Comentário de várias linhas */
select database();
create table produto (
id int not null ,
descricao varchar(150),
preco decimal(8,2)
);

insert into produto (id, descricao ,preco ) values (1, 'Smartphone XPO', 1500.99);
select * from produto;
insert into produto values(2, 'notebook i7 4gb ram',2500 );


select * from produto order by preco desc;
delete from produto where id = 2;


SET SQL_SAFE_UPDATES = 1;
drop table produto;
drop database aula_pratica_3;

create table estado (
id int not null primary key auto_increment ,
nome varchar(100) not null);
select * from estado;


insert into estado (id, nome) values (1, 'Paraná');
-- o código a seguir dará um erro pois id é auto incrementado não podendo haver chaves duplicadas
insert into estado (id, nome) values (2, 'Acre');
insert into estado (id, nome) values (2, 'Acre');

create table cidade (
id int not null primary key auto_increment,
nome varchar(100) not null,
idEstado int,
constraint fkCidadeEstado  foreign key (idEstado) references estado(id)
);

insert into cidade (id ,nome , idEstado) values ( 1, 'Curitiba', 1);
-- o id 3 ainda não existe vai dar erro
insert into cidade (id ,nome , idEstado) values ( 1, 'Salvador', 3);

alter table cidade add ddd varchar(03);

alter table cidade add regiao varchar(20) not null after nome;
describe cidade;
alter table cidade change regiao governo varchar(100);

alter table cidade modify governo varchar(50);
-- alterar nome de tabela
alter table cidade rename  to cidades ;

 create table aluno(
 id int ,
 nome varchar(130) not null, -- PREENCHIMENTO OBRIGATÓRIO
 genero char(01), -- será F,M)
 estadoCivil char(01) check (estadoCivil in ('S', 'C', 'V') ), -- Restringe a atribuição para esses 3 valores
 renda decimal(10,2) default 0 -- Se valor não for informado o valor padrão será 0
 );

-- adicionar primary key a tabela aluno,perceba que pkAluno é apenas a regra da restrição não apa-
-- recendo no display a primary key será atribuida a instancia id
alter table aluno add constraint pkAluno primary key  (id);
describe aluno;
alter table aluno drop primary key;

create table cliente(
id int auto_increment,
nome varchar(100),
cidadeId int not null,
constraint pkcliente primary key(id),
constraint fkClienteCidade foreign key(cidadeId) references cidades(id)
);

insert into aluno (id,nome) values ( 4, 'Andre');

insert into cliente values (1 , 'Pedro', 1);
insert into cliente (cidadeId) value (2);
insert into cliente values (2 , 'Maria', 2);
show tables;
select * from cidades;
insert  into cidades (id,nome,governo,idEstado,ddd) values (2, 'Salvador', 'Brasileiro', 1, 99);

insert into cliente (nome,cidadeId) values ('Nicolas',2),
('Helena',1),('beatriz',2),('laura',2);
create table funcionario(
id int ,
nome varchar(100),
cidadeId int not null,
constraint fkFuncCidade foreign key(cidadeId) references cidades(id)
);
-- inserir dados de outra tabela dentro da atual
insert into funcionario select id,nome, cidadeId from cliente;

select * from funcionario;

update cidades set nome = 'Palmares' where id = 2;

update cidades set nome = 'Salvado' , governo = 'baiano' where id = 2;


select * from cidades;
set SQL_SAFE_UPDATES = 0;

delete from cidades where id = 2;

insert into cidades (id, nome, governo,idEstado, ddd) values (3,'Miami','EUA',2,55);
-- filtragens na tabela
select * from cliente where cidadeid = 1 or cidadeid = 2;
-- filtrando por colunas
select id,nome from cliente ;

-- joins são junções de dados em duas tabelas , inner join traz como resultado  o que for igual nas duas tabela
-- self join junção com a propria tabela,auto relacionamente, cross join cruzar os dados de duas tabelas sem condição nenhuma
-- outer join(left join (traz só os dados da tabela da esquerda que faz relação com a tabela direita), right join, full join)

select id,nome from cliente where id between 2 and 6;
-- order by 'nome da coluna' asc/desc ascedente ou descendente,pode ser usado ao inves do nome da coluna o número que ela se refere respectivamente
select id,nome from cliente where id between 2 and 6 order by id desc;

show tables;
describe cidades;
describe city;
describe estado;
alter table cidades change  nome nomeCidade varchar(100);
alter table cidades change  governo nomeEstado varchar(100);

-- 
select nome ,cidadeId
from cliente
right join cidades
-- Ponto em comum:  ligação entre a foreign key da tabela cidades nesse caso idEstado e a coluna e id da tabela estado
on cliente.cidadeId = cidades.id;

select * from cliente;
select * from estado;
select * from cidades;
