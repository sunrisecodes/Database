select 
    t.country,
    date_format(t.trans_date, '%Y-%m')  as month,
    count(t.id) as trans_count,
    count(case when t.state = 'approved' then 1 end) as approved_count,
    sum(t.amount) as trans_total_amount,
    ifnull (sum(case when t.state = 'approved' then t.amount end), 0) as approved_total_amount 
from Transactions t
group by  t.country, month