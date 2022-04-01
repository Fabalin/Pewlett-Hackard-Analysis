# Pewlett-Hackard-Analysis
Using PostGreSQL to perform employee status analysis. 

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


## Results 

Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.

## Summary 

Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
