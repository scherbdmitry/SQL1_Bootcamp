SELECT name
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON menu.id = menu_id
WHERE gender = 'male'
  AND pizza_name IN ('pepperoni pizza',
                     'mushroom pizza')
  AND address IN ('Moscow',
                  'Samara')
ORDER BY name DESC;