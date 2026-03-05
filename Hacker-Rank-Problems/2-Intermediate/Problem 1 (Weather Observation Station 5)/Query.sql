select city, 
length(city) 
from station
order by length(city),city asc
limit 1;