# Email Marketing SQL Analysis

## Project Overview
This project focuses on analyzing email marketing performance using SQL.  
The goal was to combine data from multiple sources and calculate key engagement metrics.

---

## Tools & Technologies
- SQL (BigQuery)
- Data aggregation
- Window functions
- CTE (Common Table Expressions)

---

## Dataset
The analysis is based on multiple tables:
- `account`
- `account_session`
- `session`
- `session_params`
- `email_sent`
- `email_open`
- `email_visit`

---

## Key Tasks
- Combined data from multiple sources using JOIN and UNION ALL  
- Created a SQL view for structured analysis  
- Aggregated data by date, country, and user attributes  
- Calculated key metrics:
  - sent emails  
  - opened emails  
  - visited emails  
- Ranked countries using window functions (RANK)  

---

## Results
- Identified top-performing countries based on:
  - number of accounts  
  - email activity  
- Built a scalable SQL query structure using CTEs  

---

## Key Skills Demonstrated
- Writing complex SQL queries  
- Data cleaning and transformation  
- Analytical thinking  
- Working with large datasets  

---

## Project File
See the SQL code here:  
 `email_analysis.sql`
