-- models/intermediate/int_campaigns.sql

select
    date_date,
    paid_source,
    campaign_key,
    campaign_name,
    cast(ads_cost as FLOAT64) as ads_cost,
    impression,
    click
from {{ ref('stg_raw__adwords') }}

union all

select
    date_date,
    paid_source,
    campaign_key,
    campaign_name,
    cast(ads_cost as FLOAT64) as ads_cost,
    impression,
    click
from {{ ref('stg_raw__bing') }}

union all

select
    date_date,
    paid_source,
    campaign_key,
    campaign_name,
    cast(ads_cost as FLOAT64) as ads_cost,
    impression,
    click
from {{ ref('stg_raw__criteo') }}

union all

select
    date_date,
    paid_source,
    campaign_key,
    campaign_name,
    cast(ads_cost as FLOAT64) as ads_cost,
    impression,
    click
from {{ ref('stg_raw__facebook') }}