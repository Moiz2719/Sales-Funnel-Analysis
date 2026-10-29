# Findings

This project contains SQL queries designed to produce these business metrics:

## Sales funnel

- Unique users at page view, add-to-cart, checkout-start, payment-information, and purchase stages.
- Stage-to-stage conversion percentages and overall view-to-purchase conversion.

## Acquisition channels

- User counts at each stage grouped by traffic source.
- Conversion percentages by traffic source for comparison of channel performance.

## Conversion timing

- Average elapsed minutes between the earliest observed page view and add-to-cart events.
- Average elapsed minutes between the earliest observed add-to-cart and purchase events.
- Average elapsed minutes across the observed view-to-purchase journey.

## Revenue

- Number of purchase events.
- Number of distinct purchasing users.
- Total amount associated with purchase events.
- Average amount per purchase event.

The SQL modules are available in the `sql/` folder and can be run in BigQuery after setting the fully qualified table name.
