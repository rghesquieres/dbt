with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
        pdt_id,
        cast(purchse_PRICE as FLOAT64) as purchase_price,
    from source

)

select * from renamed