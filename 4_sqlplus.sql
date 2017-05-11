--copy+paste lines 2-15 to delete tables.
drop table director_info;
drop table actor_info;
drop table audience_info;
drop table showtime;
drop table seasonal_discount;
drop table movie;
drop table employee;
drop table theater_room;
drop table theater_building;
drop table actor;
drop table audience;
drop table director;
drop table person;

--copy+paste lines 17-688 to create tables and insert values.
create table person (
  id int not null primary key,
  first_name varchar2(1024),
  last_name varchar2(1024)
);

create table director (
  id int not null primary key,
  person_id int not null references person(id) on delete cascade
);

create table audience (
  id int not null primary key,
  person_id int not null references person(id) on delete cascade,
  dob timestamp default current_timestamp
);

create table actor (
  id int not null primary key,
  person_id int not null references person(id) on delete cascade
);

create table theater_building (
  id int not null primary key,
  name varchar2(1024),
  phone varchar2(1024),
  address varchar2(1024)
);

create table theater_room (
  id int not null primary key,
  theater_building_id int not null references theater_building(id) on delete cascade,
  capacity int
);

create table employee (
  id int not null primary key,
  person_id int not null references person(id) on delete cascade,
  theater_building_id int not null references theater_building(id) on delete cascade,
  title varchar2(1024),
  address varchar2(1024),
  hourly_wage int,
  ssn varchar2(11)
);

create table movie (
  id int not null primary key,
  title varchar2(1024),
  description varchar2(1024),
  rating real,
  language varchar2(1024),
  subtitle_language varchar2(1024)
);

create table seasonal_discount (
  id int not null primary key,
  date_start timestamp,
  date_end timestamp,
  description varchar2(1024),
  reduced_price real  
);

create table showtime (
  id int not null primary key,
  movie_id int not null references movie(id) on delete cascade,
  seasonal_discount_id int references seasonal_discount(id) on delete cascade,
  start_time timestamp,
  end_time timestamp,
  price real not null
);

create table audience_info (
  id int not null primary key,
  audience_id int not null references audience(id) on delete cascade,
  movie_id int not null references movie(id) on delete cascade
);

create table actor_info (
  id int not null primary key,
  actor_id int not null references actor(id) on delete cascade,
  movie_id int not null references movie(id) on delete cascade
);

create table director_info (
  id int not null primary key,
  director_id int not null references director(id) on delete cascade,
  movie_id int not null references movie(id) on delete cascade
);

insert into person(id, first_name, last_name)
values
(1, 'Arnold', 'Schwarzenegger');
insert into person(id, first_name, last_name)
values
(2, 'Lindsay', 'Lohan');
insert into person(id, first_name, last_name)
values
(3, 'Tom', 'Cruise');
insert into person(id, first_name, last_name)
values
(4, 'Will', 'Smith');
insert into person(id, first_name, last_name)
values
(5, 'Jim', 'Carrey');
insert into person(id, first_name, last_name)
values
(6, 'Dwayne', 'Johnson');
insert into person(id, first_name, last_name)
values
(7, 'Jackie', 'Chan');
insert into person(id, first_name, last_name)
values
(8, 'Matt', 'Damon');
insert into person(id, first_name, last_name)
values
(9, 'Johnny', 'Depp');
insert into person(id, first_name, last_name)
values
(10, 'Vin', 'Diesel');
insert into person(id, first_name, last_name)
values
(11, 'Steven', 'Spielberg');
insert into person(id, first_name, last_name)
values
(12, 'Peter', 'Jackson');
insert into person(id, first_name, last_name)
values
(13, 'James', 'Cameron');
insert into person(id, first_name, last_name)
values
(14, 'David', 'Yates');
insert into person(id, first_name, last_name)
values
(15, 'Michael', 'Bay');
insert into person(id, first_name, last_name)
values
(16, 'Christopher', 'Nolan');
insert into person(id, first_name, last_name)
values
(17, 'Robert', 'Zemeckis');
insert into person(id, first_name, last_name)
values
(18, 'Tim', 'Burton');
insert into person(id, first_name, last_name)
values
(19, 'Chris', 'Columbus');
insert into person(id, first_name, last_name)
values
(20, 'Gore', 'Verbinski');
insert into person(id, first_name, last_name)
values
(21, 'Bill', 'Gates');
insert into person(id, first_name, last_name)
values
(22, 'Warren', 'Buffett');
insert into person(id, first_name, last_name)
values
(23, 'Jeff', 'Bezos');
insert into person(id, first_name, last_name)
values
(24, 'Amancio', 'Ortega');
insert into person(id, first_name, last_name)
values
(25, 'Mark', 'Zuckerberg');
insert into person(id, first_name, last_name)
values
(26, 'Larry', 'Ellison');
insert into person(id, first_name, last_name)
values
(27, 'Michael', 'Bloomberg');
insert into person(id, first_name, last_name)
values
(28, 'Charles', 'Koch');
insert into person(id, first_name, last_name)
values
(29, 'Larry', 'Page');
insert into person(id, first_name, last_name)
values
(30, 'Sergey', 'Brin');
insert into person(id, first_name, last_name)
values
(31, 'Brian', 'Shi');
insert into person(id, first_name, last_name)
values
(32, 'Jamal', 'Brown');
insert into person(id, first_name, last_name)
values
(33, 'Tyrone', 'Washington');
insert into person(id, first_name, last_name)
values
(34, 'Sheniqua', 'Buckley');
insert into person(id, first_name, last_name)
values
(35, 'Lakeisha', 'Johnson');
insert into person(id, first_name, last_name)
values
(36, 'Latoya', 'Brando');
insert into person(id, first_name, last_name)
values
(37, 'Courtney', 'Morales');
insert into person(id, first_name, last_name)
values
(38, 'Shaheem', 'Perez');
insert into person(id, first_name, last_name)
values
(39, 'Raykwon', 'Butler');
insert into person(id, first_name, last_name)
values
(40, 'Daeshaun', 'Torres');

