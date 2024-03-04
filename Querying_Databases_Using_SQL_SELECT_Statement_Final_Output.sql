##########################################################
##########################################################
-- Guided Project: The SQL SELECT Statement
##########################################################
##########################################################


#############################
-- Task One: Introduction
-- In this task, retrieve data from the four tables in the database
#############################

-- Retrieve all data from the employees table
SELECT * FROM employees;


-- Retrieve all data from the departments table
SELECT * FROM departments;


-- Retrieve all data from the departments employees table
SELECT * FROM dept_emp;


-- Retrieve all data from the salaries table
SELECT * FROM salaries;


#############################
-- Task Two: SELECT - FROM AND WHERE
-- In this task, you will retrieve data from tables as in task one. In addition, 
-- you will learn how to set conditions on the result set of a query using the WHERE clause
#############################

-- The SELECT clause specifies the columns that you want a statement to return. In the SELECT
-- clause, the SELECT keyowrd is followed by a list of column names, expressions and also a function.
-- While the FROM clause is used to specify the source of the data you want to retrieve. The easiest
-- way is to name a single table or view in the FROM clause of query, or you can qualify a table or
-- view with either a database or schema with a dot notation. But since we are not using SQL JOINS, we
-- dont need to qualify. Lastly, the WHERE clause, it is used to restrict query results to only rows of 
-- interest. Also, when you want to explore a table with millions of rows, you never want to retrieve
-- all rows because it will take an unnecessarily long time to run, thats why we do filtering.

##########
-- SELECT - FROM

-- 2.1: Select the first name and last name of all employees
SELECT first_name, last_name 
FROM employees;


-- 2.2 Select all records from the employees table
SELECT * FROM employees;


-- 2.3 (Ex.) Select the department number from the departments table
SELECT dept_no 
FROM departments


-- 2.4 (Ex.) Select all records from the departments table
SELECT * FROM departments;



############
-- SELECT FROM - WHERE

-- 2.5 Select all employees whose first name is 'Elvis'
SELECT * 
FROM employees
WHERE first_name = 'Elvis'

    
-- 2.6 (Ex.) Select all employees whose first name is 'Hilari'
SELECT * 
FROM employees
WHERE first_name = 'Hilari'
    

#############################
-- Task Three: SQL Operators
-- In this task, you will retrieve data from tables in the employees database,
-- using different SQL operators together with the WHERE clause
#############################

-- In SQL, operators can be symbols or keywords. They can perform calculations (+) or comparisons (BETWEEN).
-- Logical operators are used to modify conditions, which result in TRUE, FALSE, or NULL. "AND" returns TRUE
-- if both conditions are TRUE, and FALSE if either is FALSE, otherwise NULL. "OR" returns TRUE if either
-- condition is TRUE, FALSE if both are FALSE, otherwise NULL. "NOT" returns TRUE if the condition is FALSE, 
-- FALSE if it is TRUE, otherwise NULL. Comparison Operators like (=, <> or !=, >, <, >=, <=) are used to
-- compare values in SQL queries, often in WHERE clauses.

###########
-- AND

-- 3.1 Select all male employees whose first name is 'Denis'
SELECT *
FROM employees
WHERE gender = 'M' AND first_name = 'Denis'

  
-- 3.2 (Ex.) Select all female employees whose last name is 'Reistad'
SELECT *
FROM employees
WHERE gender = 'F' AND last_name = 'Reistad'


###########
-- OR

-- Recall we have done this in 3.1 above  

SELECT *
FROM employees
WHERE first_name = 'Denis' AND gender = 'M';

-- 3.3 Select all employees whose first name is 'Denis' or 'Elvis'
SELECT *
FROM employees
WHERE first_name = 'Denis' OR first_name = 'Elvis';


-- Let us compare with this
-- Select all employees whose first name is 'Denis' and 'Elvis'

SELECT *
FROM employees
WHERE first_name = 'Denis' AND first_name = 'Elvis';
    
-- 3.4 (Ex.) Retrieve a list of all employees whose first name is either
'Kellie' or 'Aruna'
SELECT *
FROM employees
WHERE first_name = 'Kellie' OR first_name = 'Aruna';



###########
-- Operator Precedence
-- Operator precedence in SQL determines the order in which operators are evaluated in a query.
-- When a SQL query contains multiple operators, the precedence rules dictate which operation is performed
-- first. In mathematics, operations enclosed in parentheses are evaluated first according to PEMDAS rule,
-- so its a good practice to apply using parenthesis for you specify the order of operation you want in your
-- query. See the examples below.

-- 3.5 Retrieve a list of all male or female employees whose last name is 'Denis'

SELECT *
FROM employees
WHERE last_name = 'Denis' AND gender = 'M' OR gender = 'F';

-- Correct Syntax
SELECT *
FROM employees
WHERE last_name = 'Denis' AND (gender = 'M' OR gender = 'F');


-- 3.6 (Ex.) Retrieve a list of all female employees whose first name is either
'Kellie' or 'Aruna'
SELECT *
FROM employees
WHERE gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');



