-- 3. Sales funnel by traffic source
-- Compare user counts at each funnel stage across acquisition channels.

SELECT
  traffic_source,
  COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS stage_1_views,
  COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart,
  COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
  COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS stage_5_purchase
FROM `YOUR_PROJECT_ID.YOUR_DATASET.user_events`
GROUP BY traffic_source
ORDER BY stage_1_views DESC;
