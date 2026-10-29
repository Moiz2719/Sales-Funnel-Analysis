# Methodology

## 1. Funnel-stage counts

Count distinct `user_id` values for each event type to show user volume at page view, add to cart, checkout start, payment information, and purchase stages.

## 2. Conversion rates

Calculate add-to-cart users as a percentage of page-view users; checkout-start users as a percentage of add-to-cart users; payment-info users as a percentage of checkout-start users; purchase users as a percentage of payment-info users; and purchase users as a percentage of page-view users. `SAFE_DIVIDE` returns NULL when a denominator is zero.

## 3. Traffic-source comparison

Group distinct users by `traffic_source` to compare funnel counts and conversion percentages across acquisition channels.

## 4. Time to conversion

Group events by user, identify the earliest observed page view, add-to-cart, and purchase timestamps, and calculate average elapsed minutes among users with the required events.

## 5. Revenue analysis

Count purchase events, count distinct purchasing users, sum `amount` for purchase events, and calculate average revenue per purchase event.

## 6. Query setup

The SQL definitions are organised into separate modules. Replace the sample BigQuery table path with the fully qualified table name for the dataset being analysed.
