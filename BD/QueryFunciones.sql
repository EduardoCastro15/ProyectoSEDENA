set global log_bin_trust_function_creators = 1;

DELIMITER $$
create function crack_login(_matricula varchar(45), _contrasena varchar(45))
returns int
begin
	if(select count(*) from usuarios where matricula = _matricula and contrasena = _contrasena) > 0 then
    return 1;
    else
	return 0;
    end if;
end$$
DELIMITER ;

DELIMITER $$
create function crack_user(_matricula varchar(20))
returns int
begin
	if(select count(*) from discentes where matricula_discente = _matricula) > 0 then
    return 1;
    else
	return 0;
    end if;
end$$
DELIMITER ;