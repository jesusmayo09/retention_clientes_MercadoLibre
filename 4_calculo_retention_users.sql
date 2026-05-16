
-- 1) CTE para chorte:
WITH cohort AS (
    SELECT
        user_id,
        TO_CHAR(DATE_TRUNC('month', MIN(signup_date)), 'YYYY-MM') AS cohort
    FROM mercadolibre_retention
    GROUP BY user_id
),
activity AS (
-- 2) CTE activity: tomar columnas claves de mercadolibre_retention y añadir el cohort 
-- ESCRIBE TU CODIGO AQUI
    SELECT
        mr.user_id,
        c.cohort,
        day_after_signup,
        active
    FROM mercadolibre_retention AS mr
    LEFT JOIN cohort AS c
    ON mr.user_id = c.user_id
    WHERE activity_date BETWEEN '2025-01-01' AND '2025-08-31'
)

-- 3) SELECT final: conteos exactos por día acumulado X / tamaño de cohorte -> % redondeado
-- ESCRIBE TU CODIGO AQUI
SELECT
    cohort,
    ROUND((COUNT(DISTINCT CASE WHEN day_after_signup >= 7 AND active = 1 THEN user_id END) * 100.0) / NULLIF( COUNT(DISTINCT user_id), 0) , 1) AS retention_d7_pct,
    ROUND((COUNT(DISTINCT CASE WHEN day_after_signup >= 14 AND active = 1 THEN user_id END) * 100.0) / NULLIF(COUNT(DISTINCT user_id), 0), 1) AS retention_d14_pct,
    ROUND((COUNT(DISTINCT CASE WHEN day_after_signup >= 21 AND active = 1 THEN user_id END) * 100.0) / NULLIF(COUNT(DISTINCT user_id), 0), 1) AS retention_d21_pct,
    ROUND((COUNT(DISTINCT CASE WHEN day_after_signup >= 28 AND active = 1 THEN user_id END) * 100.0) / NULLIF(COUNT(DISTINCT user_id), 0), 1) AS retention_d28_pct
FROM activity
GROUP BY cohort
ORDER BY cohort;