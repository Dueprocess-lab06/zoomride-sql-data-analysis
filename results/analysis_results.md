# ZoomRide SQL Data Analysis — Results

## Project Overview

This project analyzes ZoomRide trip data using MySQL to identify trip patterns, revenue performance, customer behavior, and data-quality issues.

The analysis covers 300 original trip records involving customers and drivers across six cities. The dataset contains deliberately messy data, including inconsistent city names, duplicate trip records, and missing fare values.

---

## Tools Used

- MySQL
- SQL
- GitHub

---

## Key Questions and Results

### Q1. Total Number of Trips

The original dataset contained:

**300 trips**

---

### Q2. Top 5 Longest Completed Trips

| Trip ID | City | Distance (km) | Fare |
|---:|---|---:|---:|
| 250 | Lagos | 35.9 | 6240 |
| 225 | Lagos | 33.4 | 8820 |
| 126 | Kampala | 33.1 | 5800 |
| 98 | Abuja | 32.8 | 5750 |
| 151 | Lagos | 31.3 | 3330 |

---

### Q3. Trips by City — Before Cleaning

The original city names produced the following counts:

| City | Trips |
|---|---:|
| Lagos | 100 |
| Abuja | 40 |
| Accra | 39 |
| Nairobi | 33 |
| Port Harcourt | 32 |
| Kampala | 26 |
| PH | 5 |
| Nairobbi | 5 |
| Accra (leading space) | 5 |
| Port-Harcourt | 5 |
| Kampla | 5 |
| Lagos (leading space) | 5 |

The inconsistent spellings caused some trips belonging to the same city to appear as separate groups.

---

## Data Cleaning

### City Name Cleaning

The following city variations were standardized:

- `Nairobbi` → `Nairobi`
- `Kampla` → `Kampala`
- `PH` → `Port Harcourt`
- `Port-Harcourt` → `Port Harcourt`
- Leading/trailing spaces were removed from city names.

### Duplicate Records

Two duplicate trip groups were identified.

#### Duplicate Group 1

- Customer ID: 18
- Driver ID: 11
- Trip date: 2025-10-13
- Fare: 2550
- Trip IDs: 82 and 299

#### Duplicate Group 2

- Customer ID: 22
- Driver ID: 11
- Trip date: 2026-05-16
- Fare: 2620
- Trip IDs: 253 and 300

The duplicate records were removed while keeping the first occurrence.

### Missing Fares

There were:

**9 completed trips with missing fare values.**

The missing fares were not replaced or estimated because the correct fare values could not be determined from the available data.

---

## Q5. Trips by City — After Cleaning

After standardizing city names and removing duplicate records:

| City | Trips |
|---|---:|
| Lagos | 105 |
| Accra | 44 |
| Port Harcourt | 40 |
| Abuja | 40 |
| Nairobi | 38 |
| Kampala | 31 |

### Total Trips After Cleaning

**298 trips**

The reduction from 300 to 298 is due to the removal of the two duplicate records.

---

# Q6. Completed Revenue by City

| City | Completed Trips | Total Revenue | Average Fare |
|---|---:|---:|---:|
| Lagos | 93 | 218,890.00 | 2,405.38 |
| Accra | 37 | 92,640.00 | 2,807.27 |
| Abuja | 36 | 88,720.00 | 2,464.44 |
| Port Harcourt | 31 | 71,240.00 | 2,374.67 |
| Nairobi | 32 | 58,960.00 | 1,901.94 |
| Kampala | 19 | 38,020.00 | 2,112.22 |

### Key Finding

Lagos generated the highest completed-trip revenue:

**₦218,890 from 93 completed trips.**

Accra recorded the second-highest revenue at:

**₦92,640 from 37 completed trips.**

Although Accra had the highest average fare at **₦2,807.27**, Lagos generated substantially more total revenue because it had a much higher number of completed trips.

---

# Q7. Completed Revenue by Month

