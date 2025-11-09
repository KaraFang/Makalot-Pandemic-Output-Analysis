# Makalot Pandemic Output Analysis

Table of Contents

- [Project Background](#project-background)
- [Executive Summary](#executive-summary)
- [Key Insights](#key-insights)
- [Recommendations](#recommendations)
- [Assumptions and Caveats](#assumptions-and-caveats)

***

## Project Background

Makalot Industrial Co., a global apparel manufacturer supplying brands such as Gap, Uniqlo, and Roots, faced severe operational challenges during the pandemic as shipment delays caused rising warehouse congestion and fulfillment backlogs. As Makalot’s Production Manager at the time, I revisited this real-world problem through the lens of a data analyst — combining operational experience with technical skills to quantify backlog exposure, evaluate warehouse capacity, and uncover insights to support data-driven production and logistics decisions.

## Executive Summary

Analysis of 20K+ production orders in 2021 shows that Makalot’s total backlog reached 36.6 million units, with over 55% concentrated among three key buyers — GTG (31.2%), RTS (13.2%), and POP (12.3%). Backlog carried over from May totaled 0.1M units, an uncommon rise likely driven by pandemic-related shipment delays or customer deferrals, warranting further review to confirm root causes. Production demand peaked in September at 15.2M units, creating short-term warehouse congestion and fulfillment delays. These findings suggest potential benefits from balancing production and shipment timing to smooth monthly volume fluctuations and reduce capacity strain during high-demand periods.

![Card](Visualizations/card.png)

## Key Insights

### Backlog Trends

- Total backlog reached 36.6M units in 2021, reported on 2021/6/7.
- Volume peaked in September (15.2M units), indicating temporary production or logistics constraints.
- Backlog declined gradually toward year-end as operations stabilized.

![Monthly Trend](Visualizations/monthly_supply_vs_demand_trend.png)

### Buyer Concentration

- Top three buyers — GTG (31.2%), RTS (13.2%), and POP (12.3%) — made up over half of total backlog.
- Highlights potential dependency risk and the need for closer coordination with key accounts during disruption periods.

![Top Buyers](Visualizations/backlog_overview.png)

### Operational Capacity

- The September spike suggests warehouse and shipment congestion.
- 0.1M overdue backlog from May points to early pandemic-driven delays requiring root-cause analysis.
- More balanced scheduling and shipment pull/push strategies could help mitigate similar risks in future cycles.

## Recommendations

### Supply & Logistics Agility

- Implement flexible pull-in/push-out shipment strategies to balance workload during peak months like September.
- Strengthen cross-functional forecast alignment to improve responsiveness to demand shifts and transport disruptions.

### Key Buyer Management

- Focus on top buyers (GTG, RTS, POP) through capacity alignment and shared visibility to reduce backlog accumulation.
- Apply tiered service levels for strategic accounts to safeguard fulfillment during constrained supply periods.

### Capacity & Inventory Optimization

- Establish rolling utilization thresholds to detect warehouse or labor bottlenecks before they impact output.
- Use scenario-based planning to test alternate shipment pacing and manpower allocation under dynamic supply conditions.

### Exception Monitoring & Root-Cause Control

- Deploy automated backlog alerts to flag deviations from plan and enable early corrective action.
- Conduct systematic root-cause reviews of overdue or aged orders (e.g., May backlog) to strengthen future contingency planning.

## Assumptions and Caveats

### Data Scope and Period:
The dataset covers production orders due between June and December 2021, extracted from Makalot’s internal order records as of June 7, 2021. Orders completed or created after this date are not reflected, which may slightly understate late-year shipment recovery.

### Shipment Disruption Attribution:
Backlog causes were inferred from production and order data only. The analysis assumes shipment delays, deferred customer schedules, or port congestion as primary drivers, but lacks direct logistics tracking to confirm root causes.

### Capacity Metrics and Interpretation:
Warehouse and production utilization were not covered in this report. These metrics remain within the purview of the management team, who can integrate their operational knowledge of space, workforce, and throughput with the presented demand and backlog trends to assess overall capacity sufficiency and identify required adjustments.
