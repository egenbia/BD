create table autores(
	idautor serial primary key,
	nomeautor varchar(100) not null
);

insert into autores (nomeautor) values
('j.k. rowling'),
('george r.r. martin');

select * from autores