insert into director(id, person_id)
values
(1, 11);
insert into director(id, person_id)
values
(2, 12);
insert into director(id, person_id)
values
(3, 13);
insert into director(id, person_id)
values
(4, 14);
insert into director(id, person_id)
values
(5, 15);
insert into director(id, person_id)
values
(6, 16);
insert into director(id, person_id)
values
(7, 17);
insert into director(id, person_id)
values
(8, 18);
insert into director(id, person_id)
values
(9, 19);
insert into director(id, person_id)
values
(10, 20);

insert into audience(id, person_id)
values
(1, 21);
insert into audience(id, person_id)
values
(2, 22);
insert into audience(id, person_id)
values
(3, 23);
insert into audience(id, person_id)
values
(4, 24);
insert into audience(id, person_id)
values
(5, 25);
insert into audience(id, person_id)
values
(6, 26);
insert into audience(id, person_id)
values
(7, 27);
insert into audience(id, person_id)
values
(8, 28);
insert into audience(id, person_id)
values
(9, 29);
insert into audience(id, person_id)
values
(10, 30);

insert into actor(id, person_id)
values
(1, 1);
insert into actor(id, person_id)
values
(2, 2);
insert into actor(id, person_id)
values
(3, 3);
insert into actor(id, person_id)
values
(4, 4);
insert into actor(id, person_id)
values
(5, 5);
insert into actor(id, person_id)
values
(6, 6);
insert into actor(id, person_id)
values
(7, 7);
insert into actor(id, person_id)
values
(8, 8);
insert into actor(id, person_id)
values
(9, 9);
insert into actor(id, person_id)
values
(10, 10);

insert into theater_building(id, name, phone, address)
values
(1, 'The Ratchet Place', '212-420-6969', '420 69th Street');
insert into theater_building(id, name, phone, address)
values
(2, 'Good Theater', '420-212-1337', '1337 69th Street');
insert into theater_building(id, name, phone, address)
values
(3, 'Theater Legit', '718-123-4567', '888 8th Avenue');
insert into theater_building(id, name, phone, address)
values
(4, 'Some Ghetto Theater', '917-911-9111', '123 123rd Street');
insert into theater_building(id, name, phone, address)
values
(5, 'Canadian Movie Palace', '333-679-1738', '160 Avenue U');
insert into theater_building(id, name, phone, address)
values
(6, 'Dow Jones Movie Theater', '347-105-1585', '30 Central Park West');
insert into theater_building(id, name, phone, address)
values
(7, 'Halal Movies', '276-195-2243', '666 Bedford Stuyvesant Avenue');
insert into theater_building(id, name, phone, address)
values
(8, 'Citimovies', '212-486-1275', '610 Lexington Avenue');
insert into theater_building(id, name, phone, address)
values
(9, 'Big Cinema', '646-823-1484', '1000 Broadway');
insert into theater_building(id, name, phone, address)
values
(10, 'Netflix and Grill', '943-106-3923', '2017 11th Avenue');

