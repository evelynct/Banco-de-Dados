/*Crie uma base de dados chamada maternidade e as tabelas mãe, bebê e médico e popule tais tabelas.*/

CREATE SCHEMA maternidade;
USE maternidade;
    
CREATE TABLE mae (
	idmae int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome varchar(30) NOT NULL,
    cpf varchar(11),
    data_nascimento date,
    logradouro varchar(100),
    cep varchar(15),
    cidade varchar(50),
    estado varchar(30),
    tel_celular varchar(20),
    estado_civil varchar(30)
);
    
CREATE TABLE medico (
	idmedico int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome varchar(30) NOT NULL,
    data_nascimento date,
    tel_celular varchar(20),
    CRM varchar(20),
    especialidade varchar(50)
);
    
CREATE TABLE bebe (
	idbebe int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,	
    id_mae_fk int(11),
    id_medico_fk int(11),
    nome varchar(30) NOT NULL,
    data_nascimento date,
    peso float(5,2),
    comprimento float(5,2),
    FOREIGN KEY (id_mae_fk)REFERENCES mae (idmae),
    FOREIGN KEY (id_medico_fk)REFERENCES medico (idmedico)
);


INSERT INTO maternidade.medico (nome, data_nascimento, tel_celular,CRM, especialidade) 
 VALUES("Felipe", '1980-09-02', "41999026066", "CRM/SP123456", "Pediatra");
INSERT INTO maternidade.medico (nome, data_nascimento, tel_celular,CRM, especialidade) 
 VALUES("Gisele", '1985-12-12', "43998015563", "CRM/PR007899", "Cardiologista");
INSERT INTO maternidade.medico (nome, data_nascimento, tel_celular,CRM, especialidade)
 VALUES("Beatriz", '1977-01-19', "11996448213", "CRM/SP666147", "Ginecologista");
INSERT INTO maternidade.medico (nome, data_nascimento, tel_celular,CRM, especialidade) 
 VALUES("Roberto", '1970-03-22', "42997412545", "CRM/PR987456", "Ginecologista");
INSERT INTO maternidade.medico (nome, data_nascimento, tel_celular,CRM, especialidade)
 VALUES("Luiza", '1990-07-03', "41991236688", "CRM/PR147852", "Pediatra");


INSERT INTO maternidade.mae (nome, cpf, data_nascimento, logradouro, cep, cidade, estado,tel_celular, estado_civil)
 VALUES("Marcia", 12345678900, '1981-12-30', "Av. Getúlio Vargas, 253", "81563010000", "Londrina", "PR","43992134788", "Casada");
INSERT INTO maternidade.mae (nome, cpf, data_nascimento, logradouro, cep, cidade, estado,tel_celular, estado_civil)
 VALUES("Renata", 98765432199, '1985-01-01', "Av. Sete de Setembro, 1988", "8836905633", "Curitiba", "PR","41999026066", "Solteira");
INSERT INTO maternidade.mae (nome, cpf, data_nascimento, logradouro, cep, cidade, estado,tel_celular, estado_civil)
 VALUES("Talita", 14785236910, '1995-05-20', "Rua César Landulfo, 112", "9514785233", "Salvador", "BA","21991470250", "Solteira");
INSERT INTO maternidade.mae (nome, cpf, data_nascimento, logradouro, cep, cidade, estado,tel_celular, estado_civil)
 VALUES("Yasmim", 36985214799, '1999-08-03', "Rua Alberto Carazzai, 1475", "9288874458", "Cornélio Procópio", "PR","43994785544", "Casada");
INSERT INTO maternidade.mae (nome, cpf, data_nascimento, logradouro, cep, cidade, estado,tel_celular, estado_civil)
 VALUES("Leticia", 37188899922, '2001-11-11', "Av. Albert Einstein, 47", "8563208860", "Curitiba", "PR","", "Viúva");
INSERT INTO maternidade.mae (nome, cpf, data_nascimento, logradouro, cep, cidade, estado,tel_celular, estado_civil)
 VALUES("Isis", 98765432199, '2000-10-05', "Av. Winston Churchil, 2174", "8836905633", "Belo Horizonte", "MG","", "Solteira");
