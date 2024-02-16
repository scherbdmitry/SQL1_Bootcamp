WITH visits AS
  (SELECT DISTINCT pi.name AS pizzeria_name
   FROM person_visits pv
   JOIN
     (SELECT *
      FROM person p
      WHERE p.name = 'Andrey') tb1 ON pv.person_id = tb1.id
   JOIN pizzeria pi ON pv.pizzeria_id = pi.id),
     
	 orders AS
  (SELECT DISTINCT pi.name AS pizzeria_name
   FROM person_order po
   JOIN
     (SELECT *
      FROM person p
      WHERE p.name = 'Andrey') tb2 ON po.person_id = tb2.id
   JOIN menu m ON po.menu_id = m.id
   JOIN pizzeria pi ON m.pizzeria_id = pi.id)

SELECT pizzeria_name
FROM visits
EXCEPT
SELECT pizzeria_name
FROM orders;