insert into theater_room(id, theater_building_id, capacity)
values
(1, 1, 200);
insert into theater_room(id, theater_building_id, capacity)
values
(2, 1, 300);
insert into theater_room(id, theater_building_id, capacity)
values
(3, 2, 420);
insert into theater_room(id, theater_building_id, capacity)
values
(4, 2, 666);
insert into theater_room(id, theater_building_id, capacity)
values
(5, 3, 1337);
insert into theater_room(id, theater_building_id, capacity)
values
(6, 3, 130);
insert into theater_room(id, theater_building_id, capacity)
values
(7, 4, 679);
insert into theater_room(id, theater_building_id, capacity)
values
(8, 4, 1738);
insert into theater_room(id, theater_building_id, capacity)
values
(9, 5, 1776);
insert into theater_room(id, theater_building_id, capacity)
values
(10, 5, 333);
insert into theater_room(id, theater_building_id, capacity)
values
(11, 6, 105);
insert into theater_room(id, theater_building_id, capacity)
values
(12, 6, 140);
insert into theater_room(id, theater_building_id, capacity)
values
(13, 7, 230);
insert into theater_room(id, theater_building_id, capacity)
values
(14, 7, 720);
insert into theater_room(id, theater_building_id, capacity)
values
(15, 8, 100);
insert into theater_room(id, theater_building_id, capacity)
values
(16, 8, 100);
insert into theater_room(id, theater_building_id, capacity)
values
(17, 9, 900);
insert into theater_room(id, theater_building_id, capacity)
values
(18, 9, 100);
insert into theater_room(id, theater_building_id, capacity)
values
(19, 10, 111);
insert into theater_room(id, theater_building_id, capacity)
values
(20, 10, 550);

insert into employee(id, person_id, theater_building_id, title, address, hourly_wage, ssn)
values
(1, 31, 1, 'Janitor', '230 Park Avenue', 10, '666-69-9001');
insert into employee(id, person_id, theater_building_id, title, address, hourly_wage, ssn)
values
(2, 32, 2, 'Supervisor', '16 Manhattan Valley', 13, '321-00-1738');
insert into employee(id, person_id, theater_building_id, title, address, hourly_wage, ssn)
values
(3, 33, 3, 'Supervisor', '10 Madison Street', 13, '777-10-1234');
insert into employee(id, person_id, theater_building_id, title, address, hourly_wage, ssn)
values
(4, 34, 4, 'Cashier', '8 Spruce Street', 8.50, '175-43-1992');
insert into employee(id, person_id, theater_building_id, title, address, hourly_wage, ssn)
values
(5, 35, 5, 'Janitor', '250 Broadway', 10, '320-75-4325');
insert into employee(id, person_id, theater_building_id, title, address, hourly_wage, ssn)
values
(6, 36, 6, 'Supervisor', '444 44th Street', 13, '215-91-1623');
insert into employee(id, person_id, theater_building_id, title, address, hourly_wage, ssn)
values
(7, 37, 7, 'Manager', '432 Park Avenue', 22.50, '678-99-9821');
insert into employee(id, person_id, theater_building_id, title, address, hourly_wage, ssn)
values
(8, 38, 8, 'Fry Cook', '95 3rd Avenue', 9, '123-45-6789');
insert into employee(id, person_id, theater_building_id, title, address, hourly_wage, ssn)
values
(9, 39, 9, 'Popcorn Guy', '31 Avenue U', 9, '130-65-1009');
insert into employee(id, person_id, theater_building_id, title, address, hourly_wage, ssn)
values
(10, 40, 10, 'Nacho Guy', '99 Park Slope', 9, '987-65-4321');