###########
-- IN / NOT IN
-- The IN operator is used to determine whether a value matches any value in a specified list.
-- The NOT IN operator is used to determine whether a value does not match any value in a specified list.

-- 3.7: Retrieve a list of all employees whose first name is either 'Cathie', 'Mark' or 'Nathan'

SELECT *
FROM employees
WHERE first_name = 'Cathie' OR first_name = 'Mark' OR first_name = 'Nathan';

-- Alternative Solution
SELECT *
FROM employees
WHERE first_name IN ('Cathie', 'Mark', 'Nathan');


-- NOT IN
SELECT *
FROM employees
WHERE first_name NOT IN ('Cathie', 'Mark', 'Nathan');



#############################
-- Task Four: Wildcard Characters 
-- In this task, you will retrieve data from tables in the employees database,
-- using different wildcard characters together with the WHERE clause
#############################

###########
-- LIKE / NOT LIKE 
-- The LIKE and NOT LIKE operators in SQL are used for pattern matching within strings.
-- They are particularly useful when you want to filter rows based on whether a certain
-- column's value matches a specified pattern. These operators allow the use of wildcard
-- characters to represent unknown parts of the string. The percent sign (%) is a wildcard
-- that means one or more characters.

-- 4.1: Extract a list of all employees whose first name starts with 'Mar'
SELECT *
FROM employees
WHERE first_name LIKE 'Mar%';


-- 4.2: Extract a list of all employees whose first name starts with 'Ar'
SELECT *
FROM employees
WHERE first_name LIKE 'Ar%';


-- 4.3: Extract a list of all employees whose first name ends with 'Ar'
SELECT *
FROM employees
WHERE first_name LIKE '%ar';


-- 4.4: What do you think the result of this query will be?
-- Answer: The result of this query are the list of all names with 'ar' between its firstname.
SELECT *
FROM employees
WHERE first_name LIKE('%ar%');


-- 4.5: What do you think the output will be here?

SELECT *
FROM employees
WHERE first_name LIKE ('Mar_');

-- 4.6: What about this??
    
SELECT *
FROM employees
WHERE first_name NOT LIKE ('%Mar%');

-- 4.7 (Ex.): Extract all individuals from the 'employees' table whose first name 
-- starts with 'Mark'
SELECT *
FROM employees
WHERE first_name LIKE ('Mark%');

    
-- 4.8 (Ex.): Extract all individuals from the employees table whose first name 
-- does not contain 'Jack'

SELECT *
FROM employees
WHERE first_name NOT LIKE ('%Jack%');


#############################
-- Task Five: SQL Operators - Part 2
-- In this task, you will retrieve data from tables in the employees database,
-- using different SQL operators together with the WHERE clause
#############################

###########
-- BETWEEN - AND
-- The BETWEEN operator in SQL is used to specify a range for filtering rows based on a specified condition.
-- It allows you to retrieve rows where a column's value falls within a specified range of values, inclusive
-- of both endpoints. The smaller of the two values should always be written first, with the AND operator
-- separating the two.

-- 5.1: Extract a list of all employees who were employed between
-- 1st of January, 1990 and 1st January, 2000
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01';

    
-- 5.2: Extract a list of all employees who were not employed between
-- 1st of January, 1990 and 1st January, 2000
SELECT *
FROM employees
WHERE hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';

	
-- 5.3 (Ex.): Select all the records from the salaries table, regarding contracts
-- from 66000 to 70000 dollars/year

-- Selecting all records from the salaries table

SELECT * FROM salaries;

-- Solution to 5.3
SELECT *
FROM salaries
WHERE salary BETWEEN '66000' AND '70000';


-- 5.4: Retrieve a list of individuals whose emp_no is not between
-- 10004 and 10012.
SELECT *
FROM salaries
WHERE emp_no NOT BETWEEN '10004' AND '10012';



###########
-- IS NOT NULL / IS NULL
-- The IS NULL and IS NOT NULL operators in SQL are used to check whether a column's value
-- is NULL or not NULL, respectively. NULL represents the absence of a value or an unknown
-- value in SQL. These operators are particularly useful for filtering rows based on the
-- presence or absence of data in a specific column. These operators are handy for handling
-- cases where you need to identify records where certain fields have not been populated or
-- contain unknown values. It's important to note that comparing a column's value directly
-- with NULL using equality operators like (=) will not work as expected because NULL is treated
-- as unknown, and the result of any comparison with NULL is also unknown. Therefore, you should
-- always use IS NULL or IS NOT NULL for checking NULL values in SQL queries.

-- 5.5: Extract a list of employees whose first name is not null
   
-- Let us count how many first names are in the employees table
SELECT COUNT(first_name)
FROM employees


-- Solution to 5.5
SELECT *
FROM employees
WHERE first_name IS NOT NULL;


-- 5.6: Extract a list of employees whose first name is null
SELECT *
FROM employees
WHERE first_name IS NULL;


