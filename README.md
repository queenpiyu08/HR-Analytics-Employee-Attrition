# HR Analytics: Employee Attrition Analysis

## Project Overview
This project analyzes employee attrition in an HR dataset to understand where employee exits are more common and which patterns HR teams may want to investigate. The project combines Python analysis, SQL queries, and dashboards built in Power BI and Tableau.

## Tools Used
- **Python (Google Colab):** data inspection, analysis, summary tables, and visualizations using Pandas, Matplotlib, and Seaborn
- **MySQL:** SQL queries using filtering, aggregation, `GROUP BY`, `WHERE`, `HAVING`, and sorting
- **Power BI:** interactive HR attrition dashboard
- **Tableau:** HR attrition visualizations and dashboard

## Dataset
The project uses the IBM HR Analytics Employee Attrition dataset (`WA_Fn-UseC_-HR-Employee-Attrition.csv`). It contains 1,470 employee records and fields such as department, gender, job role, age, monthly income, overtime, job satisfaction, years at company, and attrition status.

> Include the dataset in the repository only if its license and distribution terms allow redistribution. Otherwise, provide the original source link or instructions for obtaining it.

## Project Questions
- How many employees are in the dataset, and how many left the company?
- What is the overall employee attrition rate?
- How does attrition vary by department, gender, and job role?
- How is attrition associated with overtime and age group?
- How does attrition vary by job satisfaction?
- How does average monthly income differ between employees who left and employees who stayed?
- Within Sales, what patterns appear among employees who worked overtime and left?

## Key Findings
Based on the results recorded during the analysis:
- **Total employees:** 1,470
- **Employees who left:** 237
- **Overall attrition rate:** 16.12%
- **Sales department attrition rate:** 20.63%, the highest among the departments in this analysis
- **Overtime = Yes:** 127 of 416 employees left (30.53%)
- **Overtime = No:** 110 of 1,054 employees left (10.44%)
- **Sales employees working overtime who left, by job role:** Sales Executive 31, Sales Representative 16, and Manager 1
- **Average monthly income recorded:** approximately 4,787 for employees who left and 6,833 for employees who stayed

Age-group results depend on the exact bucket boundaries used. The Python notebook and SQL analysis should use consistent age-group definitions before comparing their age-group percentages directly.

## Business Insights
The Sales department and employees who work overtime show comparatively higher attrition rates in this dataset. HR could investigate workload, scheduling, work-life balance, role expectations, compensation, and employee satisfaction for these groups. The income comparison may also help guide further analysis of compensation patterns.

These are descriptive associations from the dataset; they do **not** prove that overtime, department, income, or any other single factor caused employees to leave.


## Project Files

- `HR_Analytics_Employee_Attrition_Analysis.ipynb` — Python analysis and visualizations using Google Colab.
- `HR_Analytics_Employee_Attrition.sql` — MySQL queries for employee attrition analysis.
- `HR project.pbix` — Power BI dashboard.
- `HR_Analytics_Employee_Attrition.twb` — Tableau workbook.
- `README.md` — Project overview, key findings, business insights, and conclusion.

Adjust the file names above to match the exact names of your saved files. Add screenshots of the Power BI and Tableau dashboards in a `screenshots/` folder if you would like to show previews on GitHub.

## Conclusion
This project demonstrates a practical HR analytics workflow: inspecting a dataset, exploring employee attrition with Python and SQL, creating visual dashboards, and translating the results into business questions for HR teams. The analysis can support further investigation into employee retention, but decisions should consider additional context and should not treat observed correlations as proof of causation.
