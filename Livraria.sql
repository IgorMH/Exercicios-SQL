/* Livraria */

CREATE DATABASE LIVRARIA;

USE LIVRARIA;

/* CRIANDO TABELA */
CREATE TABLE LIVROS(
	NOME_LIVRO VARCHAR(50),
	NOME_AUTOR VARCHAR(50),
	SEXO_AUTOR VARCHAR(9),
	NUMERO_PAGINAS VARCHAR(4),
	NOME_ADITORA VARCHAR(30),
	PRECO FLOAT(5,2),
	ESTADO_EDITORA CHAR(2),
	ANO_PUBLICACAO CHAR(4)
	);
	
/* INSERINDO DADOS */	
INSERT INTO LIVROS VALUES("Cavaleiro Real", "Ana Claudia", "Feminino", "465", "Atlas", 49.9, "RJ", "2009");
INSERT INTO LIVROS VALUES("SQL para leigos", "João Nunes", "Masculino", "450", "Addison", 98, "SP", "2018");
INSERT INTO LIVROS VALUES("Receitas Caseiras", "Celia Tavares", "Feminino", "210", "Atlas",	45, "RJ", "2008");
INSERT INTO LIVROS VALUES("Pessoas Efetivas", "Eduardo Santos", "Masculino", "390", "Beta", 78.99, "RJ", "2018");
INSERT INTO LIVROS VALUES("Habitos Saudáveis", "Eduardo Santos", "Masculino", "630", "Beta", 150.98, "RJ", "2019");
INSERT INTO LIVROS VALUES("A Casa Marrom", "Hermes Macedo", "Masculino", "250", "Bubba", 60, "MG", "2016");
INSERT INTO LIVROS VALUES("Estacio Querido", "Geraldo Francisco", "Masculino", "310", "Insignia", 100, "ES", "2015");
INSERT INTO LIVROS VALUES("Pra sempre amigas", "Leda Silva", "Feminino", "510", "Insignia", 78.98, "ES", "2011");
INSERT INTO LIVROS VALUES("Copas Inesqueciveis", "Marco Alcantara", "Masculino", "200", "Larson", 130.98, "RS", "2018");
INSERT INTO LIVROS VALUES("O poder da mente", "Clara Mafra", "Feminino", "120", "Continental", 56.58, "SP", "2017");



SELECT * FROM LIVROS;

SELECT NOME_LIVRO, NOME_ADITORA FROM LIVROS;

SELECT NOME_LIVRO, ESTADO_EDITORA FROM LIVROS WHERE SEXO_AUTOR="MASCULINO";

SELECT NOME_LIVRO, NUMERO_PAGINAS FROM LIVROS WHERE SEXO_AUTOR="FEMININO";

SELECT PRECO FROM LIVROS WHERE ESTADO_EDITORA="SP";

SELECT NOME_AUTOR, SEXO_AUTOR FROM LIVROS WHERE SEXO_AUTOR="MASCULINO" AND (ESTADO_EDITORA="SP" OR ESTADO_EDITORA="RJ");