-- 5.7 (Ex.): Select the names of all departments whose department number value is not null
SELECT dept_name
FROM departments
WHERE dept_no IS NOT NULL;



#############################
-- Task Six: Other Comparison Operators
-- In this task, you will retrieve data from tables in the employees database,
-- using other comparison operators together with the WHERE clause
#############################

###########
-- Equal to (=) & Not Equal to (<> or !=)
-- The equal to (=) and not equal to (<> or !=) operators in SQL are used to compare values in a
-- WHERE clause to filter rows based on specific conditions. Both operators are essential for
-- constructing WHERE clauses to filter rows based on specific criteria. They can be used with
-- numerical, string, and date values, among others. It's important to choose the appropriate operator
-- based on the desired comparison logic in order to retrieve the correct subset of data from the database.

-- 6.1: Retrieve a list of all employees whose first name is 'Mark'

SELECT *
FROM employees
WHERE first_name = 'Mark';

-- 6.2: Retrieve a list of all employees whose first name is not 'Mark'
SELECT *
FROM employees
WHERE first_name != 'Mark';


-- 6.3: Retrieve a list of all employees whose first name is not 'Mark'
SELECT *
FROM employees
WHERE first_name <> 'Mark';



#########
-- Greater than & Less than
-- The greater than (>) and less than (<) operators in SQL are also used to compare values in a WHERE clause to filter rows
-- based on specific conditions related to numerical, string, or date values.

-- 6.4: Retrieve a list of all employees who were employed after 1st of January, 1997.
SELECT *
FROM employees
WHERE hire_date > '1997-01-01';

  
-- 6.5: Retrieve a list of all employees who were employed on or after 1st of January, 1997.
SELECT *
FROM employees
WHERE hire_date >= '1997-01-01';


-- 6.6: Retrieve a list of all employees who were employed before 1st of February, 1990
SELECT *
FROM employees
WHERE hire_date < '1997-02-01';


-- 6.7: What do you think the result will be??
SELECT *
FROM employees
WHERE hire_date <= '1990-02-01';

-- 6.8 (Ex.): Retrieve a list of all female employees who were hired on or after 1st January, 1999. 
SELECT *
FROM employees
WHERE gender = 'F' AND hire_date >= '1999-01-01';


-- 6.9: Extract a list with employees' salaries higher than 50,000 dollars per annum
SELECT *
FROM salaries
WHERE salary > 50000;


#############################
-- Task Seven: Select Distinct, Order BY, Limit, and SQL Aliases.
-- In this task, you will learn how to retrieve distinct data from tables in the employees database.
-- In addition, you will learn how to sort the result set, how to limit the result set and how to
-- give a temporary name to a column of a table.
#############################

###########
-- SELECT DISTINCT
-- The SELECT DISTINCT statement is used to return only distinct (different) values in the specified columns.

-- 7.1: Select distinct gender from the employees table

-- Let us retrieve data from the gender column from the employees table
SELECT gender
FROM employees;

-- Solution to 7.1
SELECT DISTINCT(gender)
FROM employees;


-- 7.2: Retrieve a list of the different first names in the employees database
SELECT DISTINCT(first_name)
FROM employees;


    
###########
-- ORDER BY
-- The ORDER BY clause is used to sort the result set of a SELECT statement in either ascending or descending order.

-- 7.3: Extract a list with employees' salaries higher than 50,000 dollars per annum
-- Sort the list by the most paid employee
SELECT *
FROM salaries
WHERE salary > 50000
ORDER BY salary DESC;


-- 7.4: Select all records in the employees table and order by first name
SELECT *
FROM employees
ORDER BY first_name;


-- 7.5: Select all records and order by first name in descending order
SELECT *
FROM employees
ORDER BY first_name DESC;


-- 7.6: Select all records and order by first name and last name
-- in ascending order
SELECT *
FROM employees
ORDER BY first_name, last_name ASC;



##########
-- Limit and SQL Aliases
-- The LIMIT clause is used to limit the number of rows returned by a query. LIMIT clause is one of
-- ways to filter data for optimization purposes. SQL aliases are temporary names assigned to columns
-- or tables in a SQL query to make the output more readable or to shorten the SQL code. Note that this 
-- is not a permanent name change because the column names in the original tables remain unchaned. The
-- alias only exists within a query. We use 'AS' keyword to give an alias name.

-- 7.7: Retrieve a list of the first 100 records in the employees table 
-- and order by emp_no in ascending order
SELECT *
FROM employees
ORDER BY emp_no ASC
LIMIT 100;


-- From 5.5: We counted how many first names are in the employees table

SELECT COUNT(first_name)
FROM employees;

-- 7.8: How many firstname are in the employees table. Rename the result as
-- FirstName_Count
SELECT COUNT(first_name) AS firstname_count
FROM employees;


-- Let's count how many distinct first names we have in the employees table
SELECT DISTINCT(first_name), COUNT(*) AS name_count
FROM employees
GROUP BY first_name
ORDER BY first_name;


