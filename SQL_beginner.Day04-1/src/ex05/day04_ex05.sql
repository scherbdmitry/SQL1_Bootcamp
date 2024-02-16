CREATE VIEW v_price_with_discount AS
  (SELECT DISTINCT p.name,
                   m.pizza_name,
                   m.price,
                   ROUND(0.9 * price) AS discount_price
   FROM person_order po
   JOIN person p ON po.person_id = p.id
   JOIN menu m ON po.menu_id = m.id
   ORDER BY p.name,
            m.pizza_name);