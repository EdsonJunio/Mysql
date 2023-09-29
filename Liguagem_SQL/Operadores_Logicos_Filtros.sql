/*
   Logical operators test the legitimacy of certain conditions.
   Logical operators, such as comparison operators,
   return a Boolean data type with a TRUE, FALSE or UNKNOWNS value.
*/

-- Operators
-- where
-- and
-- between
-- in
-- like
-- not
-- or
-- is null
-- is not null
-- having
use curso;
-- Operators where
select *
from senso
where nome_mun = 'Jundiai';

-- Operators and
select *
from senso
where cod_uf = '35'
  and populacao > 50000
  and ano = '2014';

-- Operators between
select *
from senso
where cod_uf = '35'
  and populacao between 50000
    and 100000
  and ano = '2014'
order by populacao desc;

-- Operators in
select *
from senso
where cod_uf in ('35', '12')
  and ano = '2014';


-- Operators not in
select *
from senso
where cod_uf not in ('35', '12')
  and ano = '2014';

-- like finds values containing or anywhere
select *
from senso
where nome_mun like ('%mara%')
  and ano = '2014';

-- like find any values that have r in the second composition
select *
from senso
where nome_mun like ('_r%')
  and ano = '2014';

-- like finds values that start with "a" and are at least 3 characters long
select *
from senso
where nome_mun like ('a_%_%')
  and ano = '2014';

-- like
select *
from senso
where nome_mun like ('a_%o')
  and ano = '2014';

-- like
select *
from senso
where nome_mun like ('a%')
  and ano = '2014';

-- wildcard as operator
select *
from senso
where nome_mun like ('_ra%')
  and ano = '2014';

-- Operators not
select ano, cod_uf, estado, nome_mun, populacao
from senso
where nome_mun not like ('A%')
  and cod_uf = '35'
  and not populacao < 40000
  and ano = '2014';

-- Operators or
select *
from senso
where nome_mun like ('A%')
  and (cod_uf = '35' or cod_uf = '15');

-- erro
select *
from senso
where nome_mun like ('A%')
  and cod_uf = '35'
  and cod_uf = '15';

-- Operators is not null
select *
from senso
where regiao is not null;

-- Operators is  null
select *
from senso
where regiao is null;

-- preparing the scenario is null
select *
from senso
where regiao = '';

update senso
set regiao=null
where regiao = '';

update senso
set regiao=''
where regiao is null;


-- Operators HAVING
select cod_uf, estado, count(*) qtd
from senso
where ano = '2014'
group by cod_uf, estado
having count(cod_mun) > 500;


-- Operators HAVING
select cod_uf, estado, count(*) qtd
from senso
where ano = '2014'
group by cod_uf, estado
having count(cod_mun) < 500;


-- Operators HAVING
select cod_uf, estado, count(cod_mun)qtd, sum(populacao)
from senso
where ano = '2014'
group by cod_uf, estado
having sum(populacao) < 50000000;




















