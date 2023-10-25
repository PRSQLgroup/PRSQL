create or replace procedure add_employee (p_employee_id number,
                                          p_first_name varchar2,
                                          p_last_name varchar2,
                                          p_job_id number,
                                          p_auto_service_id number,
                                          p_phone_number varchar2,
                                          p_hire_date date,
                                          p_salary number) is
 job_count number;
 service_count number;
 v_next_employee_id number;

begin

--- Перевірка наявності значення p_job_id в таблиці proj.jobs
    select count(*)
    into job_count
    from proj.jobs jb 
    where jb.job_id=p_job_id;

    case when job_count=0 then
      raise_application_error (-20002,' Значення з параметру p_job_id не знайдено');
    end case;
    
--- Перевірка наявності значення p_auto_service_id в таблиці proj.auto_service   
    select count(*)
    into service_count
    from proj.auto_service srv 
    where srv.auto_service_id=p_auto_service_id;

    case when service_count=0 then
      raise_application_error (-20002,' Значення з параметру p_auto_service_id не знайдено'); 
    end case;

--- Знаходимо наступне значення employee_id
    select max(mp.employee_id) + 1 into v_next_employee_id from proj.employees mp;
   
--- Вставка нового співробітника в таблицю proj.employees
    insert into proj.employees values (v_next_employee_id,p_first_name,p_last_name,p_job_id,p_auto_service_id,p_phone_number,p_hire_date,p_salary);
   
commit;
end add_employee;

