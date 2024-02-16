select person_order.order_date 			as order_date,
		person.name || ' (age:' || age || ')'	as person_information
from person_order
	join person on person.id=person_order.person_id
order by order_date asc, person_information asc