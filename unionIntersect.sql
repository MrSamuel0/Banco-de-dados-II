use sus;

create view cliente_vw as
select cust_id, concat(fname, ' ' ,lname)name
from individual
union
select cust_id, name
from business;

select name, product_cd
from cliente_vw, account
where cliente_vw.cust_id = account.cust_id;

select product_cd
from account, customer
where customer.cust_type_cd = 'i' and account.cust_id = customer.cust_id
intersect
select product_cd
from account, customer
where customer.cust_type_cd = 'b' and account.cust_id = customer.cust_id;

select city
from customer
except
select city
from branch;