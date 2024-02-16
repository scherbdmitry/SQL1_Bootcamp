WITH pepperoni_orders AS
  (SELECT person_id
   FROM person_order
   JOIN menu ON menu.id = person_order.menu_id
   WHERE pizza_name = 'pepperoni pizza' ),
     cheese_orders AS
  (SELECT person_id
   FROM person_order
   JOIN menu ON menu.id = person_order.menu_id
   WHERE pizza_name = 'cheese pizza' ),
     result_table AS
  (SELECT cheese_orders.person_id
   FROM cheese_orders
   JOIN pepperoni_orders ON cheese_orders.person_id = pepperoni_orders.person_id
   GROUP BY cheese_orders.person_id)
SELECT name
FROM person
INNER JOIN result_table ON person.id = result_table.person_id
WHERE gender = 'female'