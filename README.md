# ✈️ Airline & Flight Operations Analysis

## Project Overview

This project focuses on analysing airline operations using **PostgreSQL**. It involves designing and building a relational database and using SQL queries to explore flight operations, passenger bookings, airline performance and payment transactions.

The objective is to answer business-related questions and generate meaningful insights from airline operational data.

## Tools & Technologies

- **Database:** PostgreSQL
- **SQL Editor:** Visual Studio Code
- **Version Control:** Git & GitHub

## Database Overview

The project consists of 7 interconnected tables:

1. Airlines
2. Airports
3. Aircraft
4. Flights
5. Passengers
6. Bookings
7. Payments

The database contains **2,258 records** across these seven tables.

## Analysis Performed

A total of **15 business questions** were explored using SQL, divided into three levels.

### 1. Basic Analysis

- Counted records across all seven database tables.
- Identified airlines operating the most flights.
- Analysed flight status distribution.
- Identified countries with the highest number of passengers.
- Analysed booking and payment status distributions.

### 2. Intermediate Analysis

- Compared average departure delays across airlines.
- Identified the top five busiest flight routes.
- Analysed airport departures and arrivals.
- Identified passengers with the most bookings.
- Compared airline revenue from completed payments.
- Analysed popular payment methods and failed transactions.

### 3. Advanced Analysis

- Ranked airlines based on their total number of flights.
- Identified the top five passengers based on total spending.
- Calculated each airline's percentage contribution to total flights.
- Calculated cumulative revenue over time.

## SQL Concepts Used

- SELECT, WHERE and ORDER BY
- GROUP BY and aggregate functions
- INNER JOIN and multiple table joins
- UNION ALL
- CASE statements
- Common Table Expressions (CTEs)
- Subqueries and window functions
- RANK() and cumulative SUM()

## Project Structure

```text
airline-flight-analysis/
│
├── data/
├── insights/
├── sql/
│   └── analysis_queries.sql
│
├── .gitignore
└── README.md
```

## Learning Outcomes

Through this project, I gained practical experience in:

- Designing relational databases.
- Creating tables with primary keys, foreign keys and constraints.
- Managing and analysing structured data using PostgreSQL.
- Writing SQL queries to solve business-related problems.
- Applying joins, aggregations and window functions.
- Using Git and GitHub for project version control.

## Future Improvements

- Create visual dashboards using Power BI.
- Explore additional airline performance metrics.
- Present key findings through data visualisations.

## Author

**Srushti Vejare**

BSc IT Student | Aspiring Data Analyst

[GitHub Profile](https://github.com/srushtivejare23)