insert into movie(id, title, description, rating, language, subtitle_language)
values
(1, 'Slow and Serious', 'Racing', 4, 'English', NULL);
insert into movie(id, title, description, rating, language, subtitle_language)
values
(2, 'Pirates of the Colombia', 'Action', 3.5, 'English', 'Japanese');
insert into movie(id, title, description, rating, language, subtitle_language)
values
(3, 'The Tiger King', 'Animation', 5, 'English', 'English');
insert into movie(id, title, description, rating, language, subtitle_language)
values
(4, 'Reptileman', 'Action', 2.5, 'Korean', 'English');
insert into movie(id, title, description, rating, language, subtitle_language)
values
(5, 'Haunted Movie', 'Horror', 1.5, 'Turkish', NULL);
insert into movie(id, title, description, rating, language, subtitle_language)
values
(6, 'Tronald Dump', 'Politics', 4, 'English', NULL);
insert into movie(id, title, description, rating, language, subtitle_language)
values
(7, 'Galaxy Wars', 'Sci-Fi', 1, 'Spanish', 'Chinese');
insert into movie(id, title, description, rating, language, subtitle_language)
values
(8, 'The White Knight', 'Action', 2, 'Arabic', 'English');
insert into movie(id, title, description, rating, language, subtitle_language)
values
(9, 'Hairy Porter', 'Fantasy', 2, 'Italian', 'Swedish');
insert into movie(id, title, description, rating, language, subtitle_language)
values
(10, 'Captain Africa', 'Fighting', 4.5, 'German', 'German');

insert into seasonal_discount(id, date_start, date_end, description, reduced_price)
values
(1, current_timestamp, NULL, 'a gift for my friend', 3);
insert into seasonal_discount(id, date_start, date_end, description, reduced_price)
values
(2, NULL, NULL, 'lol', 5);
insert into seasonal_discount(id, date_start, date_end, description, reduced_price)
values
(3, NULL, NULL, 'hi man', 3);
insert into seasonal_discount(id, date_start, date_end, description, reduced_price)
values
(4, NULL, NULL, 'we are the champions!', 6);
insert into seasonal_discount(id, date_start, date_end, description, reduced_price)
values
(5, current_timestamp, NULL, 'something', 3);
insert into seasonal_discount(id, date_start, date_end, description, reduced_price)
values
(6, NULL, NULL, '123', 3);
insert into seasonal_discount(id, date_start, date_end, description, reduced_price)
values
(7, NULL, NULL, 'cscareerquestions', 15);
insert into seasonal_discount(id, date_start, date_end, description, reduced_price)
values
(8, NULL, NULL, 'my movie date', 1);
insert into seasonal_discount(id, date_start, date_end, description, reduced_price)
values
(9, current_timestamp, NULL, '1738', 6.79);
insert into seasonal_discount(id, date_start, date_end, description, reduced_price)
values
(10, NULL, NULL, NULL, 3);

insert into showtime(id, movie_id, seasonal_discount_id, start_time, end_time, price)
values
(1, 1, NULL, current_timestamp, NULL, 69);
insert into showtime(id, movie_id, seasonal_discount_id, start_time, end_time, price)
values
(2, 2, 1, current_timestamp, NULL, 42);
insert into showtime(id, movie_id, seasonal_discount_id, start_time, end_time, price)
values
(3, 3, 7, current_timestamp, NULL, 155);
insert into showtime(id, movie_id, seasonal_discount_id, start_time, end_time, price)
values
(4, 4, 9, current_timestamp, NULL, 130);
insert into showtime(id, movie_id, seasonal_discount_id, start_time, end_time, price)
values
(5, 5, NULL, current_timestamp, NULL, 13);
insert into showtime(id, movie_id, seasonal_discount_id, start_time, end_time, price)
values
(6, 6, NULL, current_timestamp, NULL, 6);
insert into showtime(id, movie_id, seasonal_discount_id, start_time, end_time, price)
values
(7, 7, 2, current_timestamp, NULL, 44);
insert into showtime(id, movie_id, seasonal_discount_id, start_time, end_time, price)
values
(8, 8, NULL, current_timestamp, NULL, 199);
insert into showtime(id, movie_id, seasonal_discount_id, start_time, end_time, price)
values
(9, 9, 5, current_timestamp, NULL, 13.37);
insert into showtime(id, movie_id, seasonal_discount_id, start_time, end_time, price)
values
(10, 10, NULL, current_timestamp, NULL, 4.2);

