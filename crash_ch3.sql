-- Comment in a standalone line
create database if not exists crash_ch3; -- Comment after statement
use crash_ch3;
create table if not exists continent
(
    continent_id int,
    continent_name varchar(30),
    population bigint
);

insert into continent (continent_id, continent_name, population)
values
(1, 'Asia', 4641054775),
(2, 'Africa', 1340598147),
(3, 'Europe', 747636026),
(4, 'North America', 592072212),
(5, 'South America', 430759766),
(6, 'Australia', 43111704),
(7, 'Antarctica', 0);

select continent_id,
       continent_name,
       population
from continent
order by population desc;

/* comments with multiple lines
line1
line2
*/

select population
from continent
where continent_name = 'Asia';

select *
from continent;

-- null value check
create table unemployed
(
    region int,
    unemployed int
);
insert into unemployed (region, unemployed)
values
(1, 2218547),
(2, 137455),
(3, null);
select * from unemployed;
select * from unemployed where unemployed is not null;