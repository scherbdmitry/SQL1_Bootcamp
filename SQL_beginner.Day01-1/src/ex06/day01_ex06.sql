select distinct person_order.order_date as action_date, 
				person.name 			as person_name
from person_order
	join person_visits on person_visits.visit_date=person_order.order_date
	join person on person.id=person_order.person_id
order by action_date asc, 
        person_name desc