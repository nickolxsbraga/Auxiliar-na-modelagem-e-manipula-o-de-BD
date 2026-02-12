use hospital;
-- consultas sem convenio e media.
select * 
from consulta
where year(data_da_consulta) = 2020
and convenio_id = 4;

select avg(valor_consulta) as valor_medio_consultas_sem_convenio
from consulta
where year(data_da_consulta) = 2020
and convenio_id = 4;


use hospital;
-- consultas com convenio e media.
select * 
from consulta
where year(data_da_consulta) = 2020
and convenio_id is not null;

select avg(valor_consulta) as valor_medio_consultas_com_convenio
from consulta
where year(data_da_consulta) = 2020
and convenio_id is not null;


use hospital;
-- internacoes com data de alta maior que data prevista.
select * 
from internacao
where data_alta > data_prev_alta;


use hospital;
-- receituario da primeira consulta.
select * 
from receituario
join consulta on consulta.id_consulta = receituario.id_receita
order by consulta.data_da_consulta asc
limit 1;


use hospital;
-- maior e menos valor de consulta sem convenio.
select * 
from consulta
where convenio_id = 4
order by valor_consulta desc
limit 1;

select * 
from consulta
where convenio_id = 4
order by valor_consulta asc
limit 1;


use hospital;
-- dados de internacoees e seus respectivos quartos + calculo.
select i.*, q.numero_quarto, tq.valor_diaria, 
datediff(i.data_alta, i.data_baixa) as dias_internado, 
(datediff(i.data_alta, i.data_baixa) * tq.valor_diaria) as total_internacao
from internacao i
join quarto q on i.quarto_id = q.id_quarto
join tipodequarto tq on q.tipoquarto_id = tq.id_tipodequarto;


use hospital;
-- data, cirurgia e numero de quarto de internacoes no tipo de quarto apartamento.
select i.data_baixa, i.cirurgia_realizada, q.numero_quarto
from internacao i
join quarto q on i.quarto_id = q.id_quarto
join tipodequarto tq on q.tipoquarto_id = tq.id_tipodequarto
where tq.descricao_quarto like 'apartamento%';


use hospital;
-- nome, data e especialidade de consultas em que o paciente tinha menos de 18 anos na data da consulta e que especialidade nao seja pediatria.
select p.nome as paciente_nome, c.data_da_consulta, e.especialidade
from consulta c
join paciente p on c.paciente_id = p.id_paciente
join especialidade e on c.especialidade_id = e.id_especialidade
where datediff(c.data_da_consulta, p.data_nascimento) / 365 < 18
and e.especialidade <> 'pediatria'
order by c.data_da_consulta;


use hospital;
-- nome do paciente, do médico, data da internação e cirurgia de internacoes realizadas por médicos da especialidade gastroenterologia, que tenham acontecido em enfermaria.
select p.nome as paciente_nome, m.nome as medico_nome, i.data_baixa, i.cirurgia_realizada
from internacao i
join paciente p on i.paciente_id = p.id_paciente
join medico m on i.medico_id = m.id_medico
join especialidade e on m.especialidade = e.especialidade
join quarto q on i.quarto_id = q.id_quarto
join tipodequarto tq on q.tipoquarto_id = tq.id_tipodequarto
where e.especialidade = 'gastroenterologia'
and tq.descricao_quarto like 'enfermaria%';


use hospital;
-- nome, crm e quantidade de consultas realizadas.
select m.nome, m.crm, count(c.id_consulta) as quantidade_consultas
from medico m
left join consulta c on m.id_medico = c.medico_id
group by m.nome, m.crm;


use hospital;
-- nomes e coren de enfermeiros que participaram de mais de uma internacao.
select e.nome, e.coren, count(ce.internacao_id) as numero_internacoes
from enfermeira e
join cuidados_enfermaria ce on e.id_enfermeira = ce.enfermagem_id
group by e.nome, e.coren
having count(ce.internacao_id) > 1;

use hospital;
-- consulta extra.
-- retorna o nome do paciente, nomes das especialidades, o valor total e a quantidade de consultas realizadas em 2020.
select p.nome as paciente_nome, 
group_concat(distinct e.especialidade separator ', ') as especialidades, 
sum(c.valor_consulta) as total_gasto, 
count(c.id_consulta) as consultas_realizadas
from consulta c
join paciente p on c.paciente_id = p.id_paciente
join medico m on c.medico_id = m.id_medico
join especialidade e on c.especialidade_id = e.id_especialidade
where year(c.data_da_consulta) = 2020
group by p.nome
having count(distinct e.especialidade) > 1;