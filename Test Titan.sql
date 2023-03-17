create database Titan
default character set utf8mb3
default collate utf8_general_ci;
use Titan;

create table produtos(
cod_prod integer(8),
loj_prod integer(8),
desc_prod char(40),
dat_includ_prod date,
preco_prod decimal (8.3)
);

drop database titan;
drop table produtos;
describe produtos;
select * from produtos;

insert into produtos
(cod_prod, loj_prod, desc_prod, dat_includ_prod, preco_prod)
values
('170', '2', 'LEITE CONDESADO MOCOCA', '2010-12-30', '45.40');

describe produtos;
select * from produtos;

insert into produtos
(cod_prod, loj_prod, desc_prod, dat_includ_prod, preco_prod)
values
('170', '2', 'LEITE CONDESADO MOCOCA', '2010-12-30', '45.40');

describe produtos;
select * from produtos;
update produtos
set preco_prod = '95.40'
where cod_prod = '170' and loj_prod ='2'
limit 1;
select * from produtos
where desc_prod like ('L%');

select count(*) from produtos;

describe produtos;
select * from produtos;

select sum(preco_prod) from produtos;

select loj_prod, sum(preco_prod) from produtos
where preco_prod >100.00
group by loj_prod;

create table estoque(
Cod_prod	Integer (8),
loj_prod	Integer (8),
qtd_prod	decimal(15,3)
);

create table lojas(
loj_prod	Integer (8),
desc_loj	Char (40)
);

describe estoque;
alter table estoque
add primary key (cod_prod, loj_prod);

alter table estoque
add foreign key (loj_prod)
references lojas(loj_prod);

SELECT p.loj_prod, l.desc_loj, p.Cod_prod, p.desc_prod, p.preco_prod, e.qtd_prod
FROM Produtos p
INNER JOIN Estoque e ON p.Cod_prod = e.Cod_prod AND p.loj_prod = e.loj_prod
INNER JOIN Lojas l ON p.loj_prod = l.loj_prod
WHERE p.loj_prod = 1;

SELECT p.Cod_prod, p.desc_prod, p.preco_prod
FROM Produtos p
LEFT JOIN Estoque e ON p.Cod_prod = e.Cod_prod AND p.loj_prod = e.loj_prod
WHERE e.Cod_prod IS NULL;

SELECT e.Cod_prod, p.desc_prod, e.loj_prod, e.qtd_prod
FROM Estoque e
LEFT JOIN Produtos p ON e.Cod_prod = p.Cod_prod AND e.loj_prod = p.loj_prod
WHERE p.Cod_prod IS NULL;