| Month | Completed Trips | Total Revenue |
|---|---:|---:|
| 2025-07 | 21 | 48,440 |
| 2025-08 | 24 | 48,520 |
| 2025-09 | 17 | 37,700 |
| 2025-10 | 18 | 40,800 |
| 2025-11 | 20 | 45,760 |
| 2025-12 | 31 | 66,980 |
| 2026-01 | 18 | 39,530 |
| 2026-02 | 17 | 46,800 |
| 2026-03 | 20 | 54,330 |
| 2026-04 | 14 | 21,160 |
| 2026-05 | 23 | 64,140 |
| 2026-06 | 25 | 54,310 |

### Key Finding

December 2025 recorded the highest monthly revenue at:

**₦66,980 from 31 completed trips.**

April 2026 recorded the lowest monthly revenue at:

**₦21,160 from 14 completed trips.**

---

# Q8. Completed Revenue by Vehicle Type

| Vehicle Type | Completed Trips | Total Revenue |
|---|---:|---:|
| Economy | 121 | 262,550 |
| Comfort | 76 | 239,050 |
| Bike | 51 | 66,870 |

### Key Finding

Economy vehicles generated the highest total revenue:

**₦262,550 from 121 completed trips.**

Comfort vehicles generated **₦239,050**, while Bike trips generated **₦66,870**.

---

# Q9. Customers Who Never Booked

Four customers had no recorded trips:

| Customer ID | Customer Name | Home City |
|---:|---|---|
| 7 | Bisi Ogunleye | Lagos |
| 23 | Wanjiru Kamau | Nairobi |
| 29 | Akinyi Ouma | Nairobi |
| 36 | Nakato Namutebi | Kampala |

These customers may represent potential opportunities for customer acquisition or re-engagement.

---

# Q10. Top 3 Customers by Completed Spend

| Rank | Customer | Completed Spend | Completed Trips |
|---:|---|---:|---:|
| 1 | Chioma Nwosu | 38,950 | 21 |
| 2 | Tunde Bakare | 37,610 | 13 |
| 3 | Zainab Garba | 35,380 | 15 |

Chioma Nwosu recorded the highest completed-trip spending at **₦38,950 across 21 trips**.

---

# Manager Recommendation

Based on the cleaned data, **Lagos is the strongest candidate for further investment**, generating **₦218,890 in revenue across 93 completed trips**, the highest among all six cities.

However, the analysis identified important data-quality issues, including inconsistent city naming and two duplicate trip records, which could lead to incorrect trip counts and revenue reporting if left unresolved.

The dataset also contains **9 completed trips with missing fares**, creating uncertainty around the true revenue generated.

Before making a major investment decision, I would like to understand the causes and financial impact of these missing fares and consider additional business metrics such as profitability and customer demand.

---

# SQL Skills Demonstrated

This project demonstrates the use of:

- `SELECT`
- `WHERE`
- `COUNT()`
- `SUM()`
- `AVG()`
- `GROUP BY`
- `ORDER BY`
- `LIMIT`
- `JOIN`
- `LEFT JOIN`
- `CASE`
- `TRIM()`
- `DATE_FORMAT()`
- `HAVING`
- `IS NULL`
- Duplicate detection
- Data cleaning
- Data deletion
- Aggregation
- Business-focused analysis

---

# Project Takeaways

The analysis shows how SQL can be used to move from raw operational data to business insights.

The main findings were:

1. Lagos was the highest-revenue city.
2. Economy vehicles generated the highest total revenue.
3. December 2025 recorded the highest monthly revenue.
4. Four customers had never booked a trip.
5. Two duplicate trip records were identified and removed.
6. City-name inconsistencies affected the original city-level analysis.
7. Nine completed trips had missing fare values.
8. Data quality should be considered before making major business decisions.

---

## Conclusion

The ZoomRide analysis demonstrates the importance of combining SQL querying with data cleaning and business interpretation. Cleaning inconsistent city names and duplicate records improved the reliability of the analysis, while the missing fare values highlighted an important limitation in the available data.

Based on the available revenue data, Lagos currently shows the strongest performance and would be the leading candidate for further investigation and potential investment.
