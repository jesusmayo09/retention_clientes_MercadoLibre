/*
1. Contar usuarios activos acumulados por país (D7, D14, D21, D28)

Objetivo: Para cada país, contar usuarios activos acumulados desde su registro, 
en el rango 2025-01-01 → 2025-08-31, al día 7, día 14, día 21 y día 28.
*/

/*
2. Convertir conteos a % de retención por país

Objetivo: Convertir los conteos del Task 1 en porcentajes de retención por país al día 7, día 14, día 21 y día 28.
*/

-- Objetivo: SOLO CONTEOS acumulados por país (sin porcentajes)
SELECT
  country,
ROUND((COUNT(DISTINCT CASE WHEN day_after_signup >= 7 AND active = 1 THEN user_id END) * 100.0) / NULLIF( COUNT(DISTINCT user_id), 0) , 1) AS retention_d7_pct,
ROUND((COUNT(DISTINCT CASE WHEN day_after_signup >= 14 AND active = 1 THEN user_id END) * 100.0) / NULLIF(COUNT(DISTINCT user_id), 0), 1) AS retention_d14_pct,
ROUND((COUNT(DISTINCT CASE WHEN day_after_signup >= 21 AND active = 1 THEN user_id END) * 100.0) / NULLIF(COUNT(DISTINCT user_id), 0), 1) AS retention_d21_pct,
ROUND((COUNT(DISTINCT CASE WHEN day_after_signup >= 28 AND active = 1 THEN user_id END) * 100.0) / NULLIF(COUNT(DISTINCT user_id), 0), 1) AS retention_d28_pct
FROM mercadolibre_retention
WHERE activity_date BETWEEN '2025-01-01' AND '2025-08-31'
GROUP BY country
ORDER BY country;