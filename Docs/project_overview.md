# Project Overview

## Purpose

Analyse user activity recorded in a BigQuery events table and summarise behaviour across a five-stage sales funnel.

## Funnel stages

1. **Page view** — `event_type = 'page_view'`
2. **Add to cart** — `event_type = 'add_to_cart'`
3. **Checkout start** — `event_type = 'checkout_start'`
4. **Payment information** — `event_type = 'payment_info'`
5. **Purchase** — `event_type = 'purchase'`

## Analysis modules

- Overall unique-user counts at each funnel stage.
- Conversion percentages between adjacent stages and overall view-to-purchase conversion.
- Stage counts and conversion rates by `traffic_source`.
- Approximate elapsed minutes between view, cart, and purchase for observed purchasers.
- Purchase-event count, purchasing-user count, total purchase revenue, and average amount per purchase event.

## Input

The SQL queries expect a BigQuery table named `user_events` containing the columns described in `data_dictionary.md`. Replace the `YOUR_PROJECT_ID.YOUR_DATASET.user_events` placeholder in each query with the actual fully qualified table path.

## Outputs

Each SQL file returns a result set directly in BigQuery. No query-result exports were included with the supplied SQL file; therefore, this repository does not state measured conversion or revenue results.
