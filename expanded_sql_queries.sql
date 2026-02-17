-- ═══════════════════════════════════════════════════════════════════
-- PRODUCT COMPLIANCE SQL QUERIES - COMPLETE COLLECTION
-- 30 Real-World Queries for Your Project
-- ═══════════════════════════════════════════════════════════════════

-- ───────────────────────────────────────────────────────────────────
-- SECTION 1: BASIC QUERIES (Good for Beginners)
-- ───────────────────────────────────────────────────────────────────

-- Query 1: View all products
SELECT * FROM products;

-- Query 2: Count total products
SELECT COUNT(*) as Total_Products FROM products;

-- Query 3: Show all Indian products
SELECT Product_ID, Product_Name, Category, Price_INR, Compliance_Status
FROM products
WHERE Country_of_Origin = 'India'
ORDER BY Price_INR DESC;

-- Query 4: Show all foreign products
SELECT Product_ID, Product_Name, Country_of_Origin, Price_INR
FROM products
WHERE Country_of_Origin != 'India'
ORDER BY Country_of_Origin, Product_Name;

-- Query 5: Find all approved products
SELECT Product_Name, Category, Country_of_Origin, Review_Date
FROM products
WHERE Compliance_Status = 'Approved'
ORDER BY Review_Date DESC;

-- Query 6: Find all rejected products
SELECT Product_Name, Category, Notes, Reviewer_Name
FROM products
WHERE Compliance_Status = 'Rejected'
ORDER BY Days_To_Review DESC;

-- ───────────────────────────────────────────────────────────────────
-- SECTION 2: FILTERING & CONDITIONS
-- ───────────────────────────────────────────────────────────────────

-- Query 7: High priority items only
SELECT Product_Name, Compliance_Status, Days_To_Review, Notes
FROM products
WHERE Priority = 'High'
ORDER BY Days_To_Review DESC;

-- Query 8: Products pending more than 15 days
SELECT Product_Name, Days_To_Review, Reviewer_Name, Priority
FROM products
WHERE Compliance_Status = 'Pending Review' AND Days_To_Review > 15
ORDER BY Days_To_Review DESC;

-- Query 9: Expensive products (over ₹50,000)
SELECT Product_Name, Country_of_Origin, Price_INR, Compliance_Status
FROM products
WHERE Price_INR > 50000
ORDER BY Price_INR DESC;

-- Query 10: Budget products (under ₹500)
SELECT Product_Name, Category, Price_INR, Compliance_Status
FROM products
WHERE Price_INR < 500
ORDER BY Price_INR;

-- Query 11: Electronics category only
SELECT Product_Name, Country_of_Origin, Price_INR, Compliance_Status
FROM products
WHERE Category = 'Electronics'
ORDER BY Price_INR DESC;

-- Query 12: Indian cosmetics
SELECT Product_Name, Regulatory_Document, Compliance_Status, Price_INR
FROM products
WHERE Category = 'Cosmetics' AND Country_of_Origin = 'India'
ORDER BY Compliance_Status;

-- ───────────────────────────────────────────────────────────────────
-- SECTION 3: COUNTING & GROUPING
-- ───────────────────────────────────────────────────────────────────

-- Query 13: Count products by category
SELECT Category, COUNT(*) as Total_Products
FROM products
GROUP BY Category
ORDER BY Total_Products DESC;

-- Query 14: Count by compliance status
SELECT Compliance_Status, COUNT(*) as Product_Count
FROM products
GROUP BY Compliance_Status
ORDER BY Product_Count DESC;

-- Query 15: Count products by country
SELECT Country_of_Origin, COUNT(*) as Total_Products
FROM products
GROUP BY Country_of_Origin
ORDER BY Total_Products DESC;

-- Query 16: Count by regulatory document type
SELECT Regulatory_Document, COUNT(*) as Usage_Count
FROM products
GROUP BY Regulatory_Document
ORDER BY Usage_Count DESC;

-- Query 17: Products per reviewer
SELECT Reviewer_Name, COUNT(*) as Products_Reviewed
FROM products
GROUP BY Reviewer_Name
ORDER BY Products_Reviewed DESC;

-- Query 18: Count by priority level
SELECT Priority, COUNT(*) as Product_Count
FROM products
GROUP BY Priority
ORDER BY Product_Count DESC;

-- ───────────────────────────────────────────────────────────────────
-- SECTION 4: CALCULATIONS & AVERAGES
-- ───────────────────────────────────────────────────────────────────

