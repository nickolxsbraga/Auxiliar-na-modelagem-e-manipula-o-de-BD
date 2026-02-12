create database Hospital;

use Hospital;

create table consulta(
id_consulta int not null,
data_da_consulta date not null,
hora_da_consulta time not null,
nome_paciente varchar(45) not null,
valor_consulta decimal(9,2) not null,
convenio mediumtext,
carteira varchar(13) not null,
receita_id int not null,
medico_id int not null,
especialidade_id int not null,
primary key (id_consulta),
foreign key(receita_id) references receituario(id_receita),
foreign key(medico_id) references medico(id_medico),
foreign key(especialidade_id) references especialidade(id_especialidade)
);

use hospital;

create table especialidade(
id_especialidade int not null,
especialidade varchar(45) not null,
primary key(id_especialidade)
);

use Hospital;

create table medico(
id_medico int not null,
nome varchar(45) not null,
telefone varchar(15) not null,
data_nascimento date not null,
email varchar(45) not null,
cpf varchar(11) not null unique,
crm varchar(10) not null unique,
especialidade varchar(45) not null,
primary key (id_medico)
);

use Hospital;

create table paciente(
id_paciente int not null,
nome varchar(45) not null,
data_nascimento date not null,
endereco varchar(45) not null,
telefone varchar(11) not null,
email varchar(45) not null,
rg varchar(10) not null unique,
cpf varchar(11) not null unique,
primary key(id_paciente),
foreign key(id_paciente) references convenio(id_convenio),
foreign key(id_paciente) references receituario(id_receita)
);

use Hospital;

create table convenio(
id_convenio int ,
nome varchar(45),
cnpj varchar(14) unique,
carencia date,
primary key (id_convenio)
);

use Hospital;

create table receituario(
id_receita int not null,
medicamento mediumtext not null,
orientacoes mediumtext not null,
primary key(id_receita)
);

use Hospital;

create table internacao(
id_internacao int not null ,
data_baixa date not null,
data_prev_alta date not null,
data_alta date not null,
cirurgia_realizada varchar(20) not null,
medico_id int not null,
paciente_id int not null,
primary key(id_internacao),
foreign key(medico_id) references medico(id_medico),
foreign key(paciente_id) references paciente(id_paciente),
foreign key(id_internacao) references quarto(id_quarto)
);

use Hospital;

create table quarto(
id_quarto int not null unique ,
numero_quarto int not null,
tipoquarto_id int not null,
primary key(id_quarto),
foreign key(tipoquarto_id) references tipodequarto(id_tipodequarto)
);

use Hospital;

create table tipodequarto(
id_tipodequarto int not null,
valor_diaria decimal not null,
descricao_quarto varchar(45) not null,
primary key(id_tipodequarto)
);

use Hospital;

create table enfermeira(
id_enfermeira int not null,
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
