{{ config (materialized='view')}}

WITH listings AS (
    SELECT * FROM {{ref('dim_listings_cleansed')}}
),
hosts AS (
    SELECT * FROM {{ ref('dim_hosts_cleansed')}}
)

SELECT 
    h.host_id,
    h.host_name,
    COUNT(l.listings_id) AS number_of_listing,
    ROUND(AVG(l.price),2) AS avg_price
    FROM listings AS l
    LEFT JOIN hosts AS h ON l.host_id = h.host_id
    GROUP BY 
        h.host_id,
        h.host_name
    ORDER BY    
        number_of_listing DESC