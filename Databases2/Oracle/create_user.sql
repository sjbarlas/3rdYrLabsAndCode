-- Create a user with username patricia and password obyrne
--
select username, created  from DBa_users where default_tablespace LIKE 'DT2283' ORDER BY USERNAME;
create user &&USERNAME
identified by &PASSWORD
default tablespace &&tbsp
quota unlimited on &&tbsp;
GRANT CREATE SESSION,
      CREATE TABLE, 
      CREATE VIEW,
      CREATE procedure,
      CREATE SEQUENCE,
      CREATE TRIGGER to &&username;
undefine password;
undefine tbsp;
undefine username;
--alter user sbarlas identified by ----;

--select * from dba_users;
