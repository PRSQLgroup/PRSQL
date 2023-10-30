create function get_client_name(p_client_id in number) return varchar2 is
v_full_name varchar2(100);
begin 

    select cl.first_name || ', ' || cl.last_name as full_name
    into v_full_name
    from proj.clients cl
    where cl.client_id = p_client_id;
    
    return v_full_name;
    
end get_client_name;