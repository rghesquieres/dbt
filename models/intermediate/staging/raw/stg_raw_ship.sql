with source as (
    select * 
    from {{ source('raw', 'ship') }}
),

renamed as (
    select
        orders_id,
        cast(ship_cost as FLOAT64) as ship_cost,
        shipping_fee,
        `logCost`
    from source
)

select * from renamed