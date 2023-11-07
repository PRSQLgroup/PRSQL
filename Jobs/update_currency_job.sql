BEGIN
  dbms_scheduler.create_job (
    job_name        => 'UPDATE_CURRENCY_JOB',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN set_currency; END;',
    start_date      => '09-11-23 07:00:00',
    repeat_interval => 'FREQ=DAILY; BYHOUR=7',
    enabled         => TRUE,
    comments        => 'Оновлення курсів валют щоранку о 7:00'
  );
END;
/