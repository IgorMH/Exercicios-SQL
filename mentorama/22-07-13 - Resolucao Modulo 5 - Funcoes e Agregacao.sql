/*1. Conte o número de registros nas tabelas seguintes. Além do número, escreva para cada item pelo menos 3 consultas com formas diferentes de chegar a esse resultado: a. customer, b. film, c. rental;
*/
SELECT COUNT(*) FROM sakila.customer;
SELECT COUNT(customer_id) FROM sakila.customer;
SELECT COUNT(1) FROM sakila.customer;
SELECT COUNT(*) FROM sakila.film;
SELECT COUNT(film_id) FROM sakila.film;
SELECT COUNT(1) FROM sakila.film;
SELECT COUNT(*) FROM sakila.rental;
SELECT COUNT(rental_id) FROM sakila.rental;
SELECT COUNT(1) FROM sakila.rental;


/*2. Qual foi o valor médio pago por aluguéis de filmes (tabela payment) no mês de junho de 2015? Quantos pagamentos foram realizados nesse período? Escreva consulta utilizada.
*/
-- R: 2312 pagamentos em junho, e média de 4.16
SELECT COUNT(*) AS qtd_pagamentos,
       AVG(amount) AS media_junho
  FROM sakila.payment
 WHERE payment_date >= "2005-06-01" AND payment_date <= "2005-06-30";

 
/*3. Em uma locadora, é comum haver um custo associado a cada filme para reposição, em caso de perda ou dano ao item. Qual é o maior custo de reposição (tabela film) no inventário atual? Descreva dois processos por meio dos quais você pode chegar a essa informação.
*/
-- R: Na aba da esquerda, buscar a tabela film e clicar na figura da tabela para abrir a query SELECT * -- FROM sakila.film; No "Result Grid", clicar no atributo replacement_cost para que fique ordenado de -- forma descendente.

-- Outra forma é utilizando a query:
SELECT MAX(replacement_cost)
  FROM sakila.film;

 

/*4. Escreva uma consulta que, a partir da tabela film, retorne um resultado específico passado em imagem
*/
SELECT rental_duration AS duracao_aluguel,
       COUNT(*) AS total_filmes,
       AVG(length) AS media_duracao_filme
  FROM sakila.film
 GROUP BY 1
 ORDER BY rental_duration ASC;

 
/*5. Responda: Quantos e quais consumidores (representados pelo atributo customer_id) já tiveram um total de pagamentos (tabela payment) maior que 200? Escreva uma consulta SQL que retorne esse resultado.
*/
-- R: Dois clientes, o 148 e o 526

SELECT customer_id AS cliente_id,
       SUM(amount) AS total_pago
  FROM sakila.payment
 GROUP BY 1
HAVING total_pago > 200;
