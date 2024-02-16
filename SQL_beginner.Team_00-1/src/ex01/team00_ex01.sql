SELECT total_cost, tour
FROM v_path_way
WHERE total_cost = (SELECT MIN(total_cost) FROM v_path_way)
  OR total_cost = (SELECT MAX(total_cost) FROM v_path_way)
ORDER BY total_cost, tour;