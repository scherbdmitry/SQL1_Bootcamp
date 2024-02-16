WITH female_table AS
  (SELECT COUNT(person_id) AS COUNT,
          pizzeria_id
   FROM person_visits
   WHERE person_id IN
       (SELECT id
        FROM person
        WHERE gender = 'female')
   GROUP BY pizzeria_id),
     male_table AS
  (SELECT COUNT(person_id) AS COUNT,
          pizzeria_id
   FROM person_visits
   WHERE person_id IN
       (SELECT id
        FROM person
        WHERE gender = 'male')
   GROUP BY pizzeria_id)

SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
WHERE pizzeria.id IN
    (SELECT female_table.pizzeria_id
     FROM female_table
     INNER JOIN male_table ON female_table.pizzeria_id = male_table.pizzeria_id
     WHERE female_table.count <> male_table.count )
ORDER BY pizzeria_name;