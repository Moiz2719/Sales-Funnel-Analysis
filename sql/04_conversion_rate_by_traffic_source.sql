-- 4. Conversion rate by traffic source
-- Compare stage-to-stage and overall conversion percentages by acquisition channel.
-- SAFE_DIVIDE returns NULL when a denominator is zero.

WITH source_funnel AS (
  SELECT
    traffic_source,
    COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS stage_1_views,
    COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart,
    COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
    COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS stage_5_purchase
  FROM `YOUR_PROJECT_ID.YOUR_DATASET.user_events`
  GROUP BY traffic_source
)

SELECT
  traffic_source,
  stage_1_views,
  stage_2_cart,
  stage_3_checkout,
  stage_4_payment,
  stage_5_purchase,
  ROUND(SAFE_DIVIDE(stage_2_cart * 100.0, stage_1_views), 2) AS view_to_cart_rate,
  ROUND(SAFE_DIVIDE(stage_3_checkout * 100.0, stage_2_cart), 2) AS cart_to_checkout_rate,
  ROUND(SAFE_DIVIDE(stage_4_payment * 100.0, stage_3_checkout), 2) AS checkout_to_payment_rate,
  ROUND(SAFE_DIVIDE(stage_5_purchase * 100.0, stage_4_payment), 2) AS payment_to_purchase_rate,
  ROUND(SAFE_DIVIDE(stage_5_purchase * 100.0, stage_1_views), 2) AS overall_conversion_rate
FROM source_funnel
ORDER BY overall_conversion_rate DESC;
