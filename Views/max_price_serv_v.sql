create view max_price_serv_v as    
select *
from proj.services sr
where sr.price_of_repair_without_spares = (select max(sv.price_of_repair_without_spares)
                                           from proj.services sv)
;

