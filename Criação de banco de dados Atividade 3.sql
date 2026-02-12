create database Hospital;

use Hospital;

create table convenio(
id_convenio int auto_increment,
nome varchar(45),
cnpj varchar(14) unique,
carencia date,
primary key (id_convenio)
);

use Hospital;

create table paciente(
id_paciente int not null auto_increment,
nome varchar(45) not null,
data_nascimento date not null,
endereco varchar(45) not null,
telefone varchar(11) not null,
email varchar(45) not null,
rg varchar(10) not null unique,
cpf varchar(11) not null unique,
convenio_id int,
primary key(id_paciente),
foreign key(convenio_id) references convenio(id_convenio)
);

use hospital;

create table especialidade(
id_especialidade int not null auto_increment,
especialidade varchar(45) not null,
primary key(id_especialidade)
);

use Hospital;

create table medico(
id_medico int not null auto_increment,
nome varchar(45) not null,
telefone varchar(15) not null,
data_nascimento date not null,
email varchar(45) not null,
cpf varchar(11) not null unique,
crm varchar(10) not null unique,
especialidade varchar(45) not null,
primary key (id_medico)
);

use hospital;

create table medico_especialidade(
id_medico_especialidade int not null,
medico_id int not null,
especialidade_id int not null,
primary key(id_medico_especialidade),
foreign key(medico_id) references medico(id_medico),
foreign key(especialidade_id) references especialidade(id_especialidade)
);


use Hospital;

create table consulta(
id_consulta int not null auto_increment,
data_da_consulta date not null,
hora_da_consulta time not null,
valor_consulta decimal(9,2) not null,
carteira varchar(13) not null,
medico_id int not null,
especialidade_id int not null,
paciente_id int not null,
convenio_id int not null,
primary key(id_consulta),
foreign key(paciente_id) references paciente(id_paciente),
foreign key(convenio_id) references convenio(id_convenio),
foreign key(medico_id) references medico(id_medico),
foreign key(especialidade_id) references especialidade(id_especialidade)
);

use Hospital;

create table receituario(
id_receita int not null auto_increment,
medicamento mediumtext not null,
orientacoes mediumtext not null,
primary key(id_receita),
foreign key(id_receita) references paciente(id_paciente)
);

use Hospital;

create table tipodequarto(
id_tipodequarto int not null auto_increment,
valor_diaria decimal not null,
descricao_quarto varchar(255) not null,
primary key(id_tipodequarto)
);

use Hospital;

create table quarto(
id_quarto int not null unique auto_increment,
numero_quarto int not null,
tipoquarto_id int not null,
primary key(id_quarto),
foreign key(tipoquarto_id) references tipodequarto(id_tipodequarto)
);

use Hospital;

create table internacao(
id_internacao int not null auto_increment,
data_baixa date not null,
data_prev_alta date not null,
data_alta date not null,
cirurgia_realizada varchar(20) not null,
medico_id int not null,
paciente_id int not null,
quarto_id int not null,
primary key(id_internacao),
foreign key(medico_id) references medico(id_medico),
foreign key(paciente_id) references paciente(id_paciente),
foreign key(quarto_id) references quarto(id_quarto)
);


use Hospital;

create table enfermeira(
id_enfermeira int not null auto_increment,
nome varchar(45) not null,
data_nascimento date not null,
cpf varchar(11) unique not null,
coren varchar(10) unique not null,
primary key(id_enfermeira)
);

use Hospital;

create table cuidados_enfermaria(
enfermagem_id int not null,
internacao_id int not null,
primary key(enfermagem_id, internacao_id),
foreign key(enfermagem_id) references enfermeira(id_enfermeira),
foreign key(internacao_id) references internacao(id_internacao)
);
