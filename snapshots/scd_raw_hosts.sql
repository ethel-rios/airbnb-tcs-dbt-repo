{% snapshot scd_raw_hosts %}

{{

config(
target_schema='DEV',
unique_key='id',
strategy='timestamp',
updated_at='updated_at'
)

}}

SELECT * FROM AIRBNB.RAW.RAW_HOSTS

{% endsnapshot %}