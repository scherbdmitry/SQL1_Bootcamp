SELECT p.name,
       COUNT(pv.pizzeria_id) AS count_of_visits
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
GROUP BY p.name
HAVING COUNT(pv.pizzeria_id) > 3;