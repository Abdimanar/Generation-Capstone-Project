-- SQL Analysis For Roblox Africa Dataset
  -- Calculating for Total Compensation 
   SELECT
    staff_id,
    basic_salary,
    allowances,
    basic_salary + allowances AS total_compensation
FROM finance_records
order by staff_id asc;

-- Net Contribution By Department
SELECT
    department_code,
    year,
    total_revenue_generated,
    total_cost,
    total_revenue_generated - total_cost AS net_contribution
FROM department_performance;

-- Cost-to-Revenue Ratio
SELECT
    department_code,
    year,
    total_cost,
    total_revenue_generated,
    ROUND(
        total_cost / NULLIF(total_revenue_generated, 0) * 100,
        2
    ) AS cost_to_revenue_percent
FROM department_performance;


-- Revenue-to-Cost Ratio
SELECT
    department_code,
    year,
    ROUND(
        total_revenue_generated / NULLIF(total_cost, 0),
        2
    ) AS revenue_cost_ratio
FROM department_performance;


-- Workforce by Department analysis
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_code = e.department_code
GROUP BY d.department_name
ORDER BY employee_count DESC;


-- Gender distribution
SELECT
    gender,
    COUNT(*) AS employee_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2)
        AS percentage_of_workforce
FROM employees
GROUP BY gender
ORDER BY employee_count DESC;


-- Gender by department
SELECT
    d.department_name,
    e.gender,
    COUNT(*) AS employee_count
FROM employees e
JOIN departments d
    ON e.department_code = d.department_code
GROUP BY d.department_name, e.gender
ORDER BY d.department_name, employee_count DESC;

-- Employee status analysis
SELECT
    employee_status,
    COUNT(*) AS employee_count
FROM employees
GROUP BY employee_status
ORDER BY employee_count DESC;

-- Workforce by position
SELECT
    position,
    COUNT(*) AS employee_count
FROM employees
GROUP BY position
ORDER BY employee_count DESC;

-- Average age by department
SELECT
    d.department_name,
    ROUND(AVG(e.age), 1) AS average_age,
    MIN(e.age) AS youngest_age,
    MAX(e.age) AS oldest_age
FROM employees e
JOIN departments d
    ON e.department_code = d.department_code
GROUP BY d.department_name
ORDER BY average_age DESC;

-- Employee education levels
SELECT
    education_level,
    COUNT(*) AS employee_count
FROM education
GROUP BY education_level
ORDER BY employee_count DESC;


-- Fields of study by department
SELECT
    d.department_name,
    ed.field_of_study,
    COUNT(*) AS employee_count
FROM employees e
JOIN departments d
    ON e.department_code = d.department_code
JOIN education ed
    ON e.employee_id = ed.employee_id
GROUP BY d.department_name, ed.field_of_study
ORDER BY d.department_name, employee_count DESC;


-- Average salary by department
SELECT
    d.department_name,
    ROUND(AVG(f.basic_salary), 2) AS average_basic_salary,
    ROUND(AVG(f.allowances), 2) AS average_allowance,
    ROUND(AVG(f.basic_salary + f.allowances), 2)
        AS average_total_compensation
FROM employees e
JOIN departments d
    ON e.department_code = d.department_code
JOIN finance_records f
    ON e.employee_id = f.staff_id
GROUP BY d.department_name
ORDER BY average_total_compensation DESC;


-- Compensation by education level
SELECT
    ed.education_level,
    COUNT(*) AS employee_count,
    ROUND(AVG(f.basic_salary + f.allowances), 2)
        AS average_total_compensation
FROM education ed
JOIN finance_records f
    ON ed.employee_id = f.staff_id
GROUP BY ed.education_level
ORDER BY average_total_compensation DESC;

-- Average performance by department and year
SELECT
    d.department_name,
    ep.year,
    ROUND(AVG(ep.performance_score), 2)
        AS average_employee_performance
FROM employee_performance ep
JOIN employees e
    ON ep.employee_id = e.employee_id
JOIN departments d
    ON e.department_code = d.department_code
GROUP BY d.department_name, ep.year
ORDER BY ep.year, average_employee_performance DESC;

-- Training and performance relationship
SELECT
    CASE
        WHEN training_hours < 25 THEN 'Below 25 hours'
        WHEN training_hours < 50 THEN '25–49 hours'
        WHEN training_hours < 75 THEN '50–74 hours'
        ELSE '75 hours and above'
    END AS training_group,
    COUNT(*) AS records,
    ROUND(AVG(performance_score), 2)
        AS average_performance_score
FROM employee_performance
GROUP BY training_group
ORDER BY MIN(training_hours);

-- Attendance and performance
SELECT
    CASE
        WHEN attendance_rate_percent < 80 THEN 'Below 80%'
        WHEN attendance_rate_percent < 90 THEN '80–89%'
        WHEN attendance_rate_percent < 95 THEN '90–94%'
        ELSE '95% and above'
    END AS attendance_group,
    COUNT(*) AS records,
    ROUND(AVG(performance_score), 2)
        AS average_performance_score,
    ROUND(AVG(projects_completed), 2)
        AS average_projects_completed
