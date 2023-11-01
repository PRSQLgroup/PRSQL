create or replace function get_car(p_car_id number) return varchar2 is
v_full_name varchar2(100);
begin 

    select cr.brand || ', ' || cr.model ||', '|| cr.licence_plate
    into v_full_name
    from proj.cars cr
    where cr.car_id = p_car_id;
    
    return v_full_name;
    
end get_car;

