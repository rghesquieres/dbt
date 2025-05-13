with sales_margin as (
    select *
    from {{ ref('int_sales_margin') }}
),

aggregated as (
    select
        orders_id,
        date_date,
        sum(margin) as operational_margin,
        sum(quantity) as quantity
    from sales_margin
    group by orders_id, date_date
)

select * from aggregated