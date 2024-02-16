WITH prod AS
  (SELECT m.pizza_name,
          pi.name,
          m.price,
          pi.id
   FROM menu m
   JOIN pizzeria pi ON m.pizzeria_id = pi.id)

SELECT tb1.pizza_name,
       tb1.name AS pizzeria_name_1,
       prod.name AS pizzeria_name_2,
       tb1.price
FROM
  (SELECT *
   FROM prod) tb1
JOIN prod ON tb1.price = prod.price
AND tb1.pizza_name = prod.pizza_name
AND tb1.id > prod.id
ORDER BY 1;