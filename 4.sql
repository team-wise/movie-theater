drop table if exists person cascade;
create table person (
  id int not null primary key,
  first_name varchar2(1024),
  last_name varchar2(1024)
);

drop table if exists director cascade;
create table director (
  id int not null primary key,
  person_id int not null references person(id) on delete cascade
);

drop table if exists audience cascade;
create table audience (
  id int not null primary key,
  person_id int not null references person(id) on delete cascade,
  dob timestamp default current_timestamp
);

drop table if exists actor cascade;
create table actor (
  id int not null primary key,
  person_id int not null references person(id) on delete cascade
);

drop table if exists theater_building cascade;
create table theater_building (
  id int not null primary key,
  name varchar2(1024),
  phone varchar2(1024),
  address varchar2(1024)
);

drop table if exists theater_room;
create table theater_room (
  id int not null primary key,
  theater_building_id int not null references theater_building(id) on delete cascade,
  capacity int
);

drop table if exists employee;
create table employee (
  id int not null primary key,
  person_id int not null references person(id) on delete cascade,
  theater_building_id int not null references theater_building(id) on delete cascade,
  title varchar2(1024),
  address varchar2(1024),
  hourly_wage int,
  ssn varchar2(11)
);

drop table if exists movie cascade;
create table movie (
  id int not null primary key,
  title varchar2(1024),
  description varchar2(1024),
  rating real,
  language varchar2(1024),
  subtitle_language varchar2(1024)
);

drop table if exists seasonal_discount cascade;
create table seasonal_discount (
  id int not null primary key,
  date_start timestamp,
  date_end timestamp,
  description varchar2(1024),
  reduced_price real  
);

drop table if exists showtime;
create table showtime (
  id int not null primary key,
  movie_id int not null references movie(id) on delete cascade,
  seasonal_discount_id int references seasonal_discount(id) on delete cascade,
  start_time timestamp,
  end_time timestamp,
  price real not null
);

drop table if exists audience_info;
create table audience_info (
  id int not null primary key,
  audience_id int not null references audience(id) on delete cascade,
  movie_id int not null references movie(id) on delete cascade
);

drop table if exists actor_info;
create table actor_info (
  id int not null primary key,
  actor_id int not null references actor(id) on delete cascade,
  movie_id int not null references movie(id) on delete cascade
);

drop table if exists director_info;
create table director_info (
  id int not null primary key,
  director_id int not null references director(id) on delete cascade,
  movie_id int not null references movie(id) on delete cascade
);

insert into person(id, first_name, last_name)
values
(1, 'Arnold', 'Schwarzenegger'),
(2, 'Lindsay', 'Lohan'),
(3, 'Tom', 'Cruise'),
(4, 'Will', 'Smith'),
(5, 'Jim', 'Carrey'),
(6, 'Dwayne', 'Johnson'),
(7, 'Jackie', 'Chan'),
(8, 'Matt', 'Damon'),
(9, 'Johnny', 'Depp'),
(10, 'Vin', 'Diesel'),
(11, 'Steven', 'Spielberg'),
(12, 'Peter', 'Jackson'),
(13, 'James', 'Cameron'),
(14, 'David', 'Yates'),
(15, 'Michael', 'Bay'),
(16, 'Christopher', 'Nolan'),
(17, 'Robert', 'Zemeckis'),
(18, 'Tim', 'Burton'),
(19, 'Chris', 'Columbus'),
(20, 'Gore', 'Verbinski'),
(21, 'Bill', 'Gates'),
(22, 'Warren', 'Buffett'),
(23, 'Jeff', 'Bezos'),
(24, 'Amancio', 'Ortega'),
(25, 'Mark', 'Zuckerberg'),
(26, 'Larry', 'Ellison'),
(27, 'Michael', 'Bloomberg'),
(28, 'Charles', 'Koch'),
(29, 'Larry', 'Page'),
(30, 'Sergey', 'Brin'),
(31, 'Brian', 'Shi'),
(32, 'Jamal', 'Brown'),
(33, 'Tyrone', 'Washington'),
(34, 'Sheniqua', 'Buckley'),
(35, 'Lakeisha', 'Johnson'),
(36, 'Latoya', 'Brando'),
(37, 'Courtney', 'Morales'),
(38, 'Shaheem', 'Perez'),
(39, 'Raykwon', 'Butler'),
(40, 'Daeshaun', 'Torres');

insert into director(id, person_id)
values
(1, 11),
(2, 12),
(3, 13),
(4, 14),
(5, 15),
(6, 16),
(7, 17),
(8, 18),
(9, 19),
(10, 20);

insert into audience(id, person_id)
values
(1, 21),
(2, 22),
(3, 23),
(4, 24),
(5, 25),
(6, 26),
(7, 27),
(8, 28),
(9, 29),
(10, 30);

insert into actor(id, person_id)
values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

insert into theater_building(id, name, phone, address)
values
(1, 'The Ratchet Place', '212-420-6969', '420 69th Street'),
(2, 'Good Theater', '420-212-1337', '1337 69th Street'),
(3, 'Theater Legit', '718-123-4567', '888 8th Avenue'),
(4, 'Some Ghetto Theater', '917-911-9111', '123 123rd Street'),
(5, 'Canadian Movie Palace', '333-679-1738', '160 Avenue U'),
(6, 'Dow Jones Movie Theater', '347-105-1585', '30 Central Park West'),
(7, 'Halal Movies', '276-195-2243', '666 Bedford Stuyvesant Avenue'),
(8, 'Citimovies', '212-486-1275', '610 Lexington Avenue'),
(9, 'Big Cinema', '646-823-1484', '1000 Broadway'),
(10, 'Netflix and Grill', '943-106-3923', '2017 11th Avenue');

