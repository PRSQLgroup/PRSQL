create or replace procedure add_employee (p_first_name varchar2,
                                          p_last_name varchar2,
                                          p_job_id number,
                                          p_auto_service_id number,
                                          p_phone_number varchar2,
                                          p_hire_date date,
                                          p_salary number) is
 job_count number;
 service_count number;
 v_next_employee_id number;
 v_job_error_text VARCHAR2(100):= 'Значення з параметру p_job_id не знайдено';
 v_service_error_text VARCHAR2(100) := 'Значення з параметру p_auto_service_id не знайдено';
 v_proc_name VARCHAR2(50) := 'add_employee';

begin
--- Виклик процедури check_work_time з передачою змінної v_proc_name
    check_work_time(v_proc_name);
    
--- Перевірка наявності значення p_job_id в таблиці proj.jobs
    select count(*)
    into job_count
    from proj.jobs jb 
    where jb.job_id=p_job_id;

    if job_count=0 then
      add_log(v_proc_name, v_job_error_text || '. p_job_id=' || p_job_id);
      raise_application_error (-20002,v_job_error_text||'. p_job_id='||p_job_id);
    end if;
    
--- Перевірка наявності значення p_auto_service_id в таблиці proj.auto_service   
    select count(*)
    into service_count
    from proj.auto_service srv 
    where srv.auto_service_id=p_auto_service_id;

    if service_count=0 then
      add_log(v_proc_name, v_service_error_text || '. p_auto_service_id=' || p_auto_service_id);
      raise_application_error (-20002,v_service_error_text||'. p_auto_service_id='||p_auto_service_id); 
    end if;

--- Знаходимо наступне значення employee_id
    select max(mp.employee_id) + 1 into v_next_employee_id from proj.employees mp;
   
--- Вставка нового співробітника в таблицю proj.employees
    insert into proj.employees values (v_next_employee_id,p_first_name,p_last_name,p_job_id,p_auto_service_id,p_phone_number,p_hire_date,p_salary);
    add_log(v_proc_name, 'Співробітника успішно додано до системи, employee_id = ' || v_next_employee_id);
   
commit;
end add_employee;