-- Query 19: Average review time by reviewer
SELECT 
    Reviewer_Name,
    COUNT(*) as Total_Reviews,
    ROUND(AVG(Days_To_Review), 1) as Avg_Days,
    MIN(Days_To_Review) as Fastest,
    MAX(Days_To_Review) as Slowest
FROM products
GROUP BY Reviewer_Name
ORDER BY Avg_Days;

-- Query 20: Average price by category
SELECT 
    Category,
    COUNT(*) as Product_Count,
    ROUND(AVG(Price_INR), 2) as Avg_Price,
    MIN(Price_INR) as Cheapest,
    MAX(Price_INR) as Most_Expensive
FROM products
GROUP BY Category
ORDER BY Avg_Price DESC;

-- Query 21: Average review time by category
SELECT 
    Category,
    ROUND(AVG(Days_To_Review), 1) as Avg_Review_Days,
    COUNT(*) as Total_Products
FROM products
GROUP BY Category
ORDER BY Avg_Review_Days DESC;

-- Query 22: Cost analysis by compliance status
SELECT 
    Compliance_Status,
    COUNT(*) as Product_Count,
    SUM(Price_INR) as Total_Value_INR,
    ROUND(AVG(Price_INR), 2) as Avg_Price
FROM products
GROUP BY Compliance_Status
ORDER BY Total_Value_INR DESC;

-- Query 23: Total value of approved products
SELECT 
    SUM(Price_INR) as Total_Approved_Value_INR,
    COUNT(*) as Total_Approved_Products,
    ROUND(AVG(Price_INR), 2) as Avg_Approved_Price
FROM products
WHERE Compliance_Status = 'Approved';

-- ───────────────────────────────────────────────────────────────────
-- SECTION 5: ADVANCED MULTI-CONDITION QUERIES
-- ───────────────────────────────────────────────────────────────────

-- Query 24: High priority + not approved
SELECT Product_Name, Compliance_Status, Days_To_Review, Category, Notes
FROM products
WHERE Priority = 'High' AND Compliance_Status != 'Approved'
ORDER BY Days_To_Review DESC;

-- Query 25: Indian electronics over ₹10,000
SELECT Product_Name, Price_INR, Compliance_Status, Regulatory_Document
FROM products
WHERE Country_of_Origin = 'India' 
  AND Category = 'Electronics' 
  AND Price_INR > 10000
ORDER BY Price_INR DESC;

-- Query 26: Foreign food & beverage pending approval
SELECT Product_Name, Country_of_Origin, Days_To_Review, Notes
FROM products
WHERE Category = 'Food & Beverages'
  AND Country_of_Origin != 'India'
  AND Compliance_Status = 'Pending Review'
ORDER BY Days_To_Review DESC;

-- Query 27: Recently reviewed products (last 30 days)
SELECT Product_Name, Review_Date, Compliance_Status, Reviewer_Name
FROM products
WHERE Review_Date >= date('now', '-30 days')
ORDER BY Review_Date DESC;

-- Query 28: Approval rate by category (advanced)
SELECT 
    Category,
    COUNT(*) as Total_Products,
    SUM(CASE WHEN Compliance_Status = 'Approved' THEN 1 ELSE 0 END) as Approved,
    SUM(CASE WHEN Compliance_Status = 'Rejected' THEN 1 ELSE 0 END) as Rejected,
    SUM(CASE WHEN Compliance_Status = 'Pending Review' THEN 1 ELSE 0 END) as Pending,
    ROUND(100.0 * SUM(CASE WHEN Compliance_Status = 'Approved' THEN 1 ELSE 0 END) / COUNT(*), 2) as Approval_Rate_Percent
FROM products
GROUP BY Category
ORDER BY Approval_Rate_Percent DESC;

-- Query 29: Compare Indian vs Foreign approval rates
SELECT 
    CASE 
        WHEN Country_of_Origin = 'India' THEN 'Indian Products'
        ELSE 'Foreign Products'
    END as Product_Type,
    COUNT(*) as Total_Products,
    SUM(CASE WHEN Compliance_Status = 'Approved' THEN 1 ELSE 0 END) as Approved,
    SUM(CASE WHEN Compliance_Status = 'Rejected' THEN 1 ELSE 0 END) as Rejected,
    ROUND(100.0 * SUM(CASE WHEN Compliance_Status = 'Approved' THEN 1 ELSE 0 END) / COUNT(*), 2) as Approval_Rate_Percent
FROM products
GROUP BY Product_Type;

-- Query 30: Top 10 most expensive products with their status
SELECT 
    Product_Name,
    Country_of_Origin,
    Category,
    Price_INR,
    Compliance_Status,
    Days_To_Review
