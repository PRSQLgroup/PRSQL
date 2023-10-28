create table proj.logs(
               id number generated always as identity minvalue 1 maxvalue 9999999999, 
               appl_proc varchar2(50), 
               message varchar2(200), 
               log_date date Default Sysdate, 
               user_os varchar2(50) default sys_context('userenv', 'os_user'),
               user_db varchar2(50) Default sys_context('userenv', 'session_user')
               );

