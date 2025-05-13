with source as (
    select * 
    from {{ source('raw', 'ship') }}
),

renamed as (
    select
        orders_id,
        cast(ship_cost as FLOAT64) as ship_cost,
        shipping_fee
        -- on supprime volontairement shipping_fee_1
    from source
)

select * from renamed