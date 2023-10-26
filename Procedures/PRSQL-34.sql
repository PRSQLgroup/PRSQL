CREATE OR REPLACE PROCEDURE check_work_time AS
  v_day_of_week VARCHAR2(20);
  v_current_time VARCHAR2(5);
BEGIN
  -- Отримання поточного дня тижня
  SELECT TO_CHAR(SYSDATE, 'DAY') INTO v_day_of_week FROM DUAL;

  -- Отримання поточного часу
  SELECT TO_CHAR(SYSDATE, 'HH24:MI') INTO v_current_time FROM DUAL;

  -- Перевірка, чи сьогодні субота або неділя
  IF v_day_of_week IN ('SATURDAY', 'SUNDAY') THEN
    -- Перевірка, чи зараз не робочий час (не в межах 08:00-18:00)
    IF v_current_time NOT BETWEEN '08:00' AND '18:00' THEN
      -- Генерація помилки
      raise_application_error(-20002, 'Ви не можете вносити зміни в неробочий час');
    END IF;
  END IF;
END check_work_time;
/
