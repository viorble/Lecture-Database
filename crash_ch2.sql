show databases;

create database music;
drop database music;

-- operate database land
create database if not exists land;
use land;
create table continent
(
    continent_id int,
    continent_name varchar(20),
    population bigint
);

-- operate database customer
create database if not exists customer;
use customer;
create table if not exists customer
(
    customer_id int,
    first_name varchar(50),
    last_name varchar(50),
    address varchar(100),
    primary key (customer_id)
);
create table if not exists complaint
(
    complaint_id int,
    customer_id int,
    complaint varchar(200),
    primary key (complaint_id),
    foreign key (customer_id) references customer(customer_id) 
);

insert into customer (customer_id, first_name, last_name, address)
values
(1, 'Bob', 'Smith', '12 Dreary Lane'),
(2, 'Sally', 'Johns', '76 Boulevard Meugler'),
(3, 'Karen', 'Bellyacher', '354 Main Street');

insert into complaint (complaint_id, customer_id, complaint)
values
(1, 3, 'I want to speak to your manager');

select A.customer_id, A.first_name, A.last_name, B.complaint from customer A, complaint B where A.customer_id = B.customer_id;

create table if not exists contact
(
    contact_id int,
    name varchar(50) not null,
    city varchar(50),
    phone varchar(20),
    email_address varchar(50) unique,
    primary key (contact_id)
);
insert into contact(contact_id, name, city, phone, email_address)
values
(1, 'Steve Chen', '北京', '123-3123', 'steve@schen21.org'),
(2, 'Joan Field', '紐約', '321-4321', 'jfield@gmail.com'),
(3, 'Bill Bashful', '台北',null,'bb@gmail.com');

insert into contact(contact_id, name, city, phone, email_address)
values
(4, 'Jacky Lin', '新竹', '', 'jacky@gmail.com');


-- operate table city
use land;
create table if not exists temperature
(
    city varchar(50),
    year int,
    high_temperature int,
    primary key (city, year)
);
insert into temperature (city, year, high_temperature)
values
("New York, NY", 2020, 96),
('Death Valley, CA', 2021, 128),
('International Falls, MN', 2021, 77),
('New York, NY', 2021, 98);

select * from temperature;

create table if not exists temperature_with_constrain_default
(
    city varchar(50),
    year int,
    high_temperature int,
    reporter varchar(10) default 'jacky',
    constraint check (year between 1880 and 2200),
    constraint check (high_temperature < 200),
    primary key (city, year)
);
insert into temperature_with_constrain_default (city, year, high_temperature, reporter)
values
("New York, NY", 2024, 100, 'john');
insert into temperature_with_constrain_default (city, year, high_temperature, reporter)
values
("New York, NY", 2023, 100, default);
create index temperature_repoter on temperature_with_constrain_default(reporter);
alter table temperature_with_constrain_default add column day_of_year varchar(50);
alter table temperature_with_constrain_default drop column day_of_year;
alter table temperature_with_constrain_default rename column reporter to reporters;
alter table temperature_with_constrain_default rename to temperature_constrain_default;


