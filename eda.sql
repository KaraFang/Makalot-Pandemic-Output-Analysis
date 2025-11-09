-- ======================================================
-- Pandemic Output Analytics
-- Data extracted Date: 2021/6/7
-- ======================================================


-- 1) Load (staging)
-- Drop tables/Views if they exist to ensure the script can rerun cleanly
DROP VIEW  IF EXISTS v_buyer_backlog;
DROP VIEW  IF EXISTS v_overdue;
DROP VIEW  IF EXISTS v_orders_kpi;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS orders_raw;

CREATE TABLE orders_raw (
  buyer TEXT,
  style TEXT,
  due_date TEXT,
  po TEXT,
  po_qty TEXT,
  packed_qty TEXT
);

COPY orders_raw
FROM 'C:\Users\Kara\samplepath\makalot_data.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE orders AS
SELECT
  buyer, style, po,
  due_date::date  AS due_date,
  CAST(po_qty AS INT)         AS po_qty,
  CAST(packed_qty AS INT)     AS packed_qty
FROM orders_raw;


-- 2) Data quality checks
-- Row count
SELECT COUNT(*) AS row_count FROM orders;
-- Ranges
SELECT MIN(due_date) AS min_due, MAX(due_date) AS max_due FROM orders;
-- Integrity
SELECT COUNT(*) AS packed_order FROM orders WHERE packed_qty > po_qty*1.1;
SELECT COUNT(*) AS null_due FROM orders WHERE due_date IS NULL;


-- 3) Create Views — reusable source for Power BI
-- Added remaining_qty and due_week to support later exploration
CREATE VIEW v_orders_kpi AS
SELECT
  buyer, style, po, due_date, po_qty, packed_qty,
  GREATEST(po_qty - packed_qty, 0) AS remaining_qty,
  DATE_TRUNC('week', due_date)::date AS due_week
FROM orders;

-- Backlog by buyer
CREATE VIEW v_buyer_backlog AS
SELECT buyer, SUM(remaining_qty) AS backlog_units
FROM v_orders_kpi
GROUP BY buyer
ORDER BY backlog_units DESC;


-- 4) Exploratory data analysis
-- Backlog: What are the Top 6 buyers with the most backlog
SELECT buyer,
       SUM(remaining_qty) AS backlog_units,
       ROUND(100.0 * SUM(remaining_qty) / SUM(SUM(remaining_qty)) OVER (), 1) || '%'AS pct_of_total
FROM v_orders_kpi
WHERE due_date BETWEEN '2021-06-07' AND '2021-12-31'
GROUP BY buyer
ORDER BY backlog_units DESC
LIMIT 6;

-- Capacity Estimate: Shows the output trend and spikes from June, 2021 utill the end of the year.
SELECT 
  TO_CHAR(DATE_TRUNC('month', due_date), 'YYYY-MM') AS month,
  SUM(remaining_qty) AS total_backlog,
  ROUND(100.0 * SUM(remaining_qty) / SUM(SUM(remaining_qty)) OVER (), 1) || '%' AS pct_of_total
FROM v_orders_kpi
WHERE due_date BETWEEN '2021-06-01' AND '2021-12-31'
GROUP BY DATE_TRUNC('month', due_date)
ORDER BY month;