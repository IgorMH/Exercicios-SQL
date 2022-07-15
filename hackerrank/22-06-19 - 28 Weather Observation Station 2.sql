/*
Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all values in LONG_W rounded to a scale of 2 decimal places.
Input Format

The STATION table is described as follows:
https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg

*/

SELECT ROUND(SUM(LAT_N),2), 
       ROUND(SUM(LONG_W),2)
  FROM STATION;
