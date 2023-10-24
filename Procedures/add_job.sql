create or replace PROCEDURE add_job(p_job_title  VARCHAR2,
                                  p_min_salary NUMBER,
                                  p_max_salary NUMBER) IS
v_count NUMBER;                                 
BEGIN
    select count(*)
    into v_count
    from proj.jobs jb
    where jb.job_title = p_job_title;
    CASE WHEN p_min_salary >  p_max_salary THEN
      raise_application_error (-20002,'Мінімальна зарплата не повинна перевищувати максимальну зарплату');
      WHEN p_min_salary < 5000 THEN
      raise_application_error (-20002,'Pозмір зарплати менший за 5000');
      WHEN p_max_salary > 9000 THEN
      raise_application_error (-20002,'Pозмір зарплати більший за  90000');
      WHEN v_count > 0 THEN
      raise_application_error (-20002,'Значення з параметру p_job_title вже існує');
    ELSE
      INSERT INTO proj.jobs (job_title,min_salary,max_salary) 
      VALUES (p_job_title,p_min_salary,p_max_salary);
      COMMIT;
    END CASE;

END add_job;