with orders_margin as (
    select *
    from {{ ref('int_orders_margin') }}
),

ship as (
    select *
    from {{ ref('stg_raw_ship') }}
),

joined as (
    select
        orders_margin.orders_id,
        orders_margin.date_date,
        orders_margin.operational_margin + ship.shipping_fee - ship.log_cost - ship.ship_cost as operational_margin
    from orders_margin
    left join ship
        on orders_margin.orders_id = ship.orders_id
)

select * from joined