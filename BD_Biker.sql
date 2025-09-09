CREATE DATABASE IF NOT EXISTS BD_Bike;
USE BD_Bike;


create table Cliente (
id_cliente int auto_increment primary key,
nome varchar(200) not null,
telefone varchar(200) not null,
email varchar(200) not null,
endereco varchar(200) not null
);

create table Bicicleta (
id_biclicleta int auto_increment primary key,
id_cliente int not null,
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
marca varchar(200) not null,
modelo varchar(200) not null,
ano int not null,
tipo varchar(200) not null,
numero_serie int not null
);

create table Serviço(
id_servico int auto_increment primary key,
nome varchar(200) not null,
descricao varchar(200) not null,
preco_base varchar(200) not null,
tempo_estimado varchar(200) not null
);

create table Produto (
id_produto int auto_increment primary key,
nome varchar(200) not null,
descricao varchar(200) not null,
preco_unitario varchar(200) not null,
estoque varchar(200) not null
);

create table Ordem_Servico (
id_ordem int auto_increment primary key,
id_biclicleta int not null,
foreign key (id_biclicleta) references Bicicleta(id_biclicleta),
data_entrada date,
data_saida date,
status varchar(200) not null,
observacoes varchar(200) not null
);

create table Items_Ordem_Servico (
id_item int auto_increment primary key,
id_ordem int not null,
foreign key (id_ordem) references Ordem_Servico (id_ordem),
tipo_item varchar(200) not null,
id_referencia varchar(200) not null,
quantidade varchar(200) not null,
preco_total varchar(200) not null
);

create table Personalizacao (
id_personalizacao int auto_increment primary key,
id_bicicleta int not null,
foreign key (id_bicicleta) references Bicicleta(id_biclicleta),
data date,
descricao varchar(200) not null,
preco varchar(200) not null
);

create table Item_Personalizacao (
id_item_personalizacao int auto_increment primary key,
id_item int not null,
foreign key (id_item) references Items_Ordem_Servico (id_item),
id_personalizacao int not null,
foreign key (id_personalizacao) references Personalizacao (id_personalizacao),
tipo_item varchar(200) not null,
id_referencia varchar(200) not null,
quantidade varchar(200) not null,
preco_total varchar(200) not null
);

create table venda (
id_venda int auto_increment primary key,
id_cliente int not null,
foreign key (id_cliente) references Cliente (id_cliente),
data_venda date,
total varchar(200) not null
);

create table Item_Venda (
id_item_venda int auto_increment primary key,
id_venda int not null,
foreign key (id_venda) references venda(id_venda),
id_produto int not null,
foreign key (id_produto) references Produto (id_produto),
quantidade varchar(200) not null,
preco_unitario varchar(200) not null
);

INSERT INTO Cliente (nome, telefone, email, endereco)
VALUES ('João da Silva', '(11)91234-5678', 'joao.silva@email.com', 'Rua das Flores, 123 - São Paulo');

INSERT INTO Cliente (nome, telefone, email, endereco)
VALUES ('Maria Oliveira', '(21)99876-5432', 'maria.oliveira@email.com', 'Av. Atlântica, 456 - Rio de Janeiro');

insert into cliente (nome, telefone, email, endereco)
values ('Pedro Santos', '(31)98675-4321', 'pedro.santos@email.com', 'R. Minas Gerais, 89 - Belo Horizonte');

INSERT INTO bicicleta (id_cliente, marca, modelo, ano, tipo, numero_serie)
VALUES (1, 'Caloi', 'Elite 30', 2022, 'MTB', 'C123456789');

insert into bicicleta (id_cliente, marca, modelo, ano, tipo, numero_serie)
values (2, 'Trek', 'Domane AL 2', 2023, 'Speed', 'T987654321');

insert into bicicleta (id_cliente, marca, modelo, ano, tipo, numero_serie)
values (3, 'Oggi', 'Hacker Sport', 2021, 'Urbana', '0654321987');

insert into serviço (nome, descricao, preco_base, tempo_estimado)
values ('Revisão Completa', 'Revisão geral com ajuste de peças', '150.00', '02:30:00');

insert into serviço (nome, descricao, preco_base, tempo_estimado)
values ('Troca de freio', 'Substuição dos freios dianteiros', '80.00', '01:00:00');

