WITH actions AS
  (SELECT pi.name, COUNT(pizzeria_id) AS total_count
   FROM person_visits AS pv
   JOIN pizzeria pi ON pv.pizzeria_id = pi.id
   GROUP BY 1
   
   UNION ALL 
   
   SELECT pi.name, COUNT(pi.name) AS total_count
   FROM person_order po
   JOIN menu m ON po.menu_id = m.id
   JOIN pizzeria pi ON m.pizzeria_id = pi.id
   GROUP BY 1)

SELECT name, sum(total_count) AS total_count
FROM actions
GROUP BY name
ORDER BY total_count DESC, name ASC