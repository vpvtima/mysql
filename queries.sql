-- узнать зарплату сотрудника с номером 10001 за 1986 год
SELECT
  employees.emp_no,
  employees.first_name,
  employees.last_name,
  salaries.salary,
  salaries.from_date
FROM employees
LEFT JOIN salaries USING (emp_no)
WHERE emp_no = 10001
      AND salaries.from_date
          LIKE "1986%";

-- узнать должность, имя и фамилию у сотрудника с номером 10001
SELECT
  employees.emp_no,
  employees.first_name,
  employees.last_name,
  employees.gender,
  titles.title
FROM employees
LEFT JOIN titles USING (emp_no)
WHERE emp_no = 10001;

-- узнать все о сотруднике с номером 10001 по таблице titles
SELECT *
FROM employees
LEFT JOIN titles USING (emp_no)
WHERE emp_no = 10001;

-- выбрать всех мужчин у кого фамилия начинается на A сортировка обратная лимит 100
SELECT *
FROM employees
WHERE gender="M"
      AND last_name
          LIKE "A%"
ORDER BY emp_no DESC
LIMIT 100;