/*
    +   Addition
    -   Subtraction
    *   Multiplication
    /   Division
    %   Model, returns the integer remainder of a division
*/

select 1 + 3 as retorno;
select 1 - 3 as retorno;
select 3 * 3 as retorno;
select 3 / 3 as retorno;
select 12 % 5 as retorno;

-- combining operators
select ((1 + 4) * (3 * 3)) / 5 as retorno;

-- script projecting 10% increase in population
select nome_mun, populacao, populacao * 1.10 as pop_projecao
from senso
where ano = '2014';

-- script projecting 10% increase in population
select nome_mun, populacao, populacao * 0.10 as acrescimo, populacao + populacao * 0.10 projecao_pob
from senso
where ano = '2014';