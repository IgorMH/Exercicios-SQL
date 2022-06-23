/* Modelagem Basica 
ENTIDADE = TABELA
CAMPOS = ATRIBUTOS
*/

CLIENTE

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER(100)
SEXO - CARACTER(1)


/* PROCESSOS DE MODELAGEM */

/* FASE 01 E 02 - AD ADM DE DADOS */

MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LOGICA - QUALQUER PROGRAM DE MODELAGEM

/* FASE 03 - DBA / AD */

MODELAGEM FISICA - SCRIPTS DE BANCO

/* INICIANDO A MODELAGEM FISICA */

/* CRIANDO O BD */

CREATE DATABASE PROJETO;

/* CONECTAR AO BD */

USE PROJETO;

/* CRIANDO A TABELA DE CLIENTES */

CREATE TABLE CLIENTES(
	NOME VARCHAR(30),
	CPF INT(10),
	EMAIL VARCHAR(30),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100),
	SEXO CHAR(1)

);

/* VERIFICANDO AS TABELAS DO BANCO */

SHOW TABLES;

/* DESCOBRINDO COMO É A ESTRUTURA DA TABELA */

DESC CLIENTES;


/* sintaxe basica de inserção: INSERT INTO NOME DA TABELA... */

/* FORMA 1 - OMITINDO AS COLUNAS */

INSERT INTO CLIENTES VALUES('JOAO', 988638273, 'JOAO@GMAIL.COM', '22923110', 'MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ', 'M'); 

INSERT INTO CLIENTES VALUES('CELIA', 541521456, 'CELIA@GMAIL.COM', '25078869', 'RIACHUELO - CENTRO - RIO DE JANEIRO - RJ', 'F');

INSERT INTO CLIENTES VALUES('JORGE', 885755896, NULL, '58748895', 'OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG', 'M');
							
/* FORMA 2 - COLOCANDO AS COLUNAS */

INSERT INTO CLIENTES(NOME, CPF, TELEFONE, ENDERECO, SEXO) VALUES('LILIAN', 887774856, '947785696', 'SENADOR SOARES = TIJUCA - RIO DE JANEIRO - RJ', 'F');

/* FORMA 3 - INSERT COMPACTO - SOMENTE MYSQL*/

INSERT INTO CLIENTES VALUES('ANA', 85548962, 'ANA@GLOBO.COM', '548556985', 'PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP', 'F'),
						   ('CARLA', 77458289, 'CARLA@TERATI.COM.BR', '66587458', 'SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG', 'F');
						   
/* COMANDO SELECT
seleção projeção e junção
*/

SELECT NOW() AS DATA_HORA, 'IGOR MORGADO' AS ALUNO;

SELECT NOME, EMAIL, SEXO FROM CLIENTES;

SELECT NOME, EMAIL, SEXO, NOW() AS DATA_HORA FROM CLIENTES;

SELECT * FROM CLIENTES;

/* FILTRANDO DADOS COM WHERE E LIKE */

SELECT NOME, SEXO, CPF FROM CLIENTES WHERE SEXO = 'M';

/* USANDO O LIKE */

SELECT NOME, CPF FROM CLIENTES WHERE ENDERECO LIKE 'RJ';

/* CARACTER CORINGA % -> QUALQUER COISA ANTES DO QUE ESTOU SELECIONANDO */

SELECT NOME, CPF FROM CLIENTES WHERE ENDERECO LIKE '%RJ';


/* ATUALIZANDO INFORMAÇÕES */ 

UPDATE CLIENTES SET EMAIL = 'LILIAN@HOTMAIL.COM' WHERE NOME = 'LILIAN';


/* PRIMEIRA FORMA NORMAL 

1- TODO CAMPO VETORIZADO SE TORNA OUTRA TABELA 

2- TODO CAMPO MULTIVALORADO SE TORNA OUTRA TABELA

3- TODA TABELA NECESSITA DE UM CAMPO QUE IDENTIFIQUE TODO REGISTRO COMO UNICO
A CHAVE PRIMARIA OU PRIMERY KEY

*/



CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTES(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M', 'F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'CEL', 'COM') NOT NULL,
	NUMERO VARCHAR(15) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTES(IDCLIENTE)
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(20) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTES(IDCLIENTE)
);


