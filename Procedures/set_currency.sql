CREATE OR REPLACE PROCEDURE set_currency IS
v_sysdate DATE := sysdate;
v_list_cur VARCHAR2(2000) := get_param_value('LIST_CUR');
v_help_date DATE := TO_DATE('31.12.2999 23:59:59','DD.MM.YYYY HH24:MI:SS');
BEGIN
      check_work_time;
    
      UPDATE  proj.currency_history cr  
      SET end_date = v_sysdate
      WHERE cr.end_date = v_help_date;
      COMMIT;
     
      execute immediate 'TRUNCATE TABLE proj.currency';

      execute immediate
      'INSERT ALL
      
       INTO proj.currency_history(currency_id, currency_txt, currency_value, start_date, end_date)   
       VALUES (r030, CC, rate, v_sysdate, v_help_date)
        
       INTO proj.currency(currency_id, currency_txt, currency_value)   
       VALUES (r030, CC, rate)
                
       SELECT * 
       FROM proj.currencies_v 
       WHERE CC IN (SELECT value_list 
       FROM TABLE(it_skills.own_func.table_from_list(v_list_cur)))';
        
      COMMIT;
        
      add_log(p_app_proc  => 'set_currency',p_message => 'Курси валют = '|| v_list_cur ||' успішно завантажені');
END set_currency;


