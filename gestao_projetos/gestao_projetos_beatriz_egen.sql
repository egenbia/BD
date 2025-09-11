create database if not exists gestao_projetos_beatriz_egen;
use gestao_projetos_beatriz_egen;

create table projetos(
    id_projetos int not null auto_increment primary key,
    nome varchar(100) not null,
    descricao varchar(100) not null,
    data_inicio date not null,
    data_termino date not null
);

create table pessoas(
    id_pessoas int not null auto_increment primary key,
    nome_completo varchar(100) not null,
    email varchar(100) unique not null
);

create table papeis(
    id_papeis int not null auto_increment primary key,
    nome varchar(100) unique not null
);

create table alocacoes(
    id_alocacoes int not null auto_increment primary key,
    id_pessoas int not null,
    foreign key (id_pessoas) references pessoas(id_pessoas),
    id_projetos int not null,
    foreign key (id_projetos) references projetos(id_projetos),
    id_papeis int not null,
    foreign key (id_papeis) references papeis(id_papeis)
);

create table tarefas(
    id_tarefas int not null auto_increment primary key,
    id_projetos int not null,
    foreign key (id_projetos) references projetos(id_projetos),
    titulo varchar(100) not null,
    descricao varchar(100) null,
    status enum('planejada','em andamento','concluída') not null,
    id_responsavel int null,
    foreign key (id_responsavel) references pessoas(id_pessoas)
);

insert into projetos (nome, descricao, data_inicio, data_termino) values
('sistema de vendas online', 'projeto de vendas online', '2025-02-01', '2025-07-30'),
('aplicativo de agenda médica', 'aplicativo para agendamento de consultas', '2025-03-10', '2025-09-15'),
('plataforma de cursos ead', 'plataforma de ensino a distância', '2025-01-20', '2025-08-05'),
('sistema de gestão escolar', 'sistema para gestão de escolas', '2025-04-01', '2025-11-20');

insert into pessoas (nome_completo, email) values
('ana souza', 'ana.souza@email.com'),
('bruno lima', 'bruno.lima@email.com'),
('carla mendes', 'carla.mendes@email.com'),
('daniel oliveira', 'daniel.oliveira@email.com'),
('fernanda costa', 'fernanda.costa@email.com'),
('gustavo pereira', 'gustavo.pereira@email.com'),
('helena rocha', 'helena.rocha@email.com'),
('igor santos', 'igor.santos@email.com');

insert into papeis (nome) values
('desenvolvedor'),
('analista'),
('testador'),
('designer'),
('gerente de projetos'),
('devops');

insert into alocacoes (id_pessoas, id_projetos, id_papeis) values
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 5),
(5, 2, 1),
(6, 2, 6),
(7, 2, 4),
(4, 2, 5),
(8, 3, 1),
(1, 3, 2),
(3, 3, 3),
(7, 3, 4),
(2, 4, 1),
(5, 4, 2),
(6, 4, 3),
(8, 4, 6);

insert into tarefas (id_projetos, titulo, descricao, status, id_responsavel) values
(1, 'criar tela de login', 'implementar tela inicial de login', 'planejada', 1),
(1, 'modelar banco de dados', 'definir modelo lógico e físico', 'concluída', 2),
(1, 'implementar carrinho de compras', 'funcionalidade de adicionar e remover produtos', 'em andamento', 1),
(1, 'testar fluxo de pagamento', 'realizar testes de pagamento', 'planejada', 3),
(1, 'configurar ambiente de produção', 'preparar servidor para deploy', 'em andamento', 4),
(2, 'criar cadastro de pacientes', 'tela e lógica de cadastro de pacientes', 'em andamento', 5),
(2, 'implementar agendamento online', 'agendamento de consultas online', 'planejada', 6),
(2, 'criar protótipo de interface', 'prototipagem das telas', 'concluída', 7),
(2, 'validar integração com calendário', 'integração com calendário externo', 'em andamento', 5),
(3, 'criar módulo de cadastro de cursos', 'módulo para cadastro de cursos', 'planejada', 8),
(3, 'implementar área do aluno', 'área privada para alunos', 'em andamento', 1),
(3, 'criar testes automáticos', 'testes automatizados do sistema', 'planejada', 3),
(3, 'desenvolver design responsivo', 'ajuste visual responsivo', 'em andamento', 7),
(3, 'ajustar autenticação com e-mail', 'correção na autenticação', 'concluída', 8),
(4, 'criar cadastro de alunos', 'cadastro inicial dos alunos', 'em andamento', 2),
(4, 'desenvolver boletim online', 'módulo de boletim digital', 'planejada', 5),
(4, 'testar módulo de presença', 'validação de presença', 'planejada', 6),
(4, 'implementar relatórios de notas', 'relatórios detalhados de desempenho', 'em andamento', 2);

-- Exercícios de Consulta MySQL
-- 1
select * from projetos order by nome asc;

-- 2
select id_projetos, nome, data_inicio from projetos where data_inicio between '2025-02-01' and '2025-04-01'
order by data_inicio desc;

-- 3
select * from projetos order by id_projetos asc
limit 2 offset 2;

-- 4
select * from pessoas
where lower(nome_completo) like '%an%' and nome_completo <> 'Ana Souza';

-- 5
select * from pessoas
where nome_completo like '% Co%' or nome_completo like '% Pe%';

-- 6
select id_tarefas, titulo, status
from tarefas
where id_projetos = 1
order by status, titulo;

-- 7
select id_tarefas, titulo, status from tarefas
where id_projetos = 3 and status = 'Concluída'
order by id_tarefas desc;

-- 8
select id_tarefas, titulo, status from tarefas
where id_projetos = 4 and status <> 'Concluída'
order by titulo;

-- 9 
select id_tarefas, id_projetos, titulo, status from tarefas
where lower(titulo) like '%cadastro%'
order by id_projetos, titulo;

-- 10
select id_tarefas, titulo, status from tarefas where id_projetos = 2
order by id_tarefas
limit 2 offset 2;




