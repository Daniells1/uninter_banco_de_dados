show databases;
create database aula;
use aula;
/* Comentário  de várias linhas */
-- suspeito, linha comentário

select database();
create table exemplo (
id int,
nome varchar(100)
);
show tables;
insert into exemplo (id, nome) values(1, 'Ana');


use aula;

create table cidade(
id int primary key,
nome varchar(100),
sigla char(03) unique);
insert into cidade (id,nome,sigla) values (1,'são paulo','SP');
select * from cidade;
insert into cidade (id,nome,sigla) values (2,'Curitiba','CWB');
select * from cidade;
insert into cidade (id,nome,sigla) values (3,'NATAL','NAT');
insert into cidade (id,nome,sigla) values (4,'BELÉM','BEL');
create table cliente(
id int primary key,
nome varchar(100),
idcidade int,
constraint fkclienteCidade foreign key (idcidade)
 references cidade(id));
 -- João é o cliente de id 1 e reside na cidade id 1.
 insert into cliente values(1,'Joao', 1);
 -- Não há ainda cidade de id 10 ,ocorerá um erro.
 insert into cliente values(2,'Jose',10);
 show databases;
 use aula;
 create table aluno(
 id int Primary key ,
 nome varchar(130) not null, -- PREENCHIMENTO OBRIGATÓRIO
 genero char(01), -- será F,M)
 estadoCivil char(01) check (estadoCivil in ('S', 'C', 'V') ), -- Restringe a atribuição para esses 3 valores
 renda decimal(10,2) default 0 -- Se valor não for informado o valor padrão será 0
 );
 insert into aluno (id,nome,genero,estadoCivil) values (1,'Priscila', 'M', 'C');
 select * from aluno;
insert into aluno (id,nome,genero,estadoCivil,renda) values(2,'null','M','S',10000); -- Cuidado para não colocar null entre aspas 
select* from aluno;
describe aluno; -- mostra as caracteristicas da tabela e os contrainst

create table city (
id int primary key auto_increment,
nome varchar(120) not null,
cepgeral int unsigned zerofill

);
select * from city;
-- adicionar uma coluna
alter table city add dddd char(05);
describe city;
-- mudar uma coluna
alter table city change dddd ddd char(05);
describe city;
-- mudar um atributo de coluna
alter table city modify ddd char(3);
describe city;

insert into city (nome,cepgeral,ddd) values ('Salvador', 75999, 045);
-- auto_increment incrementará automática o id perceba que não precisei inserir um valor para id manualmente
-- O zerofill preencherá com 0 a esquerda os espaços não utilizados na memória de um char ou varchar por exemplo.alter
select * from city;
-- a propriedade unsigned indica para o SQL que eu quero armazenar somente números positivos por isso o código abaixo gerará um erro

insert into city (nome,cepgeral,ddd) values ('Rio de Janeiro', -755000, 999);

insert into city (nome,cepgeral,ddd) values ('Rio de Janeiro', 755000, 999);
select * from city;
-- excluindo uma coluna 
alter table city drop cepgeral ;
describe city;

create table teste3 (
id int primary key,
nome varchar(100),
cpf char(09) not null unique 
);
show tables;
-- Excluindo tabela
drop table teste3;
show tables;

 
 
 