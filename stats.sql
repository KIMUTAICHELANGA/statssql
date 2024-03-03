SELECT * FROM company_divisions
LIMIT 5;

SELECT * FROM company_regions
LIMIT 5;

SELECT * FROM STAFF
LIMIT 5;

/* TOTAL EMPLOYEES IN COMPANY*/
SELECT COUNT(*) FROM staff;

/* WHAT ABOUT GENDER DISTRIBUTION */
SELECT gender,COUNT(*) AS total_employee
FROM staff
GROUP BY gender

/* how many employees in each department */
SELECT department , COUNT(*) AS total_employee
FROM staff
GROUP BY department
ORDER BY department

/* select the distincr departments */
 SELECT DISTINCT (department)
 FROM staff
 ORDER BY department


 /*highest and lowest salaries of employees */
 SELECT MAX(salary) AS max_salary ,MIN(salary) AS min_salary 
 FROM staff ;

 /* salary distribution by gender */
 SELECT gender , MIN(salary) AS min_salary ,MAX(salary) AS max_salary, AVG(salary) AS Average_salary
 FROM staff
 GROUP BY gender ;

 /* the total salary the company is spending each year */
 SELECT SUM (salary)
 FROM staff ;

 /* distribution of min,max and average salary by department */
 SELECT department,
 MIN(salary) AS min_salary,
 MAX(salary) AS max_salary,
 AVG(salary) AS avg_salary,
 COUNT(*)  AS total_employees
 FROM STAFF
 GROUP BY department
 ORDER BY 4 DESC ;


 /*how spread out the salary around the average */
 SELECT department,
 MIN(salary) AS min_salary ,
 MAX(salary) AS max_salary,
 AVG(salary) AS Average_salary,
 VAR_POP(salary) AS Variance_Salary,
 STDDEV_POP(salary) AS StandardDev_Salary,
 COUNT(*) AS total_employees
 FROM staff
 GROUP BY department
 ORDER BY 4 DESC ;


 /* which department has the highest salary spread out */
 SELECT 
department,
MIN(salary) AS Min_Salary,
MAX(salary) AS Max_salary,
ROUND(AVG(salary),2) AS Average_salary
ROUND(VAR_POP(salary),2) AS Variance_Salary
ROUND(STDDEV_POP(salary),2) AS StandardDev_Salary
COUNT(*) AS total_employees
FROM staff
GROUP BY department
ORDER BY 6 DESC


/* Health department salary */
CREATE VIEW health_dept_earning_status
AS
SELECT 
CASE 
WHEN salary>= 100000  THEN 'higher earner'
WHEN salary>= 50000 AND salary<100000 THEN 'middle earner'
ELSE 'low earner'

END AS earning_status FROM staff WHERE department LIKE 'HEALTH';

/*we can check the above view here*/
SELECT earning_status, COUNT(*)
FROM health_dept_earning_status
GROUP BY 1 ;

/*outdoors department salary */
SELECT department,salary
FROM staff
WHERE department LIKE 'outdoors'
ORDER BY 2 ASC;


CREATE VIEW outdoors_dept_earning_status
AS
SELECT
CASE
WHEN  salary >= 100000 THEN 'high earner'
WHEN salary >= 50000 AND salary < 100000 THEN 'middle earner'
ELSE 'low earner'
END AS earning_status
FROM staff
WHERE department LIKE 'Outdoors';

/* lets check the query above */
SELECT earning_status, COUNT(*)
FROM outdoors_dept_earning_status
GROUP BY 1;

 DROP VIEW health_dept_earning_status
 DROP VIEW outdoors_dept_earning_status

 /* department starts with a B */
 SELECT DISTINCT(department)
 FROM staff
 WHERE department LIKE 'B%'