INSERT INTO maternidade.mae (nome, cpf, data_nascimento, logradouro, cep, cidade, estado,tel_celular, estado_civil)
 VALUES("Tamara", 65478932173, '1997-09-13', "Rua Desembargador Motta, 100", "9514785233", "João Pessoa", "PB","41994778201", "Viúva");
INSERT INTO maternidade.mae (nome, cpf, data_nascimento, logradouro, cep, cidade, estado,tel_celular, estado_civil)
 VALUES("Bruna", 32715985209, '1998-06-24', "Rua Espírito Santo, 3333", "9288874458", "Curitiba", "PR","41997888228", "Casada");
INSERT INTO maternidade.mae (nome, cpf, data_nascimento, logradouro, cep, cidade, estado,tel_celular, estado_civil)
 VALUES("Helena", 25874633305, '2003-02-28', "Av. Iguaçu, 333", "8145635700", "Maceió", "AL","31993214444", "solteira");
INSERT INTO maternidade.mae (nome, cpf, data_nascimento, logradouro, cep, cidade, estado,tel_celular, estado_civil)
 VALUES("Alice", 00036988811, '1989-06-30', "Rua João Amadeu Pedro Bom, 2", "81940061", "Manaus", "AM","11998413366", "Casada");


ALTER TABLE maternidade.bebe
MODIFY COLUMN id_medico_fk int(11) DEFAULT NULL;


select *
from bebe;

INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(10, 3, "Enzo Silva", '2022-01-01', 3.345, 0.52);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(3, 2, "João Pedro", '2023-09-11', 2.400, 0.42);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(5, 5, "Valter Andrade", '2023-01-30', 3.00, 0.54);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(1, 5, "Nicolas Mendes", '2020-05-18', 3.750, 0.58);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(8, 4, "Juliana Madeira", '2023-05-09', 2.850, 0.48);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(6, 4, "Beatriz Midori", '2021-10-12', 2.93, 0.44);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(2, 3, "Júlia Zen", '2021-03-28', 4.120, 0.60);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(1, 5, "Cecília Fernandes", '2018-08-04', 4.365, 0.57);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(8, null , "Denilson Kross", '2018-06-16', 1.890, 0.38);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(6, 4, "Lucas Simão", '2014-07-20', 2.440, 0.46);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(7, 3, "Gabriel Felipe", '2022-04-11', 3.540, 0.54);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
 VALUES(4, 1, "Camila França", '2023-09-30', 3.880, 0.58);
INSERT INTO maternidade.bebe (id_mae_fk, id_medico_fk, nome, data_nascimento, peso, comprimento)
VALUES(4, 1, "Murilo Tanaka", '2019-10-27', 1.540, 0.35);

-- -----------------------------------------------------------------------------------------------
/* Realize uma consulta, utilizando INNER JOIN, onde seja informado o nome da mãe, nome do bebê, 
data de nascimento formatada no padrão brasileiro, peso e comprimento do bebê
(Os nomes das colunas devem fazer referência direta a informação trazida). 
Ordene os registros pelo nome do bebê e de forma ascendente */
    
SELECT mae.nome AS Nome_Mae, 
	   bebe.nome AS Nome_Bebe, 
	   date_format(bebe.data_nascimento, '%d/%m/%y') AS Data_Nascimento_Bebe, 
       bebe.peso AS Peso_Bebe,
       bebe.comprimento AS Comprimento_Bebe
FROM maternidade.mae
INNER JOIN maternidade.bebe ON mae.idmae = bebe.id_mae_fk  
ORDER BY bebe.nome asc; 
-- -----------------------------------------------------------------------------------------------
/* A partir da consulta anterior e ainda utilizando o INNER JOIN traga o nome do médico, 
além das informações já existentes na consulta anterior. 
Realize a ordenação dos registros pela data de nascimento e de forma descendente. 
Qual a diferença entre as consultas*/

SELECT mae.nome AS Nome_Mae, 
	   bebe.nome AS Nome_Bebe, 
	   date_format(bebe.data_nascimento, '%d/%m/%y') AS Data_Nascimento_Bebe, 
       bebe.peso AS Peso_Bebe,
       bebe.comprimento AS Comprimento_Bebe, 
       medico.nome AS Nome_Medico
