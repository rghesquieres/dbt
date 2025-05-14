SELECT
  FORMAT_DATE('%Y-%m', date_date) AS datemonth,
  ROUND(SUM(ads_margin), 1) AS ads_margin,
  ROUND(AVG(average_basket), 1) AS average_basket,
  ROUND(SUM(operational_margin), 1) AS operational_margin,
  ROUND(SUM(ads_cost), 1) AS ads_cost,
  SUM(ads_impressions) AS ads_impressions,
  SUM(ads_clicks) AS ads_clicks,
  SUM(quantity) AS quantity,
  ROUND(SUM(revenue), 1) AS revenue,
  ROUND(SUM(purchase_cost), 1) AS purchase_cost,
  ROUND(SUM(margin), 1) AS margin,
  ROUND(SUM(shipping_fee), 1) AS shipping_fee,
  ROUND(SUM(log_cost), 1) AS logcost,
  ROUND(SUM(ship_cost), 1) AS ship_cost

FROM {{ ref('finance_campaigns_day') }}

GROUP BY datemonth
ORDER BY datemonth DESC