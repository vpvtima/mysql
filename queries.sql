-- выбрать управляющих департаментов
SELECT *
FROM dept_manager
  LEFT JOIN departments USING (dept_no)
  LEFT JOIN employees USING (emp_no)
LIMIT 20;

-- подсчитать количество мужчин и женщин
SELECT
  COUNT(*) AS 'count',
  gender
FROM employees
GROUP BY gender;

-- выбрать сотрудников, чья зарплата меньше 70 000 лимит 20 прямая сортировка по зарплате (employees -> salaries)
SELECT  *
FROM employees
LEFT JOIN salaries USING (emp_no)
WHERE salary<70000
ORDER BY salary ASC
LIMIT 20;

-- выбрать сотрудников с должностями Engeneer (employees -> titles)
SELECT *
FROM employees
LEFT JOIN titles USING (emp_no)
WHERE titles.title='Engineer';

-- выбрать сотрудников работающих в отделе (employees -> dept_emp -> departments)
SELECT *
FROM employees
LEFT JOIN dept_emp USING (emp_no)
LEFT JOIN departments USING (dept_no)
LIMIT 20;

-- узнать зарплату сотрудника с номером 10001 за 1986 год --
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
