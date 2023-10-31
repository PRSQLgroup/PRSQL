create or replace PROCEDURE add_log(p_app_proc varchar2,
                                  p_message varchar2,
                                  p_log_date date default sysdate) IS                              
BEGIN
      INSERT INTO proj.logs(appl_proc, message,log_date) 
      VALUES (p_app_proc,p_message,p_log_date);
      COMMIT;

END add_log;