WITH resultset as (
    select * from {{ source('airbnb', 'listings') }}

)

select 
id as listings_id,
name as listings_name,
LISTING_URL,
ROOM_TYPE,
MINIMUM_NIGHTS,
HOST_ID,
PRICE as Price_str,
CREATED_AT,
UPDATED_AT
from resultset