/*
Посчитать сколько людей в каждой из профессий (employees -> titles)
отсортировать по количеству
*/
SELECT
  title, COUNT(*) AS cou
FROM employees
  LEFT JOIN titles USING (emp_no)
GROUP BY title
ORDER BY cou ASC ;

/*
Найти профессии, в которых количествео сотрудников меньше 50 000
- смотри предыдущий запрос
*/
SELECT
  COUNT(*) AS cou, title
FROM employees
  LEFT JOIN titles USING (emp_no)
GROUP BY title
HAVING cou < 50000;

/*
Найти средние зарплаты для 20 человек чей emp_no меньше 14000 (employees -> salaries)
отсортировать по зарплате
*/
SELECT emp_no, first_name, last_name,round(avg(salary)) AS Sred
FROM employees
  LEFT JOIN salaries USING (emp_no)
GROUP BY first_name
HAVING round(avg(salary))
AND emp_no<14000
ORDER BY Sred ASC
LIMIT 20;

/*
Найти людей чьи средние зарплаты меньше 45000 для 20 человек чей emp_no меньше 14000 (employees -> salaries)
- смотри предыдущий запрос
*/
SELECT
  emp_no,
  first_name,
  last_name,
  round(avg(salary)) AS Zarplata
FROM employees
  LEFT JOIN salaries USING (emp_no)
  WHERE emp_no<14000
GROUP BY emp_no
HAVING Zarplata<45000
ORDER BY Zarplata ASC
LIMIT 20;


/*
выбрать сотрудников со средней зарплатой менее 50к долларов
*/
SELECT emp_no, first_name, last_name,round(avg(salary))
FROM employees
LEFT JOIN salaries USING (emp_no)
GROUP BY emp_no
HAVING round(avg(salary))<50000;

/*
подсчитать мужчин в рабочем коллективе
*/
SELECT
  COUNT(*) AS cou, gender
FROM employees
GROUP BY gender
HAVING cou > 170000;

/*
выбрать сотрудников с суммой зарплат более 1 миллиарда двухсот миллионов долларов
*/
SELECT employees.last_name, SUM(salaries.salary) AS summ
FROM employees
LEFT JOIN salaries USING (emp_no)
GROUP BY employees.last_name
HAVING summ > 120000000;

-- ================================================

/*вывести средние зарплаты, округленные и полные сотрудников от 10001 до 10003*/
SELECT
  concat(first_name, " ", last_name) AS FIO,
  avg(salary) as SrednyayaZar,
  round(avg(salary)) as SrednyayaZar
FROM salaries
  LEFT JOIN employees USING (emp_no)
WHERE emp_no
BETWEEN '10001' AND '10003'
GROUP BY FIO;

/*
вывести среднюю зарплату, полную и округлённую для сотрудника 10004
*/
SELECT
  round(AVG(salary)) AS SrednyayaZarplataRounded,
  avg(salary) AS SrednyayaZarplata
FROM salaries
WHERE emp_no = 10004;

/*
функция CONCAT - объединить в одно поле fio имя и фамилию сотрудника за номером 10001 (employees) 
= ссылка на пример = https://www.w3schools.com/sql/trymysql.asp?filename=trysql_func_mysql_concat2
*/
SELECT first_name, last_name, concat(first_name, " ", last_name) AS FIO
FROM employees
WHERE emp_no=10001;

/*
функция SUM - сложить все зарплаты сотрудника за номером 10001 (salaries) 
= ссылка = https://www.w3schools.com/sql/trymysql.asp?filename=trysql_func_mysql_sum
*/
SELECT sum(salary) AS TotalSum
FROM salaries
WHERE emp_no=10001;

/*
LEFT JOIN : CONCAT : SUM - обединить два предыдущих задания в одном запросе (employees - > salaries)
*/
SELECT
  first_name,
  last_name,
  concat(first_name, " ", last_name, " ") AS fio,
  sum(salary) AS sum
FROM employees
  LEFT JOIN salaries USING (emp_no)
WHERE emp_no=10001;

/*
функция REPLACE - заменить все буквы 'e' на символ '+' для сотрудника за номером 10001 (employees) 
= ссылка = https://www.w3schools.com/sql/func_mysql_replace.asp
*/
SELECT
  first_name,
  last_name,
  replace(
      concat(first_name, " ", last_name),
      "e", "+") AS Repka
FROM employees
WHERE emp_no=10001;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- выбрать управляющих департаментов
SELECT first_name, last_name
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
