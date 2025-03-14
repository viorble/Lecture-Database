-- 
-- MySQL Crash Course
-- 
-- Chapter 12 – Creating Triggers						
--
-- You can copy and paste any of these commands into your favorite MySQL tool
-- (like MySQL Workbench) and run them in your own MySQL environment.
--

-- Create the tables for the chapter
create database accounting;

use accounting;

-- Create a table for account payable data for a company
create table payable
	(
	payable_id	int,
	company		varchar(100),
	amount		numeric(8,2),
	service		varchar(100)
	);
	
insert into payable
	(
	payable_id,
	company,
	amount,
	service
	)
values
	(1, 'Acme HVAC', 		 	 123.32,	'Repair of Air Conditioner'),
	(2, 'Initech Printers',		1459.00,	'New Printers'),
	(3, 'Hooli Cleaning',		4398.55,	'Janitorial Services');
	
-- Create the payable_audit table that will track changes to the payable table
create table payable_audit
	(
	audit_datetime	datetime,
	audit_user		varchar(50),
	audit_change	varchar(500)
	);
	
-- Create an after insert trigger	
drop trigger if exists tr_payable_ai;

delimiter //

create trigger tr_payable_ai
  after insert on payable
  for each row
begin
  insert into payable_audit
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
		  'New row for payable_id ',
		  new.payable_id,
		  '. Company: ',
		  new.company,
		  '. Amount: ',
		  new.amount,
		  '. Service: ',
		  new.service
	  )
	);
end//

delimiter ;

-- Insert a row into the payable table to test the insert trigger
insert into payable
	(
	  payable_id,
      company,
      amount,
      service
    )
values
	(
	  4,
	  'Sirius Painting',
      451.45,
      'Painting the lobby'
    );
	
-- Did a row get logged in the payable_audit table showing what was inserted into the payable table?
select * from payable_audit;

-- Create an after delete trigger
use accounting;

drop trigger if exists tr_payable_ad;

delimiter //

create trigger tr_payable_ad
  after delete on payable
  for each row
begin
  insert into payable_audit
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
        'Deleted row for payable_id ',
        old.payable_id,
        '. Company: ',
        old.compatr_payable_adny,
       '. Amount: ',
       old.amount,
       '. Service: ',
       old.service
    )
  );
end//

delimiter ;	

-- Delete a row from the payable table to test the delete trigger
set sql_safe_updates = 0;
delete from payable where company = 'Sirius Painting';
set sql_safe_updates = 0;


-- Is there a row in the payable_audit table that logs the deleted row from the payable table?
select * from payable_audit;

-- Create an after update trigger
delimiter //

create trigger tr_payable_au
  after update on payable
  for each row
begin
  set @change_msg = 
	concat(
		'Updated row for payable_id ',
		old.payable_id
	);

  if (old.company != new.company) then
    set @change_msg = 
	  concat(
		@change_msg,
		'. Company changed from ',
		old.company,
		' to ',
		new.company
	  );
  end if;
	
  if (old.amount != new.amount) then
    set @change_msg = 
	  concat(
		@change_msg,
		'. Amount changed from ',
		old.amount,
		' to ',
		new.amount
	  );
  end if;
	
  if (old.service != new.service) then
    set @change_msg = 
	  concat(
		@change_msg,
		'. Service changed from ',
		old.service,
		' to ',
		new.service
	  );
  end if;
	
  insert into payable_audit
	(
      audit_datetime,
      audit_user,
      audit_change
    )
  values
    (
      now(),
	  user(),
	  @change_msg
  );
	
end//

delimiter ;

-- Test the trigger by updating a row
update payable
set    amount = 100000,
       company = 'House of Larry'
where  payable_id = 3;

-- Did the update get logged?
select * from payable_audit;
