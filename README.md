Product Compliance Tracker

A comprehensive Excel-based compliance tracking system for managing 215 Indian and international products across e-commerce platforms.

📋 Project Overview
This project demonstrates product compliance management skills \, including Excel proficiency, SQL querying, data analysis, and CRM-style tracking.
🎯 Features

215 Real Products: Mix of 110 Indian brands (OnePlus, boAt, Amul) and 105 international brands (Apple, Samsung, LEGO)
Excel Dashboard: 6 sheets with color-coded status tracking
SQL Database: 40 ready-to-use queries for data analysis
5 Categories: Electronics, Food & Beverages, Cosmetics, Toys, Home & Kitchen
Compliance Tracking: Real regulatory standards (BIS, FSSAI, CDSCO, FDA, FCC, CE-Mark)

📊 What's Included
Files:

Product_Compliance_Tracker_215.xlsx - Main Excel file with 6 sheets
Product_Compliance_215.csv - Raw data in CSV format
expanded_sql_queries.sql - 40 SQL queries

Excel Sheets:

All Products - Complete dataset (215 products)
Dashboard - KPIs and summary metrics
Indian Products - 110 Indian brands filtered view
Foreign Products - 105 international brands
High Priority - 95 urgent items requiring attention
SQL Queries Reference - 40 queries color-coded by difficulty

🚀 Quick Start

Download Product_Compliance_Tracker_215.xlsx
Open in Microsoft Excel or LibreOffice Calc
Explore the 6 sheets
Try filtering, sorting, and viewing the dashboard

💻 SQL Queries
To run SQL queries:

Download DB Browser for SQLite
Open compliance_150.db
Copy any query from expanded_sql_queries.sql
Execute and view results!

📈 Key Metrics

215 Total Products (110 Indian, 105 Foreign)
76 Approved | 35 Pending | 45 Rejected | 59 Re-submission
5 Categories across multiple price ranges (₹10 - ₹1,34,900)
8 Reviewers managing compliance workflow
Real Certifications: BIS, FSSAI, CDSCO, FDA, FCC, CE-Mark, CPSC

🛠️ Skills Demonstrated

✅ Excel: Filtering, sorting, pivot tables, data validation, conditional formatting, formulas (COUNTIF, AVERAGE, SUM)
✅ SQL: SELECT, WHERE, GROUP BY, aggregate functions, CASE statements, joins
✅ Data Analysis: Pattern identification, metrics calculation, approval rate analysis
✅ CRM Knowledge: Status tracking, workflow management, priority assignment
✅ Attention to Detail: 215 products accurately categorized with real compliance standards

🎓 Use Cases
Perfect for:
Data Analyst portfolio projects
Excel proficiency demonstrations
SQL practice and learning
Compliance management system examples

📝 Sample Products
Indian: OnePlus 11R, boAt Airdopes, Amul Butter, MDH Masala, Mamaearth Serum, Lakme Lipstick, Prestige Cooker, Parle-G Biscuits
Foreign: iPhone 15 Pro, Samsung Galaxy S24, Sony PlayStation 5, LEGO City Sets, Nestle KitKat, L'Oreal Shampoo, Philips Air Fryer, Ferrero Rocher
🔍 SQL Query Examples
sql-- Find all high-priority pending items
SELECT Product_Name, Days_To_Review, Notes 
FROM products 
WHERE Priority = 'High' AND Compliance_Status = 'Pending Review';

-- Calculate approval rate by category
SELECT Category, 
       ROUND(100.0 * SUM(CASE WHEN Compliance_Status = 'Approved' THEN 1 ELSE 0 END) / COUNT(*), 2) as Approval_Rate
FROM products 
GROUP BY Category;

-- Compare Indian vs Foreign products
SELECT 
    CASE WHEN Country_of_Origin = 'India' THEN 'Indian' ELSE 'Foreign' END as Type,
    COUNT(*) as Total,
    SUM(CASE WHEN Compliance_Status = 'Approved' THEN 1 ELSE 0 END) as Approved
FROM products 
GROUP BY Type; 


BY
Anuz D
📧 anuzdhana24@gmail.com
This project is for portfolio and educational purposes.
