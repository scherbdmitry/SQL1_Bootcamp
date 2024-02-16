select pizzeria.name
from pizzeria
where pizzeria.name not in (select distinct pizzeria.name
						   	from pizzeria
						   		join person_visits on person_visits.pizzeria_id=pizzeria.id)

select pizzeria.name 
from pizzeria
where not exists (select 1
				 	from person_visits
				 	where pizzeria.id=person_visits.pizzeria_id)