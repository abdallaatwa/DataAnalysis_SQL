-- Number of employees
SELECT count (EmpID) as number_of_employees
from `Employee_dataset.employee_data`;

-- Number of employees by sex
SELECT GenderCode,count(GenderCode) AS Gender_count
from `Employee_dataset.employee_data`
group by GenderCode;


-- Employees distribution over states
SELECT count(EmpID) AS Number_of_employees,State
from `Employee_dataset.employee_data`
group by State
order by Number_of_employees DESC;

-- Payzone by distribution per title
SELECT Title,count(EmpID) AS Number_of_employees,PayZone
from `Employee_dataset.employee_data`
group by Title,PayZone
order by Title;

-- Distribution per race
SELECT RaceDesc,count(EmpID) AS Number_of_employees
from `Employee_dataset.employee_data`
group by RaceDesc
order by Number_of_employees DESC;

-- Performance score of employees
SELECT `Performance Score`,count(EmpID) AS Number_of_employees
from `Employee_dataset.employee_data`
group by `Performance Score`
order by Number_of_employees DESC;

-- Number of employees per department
SELECT DepartmentType,count(EmpID) as number_of_employees
from `Employee_dataset.employee_data`
group by DepartmentType
order by number_of_employees DESC;

-- Number of employees per division
SELECT Division,count(EmpID) as number_of_employees
from `Employee_dataset.employee_data`
group by Division
order by number_of_employees DESC;

-- Number of employees by employee type
SELECT EmployeeType,count(EmpID) as number_of_employees
from `Employee_dataset.employee_data`
group by EmployeeType
order by number_of_employees DESC;

-- Number of employees by performance score
SELECT `Performance Score`,count(EmpID) as number_of_employees
from `Employee_dataset.employee_data`
group by`Performance Score`
order by number_of_employees DESC;

-- Number of employees by employee type
SELECT EmployeeType,count(EmpID) as number_of_employees
from `Employee_dataset.employee_data`
group by EmployeeType
order by number_of_employees DESC;

--Number of employees by education level
SELECT `Education Level`,count(`Applicant ID`) AS Number_of_employees
FROM `eighth-renderer-425903-n2.Employee_dataset.recruitment_data`
group by `Education Level`
order by Number_of_employees DESC;

--Employee peformance,engagement and satisfaction score (JOIN)
SELECT 
  t1.EmpID,
  t1.`Performance score`,
  t2.`Engagement score`,
  t2.`Satisfaction score`
FROM 
  `Employee_dataset.employee_data` AS t1
JOIN 
  `Employee_dataset.employee_engagement_survey_data` AS t2
ON 
  t1.EmpID = t2.`Employee ID`
limit 100;



--Payzone among employees by education (JOIN)
SELECT 
  count(t1.EmpID) AS Number_of_employees,
  t1.Payzone,
  t2.`Education level`
FROM 
  `Employee_dataset.employee_data` AS t1
JOIN 
  `Employee_dataset.recruitment_data` AS t2
ON 
  t1.EmpID = t2.`Applicant ID`
  Group by t2.`Education level`,t1.Payzone
  order by t1.Payzone ASC;



--Employees training outcome (JOIN)
SELECT 
 count(t1.EmpID) AS Number_of_employees,
 t2.`training outcome`
FROM 
  `Employee_dataset.employee_data` AS t1
JOIN 
  `Employee_dataset.training_and_development_data` AS t2 
ON 
t1.EmpID = t2.`Employee ID`
Group by t2.`training outcome`
Order by Number_of_employees DESC;

