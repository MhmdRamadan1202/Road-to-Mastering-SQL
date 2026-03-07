select ('There are a total of '||count(name)||' '||lower(occupation)||'s.')
from occupations 
group by occupation 
order by count(name)asc, occupation asc;