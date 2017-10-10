-- выбрать всех мужчин у кого фамилия начинается на A сортировка обратная лимит 100
SELECT *
FROM employees
WHERE gender="M"
      AND last_name
          LIKE "A%"
ORDER BY emp_no DESC
LIMIT 100;