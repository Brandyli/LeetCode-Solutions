WITH tax_multiplier AS (
SELECT company_id,
CASE WHEN MAX(salary) < 1000 THEN 1.0
WHEN MAX(salary) <= 10000 THEN 0.76
ELSE 0.51 END AS mult
FROM Salaries
GROUP BY company_id
)
SELECT s.company_id, s.employee_id, s.employee_name, ROUND(s.salary * t.mult) AS salary
FROM Salaries s JOIN tax_multiplier t ON s.company_id = t.company_id;


select s.company_id, s.employee_id, s.employee_name,
round(
		case when x.max_sal between 1000 and 10000 then salary * 0.76
		when x.max_sal > 10000 then salary * 0.51 else salary end, 0) as salary

from salaries s inner join
(select company_id, max(salary) max_sal from salaries group by company_id) x

on s.company_id = x.company_id;
