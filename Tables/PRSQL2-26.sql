create or replace PROCEDURE del_employee(
    p_first_name VARCHAR2,
    p_last_name VARCHAR2,
    p_job_id NUMBER,
    p_auto_service_id NUMBER,
    p_phone_number VARCHAR2,
    p_hire_date DATE,
    p_salary NUMBER
    p_employee_id NUMBER
) IS
    l_employee_count NUMBER;
BEGIN
    
    SELECT COUNT(*)
    INTO l_employee_count
    FROM proj.employees
      AND first_name = p_first_name
      AND last_name = p_last_name
      AND job_id = p_job_id
      AND auto_service_id = p_auto_service_id
      AND phone_number = p_phone_number
      AND hire_date = p_hire_date
      AND salary = p_salary;
    WHERE employee_id = p_employee_id;
      

    IF l_employee_count = 0 THEN
        raise_application_error(-20002, 'Значення з параметрів не знайдено');
        raise_application_error(-20002, '�������� � ��������� �� ��������');
    ELSE
        DELETE FROM proj.employees
        WHERE employee_id = p_employee_id
        COMMIT;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        -- Обробка інших помилок
        DBMS_OUTPUT.PUT_LINE('Помилка: ' || SQLERRM);
      
        DBMS_OUTPUT.PUT_LINE('�������: ' || SQLERRM);
END;
