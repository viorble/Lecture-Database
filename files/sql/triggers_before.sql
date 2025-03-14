-- 
-- MySQL Crash Course
-- 
-- Chapter 12 – Creating Triggers						
--
-- You can copy and paste any of these commands into your favorite MySQL tool
-- (like MySQL Workbench) and run them in your own MySQL environment.
--

-- Create the tables for the chapter

create database bank;

use bank;

create table credit
	(
	customer_id		int,
	customer_name	varchar(100),
	credit_score	int
	);
	
-- Create a before insert trigger	
drop trigger if exists tr_credit_bi;

delimiter //

create trigger tr_credit_bi
  before insert on credit
  for each row
begin
  if (new.credit_score < 300) then
	set new.credit_score = 300;
  end if;
  
  if (new.credit_score > 850) then
	set new.credit_score = 850;
  end if;
 
 end//

delimiter ;

-- Test the trigger by inserting some values into the credit table
insert into credit
	(
	customer_id,
	customer_name,
	credit_score
	)
values
	(1,	'Milton Megabucks',	  987),
	(2,	'Patty Po', 		  145),
	(3, 'Vinny Middle-Class', 702);
	
-- Create the before delete trigger	
use bank;

delimiter //

create trigger tr_credit_bd
 before delete on credit
  for each row
begin
  if (old.credit_score > 750) then
     signal sqlstate '45000'
       set message_text = 'Cannot delete scores over 750';
  end if;

end//

delimiter ;

-- Test the trigger
delete from credit where customer_id = 1;
delete from credit where customer_id = 2;

-- Try it Yourself Exercises

-- Set up for chapter 12 exercises
create database jail;

use jail;

create table alcatraz_prisoner
	(
	prisoner_id		int,
	prisoner_name	varchar(100)
	);
	
insert into alcatraz_prisoner
	(
	prisoner_id,
	prisoner_name
	)
values
	(85,	'Al Capone'),
	(594,	'Robert Stroud'),
	(1476, 	'John Anglin');

-- Exercise 12-1: Create the audit table
create table alcatraz_prisoner_audit
	(
	audit_datetime	datetime,
	audit_user		varchar(100),
	audit_change	varchar(200)
	);

-- Exercise 12-2: Create and test a before insert audit trigger
use jail;

drop trigger if exists tr_alcatraz_prisoner_ai;

-- Create the trigger
delimiter //

 create trigger tr_alcatraz_prisoner_ai
  after insert on alcatraz_prisoner
  for each row
begin
  insert into alcatraz_prisoner_audit
  (
    audit_datetime,
    audit_user,
    audit_change
  )
  values
  (
    now(),
    user(),
    concat(
      'New row for Prisoner ID ',
      new.prisoner_id,
      '. Prisoner Name: ',
      new.prisoner_name
    )
  );
end//

delimiter ;

-- Test the trigger by inserting a new prisoner
insert into alcatraz_prisoner
  (
    prisoner_id,
    prisoner_name
  )
values
  (
    117,
    'Machine Gun Kelly'
  );

-- Did the row get inserted into the alcatraz_prisoner table?
select * from alcatraz_prisoner;

-- Did the new prisoner get logged in the audit table?
select * from alcatraz_prisoner_audit;

-- Set up for exercise 12-3
create database exam;

use exam;

create table grade
	(
	student_name	varchar(100),
	score 			int
	);
	
insert into grade
	(
	student_name,
	score
	)
values
	('Billy',79),
	('Jane', 87),
	('Paul', 93);
	
-- Exercise 12-3: Create the trigger
use exam;

delimiter //

create trigger tr_grade_bu 
  before update on grade
  for each row
begin
  if (new.score < 50) then
    set new.score = 50;
  end if;
  
  if (new.score > 100) then
    set new.score = 100;
  end if;
 
end//

delimiter ;

-- Test the trigger by updating some grades
update grade set score = 38  where student_name = 'Billy';
update grade set score = 107 where student_name = 'Jane';
update grade set score = 95  where student_name = 'Paul';

-- Are there no grades lower than 50 or higher than 100?
select * from grade;
