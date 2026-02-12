use hospital;

insert into enfermeira(nome, data_nascimento, cpf, coren) values
('Ana Paula Silva', '1988/03/15', '72807111904', '79468250'),
('João Carlos Pereira', '1992/09/21', '89177125309', '80416301'),
('Ricardo Mendes Alves', '1978/04/08', '54709177615', '69318046'),
(' Maria Fernanda Souza', '1997/02/21', '01802440003', '98013259'),
('Camila Rocha Lima', '1989/01/17', '60197333001', '64019347'),
(' Felipe Gomes Santos', '1995/06/27', '88290131201', '87401926'),
(' Juliana Costa Ribeiro', '1980/12/30', '89146140187', '03263186'),
('Lucas Oliveira Matos', '1990/11/03', '56178945201', '83208513');

select * from enfermeira;

use hospital;

insert into tipodequarto(valor_diaria, descricao_quarto) values
('400.00', 'Apartamento - Quarto mais privado, com banheiro e três cômodos'),
('250.00', 'Quartos Duplos - Quarto em conjunto, contém duas camas e banheiro privado'),
('80.00', 'Enfermaria - Quarto com múltiplas camas, indicado para pacientes que necessitam de maior acompanhamento médico');

select * from tipodequarto;

use hospital;

insert into convenio(nome, cnpj, carencia) values
('Ipe', '12345678000190', ' 2025/02/20'),
('Unimed', '98768432000115', '2024/11/12'),
('Porto Seguro Saúde', '23456789000181', '2024/12/12'),
('Prevent Senior', '87654321000104', '2025/02/20');

select * from convenio;