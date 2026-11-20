
# Airline & Flight Operations Analysis – Key Insights

## Project Summary

This document highlights the key findings obtained from analysing airline operations using PostgreSQL.

The analysis covers airline performance, flight operations, passenger bookings, routes and payment transactions.

## 1. Average Departure Delay by Airline

**Business Question:** Which airlines have the highest average departure delays?

**Finding:**

- IndiGo recorded the highest average departure delay of 107.20 minutes.
- British Airways recorded the lowest average departure delay of 72.05 minutes.
- The results help compare departure delay performance across airlines.

**SQL Concepts Used:** JOIN, AVG(), GROUP BY, WHERE and ORDER BY.


## 2. Flight Status Distribution

**Business Question:** What is the distribution of flight statuses?

**Finding:**

- Total flights analysed: 500.
- Scheduled flights: 205 (41%).
- On Time flights: 185 (37%).
- Delayed flights: 81 (16.2%).
- Cancelled flights: 29 (5.8%).

**Business Observation:**

Scheduled and On Time flights together account for 78% of all records. Delayed and Cancelled flights account for the remaining 22%.

**SQL Concepts Used:** COUNT(), GROUP BY and ORDER BY.


## 3. Top 5 Busiest Flight Routes

**Business Question:** Which are the top five busiest flight routes?

**Finding:**

| Origin City | Destination City | Total Flights |
|---|---|---:|
| Bengaluru | Doha | 25 |
| Sydney | Kolkata | 25 |
| Dubai | Melbourne | 25 |
| Mumbai | Singapore | 25 |
| Abu Dhabi | New York | 25 |

**Business Observation:**

All five routes have an equal number of flights (25 each). This indicates that no single route leads among the top five in this dataset.

**SQL Concepts Used:** Multiple JOINs, COUNT(), GROUP BY, ORDER BY and LIMIT.


## 4. Airline Revenue Analysis

**Business Question:** Which airlines generate the highest revenue from completed payments?

**Finding:**

- IndiGo ranked first with 922136.59 in completed payment revenue.
- Lufthansa ranked second with 908704.30.
- Qatar Airways ranked third with 882542.39.
- Singapore Airlines recorded the lowest revenue with 725235.92.

**Business Observation:**

IndiGo generated the highest completed payment revenue among the eight airlines analysed. The results help compare revenue performance across airlines.

**SQL Concepts Used:** Multiple JOINs, SUM(), WHERE, GROUP BY and ORDER BY.


## 5. Airline Ranking Based on Total Flights

**Business Question:** How do airlines rank based on their total number of flights?

**Finding:**

- Four airlines operated 63 flights each and shared rank 1.
- The remaining four airlines operated 62 flights each and shared rank 5.

**Business Observation:**

The difference in flight counts between the two groups is only one flight. This shows a nearly equal distribution of flights across all eight airlines.

**SQL Concepts Used:** JOIN, COUNT(), GROUP BY and RANK() window function.


## 6. Cumulative Revenue Analysis

**Business Question:** How does completed payment revenue accumulate over time?

**Finding:**

- Total daily records analysed: 350.
- Analysis period: 1 October 2025 to 15 September 2026.
- Cumulative revenue by 15 September 2026: 6718582.63.
- Revenue on the final recorded day: 30736.36.

**Business Observation:**

The cumulative revenue analysis shows how completed payment revenue builds over time. By 15 September 2026, the total cumulative revenue reached 6718582.63.

**SQL Concepts Used:** CTEs, SUM(), GROUP BY and SUM() OVER (ORDER BY).
