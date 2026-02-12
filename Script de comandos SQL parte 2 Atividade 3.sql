use hospital;

alter table medico add column em_atividade bit default 1; 

select * from medico;

use hospital;

update medico set em_atividade = 0 where id_medico in (1, 2); 

select * from medico;

use hospital;

update internacao set data_alta = date_add(data_baixa, interval 3 day) where quarto_id = 3;

select * from internacao;

select * from convenio;

use hospital;

set foreign_key_checks = 0;
delete from consulta where paciente_id in (select id_paciente from paciente where convenio_id = 4);
delete from paciente where convenio_id = 4;
delete from convenio where id_convenio = 4;
set foreign_key_checks = 1;

select * from convenio;
