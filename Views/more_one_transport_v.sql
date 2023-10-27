create view more_one_transport_v as      
select cl.client_id, cl.first_name, cl.last_name
from clients cl
inner join (select cr.client_id, count(*) as cnt_cars from cars cr
            group by cr.client_id
            having count(*)>1) t
on t.client_id = cl.client_id
order by cl.client_id
;