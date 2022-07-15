/*
Query a count of the number of cities in CITY having a Population larger than 100,000.

Input Format:
https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg

*/

SELECT COUNT(ID)
  FROM CITY
 WHERE POPULATION > 100000


