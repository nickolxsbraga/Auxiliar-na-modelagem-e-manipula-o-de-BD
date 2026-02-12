use hospital;

insert into medico(nome, telefone, data_nascimento, email, cpf, crm, especialidade) values
('Carlos Augusto', '(51) 97527-6372', '1992/02/23', 'carlosaugusto@gmail.com', '80306292167', 'CRM/RS208', 'Urologia'),
('Luan Gomes', '(54) 98403-6340', '1985/09/20', 'luan@gmail.com', '90167488903', 'CRM/RS567', 'Medicina Intensiva'),
('Luana Souza', '(24) 98777-9068', '1990/05/26', 'luanasouza@gmail.com', '56382967067', 'CRM/RJ711', 'Pediatria'),
('Maria Luiza', '(54) 98078-2009', '1998/04/08', 'mariluiza@gmail.com', '90187392351', 'CRM/RS901', 'Pneumologia'),
('João Pedro', '(55) 98386-6557', '1987/06/12', 'jp@gmail.com', '90154243890', 'CRM/RS477', 'Infectologista'),
('Juliana Monteiro', '(54) 97940-4857', '1990/12/10', 'juliana@gmail.com', '57489046123', 'CRM/RS619', 'Oftalmologia'),
('Paula Lira', '(47) 98900-7531', '1986/08/20', 'paulaalira@gmail.com', '44389102067', 'CRM/RS206', 'Pediatria'),
('Leila Pereira', '(55) 97515-8331', '1979/10/11', 'leilape@gmail.com', '88192074601', 'CRM/RS093', 'Neurologia'),
('Marcia Maria', '(51) 98313-4354', '1996/07/14', 'marciamari@gmail.com', '32685933109', 'CRM/RS861', 'Dermatologia'),
('Fernanda Silva', '(55) 98921-3533', '1993/05/30', 'fesilva@gmail.com', '55462791403', 'CRM/RS299)', 'Cardiologia');

select * from medico;

use hospital;

insert into paciente(nome, data_nascimento, endereco, telefone, email, rg, cpf, convenio_id) values
('Rogerio Santos', '2001/09/25', 'Rua Um', '55989743930', 'rogerio@gmail.com', '8540251951', '49066375032', '1'),
('Nicolas Gabriel', '1999/02/10', 'Rua B', '51989617268', 'nicogabi@hotmail.com', '8256192978', '69167382190', '1'),
('Daniele Garcia', '2010/07/15', 'Rua Zero', '55984344505', 'danigarcia@gmail.com', '6317549870', '52175496708', '3'),
('Michael Lopes', '1998/09/12', 'Rua Trinta', '55986158441', 'michael@gmail.com', '9843862190', '62168520187', '2'),
('Danilo Montreal', '1990/12/5', 'Rua México', '51994259126', 'danilo@outlook.com', '9821674301', '54896742120', '1'),
('Martha Nicoly', '2000/11/09', 'Rua Quarenta', '51998435271', 'marthaa@gmail.com', '9887654375', '72185492046', '4'),
('Carmen Juaréz', '1975/01/03', 'Rua Inglaterra', '51982815557', 'carmen123@gmail.com', '9821674310', '72159451087', '2'),
('Lucas Matheus', '2006/10/26', 'Rua Central', '51972451939', 'lucasmats@gmail.com', '9821473856', '654901367', '2'),
('Pedro Machado', '2008/08/04', 'Rua Baixa', '54984483262', 'pedrobk@gmail.com', '9867478743', '5439672097', '1'),
('Luana Silva', '1999/11/07', 'Rua A', '54995739004', 'lulu@gmail.com', '2871675498', '9873075401', '4'),
('Franciele Ortiz', '1987/09/03', 'Rua J', '55981173127', 'franciele@gmail.com', '9821875400', '67719077553', '1'),
('Maira Luiza', '2000/10/07', 'Rua Galeão', '54986677839', 'maira@gmail.com', '9987675429', '19099067431', '3');

select * from paciente;

use hospital;

insert into especialidade(especialidade) values
('Pediatria'),
('Clinica Geral'),
('Gastroenterologia'),
('Dermatologia'),
('Urologia'),
('Cardiologia'),
('Neurologia'),
('Pnemeulogia');

select * from especialidade;

use hospital;

insert into consulta(data_da_consulta, hora_da_consulta, valor_consulta, carteira, medico_id, especialidade_id, paciente_id, convenio_id) values
('2017/07/10', '10:00:00', '120.00', '9201887318854', '1', '3', '1', '1'),
('2017/12/05', '08:30:00', '100.00', '0021989298551', '3', '1', '3', '4'),
('2018/03/30', '07:30:00', '50.00', '2712873767398', '5', '5', '5', '3'),
('2018/07/15', '15:00:00', '35.00', '9087664321887', '7', '1', '9', '3'),
('2019/01/29', '16:00:00', '150.00', '6215666529987', '9', '2', '10', '1'),
('2019/10/20', '16:30:00', '90.00', '0869764533433', '2', '4', '2', '2'),
('2020/02/20', '11:30:00', '60.00', '2006099332014', '4', '6', '4', '1'),
('2020/03/10', '10:45:00', '30.00', '9876586869075', '6', '8', '6', '1'),
('2021/09/15', '09:30:00', '50.00', '8369824837654', '8', '7', '8', '2'),
('2022/10/11', '10:45:00', '100.00', '2745836432824', '10', '3', '7', '4'),
('2022/10/20', '11:00:00', '45.00', '8647589285844', '2', '1', '2', '3'),
('2022/11/15', '09:30:00', '50.00', '0028495683995', '1', '5', '1', '2');

select * from consulta;

use hospital;

insert into receituario(medicamento, orientacoes) values
('Diazepam 5 mg, Escitalopram 10 mg', '2 vezes ao dia'),
('Losartana 50 mg, Sinvastatina 20 mg', '1 comprimido a noite'),
('Amoxicilina 500 mg, Clenil 250 mcg', 'Uso a cada 6h'),
('Ciprofloxacino 500 mg, Pyridium 100 mg', '3 vezes ao dia'),
('Paracetamol 500 mg, Miosan 10 mg', '2 comprimdos a cada 6h');

select * from receituario;

use hospital;

insert into quarto(numero_quarto, tipoquarto_id) values
('101', '1'),
('201', '2'),
('301', '3');

select * from quarto;

use hospital;

insert into internacao(data_baixa, data_prev_alta, data_alta, cirurgia_realizada, medico_id, paciente_id, quarto_id) values
('2017/12/10', '2017/12/20', '2017/12/20', 'Ret. de Hernia', '3', '2', '1'),
('2018/04/12', '2018/04/20', '2018/04/23', 'Mamoplastia', '6', '6', '1'),
('2018/07/31', '2018/09/04', '2018/09/03', 'Colecistectomia', '9', '3', '1'),
('2019/02/20', '2019/02/28', '2019/03/02', 'Ret. pedra. Vesícula', '2', '5', '2'),
('2019/04/26', '2019/05/07', '2019/05/08', 'Blefaroplastia', '1', '7', '3'),
('2020/01/05', '2020/01/08', '2020/01/10', 'Ret. de Hernia', '4', '9', '2'),
('2021/10/08', '2021/11/02', '2021/11/02', 'Rinosplastia', '5', '7', '3');

select * from internacao;

use hospital;

insert into cuidados_enfermaria(enfermagem_id, internacao_id) values
('1', '15'),
('3', '17'),
('5', '19'),
('7', '21'),
('2', '16'),
('4', '18'),
('6', '20'),
('8', '17'),
('5', '15'),
('2', '20');

select * from cuidados_enfermaria;