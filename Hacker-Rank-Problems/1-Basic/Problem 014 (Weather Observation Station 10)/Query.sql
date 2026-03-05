select distinct city 
from station 
where LOWER(SUBSTR(CITY,-1,1)) not in ('a','e','i','o','u');