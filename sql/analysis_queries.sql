
-- =====================================================
-- PROJECT: AIRLINE & FLIGHT OPERATIONS ANALYSIS
-- DATABASE: PostgreSQL
-- PURPOSE: Analyse airline operations, flights,
-- passengers, bookings and payments.
-- =====================================================


-- =====================================================
-- SECTION 1: BASIC ANALYSIS
-- =====================================================


-- Q1. Count the total records in all 7 tables.

SELECT 'airlines' AS table_name, COUNT(*) AS total_records
FROM airlines

UNION ALL

SELECT 'airports', COUNT(*) FROM airports

UNION ALL

SELECT 'aircraft', COUNT(*) FROM aircraft

UNION ALL

SELECT 'flights', COUNT(*) FROM flights

UNION ALL

SELECT 'passengers', COUNT(*) FROM passengers

UNION ALL

SELECT 'bookings', COUNT(*) FROM bookings

UNION ALL

SELECT 'payments', COUNT(*) FROM payments;


-- Q2. Find which airlines operate the most flights.

SELECT
    a.airline_name,
    COUNT(f.flight_id) AS total_flights
FROM airlines a
JOIN flights f
    ON a.airline_id = f.airline_id
GROUP BY a.airline_name
ORDER BY total_flights DESC;


-- Q3. Analyse the distribution of flight statuses.

SELECT
    flight_status,
    COUNT(*) AS total_flights
FROM flights
GROUP BY flight_status
ORDER BY total_flights DESC;


-- Q4. Find countries with the highest number of passengers.

SELECT
    country,
    COUNT(*) AS total_passengers
FROM passengers
GROUP BY country
ORDER BY total_passengers DESC;


-- Q5. Analyse booking and payment status distributions.

-- Part A: Booking status distribution

SELECT
    booking_status,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY booking_status
ORDER BY total_bookings DESC;


-- Part B: Payment status distribution

SELECT
    payment_status,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_status
ORDER BY total_payments DESC;


-- =====================================================
-- SECTION 2: INTERMEDIATE ANALYSIS
-- =====================================================


-- Q6. Find airlines with the highest average departure delays.

SELECT
    a.airline_name,
    ROUND(AVG(f.departure_delay_minutes), 2)
        AS average_delay_minutes
FROM airlines a
JOIN flights f
    ON a.airline_id = f.airline_id
WHERE f.flight_status <> 'Cancelled'
GROUP BY a.airline_name
ORDER BY average_delay_minutes DESC;


-- Q7. Find the top 5 busiest flight routes.

SELECT
    origin.city AS origin_city,
    destination.city AS destination_city,
    COUNT(*) AS total_flights
FROM flights f
JOIN airports origin
    ON f.origin_airport_id = origin.airport_id
JOIN airports destination
    ON f.destination_airport_id = destination.airport_id
GROUP BY origin.city, destination.city
ORDER BY total_flights DESC
LIMIT 5;


-- Q8. Analyse airport departures and arrivals.

SELECT
    a.airport_name,
    a.city,
    'Departure' AS operation_type,
    COUNT(*) AS total_flights
FROM airports a
JOIN flights f
    ON a.airport_id = f.origin_airport_id
GROUP BY a.airport_name, a.city

UNION ALL

SELECT
    a.airport_name,
    a.city,
    'Arrival' AS operation_type,
    COUNT(*) AS total_flights
FROM airports a
JOIN flights f
    ON a.airport_id = f.destination_airport_id
GROUP BY a.airport_name, a.city

ORDER BY total_flights DESC;


-- Q9. Find the top 10 passengers with the most bookings.

SELECT
    p.passenger_id,
    p.first_name,
    p.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM passengers p
JOIN bookings b
    ON p.passenger_id = b.passenger_id
GROUP BY
    p.passenger_id,
    p.first_name,
    p.last_name
ORDER BY total_bookings DESC
LIMIT 10;


-- Q10. Find airlines generating the highest revenue
-- from completed payments.

SELECT
    a.airline_name,
    ROUND(SUM(p.amount), 2) AS total_revenue
FROM payments p
JOIN bookings b
    ON p.booking_id = b.booking_id
JOIN flights f
    ON b.flight_id = f.flight_id
JOIN airlines a
    ON f.airline_id = a.airline_id
WHERE p.payment_status = 'Completed'
GROUP BY a.airline_name
ORDER BY total_revenue DESC;


-- Q11. Analyse payment methods and failed payments.

SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(
        CASE
            WHEN payment_status = 'Failed' THEN 1
            ELSE 0
        END
    ) AS failed_payments
FROM payments
GROUP BY payment_method
ORDER BY total_transactions DESC;


-- =====================================================
-- SECTION 3: ADVANCED ANALYSIS
-- =====================================================


-- Q12. Rank airlines based on their total number of flights.

SELECT
    a.airline_name,
    COUNT(f.flight_id) AS total_flights,
    RANK() OVER (
        ORDER BY COUNT(f.flight_id) DESC
    ) AS airline_rank
FROM airlines a
JOIN flights f
    ON a.airline_id = f.airline_id
GROUP BY a.airline_name
ORDER BY airline_rank;


-- Q13. Find the top 5 passengers based on total spending.

SELECT
    p.passenger_id,
    p.first_name,
    p.last_name,
    ROUND(SUM(pay.amount), 2) AS total_spending
FROM passengers p
JOIN bookings b
    ON p.passenger_id = b.passenger_id
JOIN payments pay
    ON b.booking_id = pay.booking_id
WHERE pay.payment_status = 'Completed'
GROUP BY
    p.passenger_id,
    p.first_name,
    p.last_name
ORDER BY total_spending DESC
LIMIT 5;


-- Q14. Calculate each airline's percentage contribution to total flights.

WITH airline_flights AS (
    SELECT
        a.airline_name,
        COUNT(f.flight_id) AS total_flights
    FROM airlines a
    JOIN flights f
        ON a.airline_id = f.airline_id
    GROUP BY a.airline_name
)
SELECT
    airline_name,
    total_flights,
    ROUND(
        total_flights * 100.0 /
        SUM(total_flights) OVER(),
        2
    ) AS flight_percentage
FROM airline_flights
ORDER BY flight_percentage DESC;


-- Q15. Calculate cumulative revenue over time.

WITH daily_revenue AS (
    SELECT
        payment_date::DATE AS payment_day,
        SUM(amount) AS daily_revenue
    FROM payments
    WHERE payment_status = 'Completed'
    GROUP BY payment_date::DATE
)
SELECT
    payment_day,
    ROUND(daily_revenue, 2) AS daily_revenue,
    ROUND(
        SUM(daily_revenue) OVER (
            ORDER BY payment_day
        ),
        2
    ) AS cumulative_revenue
FROM daily_revenue
ORDER BY payment_day;
