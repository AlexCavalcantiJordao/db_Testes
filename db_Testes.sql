-- Funções de Arredondamento no MySQL - ROUND, FLOOR, CEILING, TRUNCATE
create database db_Testes;

use db_Testes;

create table funcionarios(
	id_func smallint primary key auto_increment,
	nome_func varchar(30) not null,
	sobrenome_func varchar(50) not null
);

-- Conferir a tabela criada e sua chave primária....
describe funcionarios;
create table departamento(
	id_dep smallint auto_increment,
	nome_dep varchar(30) not null,
	constraint pk_id_dep primary key (id_dep)
);

-- Conferir a tabela criada e sua chave primária....
describe departamento;

create table fornecedores(
	id_forn smallint,
	nome_forn varchar(30) not null
);

-- Conferir a tabela criada:
describe fornecedores;

insert into fornecedores(id_forn, nome_forn) values (1, 'ACME');

select * from fornecedores;

-- Adicionar restrições de pk a uma coluna:
alter table fornecedores
add primary key (id_forn);

create table venda(
	id_produto smallint,
	id_cliente smallint,
	qtde smallint,
	constraint primary key (id_produto, id_cliente)
);

-- Conferir a chave primária....
describe venda;

-- Importar e Exportar arquivos CSV em tabelas do MySQL...

/* 
Importar CSV: Sintaxe
LOAD DATA INFILE: 'Caminho/do/arquivo.csv'
into table nome_tabela
field terminated by 'delimitador'
enclosed terminated by 'caractered_de_quebra'
ignore x rows
*/

show variables like 'secure_file_priv';
-- Exemplo:
use db_biblioteca;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/autores.csv'
into table tbl_autores
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(nomeAutor, SobrenomeAutor);

select * from tbl_editoras;

/* 
Importar CSV: Sintaxe
LOAD DATA INFILE: 'Caminho/do/arquivo.csv'
into outfile nome_tabela
field terminated by 'delimitador'
enclosed terminated by 'caractered_de_quebra'
ignore x rows
*/

(select 'Livro', 'Preço', 'Editora')
union
select L.NomeLivro, L.precoLivro, E.nomeEditora
from tbl_livros L
inner join tbl_editora E
on L.ideditora = E.idEditora
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/teste.csv'
fields terminated by ','
enclosed by '"'
lines terminated by '\n';