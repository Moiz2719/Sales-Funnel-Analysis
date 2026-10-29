# Findings and Limitations

## What the SQL is designed to measure

- Unique users at each sales-funnel stage.
- Stage-to-stage and overall conversion percentages.
- Funnel counts and conversion percentages by traffic source.
- Average elapsed minutes between observed views, cart additions, and purchases for relevant users.
- Purchase-event count, number of distinct purchasing users, total purchase revenue, and average amount per purchase event.

## Results availability

The supplied file contains SQL query definitions only. It does not include executed results, screenshots of BigQuery outputs, or a data extract. No numeric findings or traffic-source rankings can be verified from the supplied source alone.

## Limitations and assumptions

1. **Independent stage counts:** Counting distinct users at each event type does not guarantee a strict sequential funnel or a common session/cohort.
2. **Event attribution:** The queries use one `traffic_source` field. Its definition and whether a user can appear under multiple sources are unknown.
3. **Date type:** `TIMESTAMP_DIFF` requires compatible timestamp/datetime operands. The source field's data type was not supplied.
4. **Journey sequencing:** Taking minimum timestamps per user can combine different sessions; the query does not explicitly enforce event order.
5. **Average order value label:** The query divides purchase-event revenue by purchase-event count. Validate that one purchase event means one order before labelling this as average order value.
6. **Revenue semantics:** Currency, tax/discount handling, duplicate event handling, and the definition of `amount` were not provided.
7. **Zero denominators:** Conversion-rate expressions in the refactored queries use `SAFE_DIVIDE`; such rates appear as NULL when the denominator is zero.

Review these assumptions and validate all SQL outputs against the actual BigQuery schema before publishing business conclusions.
