-- Criar um banco de dados chamado 'livraria_teste'
CREATE DATABASE livraria_teste;

-- Mudar para o banco de dados criado
USE livraria_teste;

-- 
/* 
Para criar uma tabela no banco de dados precisamos definir:
- Nome da tabela (por boas práticas, usar no plural)
- Atributos da tabela: nome, tipo e tamanho
- Restrições: PRIMARY KEY, AUTO_INCREMENT, NOT NULL
*/

-- Criar a tabela 'clientes'
CREATE TABLE clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,  -- ID único para cada cliente, gerado automaticamente
    nome VARCHAR(50) NULL,                 -- Nome do cliente, obrigatório, até 50 caracteres
    idade INT(3) NULL                      -- Idade do cliente, obrigatório, até 3 dígitos
);

-- 
/* 
Para inserir dados na tabela, usamos o comando:
INSERT INTO nome_tabela (colunas) VALUES (valores);

Obs: Não precisamos inserir o campo 'idCliente' pois ele é gerado automaticamente (AUTO_INCREMENT)
*/

-- Inserindo dados corretamente
INSERT INTO clientes (nome, idade) VALUES ('bia egen', 19);
INSERT INTO clientes (nome, idade) VALUES ('gabi lino', 18);
INSERT INTO clientes (nome, idade) VALUES ('gabi lino', 18); -- dado duplicado permitido, pois não há restrição

-- 
/* 
Para listar todos os dados da tabela, usamos:
SELECT * FROM nome_tabela;
*/

-- Listar todos os registros da tabela clientes
SELECT * FROM clientes;

insert into clientes (nome, idade) values ('igor', 19);

/*
crie uma tabela chamada autores  com os seguintes atributos: idautor int auto increment primary key, nomeautor varchar de 100 espaços não aceitando nulo
*/

/*
inserir os seguintes dados na tabela 
1. jk rowling
2. george r.r. martin
*/

-- Criar a tabela 'autores'
CREATE TABLE autores (
    idautor INT AUTO_INCREMENT PRIMARY KEY,  -- ID único para cada autor, gerado automaticamente
    nomeautor VARCHAR(100) not NULL            -- Nome do autor, obrigatório, até 100 caracteres
);

insert into autores (nomeautor) values ('jk rowling');
insert into autores (nomeautor) values ('george r.r. martin');

select * from autores;