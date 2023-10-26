create or replace PROCEDURE del_employee(
    p_employee_id NUMBER
) IS
    l_employee_count NUMBER;
BEGIN
    
    SELECT COUNT(*)
    INTO l_employee_count
    FROM proj.employees
    WHERE employee_id = p_employee_id;

    IF l_employee_count = 0 THEN
        raise_application_error(-20002, 'Значення з параметрів не знайдено');
    ELSE
      
	 
        DELETE FROM proj.employees
        WHERE employee_id = p_employee_id;
        COMMIT;
    END IF;
END;