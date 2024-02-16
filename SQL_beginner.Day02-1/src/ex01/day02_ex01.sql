SELECT missing_days::date AS missing_date
FROM GENERATE_SERIES(timestamp '2022-01-01', '2022-01-10', '1 day') AS missing_days
         LEFT JOIN (SELECT pv.visit_date
                    FROM person_visits AS pv
                    WHERE pv.person_id = 1 
                       OR pv.person_id = 2) t2
                   ON missing_days = visit_date
WHERE visit_date IS NULL
ORDER BY missing_date;