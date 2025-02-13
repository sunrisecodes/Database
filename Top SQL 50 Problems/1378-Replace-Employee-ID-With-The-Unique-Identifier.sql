Select empU.unique_id, emp.name
from employees emp
left join EmployeeUNI empU
on emp.id = empU.id