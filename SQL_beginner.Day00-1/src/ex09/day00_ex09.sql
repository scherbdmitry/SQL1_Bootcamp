SELECT 
	(select name from person where person.id=person_visits.person_id) AS person_name ,  
    (select name from pizzeria where pizzeria.id=person_visits.pizzeria_id) AS pizzeria_name
FROM 
	(select * from person_visits where visit_date between '2022-01-07' and '2022-01-09') as person_visits
ORDER BY 
	person_name asc, 
	pizzeria_name desc