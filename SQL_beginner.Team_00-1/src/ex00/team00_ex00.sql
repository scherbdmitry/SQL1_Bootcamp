-- DDL

CREATE TABLE graph
(
    point1 CHAR NOT NULL,
    point2 CHAR NOT NULL,
    cost   INT	NOT NULL
);

INSERT INTO graph 
VALUES  ('a', 'b', 10),
        ('a', 'c', 15),
        ('a', 'd', 20),
        ('b', 'a', 10),
        ('b', 'c', 35),
        ('b', 'd', 25),
        ('c', 'a', 15),
        ('c', 'b', 35),
        ('c', 'd', 30),
        ('d', 'a', 20),
        ('d', 'b', 25),
        ('d', 'c', 30);

-- DML

CREATE VIEW v_path_way AS (
WITH RECURSIVE p(last_point, tour) AS (
	SELECT
		point1,
		ARRAY[point1]::char(1)[], 0 AS cost
	FROM graph
	WHERE point1 = 'a'

	UNION

	SELECT
		graph.point2 AS last_point,
		(p.tour || ARRAY[graph.point2])::char(1)[] AS tour,
		p.cost + graph.cost
	FROM graph, p
	WHERE graph.point1 = p.last_point
	AND NOT graph.point2 = ANY(p.tour)
), result_path AS (
	SELECT
		array_append(tour, 'a') AS tour,
		cost + (SELECT cost FROM graph WHERE point1 = p.last_point AND point2 = 'a') as cost
	FROM p
	WHERE (SELECT array_length(p.tour, 1)) = 4
)
SELECT
	cost AS total_cost,
	tour
FROM result_path
)

SELECT total_cost, tour
FROM v_path_way
WHERE total_cost = (SELECT MIN(total_cost) FROM v_path_way)
ORDER BY total_cost, tour;