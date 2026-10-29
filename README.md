# User Analytics & Sales Funnel Analysis

A Google BigQuery SQL project that analyses user behaviour across five sales-funnel stages: page view, add to cart, checkout start, payment information, and purchase. The queries measure funnel size, stage-to-stage conversion, acquisition-channel performance, time to conversion, and purchase revenue.

## High-level architecture

```mermaid
flowchart TD
    A[BigQuery user_events table] --> B[Count unique users at each funnel stage]
    B --> C[Calculate overall conversion rates]
    B --> D[Compare funnel performance by traffic source]
    A --> E[Measure time between user events]
    A --> F[Analyse purchases and revenue]
    C --> G[Review funnel drop-off]
    D --> H[Compare acquisition channels]
    E --> I[Understand conversion journey duration]
    F --> J[Review revenue and average order value]
    G --> K[Business insights and recommendations]
    H --> K
    I --> K
    J --> K
```

## Business questions

- How many unique users reach each of the five funnel stages?
- What proportion of users progress between stages and from initial view to purchase?
- How does funnel performance differ by traffic source?
- How long does it take converting users to move from viewing a page to adding to cart and purchasing?
- How many purchase events and purchasing users are recorded, and what are total revenue and average order value?

## Repository structure

```text
Sales-Funnel-Analysis/
├── README.md
├── .gitignore
├── sql/
│   ├── 01_overall_sales_funnel.sql
│   ├── 02_sales_funnel_conversion_rates.sql
│   ├── 03_sales_funnel_by_traffic_source.sql
│   ├── 04_conversion_rate_by_traffic_source.sql
│   ├── 05_time_to_conversion.sql
│   └── 06_revenue_analysis.sql
└── Docs/
    ├── project_overview.md
    ├── data_dictionary.md
    ├── methodology.md
    └── findings.md
```

## Tools

Google BigQuery and SQL.

## Setup and run

1. Make sure you have access to a BigQuery dataset containing an `user_events` table with the fields documented in `Docs/data_dictionary.md`.
2. In each SQL file, replace `YOUR_PROJECT_ID.YOUR_DATASET.user_events` with your actual fully qualified BigQuery table name.
3. Open the query file in BigQuery SQL workspace and run it. Review the output before drawing conclusions.

## Query modules

| File | Purpose |
|---|---|
| `01_overall_sales_funnel.sql` | Counts distinct users at each stage. |
| `02_sales_funnel_conversion_rates.sql` | Calculates stage-to-stage and overall conversion percentages. |
| `03_sales_funnel_by_traffic_source.sql` | Counts funnel-stage users for each traffic source. |
| `04_conversion_rate_by_traffic_source.sql` | Calculates funnel conversion percentages by source. |
| `05_time_to_conversion.sql` | Estimates elapsed time between key events for users who purchased. |
| `06_revenue_analysis.sql` | Summarises purchase events, purchasing users, total revenue, and average order value. |

