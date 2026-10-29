# Methodology

## 1. Funnel-stage counts

The first query counts distinct `user_id` values for each event type. Since each stage is counted independently across the event table, the resulting counts do not automatically prove that users moved through stages in order within one session.

## 2. Conversion rates

The second query calculates adjacent-stage percentages:

- add to cart divided by page-view users;
- checkout-start users divided by add-to-cart users;
- payment-info users divided by checkout-start users;
- purchase users divided by payment-info users;
- purchase users divided by page-view users.

The traffic-source conversion query repeats these calculations per source. `SAFE_DIVIDE` is used in the refactored version to return NULL when the denominator is zero instead of raising a division error. Interpret percentages carefully if stages were not measured over the same cohort, period, or session definition.

## 3. Traffic-source comparison

Queries group distinct users by `traffic_source`, allowing counts and conversion percentages to be compared across acquisition channels. Before attributing performance differences to a source, check source attribution rules and whether users can have more than one source.

## 4. Time to conversion

The time query groups events by user and takes the earliest observed page view, add-to-cart, and purchase timestamps, keeping users with a purchase event. It calculates average time differences in minutes among users with both view and cart timestamps. Confirm that timestamp types and timezone handling are appropriate. Earliest observed events can span sessions or have unexpected ordering if the dataset does not enforce a single journey.

## 5. Revenue analysis

The revenue query counts purchase events, counts distinct purchasers, sums `amount` for purchase events, and divides purchase revenue by the number of purchase events. This result is strictly average revenue per purchase event unless the schema establishes that one purchase event equals one order.

## Reproducibility

The SQL definitions came from the uploaded file and are organised into separate modules. The original project-specific BigQuery path has been replaced with a placeholder. The queries have not been executed against the underlying table because the dataset and result outputs were not supplied.
