/*1. Analise a tabela rental e responda:
a. Qual é a ordenação padrão da tabela? Qual comando você utilizou para analisar?*/
-- A ordenação padrão se dá na ordem em que os dados foram criados e inseridos na tabela.
SELECT * 
  FROM sakila.rental;

-- b. Qual consulta SQL você pode usar para ordenar os registros de forma descendente por data de retorno do DVD?
SELECT * 
  FROM sakila.rental 
 ORDER BY return_date DESC;


--c. Qual consulta SQL você pode usar para ordenar os registros de forma combinada: ascendente por id do consumidor, e ascendente por data de retorno do DVD?
SELECT * 
  FROM sakila.rental 
 ORDER BY customer_id, return_date;


--d. O que acontece com os valores NULL na ordenação?
--Os valores NULL são prioridade na ordenação ascendente, aparecendo antes de qualquer outro valor.

/*2. Quais são as combinações únicas de features especiais (coluna special_features) dos filmes? Qual consulta você utilizou para chegar a esse resultado? Dicas: Utilize a cláusula ORDER BY para facilitar a visualização.
*/

SELECT special_features 
  FROM sakila.film 
 GROUP BY special_features 
 ORDER BY special_features;

/*R: 
Trailers
Commentaries
Trailers,Commentaries
Deleted Scenes
Trailers,Deleted Scenes
Commentaries,Deleted Scenes
Trailers,Commentaries,Deleted Scenes
Behind the Scenes
Trailers,Behind the Scenes
Commentaries,Behind the Scenes
Trailers,Commentaries,Behind the Scenes
Deleted Scenes,Behind the Scenes
Trailers,Deleted Scenes,Behind the Scenes
Commentaries,Deleted Scenes,Behind the Scenes
Trailers,Commentaries,Deleted Scenes,Behind the Scenes*/





/*3. Você está ajudando a equipe de desenvolvimento a criar uma nova funcionalidade no sistema da locadora, permitindo que a equipe de atendentes liste os consumidores de maneira similar a seus celulares, ordenando por sobrenome ascendente e nome descendente. Qual consulta SQL você pode usar para essse objetivo?*/

SELECT *
  FROM sakila.customer
 ORDER BY first_name, last_name DESC;

