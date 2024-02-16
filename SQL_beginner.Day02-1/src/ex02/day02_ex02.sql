SELECT COALESCE(p.name, '-') AS person_name,
       t1.visit_date AS visit_date,
       COALESCE(pz.name, '-') AS pizzeria_name
FROM person AS p
FULL JOIN
  (SELECT *
   FROM person_visits AS pv
   WHERE pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03') t1 ON p.id = t1.person_id
FULL JOIN pizzeria AS pz ON t1.pizzeria_id = pz.id
ORDER BY person_name,
         visit_date,
         pizzeria_name;