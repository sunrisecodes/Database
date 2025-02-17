SELECT customer_id, count(v.visit_id) as count_no_trans 
from visits v
left join Transactions t
on v.visit_id = t.visit_id
where t.transaction_id is Null
GROUP by customer_id
