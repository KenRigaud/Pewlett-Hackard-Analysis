SELECT employees.emp_no, employees.first_name, employees.last_name, titles.title, titles.from_date, titles.to_date
INTO retirement_titles

FROM employees
INNER JOIN titles ON (employees.emp_no =  titles.emp_no)

WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by employees.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO ordered_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

SELECT COUNT(ordered_titles.emp_no), ordered_titles.title

INTO retiring_titles
FROM ordered_titles

GROUP BY title 

ORDER BY COUNT(title)  DESC;

/* Part 2 query
*/

SELECT DISTINCT ON(employees.emp_no) employees.emp_no, employees.first_name, employees.last_name, employees.birth_date, demployees.from_date, demployees.to_date, titles.title
INTO mentorship_eligibilty
FROM employees

Left outer Join dept_emp ON (employees.emp_no = demployees.emp_no)
Left outer Join titles ON (employees.emp_no = titles.emp_no)

WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no;