# Data Dictionary

The uploaded SQL file references the following fields in the BigQuery table `user_events`. Their meanings below are inferred from how the SQL uses them; the underlying table schema was not provided.

| Field | Meaning inferred from queries | Used for |
|---|---|---|
| `user_id` | Identifier for a user | Distinct-user counts and grouping individual event journeys. |
| `event_type` | Name/type of an event | Identifying page views, cart additions, checkout starts, payment-info events, and purchases. |
| `traffic_source` | Acquisition or traffic channel | Grouping the funnel by source. |
| `event_date` | Event timestamp/date-time | Calculating the earliest event times and elapsed minutes between events. |
| `amount` | Monetary amount associated with an event | Summing purchase amounts and calculating average amount per purchase event. |

## Schema checks before running

- Confirm the exact column names and types in BigQuery.
- The time-to-conversion query calls `TIMESTAMP_DIFF(..., MINUTE)`. Confirm that `event_date` is a compatible TIMESTAMP field (or adapt the expression for its actual type).
- Confirm whether `amount` is populated only for purchases and whether its units/currency are consistent.
- Confirm whether one purchase event represents one order. The original query counts purchase events, not distinct order identifiers.
