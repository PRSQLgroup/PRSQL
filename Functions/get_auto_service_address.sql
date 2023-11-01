create or replace function get_auto_service_address(p_auto_service_id number) return varchar2 is
    v_address varchar2(100);
begin
    select city || ', ' || street || ', ' || address
    into v_address
    from auto_service
    where auto_service_id = p_auto_service_id;
    return v_address;
end; 


