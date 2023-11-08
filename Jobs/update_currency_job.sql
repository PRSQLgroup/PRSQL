BEGIN
  dbms_scheduler.create_job (
    job_name        => 'UPDATE_CURRENCY_JOB',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN set_currency; END;',
    start_date      => TO_DATE('09-11-23 07:00:00', 'dd-mm-yy hh24:mi:ss'),
    end_date        => TO_DATE('31-12-2999', 'dd-mm-yyyy'),
    repeat_interval => 'FREQ=DAILY; BYHOUR=7',
    enabled         => TRUE,
    comments        => 'Оновлення курсів валют щоранку о 7:00',
    job_class       => 'DEFAULT_JOB_CLASS',
    auto_drop       => FALSE
  );
END;
/