insert into theater_room(id, theater_building_id, capacity)
values
(1, 1, 200),
(2, 1, 300),
(3, 2, 420),
(4, 2, 666),
(5, 3, 1337),
(6, 3, 130),
(7, 4, 679),
(8, 4, 1738),
(9, 5, 1776),
(10, 5, 333),
(11, 6, 105),
(12, 6, 140),
(13, 7, 230),
(14, 7, 720),
(15, 8, 100),
(16, 8, 100),
(17, 9, 900),
(18, 9, 100),
(19, 10, 111),
(20, 10, 550);

insert into employee(id, person_id, theater_building_id, title, address, hourly_wage, ssn)
values
(1, 31, 1, 'Janitor', '230 Park Avenue', 10, '666-69-9001'),
(2, 32, 2, 'Supervisor', '16 Manhattan Valley', 13, '321-00-1738'),
(3, 33, 3, 'Supervisor', '10 Madison Street', 13, '777-10-1234'),
(4, 34, 4, 'Cashier', '8 Spruce Street', 8.50, '175-43-1992'),
(5, 35, 5, 'Janitor', '250 Broadway', 10, '320-75-4325'),
(6, 36, 6, 'Supervisor', '444 44th Street', 13, '215-91-1623'),
(7, 37, 7, 'Manager', '432 Park Avenue', 22.50, '678-99-9821'),
(8, 38, 8, 'Fry Cook', '95 3rd Avenue', 9, '123-45-6789'),
(9, 39, 9, 'Popcorn Guy', '31 Avenue U', 9, '130-65-1009'),
(10, 40, 10, 'Nacho Guy', '99 Park Slope', 9, '987-65-4321');

insert into movie(id, title, description, rating, language, subtitle_language)
values
(1, 'Slow and Serious', 'Racing', 4, 'English', NULL),
(2, 'Pirates of the Colombia', 'Action', 3.5, 'English', 'Japanese'),
(3, 'The Tiger King', 'Animation', 5, 'English', 'English'),
(4, 'Reptileman', 'Action', 2.5, 'Korean', 'English'),
(5, 'Haunted Movie', 'Horror', 1.5, 'Turkish', NULL),
(6, 'Tronald Dump', 'Politics', 4, 'English', NULL),
(7, 'Galaxy Wars', 'Sci-Fi', 1, 'Spanish', 'Chinese'),
(8, 'The White Knight', 'Action', 2, 'Arabic', 'English'),
(9, 'Hairy Porter', 'Fantasy', 2, 'Italian', 'Swedish'),
(10, 'Captain Africa', 'Fighting', 4.5, 'German', 'German');

insert into seasonal_discount(id, date_start, date_end, description, reduced_price)
values
(1, current_timestamp, NULL, 'a gift for my friend', 3),
(2, NULL, NULL, 'lol', 5),
(3, NULL, NULL, 'hi man', 3),
(4, NULL, NULL, 'we are the champions!', 6),
(5, current_timestamp, NULL, 'something', 3),
(6, NULL, NULL, '123', 3),
(7, NULL, NULL, 'cscareerquestions', 15),
(8, NULL, NULL, 'my movie date', 1),
(9, current_timestamp, NULL, '1738', 6.79),
(10, NULL, NULL, NULL, 3);

insert into showtime(id, movie_id, seasonal_discount_id, start_time, end_time, price)
values
(1, 1, NULL, current_timestamp, NULL, 69),
(2, 2, 1, current_timestamp, NULL, 42),
(3, 3, 7, current_timestamp, NULL, 155),
(4, 4, 9, current_timestamp, NULL, 130),
(5, 5, NULL, current_timestamp, NULL, 13),
(6, 6, NULL, current_timestamp, NULL, 6),
(7, 7, 2, current_timestamp, NULL, 44),
(8, 8, NULL, current_timestamp, NULL, 199),
(9, 9, 5, current_timestamp, NULL, 13.37),
(10, 10, NULL, current_timestamp, NULL, 4.2);

insert into audience_info(id, audience_id, movie_id)
values
(1, 1, 1),
(2, 1, 7),
(3, 2, 3),
(4, 2, 6),
(5, 3, 6),
(6, 3, 5),
(7, 4, 3),
(8, 4, 10),
(9, 5, 8),
(10, 5, 4),
(11, 6, 7),
(12, 6, 9),
(13, 7, 6),
(14, 7, 3),
(15, 8, 1),
(16, 8, 8),
(17, 9, 6),
(18, 9, 5),
(19, 10, 4),
(20, 10, 2);

insert into actor_info(id, actor_id, movie_id)
values
(1, 1, 7),
(2, 1, 6),
(3, 2, 1),
(4, 2, 6),
(5, 3, 5),
(6, 3, 7),
(7, 4, 10),
(8, 4, 1),
(9, 5, 3),
(10, 5, 2),
(11, 6, 7),
(12, 6, 5),
(13, 7, 4),
(14, 7, 2),
(15, 8, 9),
(16, 8, 7),
(17, 9, 5),
(18, 9, 2),
(19, 10, 8),
(20, 10, 2);

insert into director_info(id, director_id, movie_id)
values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);
