# zoomride-sql-data-analysis
___
## Project Overview
This project analyzes ZoomRide trip data using MySQL to identify trip patterns, revenue performance, customer behavior, and data-quality issues. The analysis covers 300 original trip records involving customers and drivers across six cities. The dataset contains deliberately messy data, including inconsistent city names, duplicate trip records, and missing fare values.

---
## Tools Used

- MySQL
- SQL
___
## Project Files

- 📄 [SQL Analysis Queries](sql/zoomride_analysis.sql)
- 📊 [Analysis Results](results/analysis_results.md) — Detailed findings, cleaned results, revenue analysis, customer analysis, and business recommendations.

___
## Analysis and key Findings 
- How many trips were recorded?
The dataset initially contained **300 trip records**.
- What were the 5 longest completed trips?
The five longest completed trips ranged from **31.3 km to 35.9 km**, with Lagos appearing three times among the top five.
- How many trips occurred in each city?
The original data contained inconsistent city names, causing some cities to appear as separate groups. After cleaning, Lagos had the highest number of trips with **105**, followed by Accra (**44**), Port Harcourt (**40**), Abuja (**40**), Nairobi (**38**), and Kampala (**31**).
- Were there duplicate or incomplete records?
Two duplicate trip records were identified and removed. The analysis also found **9 completed trips with missing fare values**. These missing values were not estimated because their correct fares could not be determined from the available data.
- What changed after data cleaning?
After standardizing city names and removing the two duplicate records, the dataset decreased from **300 to 298 trips**. The cleaned data provided a more reliable basis for city-level analysis.
- Which city generated the most revenue?
**Lagos** generated the highest completed-trip revenue at **₦218,890 from 93 completed trips**, followed by Accra at **₦92,640**.
- Which month generated the highest revenue?
**December 2025** recorded the highest monthly revenue at **₦66,980 from 31 completed trips**.

- Which vehicle type generated the most revenue?
**Economy vehicles** generated the highest revenue at **₦262,550 from 121 completed trips**, followed by Comfort at ₦239,050 and Bike at ₦66,870.

- Which customers had never booked a trip?
Four customers had no recorded trips: **Bisi Ogunleye, Wanjiru Kamau, Akinyi Ouma, and Nakato Namutebi**.

- Who were the top 3 customers by completed spending?
The highest-spending customers were:
- **Chioma Nwosu — ₦38,950**
- **Tunde Bakare — ₦37,610**
-  **Zainab Garba — ₦35,380**
___
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
- Lagos was the highest-revenue city.
- Economy vehicles generated the highest total revenue.
-  December 2025 recorded the highest monthly revenue.
-   Four customers had never booked a trip.
-   Two duplicate trip records were identified and removed.
-    City-name inconsistencies affected the original city-level analysis.
-     Nine completed trips had missing fare values.
-  Data quality should be considered before making major business decisions.
---

## Business Recommendation
Based on the available revenue data, **Lagos is the strongest city/place for further investment**, generating ₦218,890 from 93 completed trips. However, the analysis revealed important data-quality issues, including inconsistent city names, duplicate records, and 9 completed trips with missing fares. These issues should be investigated before making major business decisions, particularly because missing fares may affect the accuracy of reported revenue.
___
## Conclusion
The ZoomRide analysis demonstrates the importance of combining SQL querying with data cleaning and business interpretation. Cleaning inconsistent city names and duplicate records improved the reliability of the analysis, while the missing fare values highlighted an important limitation in the available data.

Based on the available revenue data, Lagos currently shows the strongest performance and would be the leading candidate for further investigation and potential investment.
