# Pewlett-Hackard-Analysis
Using PostGreSQL to perform retirement status analysis. 

## Overview 
Pewlett Hackard is a large company that has been around since 1985, based on the earliest hire date within the employees database. The age demographic of the company is mostly baby boomers who are currently coming up on their retirement. The criteria for retirement eligbility is to be a current employee whose birth years are between 1952 to 1955. To prepare for this *"silver tsunami"*, the company is looking to identify the amount of retirement eligable employees and prepare for the amount of vacant positions that will need to be filled. The employee specific data is stored in 6 distinct but related CSV files in PostGreSQL database with the specified data types below:

- [Departments](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/departments.csv)
  - Department Number (4 Alpha-numeric characters)
  - Department Name (String Characters of maximum 40 units)
- [Employees](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/employees.csv)
  - Employee Number (Integers)
  - Birth Date (Date)
  - First Name (String Characters)
  - Last Name (String Characters)
  - Gender (String Characters)
  - Hire Date (Date)
- [Department Managers](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/dept_manager.csv)
  - Department Number (4 Alpha-numeric characters)
  - Employee Number (Integers)
  - From Date (Date)
  - To Date (Date)
- [Department Employees](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/dept_emp.csv)
  - Employee Number (Integers)
  - Department Number (4 Alpha-numeric characters)
  - From Date (Date)
  - To Date (Date)
- [Titles](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/titles.csv) 
  - Employee Number (Integers)
  - Title (String Characters)
  - From Date (Date)
  - To Date (Date)
- [Salaries](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/salaries.csv) 
  - Employee Number (Integers)
  - Salary (String Characters)
  - From Date (Date)
  - To Date (Date)

**The schema below showcases the relationship between each individual table as well as their primary keys (denoted by a faint key symbol next to the column name).** 

![Schema](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Employees_DBD.png)

An employee analysis to identify retirement eligable employees and their associated information, will be performed using PostGreSQL. This data will then be grouped by departments to assess the severity of the silver tsunami. 

### Challenge 
The Challenge portion of the analysis will group the reitrement eligable employees by their titles to assess the mangitude of vacant positions to fill based on job type. In prepartion for the silver tusnami, the company wishes to implement a mentorship program to support existing employees who were born during 1965. Mentorship eligable employees will also be identified as well.  

An additional analysis will be performed to assess retirement readiness across departments with further refinement based on hire dates between 1985 to 1988. The results are captured in the Analysis_Images folder and displayed in the summary section. Their respective CSV files were omitted due to high data volume. 

## Results 
Three CSV files from the challenge are analyzed below to assess the magnitude of possible vacant positions due to the departure of retirement-aged employees. One additional CSV file provides the query listing the current employees that qualify for the mentorship program. Supplemental queries have been included to display the results by departments and job titles and is provided as PNG files. 

### Retirement-Aged Employees by Titles
- [retirement_titles.csv](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/Data_Challenge/retirement_titles.csv) displays the initial query for the list of employees that are of retirement age. Since the query was made by joining the employees table with the titles table on matching employee numbers, the dataset includes repeating employees who have changed titles during their time at the company. Additionally, the filtered dataset does not account for the current employee status, meaning that it includes employees that are no longer with the company. The total number of employees from this data set is 133,776. 
- [unique_titles.csv](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/Data_Challenge/unique_titles.csv) refines the previous dataset by filtering using the to_date column from the dept_emp table as the defintion of active employees and selecting their most recent titles. This data set accurately lists the current retirement aged employees in the company totaling 72,458 employees by eliminating repeating and non-active employees.
- [retiring_titles.csv](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/Data_Challenge/retiring_titles.csv) summarizes the previous data set by categorizing the results based on titles. The results are listed below in the left table, along with a supplemental table showing all current employees by titles on the right. Based on these values, around 30% of the positions across all titles will become vacant, with the exception of Managers at 22%.   

  **Retiring (left) and Current (right) Employees by Titles**

  ![retiring_titles](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/Analysis_Images/Retiring_Titles.PNG) ![current_emp_titles](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/Analysis_Images/current_emp_titles.PNG) 

### Mentorship Eligable Employees by Titles
- [mentorship_eligibility.csv](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/Data_Challenge/mentorship_eligibility.csv) displays the list of employees eligable for mentorship by titles. A supplemental query was perfomed to display this information based on titles below. Across all titles, except for Managers, less than 1% of the workforce qualifies for the mentorship program.  
  
  **Mentorship Eligbility by Titles**
  
  ![mentee_titles](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/Analysis_Images/mentee_titles.PNG)

## Summary 
- A total of 72,458 roles will require replacements as a consequence of the "silver tsunami", which represents 30% of the company's current workforce.
- Based on analysis performed in the [Additional_analysis.sql](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Queries/Additional_Analysis.sql) file and supplemental analysis in the [Employee_Database_Challenge.sql](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Queries/Employee_Database_Challenge.sql) file, there are more than enough retirement-ready employees to mentor the next generation of Pewlett Hackard employees, across all departments. The images below display the aforementioned analyses in the order from left to right by **1. All Active Employees**, **2. Retirement Ready Employees** and **3. Mentorship Eligible Employees**:   

  ![active employees by department](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/Analysis_Images/active_emp_dpt.PNG) ![retirement ready by departments](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/Analysis_Images/retire_package_eligible_dpt.PNG) ![mentees by departments](https://github.com/Fabalin/Pewlett-Hackard-Analysis/blob/main/Data/Analysis_Images/mentee_dept.PNG)
