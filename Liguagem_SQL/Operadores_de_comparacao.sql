

select *
from senso
where cod_uf = '35'
  and ano = '2014';


-- used operation =
select *
from senso
where nome_mun = 'Dourado'
  and cod_uf = '35'
  and ano = '2014';


-- used operation >
select *
from senso
where populacao > 100000
  and ano > '2014';

select *
from senso
where populacao > 1000000
  and cod_uf > '35'
  and ano > '2014';


-- used operation <
select *
from senso
where populacao < 100000
  and ano < '2014';

select *
from senso
where populacao < 50000
  and ano < '2014';


-- used operation <=
select *
from senso
where populacao <= 100000
  and ano <= '2014';

select *
from senso
where populacao <= 50000
  and ano <= '2014';

-- used operation <=
select *
from senso
where populacao >= 100000
  and ano >= '2014';

select *
from senso
where populacao >= 50000
  and ano >= '2014';

-- used operation <>
select *
from senso
where populacao <> 100000
  and ano <> '2014';

select *
from senso
where populacao <> 50000
  and cod_uf <>'35'
  and ano <> '2014';

-- Combinando Operadores
select * from senso
where populacao <= 100000
    and populacao >=50000
    and cod_uf = '35'
    and nome_mun <> 'Vinhedo'
    and ano='2014';
