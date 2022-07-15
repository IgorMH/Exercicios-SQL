/*
Query the average population for all cities in CITY, rounded down to the nearest integer.

Input Format:
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg
*/

SELECT ROUND(AVG(POPULATION))
  FROM CITY;
