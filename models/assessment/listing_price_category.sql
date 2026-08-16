{{ config ( materialized = 'view' ) }}

SELECT  
    listings_id AS listing_id,
    listings_name AS listing_name,
    price,
    CASE 
        WHEN price < 100 THEN 'Budget'
        WHEN price >= 100 AND price < 300 THEN 'Mid-range'
        WHEN price >= 300 THEN 'Premium'
    END AS price_category,
    {{ nights_category('minimum_nights') }} AS stay_category
FROM {{ ref ('dim_listings_cleansed')}}
