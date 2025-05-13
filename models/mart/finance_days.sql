with base as (
    select *
    from {{ ref('int_orders_operational') }}
),

aggregated as (
    select
        date_date,
        count(distinct orders_id) as nb_transactions,
        sum(revenue) as revenue,
        round(sum(revenue) / count(distinct orders_id), 1) as average_basket,
        sum(margin) as margin,
        sum(operational_margin) as operational_margin
    from base
    group by date_date
)

select * from aggregated