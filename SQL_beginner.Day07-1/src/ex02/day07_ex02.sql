WITH visits AS (SELECT pi.name,
                       COUNT(pizzeria_id),
                       'visit' AS action_type
                FROM person_visits AS pv
                         JOIN pizzeria pi ON pv.pizzeria_id = pi.id
                GROUP BY pi.name
                ORDER BY count DESC
                LIMIT 3),
     orders AS (SELECT pi.name,
                       COUNT(pi.name),
                       'order' AS action_type
                FROM person_order po
                         JOIN menu m ON po.menu_id = m.id
                         JOIN pizzeria pi ON m.pizzeria_id = pi.id
                GROUP BY pi.name
                ORDER BY count DESC
                LIMIT 3)
				
SELECT name, count, action_type
FROM visits
UNION ALL
SELECT name, count, action_type
FROM orders
ORDER BY action_type ASC, count DESC;