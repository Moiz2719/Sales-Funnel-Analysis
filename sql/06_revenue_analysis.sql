-- 6. Revenue analysis
-- Measure purchase events, purchasing users, total revenue, and average amount per purchase event.

SELECT
  COUNTIF(event_type = 'purchase') AS total_purchases,
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchasing_users,
  ROUND(SUM(CASE WHEN event_type = 'purchase' THEN amount ELSE 0 END), 2) AS total_revenue,
  ROUND(
    SAFE_DIVIDE(
      SUM(CASE WHEN event_type = 'purchase' THEN amount ELSE 0 END),
      COUNTIF(event_type = 'purchase')
    ),
    2
  ) AS average_order_value
FROM `YOUR_PROJECT_ID.YOUR_DATASET.user_events`;
