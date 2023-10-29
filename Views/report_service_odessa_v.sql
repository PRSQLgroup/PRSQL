create or replace view report_service_odessa_v as
select
  e.employee_id,
  e.first_name , e.last_name ,
  av.city,
  av.street,
  av.address
from
  proj.auto_service av,
  proj.employees e
where
  av.auto_service_id = 3
  and e.auto_service_id = av.auto_service_id;