SELECT
  f.date_date,
  ROUND(f.operational_margin - c.ads_cost, 1) AS ads_margin,
  f.average_basket,
  f.operational_margin,
  c.ads_cost,
  c.ads_impressions,
  c.ads_clicks,
  f.quantity,
  f.revenue,
  f.purchase_cost,
  f.margin,
  f.shipping_fee,
  f.logcost,
  f.ship_cost

FROM {{ ref('finance_days') }} f
LEFT JOIN {{ ref('int_campaigns_day') }} c
  ON f.date_date = c.date_date

ORDER BY f.date_date DESC