FROM products
ORDER BY Price_INR DESC
LIMIT 10;

-- ───────────────────────────────────────────────────────────────────
-- SECTION 6: PRACTICAL BUSINESS QUERIES
-- ───────────────────────────────────────────────────────────────────

-- Query 31: Products stuck in review (over 20 days)
SELECT 
    Product_Name,
    Category,
    Days_To_Review,
    Reviewer_Name,
    Notes
FROM products
WHERE Compliance_Status IN ('Pending Review', 'Re-submission Required')
  AND Days_To_Review > 20
ORDER BY Days_To_Review DESC;

-- Query 32: Products needing immediate attention
SELECT 
    Product_Name,
    Priority,
    Compliance_Status,
    Days_To_Review,
    Category,
    Notes
FROM products
WHERE Priority = 'High' 
  AND Compliance_Status IN ('Rejected', 'Re-submission Required')
ORDER BY Days_To_Review DESC;

-- Query 33: Reviewer workload distribution
SELECT 
    Reviewer_Name,
    COUNT(*) as Total_Assigned,
    SUM(CASE WHEN Compliance_Status = 'Approved' THEN 1 ELSE 0 END) as Completed,
    SUM(CASE WHEN Compliance_Status = 'Pending Review' THEN 1 ELSE 0 END) as Pending,
    SUM(CASE WHEN Compliance_Status = 'Rejected' THEN 1 ELSE 0 END) as Rejected
FROM products
GROUP BY Reviewer_Name
ORDER BY Pending DESC;

-- Query 34: Products by price range
SELECT 
    CASE 
        WHEN Price_INR < 1000 THEN 'Budget (< ₹1000)'
        WHEN Price_INR BETWEEN 1000 AND 10000 THEN 'Mid-Range (₹1K-10K)'
        WHEN Price_INR BETWEEN 10001 AND 50000 THEN 'Premium (₹10K-50K)'
        ELSE 'Luxury (> ₹50K)'
    END as Price_Range,
    COUNT(*) as Product_Count,
    ROUND(AVG(Price_INR), 2) as Avg_Price
FROM products
GROUP BY Price_Range
ORDER BY Avg_Price;

-- Query 35: Category breakdown by country
SELECT 
    Country_of_Origin,
    Category,
    COUNT(*) as Product_Count
FROM products
WHERE Country_of_Origin IN ('India', 'USA', 'China', 'Japan', 'South Korea')
GROUP BY Country_of_Origin, Category
ORDER BY Country_of_Origin, Product_Count DESC;

-- ───────────────────────────────────────────────────────────────────
-- SECTION 7: SEARCH QUERIES (Use these to find specific products)
-- ───────────────────────────────────────────────────────────────────

-- Query 36: Search by product name (find OnePlus products)
SELECT Product_Name, Category, Price_INR, Compliance_Status
FROM products
WHERE Product_Name LIKE '%OnePlus%'
ORDER BY Price_INR DESC;

-- Query 37: Search by brand (find all Samsung products)
SELECT Product_Name, Category, Price_INR, Compliance_Status
FROM products
WHERE Product_Name LIKE '%Samsung%'
ORDER BY Product_Name;

-- Query 38: Find all smartwatches
SELECT Product_Name, Country_of_Origin, Price_INR, Compliance_Status
FROM products
WHERE Product_Name LIKE '%Watch%' OR Product_Name LIKE '%watch%'
ORDER BY Price_INR DESC;

-- Query 39: Find specific regulatory compliance (BIS products)
SELECT Product_Name, Category, Country_of_Origin, Compliance_Status
FROM products
WHERE Regulatory_Document = 'BIS'
ORDER BY Category, Product_Name;

-- Query 40: Products with specific issues (Barcode problems)
SELECT Product_Name, Compliance_Status, Notes, Reviewer_Name
FROM products
WHERE Notes LIKE '%Barcode%' OR Notes LIKE '%barcode%'
ORDER BY Priority DESC;

-- ═══════════════════════════════════════════════════════════════════
-- HOW TO USE THESE QUERIES:
-- ═══════════════════════════════════════════════════════════════════
--
-- BEGINNER: Start with Queries 1-12 (Basic filtering)
-- INTERMEDIATE: Try Queries 13-23 (Counting and calculations)
-- ADVANCED: Practice Queries 24-35 (Multi-conditions and analysis)
-- PRACTICAL: Use Queries 31-35 for real business scenarios
-- SEARCH: Use Queries 36-40 to find specific products
--
-- Copy any query, paste it in DB Browser for SQLite, and click Run!
-- ═══════════════════════════════════════════════════════════════════
