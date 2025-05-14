with orders_margin as (
    select *
    from {{ ref('int_orders_margin') }}
),

ship as (
    select *
    from {{ ref('stg_raw_ship') }}
),


sales as (
    select *
    from {{ ref('int_sales_margin') }}
),

joined as (
    select
        orders_margin.orders_id,
        orders_margin.date_date,
        sum(sales.revenue) as revenue,
        sum(sales.margin) as margin,
        orders_margin.operational_margin
            + ship.shipping_fee
            - ship.`logCost`
            - cast(ship.ship_cost as FLOAT64) as operational_margin
    from orders_margin
    left join sales
        on orders_margin.orders_id = sales.orders_id
    left join ship
        on orders_margin.orders_id = ship.orders_id
    group by orders_margin.orders_id, orders_margin.date_date,
             orders_margin.operational_margin, ship.shipping_fee, ship.`logCost`, ship.ship_cost
)

select * from joined