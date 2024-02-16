select person.id,
		person.name,
		person.age,
		person.gender,
		person.address,
		pizzeria.id,
		pizzeria.name,
		pizzeria.rating
from person cross join  pizzeria
order by person.id, 
		pizzeria.id