insert into audience_info(id, audience_id, movie_id)
values
(1, 1, 1);
insert into audience_info(id, audience_id, movie_id)
values
(2, 1, 7);
insert into audience_info(id, audience_id, movie_id)
values
(3, 2, 3);
insert into audience_info(id, audience_id, movie_id)
values
(4, 2, 6);
insert into audience_info(id, audience_id, movie_id)
values
(5, 3, 6);
insert into audience_info(id, audience_id, movie_id)
values
(6, 3, 5);
insert into audience_info(id, audience_id, movie_id)
values
(7, 4, 3);
insert into audience_info(id, audience_id, movie_id)
values
(8, 4, 10);
insert into audience_info(id, audience_id, movie_id)
values
(9, 5, 8);
insert into audience_info(id, audience_id, movie_id)
values
(10, 5, 4);
insert into audience_info(id, audience_id, movie_id)
values
(11, 6, 7);
insert into audience_info(id, audience_id, movie_id)
values
(12, 6, 9);
insert into audience_info(id, audience_id, movie_id)
values
(13, 7, 6);
insert into audience_info(id, audience_id, movie_id)
values
(14, 7, 3);
insert into audience_info(id, audience_id, movie_id)
values
(15, 8, 1);
insert into audience_info(id, audience_id, movie_id)
values
(16, 8, 8);
insert into audience_info(id, audience_id, movie_id)
values
(17, 9, 6);
insert into audience_info(id, audience_id, movie_id)
values
(18, 9, 5);
insert into audience_info(id, audience_id, movie_id)
values
(19, 10, 4);
insert into audience_info(id, audience_id, movie_id)
values
(20, 10, 2);

insert into actor_info(id, actor_id, movie_id)
values
(1, 1, 7);
insert into actor_info(id, actor_id, movie_id)
values
(2, 1, 6);
insert into actor_info(id, actor_id, movie_id)
values
(3, 2, 1);
insert into actor_info(id, actor_id, movie_id)
values
(4, 2, 6);
insert into actor_info(id, actor_id, movie_id)
values
(5, 3, 5);
insert into actor_info(id, actor_id, movie_id)
values
(6, 3, 7);
insert into actor_info(id, actor_id, movie_id)
values
(7, 4, 10);
insert into actor_info(id, actor_id, movie_id)
values
(8, 4, 1);
insert into actor_info(id, actor_id, movie_id)
values
(9, 5, 3);
insert into actor_info(id, actor_id, movie_id)
values
(10, 5, 2);
insert into actor_info(id, actor_id, movie_id)
values
(11, 6, 7);
insert into actor_info(id, actor_id, movie_id)
values
(12, 6, 5);
insert into actor_info(id, actor_id, movie_id)
values
(13, 7, 4);
insert into actor_info(id, actor_id, movie_id)
values
(14, 7, 2);
insert into actor_info(id, actor_id, movie_id)
values
(15, 8, 9);
insert into actor_info(id, actor_id, movie_id)
values
(16, 8, 7);
insert into actor_info(id, actor_id, movie_id)
values
(17, 9, 5);
insert into actor_info(id, actor_id, movie_id)
values
(18, 9, 2);
insert into actor_info(id, actor_id, movie_id)
values
(19, 10, 8);
insert into actor_info(id, actor_id, movie_id)
values
(20, 10, 2);

insert into director_info(id, director_id, movie_id)
values
(1, 1, 1);
insert into director_info(id, director_id, movie_id)
values
(2, 2, 2);
insert into director_info(id, director_id, movie_id)
values
(3, 3, 3);
insert into director_info(id, director_id, movie_id)
values
(4, 4, 4);
insert into director_info(id, director_id, movie_id)
values
(5, 5, 5);
insert into director_info(id, director_id, movie_id)
values
(6, 6, 6);
insert into director_info(id, director_id, movie_id)
values
(7, 7, 7);
insert into director_info(id, director_id, movie_id)
values
(8, 8, 8);
insert into director_info(id, director_id, movie_id)
values
(9, 9, 9);
insert into director_info(id, director_id, movie_id)
values
(10, 10, 10);