FROM employee_performance
GROUP BY attendance_group
ORDER BY MIN(attendance_rate_percent);

-- Bonus and performance
SELECT
    bonus_awarded,
    COUNT(*) AS record_count,
    ROUND(AVG(performance_score), 2) AS average_performance,
    ROUND(AVG(projects_completed), 2) AS average_projects,
    ROUND(AVG(attendance_rate_percent), 2) AS average_attendance
FROM employee_performance
GROUP BY bonus_awarded;

-- Insurance status
SELECT
    insurance_status,
    COUNT(*) AS employee_count
FROM health_records
GROUP BY insurance_status
ORDER BY employee_count DESC;

-- Insurance status by department
SELECT
    d.department_name,
    h.insurance_status,
    COUNT(*) AS employee_count
FROM health_records h
JOIN employees e
    ON h.employee_id = e.employee_id
JOIN departments d
    ON e.department_code = d.department_code
GROUP BY d.department_name, h.insurance_status
ORDER BY d.department_name, employee_count DESC;

-- Medical-leave eligibility and performance
SELECT
    h.medical_leave_eligible,
    ROUND(AVG(ep.performance_score), 2)
        AS average_performance,
    ROUND(AVG(ep.attendance_rate_percent), 2)
        AS average_attendance,
    ROUND(AVG(ep.projects_completed), 2)
        AS average_projects
FROM health_records h
JOIN employee_performance ep
    ON h.employee_id = ep.employee_id
GROUP BY h.medical_leave_eligible;


-- Department revenue, costs, and profit
SELECT
    department_name,
    year,
    total_revenue_generated,
    total_cost,
    total_revenue_generated - total_cost AS net_contribution,
    ROUND(
        (total_revenue_generated - total_cost)
        / NULLIF(total_revenue_generated, 0) * 100,
        2
    ) AS contribution_margin_percent
FROM department_performance
ORDER BY year, net_contribution DESC;

-- Department performance trends
SELECT
    department_name,
    year,
    average_performance_score,
    training_hours_completed,
    total_revenue_generated,
    total_cost
FROM department_performance
ORDER BY department_name, year;*/

CREATE VIEW vw_employee_profile AS
SELECT
    e.employee_id,
    e.age,
    e.position,
    e.date_joined,
    e.gender,
    e.employee_status,
    e.department_code,
    d.department_name,
    ed.institution_country,
    ed.education_level,
    ed.degree_title,
    ed.field_of_study,
    ed.graduation_date,
    f.basic_salary,
    f.allowances,
    f.basic_salary + f.allowances AS total_compensation,
    h.medical_leave_eligible,
    h.insurance_status,
    h.insurance_provider,
    h.insurance_plan_type,
    h.medical_leave_balance
FROM employees e
LEFT JOIN departments d
    ON e.department_code = d.department_code
LEFT JOIN education ed
    ON e.employee_id = ed.employee_id
LEFT JOIN finance_records f
    ON e.employee_id = f.staff_id
LEFT JOIN health_records h
    ON e.employee_id = h.employee_id;
   
   CREATE VIEW vw_employee_performance_analysis AS
SELECT
    ep.record_id,
    ep.employee_id,
    ep.year,
    ep.performance_score,
    ep.projects_completed,
    ep.training_hours,
    ep.attendance_rate_percent,
    ep.bonus_awarded,
    e.age,
    e.gender,
    e.position,
    e.employee_status,
    e.department_code,
    d.department_name,
    ed.education_level,
    ed.field_of_study,
    f.basic_salary,
    f.allowances,
    f.basic_salary + f.allowances AS total_compensation,
    h.insurance_status,
    h.insurance_plan_type,
    h.medical_leave_eligible,
    h.medical_leave_balance
FROM employee_performance ep
JOIN employees e
    ON ep.employee_id = e.employee_id
LEFT JOIN departments d
    ON e.department_code = d.department_code
LEFT JOIN education ed
    ON e.employee_id = ed.employee_id
LEFT JOIN finance_records f
    ON e.employee_id = f.staff_id
LEFT JOIN health_records h
    ON e.employee_id = h.employee_id;
    
    CREATE VIEW vw_department_performance_analysis AS
SELECT
    dp.record_id,
    dp.department_code,
    dp.department_name,
    dp.year,
    dp.average_performance_score,
    dp.total_revenue_generated,
    dp.total_cost,
    dp.training_hours_completed,
    dp.total_revenue_generated - dp.total_cost
        AS net_contribution,
    ROUND(
        dp.total_cost /
        NULLIF(dp.total_revenue_generated, 0) * 100,
        2
    ) AS cost_to_revenue_percent,
    ROUND(
        dp.total_revenue_generated /
        NULLIF(dp.total_cost, 0),
        2
    ) AS revenue_cost_ratio
FROM department_performance dp;
    
