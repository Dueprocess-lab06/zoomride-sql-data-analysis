-- ============================================================
-- ZOOMRIDE SQL DATA ANALYSIS | MySQL
-- ============================================================
-- These queries are intended to be placed below
-- "YOUR QUERIES START HERE" in the original ZoomRide setup script.
-- ============================================================

-- Q1. Total trips
SELECT COUNT(*) AS total_trips
FROM trips;

-- Q2. Five longest completed trips
SELECT trip_id, city, distance_km, fare
FROM trips
WHERE status = 'Completed'
ORDER BY distance_km DESC
LIMIT 5;

-- Q3. Trips by city
SELECT city, COUNT(*) AS trip_count
FROM trips
GROUP BY city
ORDER BY trip_count DESC;

-- Q4a. Duplicate trips
SELECT
    customer_id,
    driver_id,
    trip_date,
    fare,
    COUNT(*) AS duplicate_count,
    MIN(trip_id) AS first_trip_id,
    MAX(trip_id) AS later_trip_id
FROM trips
GROUP BY customer_id, driver_id, trip_date, fare
HAVING COUNT(*) > 1;

-- Q4b. Completed trips with missing fare
SELECT COUNT(*) AS completed_trips_missing_fare
FROM trips
WHERE status = 'Completed'
  AND fare IS NULL;

-- Q5a. Standardize city names
UPDATE trips
SET city =
    CASE
        WHEN TRIM(city) = 'Lagos' THEN 'Lagos'
        WHEN TRIM(city) = 'Abuja' THEN 'Abuja'
        WHEN TRIM(city) = 'Accra' THEN 'Accra'
        WHEN TRIM(city) IN ('Nairobi', 'Nairobbi') THEN 'Nairobi'
        WHEN TRIM(city) IN ('Kampala', 'Kampla') THEN 'Kampala'
        WHEN TRIM(city) IN ('Port Harcourt', 'Port-Harcourt', 'PH')
            THEN 'Port Harcourt'
        ELSE TRIM(city)
    END;

-- Q5b. Delete duplicate rows; keep the first/lower trip_id
DELETE t1
FROM trips AS t1
INNER JOIN trips AS t2
    ON t1.customer_id = t2.customer_id
   AND t1.driver_id = t2.driver_id
   AND t1.trip_date = t2.trip_date
   AND t1.fare <=> t2.fare
   AND t1.trip_id > t2.trip_id;

-- Q5c. Verify city counts after cleaning
SELECT city, COUNT(*) AS trip_count
FROM trips
GROUP BY city
ORDER BY trip_count DESC;

-- Q5d. Verify total rows after cleaning
SELECT COUNT(*) AS total_trips_after_cleaning
FROM trips;

-- Q6. Revenue by city — completed trips only
SELECT
    city,
    COUNT(*) AS trip_count,
    SUM(fare) AS total_revenue,
    ROUND(AVG(fare), 2) AS average_fare
FROM trips
WHERE status = 'Completed'
GROUP BY city
ORDER BY total_revenue DESC;

-- Q7. Revenue by month — completed trips only
SELECT
    DATE_FORMAT(trip_date, '%Y-%m') AS month,
    COUNT(*) AS trip_count,
    SUM(fare) AS total_revenue
FROM trips
WHERE status = 'Completed'
GROUP BY DATE_FORMAT(trip_date, '%Y-%m')
ORDER BY month;

-- Q8. Revenue by vehicle type — completed trips only
SELECT
    d.vehicle_type,
    COUNT(*) AS trip_count,
    SUM(t.fare) AS total_revenue
FROM trips AS t
INNER JOIN drivers AS d
    ON t.driver_id = d.driver_id
WHERE t.status = 'Completed'
GROUP BY d.vehicle_type
ORDER BY total_revenue DESC;

-- Q9. Customers who never booked a trip
SELECT
    c.customer_id,
    c.customer_name,
    c.home_city
FROM customers AS c
LEFT JOIN trips AS t
    ON c.customer_id = t.customer_id
WHERE t.trip_id IS NULL;

-- Q10. Top 3 customers by completed-trip spending
SELECT
    c.customer_name,
    SUM(t.fare) AS total_spend,
    COUNT(*) AS trip_count
FROM customers AS c
INNER JOIN trips AS t
    ON c.customer_id = t.customer_id
WHERE t.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spend DESC
LIMIT 3;
