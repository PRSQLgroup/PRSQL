create or replace function get_param_value(p_param_name varchar2)
return varchar2 as
    v_param_value varchar2(100);
begin
    select param_value into v_param_value
    from logic_params
    where param_name = p_param_name;
    return v_param_value;

end;

