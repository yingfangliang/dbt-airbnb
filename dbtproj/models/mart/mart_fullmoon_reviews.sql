{{
    config(
        materialized = 'table'
    )
}}
WITH 
fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
full_moon_dates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)
SELECT
    fr.*,
    CASE
        WHEN fm.full_moon_date IS NULL THEN 'not full moon'
        ELSE 'full moon'
    END AS is_full_moon
FROM fct_reviews AS fr 
    LEFT JOIN full_moon_dates AS fm 
    ON (TO_DATE(fr.review_date) = DATEADD(DAY, 1, fm.full_moon_date))