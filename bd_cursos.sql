/*Restrições e Integridades

O que são Restrições de integridade?
São regras que garantem a confiabilidade e consistencia dos dados em um banco de dados

Tipos de restrições:
- integridade de entidade
---garante que cada registro seja unico
---PK
---unique
---not null

- integridade referencial 
--- mantem os relacionamento entre as tabelas validos
---FK
---On delete cascade -> se um cliente for excluido, seus pedidos tbm são
---on delete restrict -> impede a exclusão se houver pedidos vinculados

- integridade de domínio
---define valores permitidos para um cargo
---check(preco>0) -> preço não poderá ser negativo
---ENUM ('Pendente', 'Pago', 'Cancelado') -> o atributo receberá somente os valores pré-definidos
---default -> valores padrão se nenhum valor for informado
*/

create database if not exists bd_cursos;
use bd_cursos;

create table alunos(
id int primary key auto_increment, /*PRIMARY KEY (chave primária) -> identifica cada linha*/
nome varchar(100) not null, /*campo obrigatório*/
email varchar(100) unique not null, /* unique -> evita duplicidade de dado*/
genero enum('M', 'F', 'Não informado') default 'Não informado', /*aceita soeme os valores pré-definidos*/

data_nascimento date not null,
stutus_ativo boolean default true
);

create table cursos(
id int primary key auto_increment,
nome varchar(100) not null unique,
carga_horaria int not null check (carga_horaria >=10 and carga_horaria <=200),
nivel Enum ('Basico', 'Intermediário', 'Avançado') not null,
ativo boolean default true
);

create table matriculas(
id int primary key auto_increment,
aluno_id int not null,
curso_id int not null,
data_matricula date not null default current_timestamp,
-- restrições de integridade
constraint fk_idAluno_matricula foreign key (aluno_id) references alunos(id)
on delete cascade, -- Se um aluno for excluido irá apagar a matricula tambem
constraint fk_idCurso_matricula foreign key (curso_id) references cursos(id)
on delete restrict -- irá impedir a exclusão do curso que estiver na matricula
);

insert into alunos (nome, email, genero, data_nascimento) values
('Ana Silva', 'ana.silva@gmail.com', 'F', '2000-05-20'),
('Carlos Souza', 'carlos.souza@gmail.com', 'M', '1998-03-10');

insert into cursos (nome, carga_horaria, nivel) values
('Introdução a Programação', '40', 'Básico'),
('Banco de Dados Avançado', '80', 'Avançado');

insert into matriculas (aluno_id, curso_id) values
(1,2),
(2,1);

select * from alunos;
select * from cursos;
select * from matriculas;

-- Gerando erros em nosso banco de dados
-- Erro: duplicando o campo email (violando o unique)
insert into alunos (nome, email, genero, data_nascimento) values
('Ana C. Silva', 'ana.csilva@gmail.com', 'F', '2001-01-01');

-- Erro: nulo em campos not null
insert into cursos (nome, carga_horaria, nivel) values
(Null, '40', 'Básico');

-- Erro: violando check (carga_horaria invalidade)
insert into cursos (nome, carga_horaria, nivel) values
('Curso Inválido', '5', 'Intermediario');

-- Erro: apagar cursos com matricula (on delete restrict)
delete from cursos where id = 1;

select * from matriculas;
delete from alunos where id =1;
