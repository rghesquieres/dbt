with source as (
    select * 
    from {{ source('raw', 'ship') }}
    where shipping_fee <> shipping_fee_1  -- pour analyser la différence si besoin
),

renamed as (
    select
        order_id,
        cast(ship_cost as FLOAT64) as ship_cost,
        shipping_fee,  -- garde seulement l’un des deux
        -- supprime ou commente shipping_fee_1 si inutilisé
    from source
)

select * from renamed