with sales as (
    select *
    from {{ ref('stg_raw_sales') }}
),

products as (
    select *
    from {{ ref('stg_raw_product') }}
),

joined as (
    select
        sales.orders_id,
        sales.date_date,
        sales.revenue,
        sales.quantity,
        products.purchase_price,
        sales.quantity * products.purchase_price as purchase_cost,
        sales.revenue - (sales.quantity * products.purchase_price) as margin
    from sales
    left join products
        on sales.products_id = products.products_id
)

select * from joined