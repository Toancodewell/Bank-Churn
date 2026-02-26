SELECT * FROM Bank_DB.bank_customers_churn;

# 1. What is the customer churn rate at this bank?
SELECT 
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM bank_customers_churn;

# 2. In which country do customers leave the most?

SELECT 
	country,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM bank_customers_churn
GROUP BY 1;


# 3. Which age group is most likely to leave the bank?

SELECT 
    CASE 
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 35 THEN '30-35'
        WHEN age BETWEEN 36 AND 45 THEN '35-45'
        ELSE '45+'
    END AS age_group,
    COUNT(*) total_customer,
    SUM(churn) churn_customer,
    ROUND(SUM(churn)/COUNT(*)*100,2) churn_rate
FROM bank_customers_churn
GROUP BY age_group
ORDER BY churn_rate DESC;

# 4. Does a low credit score lead to more churn?
-- SELECT 
--     max(credit_score),
--     min(credit_score)
-- FROM bank_customers_churn;
WITH credit_segment AS (
    SELECT 
        CASE 
            WHEN credit_score BETWEEN 350 AND 499 THEN '1_Very Low'
            WHEN credit_score BETWEEN 500 AND 579 THEN '2_Low'
            WHEN credit_score BETWEEN 580 AND 669 THEN '3_Medium'
            WHEN credit_score BETWEEN 670 AND 739 THEN '4_High'
            ELSE '5_Very High'
        END AS credit_group,
        churn
    FROM bank_customers_churn
)
SELECT 
    credit_group,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn)*100.0/COUNT(*),2) AS churn_rate
FROM credit_segment
GROUP BY credit_group
ORDER BY credit_group;

# 5. Are active customers more loyal?

SELECT 
	active_member,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM bank_customers_churn
GROUP BY 1;

# 6. Does using multiple products lead to greater loyalty?
SELECT 
	products_number,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM bank_customers_churn
GROUP BY 1
ORDER BY churn_rate DESC;

# 7 . Are high-balance customers prone to bombing?

WITH balance_rank AS (
    SELECT 
        *,
        NTILE(4) OVER (ORDER BY balance) AS balance_quartile
    FROM bank_customers_churn
),

balance_segment AS (
    SELECT 
        CASE 
            WHEN balance_quartile = 4 THEN 'High Balance'
            WHEN balance_quartile = 3 THEN 'Upper Mid'
            WHEN balance_quartile = 2 THEN 'Lower Mid'
            ELSE 'Low Balance'
        END AS balance_group,
        churn
    FROM balance_rank
)

SELECT 
    balance_group,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn)*100.0/COUNT(*),2) AS churn_rate
FROM balance_segment
GROUP BY balance_group
ORDER BY churn_rate DESC;

# 8. Who is at the highest risk of churn?
SELECT *
FROM bank_customers_churn
WHERE churn = 1
ORDER BY credit_score ASC, age DESC
LIMIT 20;

# 9. Is having high-value customers a cause for concern?
SELECT 
    country,
    ROUND(AVG(balance),2) avg_balance,
    ROUND(AVG(estimated_salary),2) avg_salary,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate
FROM bank_customers_churn
GROUP BY country;
