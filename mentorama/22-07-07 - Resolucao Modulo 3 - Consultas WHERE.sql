/*
1. A partir de uma consulta SQL descubra quantos endereços estão 
cadastrados no distrito West Bengali na tabela address
*/

SELECT COUNT(*)
  FROM sakila.address
 WHERE district = "West Bengali"

/*
2. Retorne todos os pagamentos (tabela payment) cujo valor da transação
foi maior que 5 dólares
*/

SELECT *
  FROM sakila.payment
 WHERE amount > 5;

/*
3. Modifique a consulta criada no item 2, para que dessa vez retorno todos
os pagamentos cujo valor de transação foi maior ou igual a 1 dólar e menos que 5 dólares
*/

SELECT *
  FROM sakila.payment
 WHERE amount >= 1 AND amount < 5;

/*
4. O sistema que determina a classificação indicativa dos filmes é criado e gerenciado pela 
Motion Picture Association. A partir de uma consulta SQL, liste os filmes da locadora que 
têm indicação de orientação parental (valores PG ou PG-13).
*/
SELECT * FROM sakila.film WHERE rating IN ('PG', 'PG-13')
SELECT * FROM sakila.film WHERE rating = 'PG' OR rating = 'PG-13'

/*
5. Alguns filmes foram alugados mas não foram devolvidos! A partir da tabela rental, liste
os aluguéis que não tiveram sua devolução registrada no sistema.
*/
SELECT * 
  FROM sakila.rental 
 WHERE return_date IS NULL;
