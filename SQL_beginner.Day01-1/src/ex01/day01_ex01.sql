(SELECT 
	name as object_name
from person
order by object_name)

union all

(SELECT 
	pizza_name
from menu
order by pizza_name)