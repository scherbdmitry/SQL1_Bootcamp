--insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
--insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT coalesce("user".name, 'not defined')     AS name,
       coalesce("user".lastname, 'not defined') AS lastname,
       c.name                              AS currency_name,
       cast(round(balance.money * c.rate_to_usd, 6) as real) AS currency_in_usd
FROM balance
    LEFT JOIN "user" ON balance.user_id = "user".id
    INNER JOIN currency c
        ON (balance.currency_id = c.id
               AND c.updated = coalesce(
                   (SELECT max(currency.updated)
                    FROM currency
                    WHERE c.id = currency.id AND balance.updated >= currency.updated
                    GROUP BY currency.id),
                   (SELECT min(currency.updated)
                    FROM currency
                    WHERE c.id = currency.id AND balance.updated < currency.updated
                    GROUP BY currency.id)))
ORDER BY name DESC, lastname, currency_name;