FROM maternidade.mae
INNER JOIN maternidade.bebe ON mae.idmae = bebe.id_mae_fk
LEFT JOIN maternidade.medico ON medico.idmedico = bebe.id_medico_fk  
ORDER BY bebe.data_nascimento DESC;

-- Usei o left join para incluir todos os itens da tabela da esquerda no caso o bebe, 
--   para que ate mesmo os bebes nao tem o id_medico sejam incluidos nessa consulta.
-- -----------------------------------------------------------------------------------------------
/* Realize uma consulta trazendo o nome da mãe, nome do bebê, nome do médico, data de nascimento formatada, peso, comprimento,
 IMC do bebê (A precisão deve ser de duas casas decimais) e especialidade do médico 
 (Os nomes das colunas devem fazer referência direta a informação trazida). 
 Trazer somente os registros onde o peso do bebê esteja na faixa entre 3 e 4 kg e a especialidade do(a)(s) médico(a)(s) 
 que realizaram o atendimento seja “Ginecologia” ou “Pediatria */

SELECT mae.nome AS Nome_Mae, 
	   bebe.nome AS Nome_Bebe, 
       medico.nome AS Nome_Medico,
	   date_format(bebe.data_nascimento, '%d/%m/%y') AS Data_Nascimento_Bebe, 
       bebe.peso AS Peso_Bebe,
       bebe.comprimento AS Comprimento_Bebe,
       ROUND(bebe.peso / POWER(bebe.comprimento, 2), 2) AS IMC_Bebe
FROM maternidade.mae
 INNER JOIN maternidade.bebe ON mae.idmae = bebe.id_mae_fk
 LEFT JOIN maternidade.medico ON medico.idmedico = bebe.id_medico_fk
WHERE bebe.peso between 3 and 4 
 AND (medico.especialidade = 'Ginecologia' OR medico.especialidade = 'Pediatria'); 
-- -----------------------------------------------------------------------------------------------
/* Realize uma consulta trazendo o nome da mãe, logradouro, cidade, estado, estado civil da mãe, 
data de nascimento da mãe formatada no padrão brasileiro, nome do bebê e a data de nascimento do bebê formatada no padrão brasileiro. 
Por fim, não trazer as mães onde o estado civil seja viúva. 
Fazer tal consulta primeiramente sem a cláusula GROUP BY edepois adicionar tal clásula. 
Explique a diferença. Utilize as cláusulas INNER JOIN, RIGHT JOIN e LEFT JOIN. Existem diferenças? */
 
SELECT mae.nome AS Nome_Mae, 
	   mae.logradouro AS Logradouro, 
       mae.cidade AS Cidade,
       mae.estado AS Estado,
       mae.estado_civil AS Estado_civil,
	   date_format(mae.data_nascimento, '%d/%m/%y') AS Data_Nascimento_Mae, 
       bebe.nome AS Nome_Bebe,
	   date_format(bebe.data_nascimento, '%d/%m/%y') AS Data_Nascimento_Bebe 
FROM maternidade.mae
 INNER JOIN maternidade.bebe ON mae.idmae = bebe.id_mae_fk
WHERE mae.estado_civil != 'viuva';

-- ---------

SELECT mae.nome AS Nome_Mae, 
	   mae.logradouro AS Logradouro, 
       mae.cidade AS Cidade,
       mae.estado AS Estado,
       mae.estado_civil AS Estado_civil,
	   date_format(mae.data_nascimento, '%d/%m/%y') AS Data_Nascimento_Mae, 
       bebe.nome AS Nome_Bebe,
	   date_format(bebe.data_nascimento, '%d/%m/%y') AS Data_Nascimento_Bebe 
FROM maternidade.mae
 LEFT JOIN maternidade.bebe ON mae.idmae = bebe.id_mae_fk
WHERE mae.estado_civil != 'viuva'
GROUP BY mae.idmae; -- Adicionando GROUP BY
-- -----------------------------------------------------------------------------------------------
