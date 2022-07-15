1. Qual o nome e sobrenome dos dois funcionários da nossa locadora?
R: Mike Hillyer e Jon Stephens

2. Escreva uma consulta SQL que retorne todos os registros e os atributos firs_name, last_name e email da tabela customer.
```{sql}
SELECT  first_name,
	last_name,
	email
  FROM  sakila.customer
```

3. Escreva a consulta SQL que retorne a seguinte tabela: (imagem indisponível)
```{sql}
SELECT  city AS nome_cidade,
	country_id AS id_pais,
	city_id AS id_cidade,
	last_update AS ultima_atualizacao
  FROM  sakila.customer
```

4. Escreva uma consulta SQL que retorne a lista única de distritos na tabela address.
```{sql}
SELECT DISTINCT district
  FROM sakila.address
```