insert into serviço (nome, descricao, preco_base, tempo_estimado)
values ('Alinhamento', 'Alinhamento das rodas dianteira/traseira', '60.00', '00:45:00');

insert into produto (nome, descricao, preco_unitario, estoque)
values ('Pneu 29"', 'Pneu MTB 29x2.10', '120.00', '10');

insert into produto (nome, descricao, preco_unitario, estoque)
values ('Câmbio Shimano Altus', 'Câmbio traveiro 8v', '180.00', '5');

insert into produto (nome, descricao, preco_unitario, estoque)
values ('Pastilha de freio', 'Pastilha de freio hidráulico', '40.00', '20');

insert into produto (nome, descricao, preco_unitario, estoque)
values ('Guidão Fiat', 'Guidão de alumínio 720mm', '90.00', '7');

insert into produto (nome, descricao, preco_unitario, estoque)
values ('Pneu 29"', 'Pneu MTB 29x2.10', '120.00', '10');

INSERT INTO Items_Ordem_Servico (id_ordem, tipo_item, id_referencia, quantidade, preco_total)
VALUES (1, 'Servico', 1, 1, 150.00);

INSERT INTO Items_Ordem_Servico (id_ordem, tipo_item, id_referencia, quantidade, preco_total)
VALUES (1, 'Servico', 2, 1, 80.00);

INSERT INTO Items_Ordem_Servico (id_ordem, tipo_item, id_referencia, quantidade, preco_total)
VALUES (1, 'Produto', 3, 2, 80.00);

INSERT INTO Items_Ordem_Servico (id_ordem, tipo_item, id_referencia, quantidade, preco_total)
VALUES (1, 'Servico', 1, 1, 150.00);

INSERT INTO Items_Ordem_Servico (id_ordem, tipo_item, id_referencia, quantidade, preco_total)
VALUES (2, 'Servico', 2, 1, 80.00);

INSERT INTO Items_Ordem_Servico (id_ordem, tipo_item, id_referencia, quantidade, preco_total)
VALUES (2, 'Servico', 3, 1, 60.00);

insert into venda (id_cliente, data_venda, total)
values (1, '2025-08-19', '210.0');

insert into venda (id_cliente, data_venda, total)
values (2, '2025-08-25', '120.0');

insert into item_venda (id_venda, id_produto, quantidade, preco_unitario)
values (1, 1, '1', '120.0');

insert into item_venda (id_venda, id_produto, quantidade, preco_unitario)
values (1, 3, '1', '40.0');

insert into item_venda (id_venda, id_produto, quantidade, preco_unitario)
values (1, 4, '1', '50.0');

insert into item_venda (id_venda, id_produto, quantidade, preco_unitario)
values (2, 1, '1', '120.0');

#Tipos de selects
select * from cliente;

#retornar os 2 primeiros clientes
select * from cliente limit 2;

#retonar os 2 primeiros clientes pulando os dois primeiros
select * from cliente limit 2 offset 2;

#listar os produtos em ordem alfabetica
select * from produto order by nome asc;
select * from produto order by nome;
select * from produto order by preco_unitario;

#listar os 3 produtos mais baratos
select * from produto order by preco_unitario limit 3;

#listar os produtos em ordem alfabetica descendente
select * from produto order by nome desc;

#mostrar os serviços com preço acima de 100 reais
select * from servico where preco_base > 100;

#ver as bicicletas do ano de 2023
select * from bicicleta where ano = 2023;
select * from bicicleta where ano between 2022 and 2022;

#ver as ordens de serviço que ainda não foram concluidas
select * from ordem_servico where status != "Concluida";

#buscar cliente pelo nome
select * from cliente where nome like "%Maria%";

#ver os produtos com menos de 10 unidades no estoque
select * from produto where estoque <10;

#mostrar as personalidades feitas após 15 de agosto de 2025

DELETE FROM Produto
WHERE id_produto = 5;
SELECT * FROM item_venda;
ALTER TABLE Item_Personalizacao RENAME TO Personalizacao;
describe items_ordem_servico;
show tables;
ALTER TABLE Item_Personalizacao 
ADD COLUMN id_item_personalizacao INT AUTO_INCREMENT PRIMARY KEY FIRST;
delete from serviço



