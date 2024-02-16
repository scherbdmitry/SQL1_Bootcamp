WITH aggregate_balance AS (
	SELECT user_id, SUM(money) as sum, type, currency_id
	FROM balance
	GROUP by user_id, type, currency_id
), aggregate_currency AS (
	SELECT currency.id, currency.name, currency.rate_to_usd as last_rate 
	FROM currency
	JOIN (SELECT id, name, MAX(updated) 
		  FROM currency 
		  GROUP BY id, name) as c
	ON currency.id = c.id AND currency.name = c.name AND currency.updated = c.max
)
SELECT
	COALESCE("user".name, 'not defined') AS name,
	COALESCE("user".lastname, 'not defined') AS lastname,
	aggregate_balance.type AS type,
	aggregate_balance.sum AS volume,
	COALESCE(aggregate_currency.name, 'not defined') AS currency_name,
	COALESCE(aggregate_currency.last_rate, 1) AS last_rate_to_usd,
	CAST(ROUND(aggregate_balance.sum * COALESCE(aggregate_currency.last_rate, 1), 6) AS real) AS total_volume_in_usd
FROM "user"
FULL JOIN aggregate_balance ON aggregate_balance.user_id = "user".id
LEFT JOIN aggregate_currency ON aggregate_currency.id = aggregate_balance.currency_id
ORDER BY name DESC, lastname, type;
