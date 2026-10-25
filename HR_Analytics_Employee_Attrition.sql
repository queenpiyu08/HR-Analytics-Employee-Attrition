-- ============================================================
-- HR ANALYTICS: EMPLOYEE ATTRITION
-- SQL Practice Queries - Part 1
-- Table: wa_fn-usec_-hr-employee-attrition
-- Database: MySQL
-- ============================================================

-- 1. Total number of employees
SELECT COUNT(*) AS total_employees
FROM `wa_fn-usec_-hr-employee-attrition`;


-- 2. Count employees by Attrition status (Yes / No)
SELECT
    Attrition,
    COUNT(*) AS employee_count
FROM `wa_fn-usec_-hr-employee-attrition`
GROUP BY Attrition;


-- 3. Overall employee attrition rate (%)
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM `wa_fn-usec_-hr-employee-attrition`;


-- 4. Department-wise employee count and number who left
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left
FROM `wa_fn-usec_-hr-employee-attrition`
GROUP BY Department;


-- 5. Department-wise attrition rate (%)
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM `wa_fn-usec_-hr-employee-attrition`
GROUP BY Department
ORDER BY attrition_rate DESC;


-- 6. Gender-wise attrition analysis
SELECT
    Gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM `wa_fn-usec_-hr-employee-attrition`
GROUP BY Gender
ORDER BY attrition_rate DESC;


-- 7. Job role-wise attrition analysis
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM `wa_fn-usec_-hr-employee-attrition`
GROUP BY JobRole
ORDER BY attrition_rate DESC;


-- 8. Overtime-wise attrition analysis
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM `wa_fn-usec_-hr-employee-attrition`
GROUP BY OverTime
ORDER BY attrition_rate DESC;

-- Business insight (from the recorded results):
-- OverTime = Yes: 416 employees, 127 left, attrition rate 30.53%.
-- OverTime = No:  1054 employees, 110 left, attrition rate 10.44%.
-- Overtime is associated with higher attrition in this dataset, but this
-- comparison alone does not prove that overtime causes employees to leave.


-- 9. Sales department: compare attrition by overtime status
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM `wa_fn-usec_-hr-employee-attrition`
WHERE Department = 'Sales'
GROUP BY OverTime
ORDER BY attrition_rate DESC;

-- Business insight (from the recorded results):
-- Sales, OverTime = Yes: 128 employees, 48 left, attrition rate 37.50%.
-- Sales, OverTime = No:  318 employees, 44 left, attrition rate 13.84%.
-- This is an association worth investigating, not proof of causation.


-- 10. Show Sales employees who work overtime and have left
SELECT
    Age,
    Gender,
    JobRole,
    MonthlyIncome,
    OverTime,
    Attrition
FROM `wa_fn-usec_-hr-employee-attrition`
WHERE Department = 'Sales'
  AND OverTime = 'Yes'
  AND Attrition = 'Yes';


-- 11. Preview five Sales employees who work overtime
SELECT *
FROM `wa_fn-usec_-hr-employee-attrition`
WHERE Department = 'Sales'
  AND OverTime = 'Yes'
LIMIT 5;

-- ============================================================
-- PART 2: ADDITIONAL FILTERING, HAVING, AGE, SATISFACTION, INCOME
-- ============================================================

-- 12. Sales employees who work overtime and left, grouped by job role
SELECT
    JobRole,
    COUNT(*) AS employees_left
FROM `wa_fn-usec_-hr-employee-attrition`
WHERE Department = 'Sales'
  AND OverTime = 'Yes'
  AND Attrition = 'Yes'
GROUP BY JobRole
ORDER BY employees_left DESC;

-- Recorded result / business insight:
-- Sales Executive: 31; Sales Representative: 16; Manager: 1.
-- These counts match all three filters: Sales, overtime, and attrition = Yes.
-- Investigate workload and overtime patterns; this does not prove causation.


-- 13. HAVING: show job roles with more than 2 matching employees
SELECT
    JobRole,
    COUNT(*) AS employees_left
FROM `wa_fn-usec_-hr-employee-attrition`
WHERE Department = 'Sales'
  AND OverTime = 'Yes'
  AND Attrition = 'Yes'
GROUP BY JobRole
HAVING COUNT(*) > 2
ORDER BY employees_left DESC;


-- 14. Age-group employee count and number who left
-- NOTE: This dataset may have an imported column name `ï»¿Age` because
-- of a UTF-8 BOM in the CSV. If your actual MySQL column is `Age`,
-- replace each `ï»¿Age` below with `Age`.
SELECT
    CASE
        WHEN `ï»¿Age` < 25 THEN 'Under 25'
        WHEN `ï»¿Age` BETWEEN 25 AND 34 THEN '25-34'
        WHEN `ï»¿Age` BETWEEN 35 AND 44 THEN '35-44'
        WHEN `ï»¿Age` BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left
FROM `wa_fn-usec_-hr-employee-attrition`
GROUP BY age_group
ORDER BY employees_left DESC;


-- 15. Age-group attrition rate (%)
SELECT
    CASE
        WHEN `ï»¿Age` < 25 THEN 'Under 25'
        WHEN `ï»¿Age` BETWEEN 25 AND 34 THEN '25-34'
        WHEN `ï»¿Age` BETWEEN 35 AND 44 THEN '35-44'
        WHEN `ï»¿Age` BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM `wa_fn-usec_-hr-employee-attrition`
GROUP BY age_group
ORDER BY attrition_rate DESC;


-- 16. Job satisfaction-wise attrition analysis
SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM `wa_fn-usec_-hr-employee-attrition`
GROUP BY JobSatisfaction
ORDER BY attrition_rate DESC;


-- 17. Compare average monthly income for employees who stayed vs left
SELECT
    Attrition,
    COUNT(*) AS total_employees,
    ROUND(AVG(MonthlyIncome), 2) AS average_monthly_income
FROM `wa_fn-usec_-hr-employee-attrition`
GROUP BY Attrition;


-- ============================================================
-- FINAL FINDINGS (based on the results recorded during practice)
-- ============================================================
-- Overall attrition rate: 16.12%.
-- Highest department attrition rate: Sales, 20.63%.
-- Highest age-group attrition rate: Under 25, 39.18% (verify against
-- the output of Query 15 because age-group definitions can vary).
-- Overtime = Yes attrition rate: 30.53%.
-- Average monthly income recorded: employees who left, about 4,787;
-- employees who stayed, about 6,833. Verify currency/values from Query 17.
-- These are descriptive associations and do not by themselves prove causation.
