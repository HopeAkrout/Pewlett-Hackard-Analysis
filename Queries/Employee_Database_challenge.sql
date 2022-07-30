-- DELIVERABLE 1 --

--create table for number of retiring employees by title
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retiring_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
    AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no, t.to_date DESC;


--create table for number of retiring employees by title
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
INTO unique_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no, t.to_date DESC;


--# of employees retiring by title
SELECT title, COUNT(title) as Total FROM unique_titles 
GROUP BY title
ORDER BY Total DESC


-- DELIVERABLE 2 --

--Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
--INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
    ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
    ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

--# of employees eligible for mentorship program by title
SELECT title, COUNT(title) as Total FROM mentorship_eligibilty 
GROUP BY title
ORDER BY Total DESC

--# of current employees by title
SELECT title, COUNT(title) as Total FROM titles
WHERE (to_date = '9999-01-01') 
GROUP BY title
ORDER BY Total DESC