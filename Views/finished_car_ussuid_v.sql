create view finished_car_ussuid_v as      
  select 
    ds.status_id,
    ds.order_id, 
    ds.order_date, 
    ds.first_name ||' '|| ds.last_name as name, 
    ds.car_id, ds.service_id, 
    st.description 
    from 
         (select * from orders rd
            join clients cl
            on rd.client_id=cl.client_id
            where cl.client_id=10 ) ds 
   join status st on ds.status_id=st.status_id
where ds.status_id=9 
;
