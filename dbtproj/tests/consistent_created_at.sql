SELECT *
FROM {{ ref('fct_reviews') }} AS f 
    LEFT JOIN dim_listings_cleaned AS l 
    ON f.listing_id = l.listing_id
WHERE f.review_date < l.created_at

-- SELECT * FROM {{ ref('dim_listings_cleansed') }} l
-- INNER JOIN {{ ref('fct_reviews') }} r
-- USING (listing_id)
-- WHERE l.created_at >= r.review_date