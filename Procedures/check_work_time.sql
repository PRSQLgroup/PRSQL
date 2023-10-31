create or replace procedure check_work_time(p_proc_name varchar2 default null) as
  v_day_of_week varchar2(20);
  v_current_time varchar2(5);
  v_error_text varchar2(100) := 'Ви не можете вносити зміни в неробочий час';
begin
  -- Отримання поточного дня тижня
  select to_char(sysdate, 'DAY') into v_day_of_week from dual;

  -- Отримання поточного часу
  select to_char(sysdate, 'HH24:MI') into v_current_time from dual;

  -- Перевірка, чи сьогодні субота або неділя або зараз не робочий час (не в межах 08:00-18:00)

  if (v_day_of_week in ('SATURDAY', 'SUNDAY') 
    or  v_current_time not between '08:00' and '18:00') then
     add_log('check_work_time ' || p_proc_name, v_error_text);
     raise_application_error(-20002, v_error_text);
  end if;
end check_work_time;
/
