create or replace PROCEDURE add_job(p_job_title  VARCHAR2,
                                  p_min_salary NUMBER,
                                  p_max_salary NUMBER) IS
v_count NUMBER; 
v_min_max_error_text VARCHAR2(200) := 'Мінімальна зарплата не повинна перевищувати максимальну зарплату';
v_min_error_text VARCHAR2(100) := 'Pозмір зарплати менший за 5000';
v_max_error_text VARCHAR2(100) := 'Pозмір зарплати більший за 90000';
v_job_error_text VARCHAR2(100) := 'Значення з параметру p_job_title вже існує';
v_proc_name VARCHAR2(50) := 'add_job';
BEGIN
    BEGIN
    check_work_time(p_proc_name => v_proc_name);
    END;

    SELECT COUNT(*)
    INTO v_count
    FROM proj.jobs jb
    WHERE jb.job_title = p_job_title;
    
    CASE WHEN p_min_salary >  p_max_salary THEN
            
        add_log(p_app_proc  => v_proc_name,p_message => v_min_max_error_text);
        raise_application_error (-20002, v_min_max_error_text);
      
         WHEN p_min_salary < 5000 THEN
                      
        add_log(p_app_proc  => v_proc_name,p_message => v_min_error_text||'. p_min_salary='||p_min_salary);
        raise_application_error (-20002, v_min_error_text||'. p_min_salary='||p_min_salary );
      
      WHEN p_max_salary > 90000 THEN
                    
        add_log(p_app_proc  => v_proc_name,p_message => v_max_error_text||'. p_max_salary='||p_max_salary);
        raise_application_error (-20002, v_max_error_text||'. p_max_salary='||p_max_salary );
      
      WHEN v_count > 0 THEN
            
        add_log(p_app_proc  => v_proc_name,p_message => v_job_error_text);
        raise_application_error (-20002,v_job_error_text);
    
    ELSE
      INSERT INTO proj.jobs (job_title,min_salary,max_salary) 
      VALUES (p_job_title,p_min_salary,p_max_salary);
      COMMIT;
      add_log(p_app_proc  => v_proc_name,p_message => 'Посаду успішно додано до системи, job_title = ' || p_job_title);
    END CASE;

END add_job;