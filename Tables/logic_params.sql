-- Створення таблиці LOGIC_PARAMS
CREATE TABLE LOGIC_PARAMS (
  param_name VARCHAR2(150),
  param_value VARCHAR2(2000),
  param_descr VARCHAR2(300)
);

-- Додавання коментарів до стовпців
COMMENT ON COLUMN LOGIC_PARAMS.param_name IS 'Назва параметра';
COMMENT ON COLUMN LOGIC_PARAMS.param_value IS 'Значення параметра';
COMMENT ON COLUMN LOGIC_PARAMS.param_descr IS 'Опис параметра';


-- Додавання рядка з параметрами
INSERT INTO LOGIC_PARAMS (param_name, param_value, param_descr)
VALUES ('LIST_CUR', 'USD,EUR,AUD,PLN,AMD,XAU,XAG,TRY,GBP,EGP', 'Список валют, які потрібно заванажити');

