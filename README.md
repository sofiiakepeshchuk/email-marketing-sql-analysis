# Email Marketing Analytics (SQL Project)

## Overview
This project analyzes email marketing performance using SQL by combining multiple data sources into a unified dataset.

The goal is to evaluate user engagement and identify top-performing countries based on email activity.

---

## Tools & Technologies
- SQL (BigQuery)
- JOIN, UNION ALL
- CTE (Common Table Expressions)
- Window Functions (RANK)
- Data Aggregation (GROUP BY)

---

## Data Sources
The analysis is based on multiple tables:
- account
- account_session
- session
- session_params
- email_sent
- email_open
- email_visit

---

## Key Steps
- Combined user, session, and email data into a single analytical dataset  
- Created a SQL view to simplify analysis  
- Calculated key metrics:
  - number of accounts  
  - emails sent  
  - emails opened  
  - email visits  
- Aggregated data by country and user segments  
- Ranked countries by performance using window functions  

---

## Insights
- Identified top countries with the highest email engagement  
- Compared user activity across different segments  
- Built a scalable SQL structure for further analysis  

---

## Skills Demonstrated
- Writing complex SQL queries  
- Data modeling and transformation  
- Analytical thinking  
- Working with relational databases  

---

## Business Value
This analysis helps marketing teams:
- understand user engagement  
- optimize email campaigns  
- focus on high-performing regions

---  

## Project File
[Open SQL file](./email_analysis.sql)
