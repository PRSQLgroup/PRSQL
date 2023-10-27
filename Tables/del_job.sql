create or replace procedure del_job(p_job_id number) is
  v_count number;
begin
 select count(*)
  into v_count
  from proj.jobs
  where job_id = p_job_id;
 case
    when v_count = 0 then
      raise_application_error (-20002, 'значення з параметру p_job_id не знайдено');
    else
      delete from proj.jobs where job_id = p_job_id;
    commit;
  end case;
end del_job;