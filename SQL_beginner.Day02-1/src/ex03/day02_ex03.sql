WITH visits AS
  (SELECT pv.visit_date
   FROM person_visits AS pv
   WHERE pv.person_id = 1
     OR pv.person_id = 2),
     missing_dates AS
  (SELECT days::date AS missing_date
   FROM GENERATE_SERIES('2022-01-01', '2022-01-10', interval '1 day') AS days)
SELECT missing_date
FROM missing_dates
LEFT JOIN visits ON missing_dates.missing_date = visits.visit_date
WHERE visit_date IS NULL
ORDER BY missing_date;