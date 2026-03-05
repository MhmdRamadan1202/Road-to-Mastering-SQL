SELECT DISTINCT city 
FROM station 
WHERE LOWER(SUBSTR(CITY,1,1)) NOT IN ('a','e','i','o','u');