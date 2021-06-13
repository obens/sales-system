create table employee(
	id int not null,
	name varchar not null(50),
	birthDate int not null,
	salary float not null
);

insert into employee values(1,'jacques','23',1000.05);
insert into employee values(2,'Wilnor','33',5200.55);
insert into employee values(3,'PIPO','24',4000.55);
insert into employee values(4,'arlindo ','26',1200.55);
insert into employee values(5,'Kerli','19',1250.00);
	

/*REP A*/

CREATE OR REPLACE FUNCTION aumento() RETURNS VOID AS $$

BEGIN
	update employee SET salary = salary + salary*0.1 where id IN (select id from employee);
END;
$$ LANGUAGE plpgsql;

select aumento();

/*REP B*/

CREATE OR REPLACE FUNCTION aumentoX(X float, N int) RETURNS VOID AS $$

BEGIN
	update employee SET salary = salary + salary*X/100 where id IN (select id from employee where id > N);

END;
$$ LANGUAGE plpgsql;

select aumentoX(20.2,2);

/*REP C*/

CREATE OR REPLACE FUNCTION remocao() RETURNs VOID AS $$

BEGIN
	delete from employee  where salary > (select avg(salary) from employee);
END;
$$ LANGUAGE plpgsql;

select remocao();

/*REP D*/
alter table employee add current_user_table varchar(50);
alter table employee add current_date_table date;

CREATE OR REPLACE FUNCTION insereDados(id int, name varchar, birthDate int, salary float) RETURNS VOID AS $$

BEGIN
	insert into employee values(id, name, birthDate, salary, current_user, current_date);
END;
$$ LANGUAGE plpgsql;

select insereDados(5,'fulano de tal','26',1200.55);
