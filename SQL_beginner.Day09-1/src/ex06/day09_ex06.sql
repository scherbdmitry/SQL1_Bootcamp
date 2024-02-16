CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
	IN pperson varchar DEFAULT 'Dmitriy', 
	IN pprice numeric DEFAULT 500, 
	IN pdate date DEFAULT '2022-01-08') 
RETURNS VARCHAR AS $$
 DECLARE pizzeria_name VARCHAR;
 BEGIN
  SELECT pizzeria.name INTO pizzeria_name
  FROM pizzeria
  JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
  JOIN person ON person.id = person_id
  JOIN menu ON menu.pizzeria_id = pizzeria.id
  WHERE person.name = pperson AND price < pprice AND visit_date = pdate;

  RETURN pizzeria_name;
 END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');