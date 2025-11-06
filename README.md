# Makalot Pandemic Output Analysis

Table of Contents

- [Project Background](#project-background)
- [Executive Summary](#executive-summary)
- [Key Insights](#key-insights)
- [Recommendations](#recommendations)
- [Assumptions and Caveats](#assumptions-and-caveats)

***

## Project Background

Pandemic shipping delays created a packed-goods backlog and warehouse capacity risk. This MVP turns a single PO dataset into clear backlog and overdue visibility for faster decisions.

## Executive Summary

Backlog is concentrated: Top 3 buyers account for __% of remaining units.

Risk is near-term: __ POs are overdue; __% of backlog is due within 7 days.

Immediate actions: Prioritize shipping for Buyer X/Style Y and raise outbound by +__ pallets/day to keep utilization under __%.

## Key Insights

Backlog by Buyer: Buyer A = __ units (__% of total).

Completion Rate: Average __%; lagging for Buyer B (__%).

Overdue: __ POs overdue > 7 days; oldest due YYYY-MM-DD.

(If you add capacity later) Utilization: Now __%; Days to Full: __ at current rates.

## Recommendations

Ship sequence: Clear Buyer A & Style Z first (largest aging backlog).

Capacity relief: Increase outbound to __ /day this week; target <85% utilization.

Exception review: Escalate __ oldest POs; root-cause by vendor/buyer.

## Assumptions and Caveats

Single dataset (PO level); no carry-over logic or pricing.

Completion = packed_qty / po_qty; remaining = max(po_qty − packed_qty, 0).

Overdue = due_date < today and remaining > 0.

## How to Use / Refresh SOP
