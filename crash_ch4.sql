create database crash_ch4;
use crash_ch4;
CREATE TABLE solar_eclipse (
    eclipse_date DATE,
    time_of_greatest_eclipse TIME,
    eclipse_type VARCHAR(10),
    magnitude DECIMAL(4 , 3 )
);
insert into solar_eclipse (eclipse_date, time_of_greatest_eclipse, eclipse_type, magnitude)
values
('2022-04-30', '20:42:36','Partial', 0.640),
('2022-10-25', '11:01:20','Partial', 0.862),
('2023-04-20', '04:17:56', 'Hybrid', 1.013);

CREATE TABLE country_code (
    country_code CHAR(3)
);
insert into country_code (country_code)
values
('JPN'),
('JP'),
('J'),
('');
CREATE TABLE test_varchar_size (
    huge_column VARCHAR(16384)
);

CREATE TABLE student (
    student_id INT,
    student_class ENUM('Freshman', 'Sophomore', 'Junior', 'Senior')
);
insert into student(student_id, student_class)
values
(1, 'Freshman');

CREATE TABLE interpreter (
    interpreter_id INT,
    language_spoken SET('English', 'German', 'French', 'Spanish')
);
insert into interpreter(interpreter_id, language_spoken)
values
(1, ''),
(2, 'English'),
(3, 'English,Spanish'),
(4, 'Chinese');

create table book
(
    book_id int,
    author_bio tinytext, -- 256 characters
    book_proposal text, -- 64KB
    entire_book mediumtext -- 16MB
);
insert into book (book_id, author_bio, book_proposal, entire_book)
values
(1, "Tom's birthday is 1939/10/03", null, null),
(2, 'John\'s birthday is 1940/01/01', null, null);
-- (3, 'Peter's birthday is 1968/02/02', null, null);

create table encryption
(
    key_id int,
    encryption_key binary(50)
);

create table signature
(
    signature_id int,
    signature varbinary(400)
);

create table planet_stat
(
    planet varchar(20),
    miles_from_earth bigint,
    diameter_km mediumint
);
insert into planet_stat (planet, miles_from_earth, diameter_km)
values
('Mars', 48678219, 6792),
('Jupiter', 3906747712, 142984),
('Staurn', 792248279, 120536),
('Uranus', 1692662533, 51118),
('Neptune', 2703959966, 49528);

create table planet_stat_v2
(
    planet varchar(20),
    miles_from_earth int unsigned,
    diameter_km mediumint
);
insert into planet_stat_v2 (planet, miles_from_earth, diameter_km)
values
('Mars', 48678219, 6792),
('Jupiter', 3906747712, 142984),
('Staurn', 792248279, 120536),
('Uranus', 1692662533, 51118),
('Neptune', 2703959966, 49528);

create table food
(
    food varchar(30),
    organic_flag bool,
    gluten_free_flag bool
);
desc food;