INSERT INTO CLIENTES VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTES VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTES VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTES VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTES VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTES VALUES(NULL,'CELIA','F','CELIA@IG.COM','5767876889');

UPDATE CLIENTES SET EMAIL = 'CELIA@IG.COM', SEXO = 'F' WHERE NOME = 'CELIA';

INSERT INTO CLIENTES VALUES(NULL,'PAULA','F',NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);


/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGENIRA FICA NA TABELA MAIS FRACA
   EM RELACIONAMENTO 1 X N A CHAVE ESTRANGENIRA FICA NA TABELA N*/
   

SELECT NOME, SEXO, NUMERO
FROM CLIENTES
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE;
	
SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTES
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE
WHERE NUMERO LIKE '%6';

SELECT CLIENTES.NOME, CLIENTES.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTES
INNER JOIN ENDERECO
ON CLIENTES.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTES.IDCLIENTE = TELEFONE.ID_CLIENTE;

/* OU */

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTES C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT C.NOME, C.SEXO, IFNULL(C.EMAIL,'NÃO TEM EMAIL') AS 'E-MAIL', E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTES C
	INNER JOIN ENDERECO E
	ON IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON IDCLIENTE = T.ID_CLIENTE;


INSERT INTO CLIENTES VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTES VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTES VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTES VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTES VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTES VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTES VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTES VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTES VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTES VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTES VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTES VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTES VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');


INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',8);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',13);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',15);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',16);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);


INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',8);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',8);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',10);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',10);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',10);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',12);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',14);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',15);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',16);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',19);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',19);

SELECT   C.NOME, 
			C.SEXO, 
			IFNULL(C.EMAIL, 'NÃO TEM E-MAIL') AS 'E-MAIL', 
			T.TIPO, 
			IFNULL(T.NUMERO, 'NÃO TEM TELEFONE') AS 'NUMERO', 
			E.BAIRRO, 
			E.CIDADE, 
			E.ESTADO
FROM CLIENTES C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

CREATE VIEW RELATORIO AS 
SELECT   C.NOME, 
			C.SEXO, 
			IFNULL(C.EMAIL, 'NÃO TEM E-MAIL') AS 'E-MAIL', 
			T.TIPO, 
			IFNULL(T.NUMERO, 'NÃO TEM TELEFONE') AS 'NUMERO', 
			E.BAIRRO, 
			E.CIDADE, 
			E.ESTADO
FROM CLIENTES C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

DROP VIEW RELATORIO;

CREATE VIEW V_RELATORIO AS 
SELECT   C.NOME, 
			C.SEXO, 
			IFNULL(C.EMAIL, 'NÃO TEM E-MAIL') AS 'E-MAIL', 
			T.TIPO, 
			IFNULL(T.NUMERO, 'NÃO TEM TELEFONE') AS 'NUMERO', 
			E.BAIRRO, 
			E.CIDADE, 
			E.ESTADO
FROM CLIENTES C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;





/* STORED PROCEDURES */

DELIMITER $

CREATE PROCEDURE NOME_EMPRESA()
BEGIN

	SELECT 'IGOR MORGADO' AS EMPRESA;

END
$

CALL NOME_EMPRESA()$

CREATE PROCEDURE CONTA()
BEGIN
	
	SELECT 10 * 10 AS CONTA;

END
$

DROP PROCEDURE CONTA;

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN

	SELECT NUMERO1 * NUMERO2 AS CONTA;

END
$

CALL CONTA(5,6)$


CREATE PROCEDURE ADD_LIVRO(NOME VARCHAR(30), AUTOR VARCHAR(30), SEXO VARCHAR(10), PAGINAS INT, EDITORA VARCHAR(30), PRECO INT, ESTADO VARCHAR(2), ANO INT)
BEGIN

	INSERT INTO LIVROS VALUES(NOME, AUTOR, SEXO, PAGINAS, EDITORA, PRECO, ESTADO, ANO);

END 
$

CREATE PROCEDURE DEL_LIVRO(NOME VARCHAR(30))
BEGIN

	DELETE FROM LIVROS WHERE NOME_LIVRO = 'NOME';

END
$