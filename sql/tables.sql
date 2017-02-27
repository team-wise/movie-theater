DROP TABLE IF EXISTS theater_managers CASCADE;
CREATE TABLE theater_managers (
  id SERIAL NOT NULL PRIMARY KEY,
  name TEXT NOT NULL DEFAULT ''
);

DROP TABLE IF EXISTS movie_theaters CASCADE;
CREATE TABLE movie_theaters (
  id SERIAL NOT NULL PRIMARY KEY,
  theater_manager_id INT NOT NULL REFERENCES theater_managers(id) ON DELETE CASCADE,
  address TEXT NOT NULL DEFAULT '',
  name TEXT NOT NULL DEFAULT '',
  phone_number VARCHAR(64) NOT NULL DEFAULT '911'
);

DROP TABLE IF EXISTS movie_theater_rooms CASCADE;
CREATE TABLE movie_theater_rooms (
  id SERIAL NOT NULL PRIMARY KEY,
  movie_theater_id INT NOT NULL REFERENCES movie_theaters(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS directors CASCADE;
CREATE TABLE directors (
  id SERIAL NOT NULL PRIMARY KEY,
  name TEXT NOT NULL
);

DROP TABLE IF EXISTS actors CASCADE;
CREATE TABLE actors (
  id SERIAL NOT NULL PRIMARY KEY,
  name TEXT NOT NULL
);

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
  id SERIAL NOT NULL PRIMARY KEY,
  movie_theater_id INT NOT NULL REFERENCES movie_theaters(id) ON DELETE CASCADE,
  director_id INT NOT NULL REFERENCES directors(id) ON DELETE CASCADE,
  rating TEXT,
  title TEXT NOT NULL,
  description TEXT
);

DROP TABLE IF EXISTS actors_in_movies;
CREATE TABLE actors_in_movies (
  id SERIAL NOT NULL PRIMARY KEY,
  movie_id INT NOT NULL REFERENCES movies(id) ON DELETE CASCADE,
  actor_id INT NOT NULL REFERENCES actors(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS audience;
CREATE TABLE audience (
  id SERIAL NOT NULL PRIMARY KEY,
  movie_theater_id INT NOT NULL REFERENCES movie_theaters(id) ON DELETE CASCADE,
  movie_id INT NOT NULL REFERENCES movies(id) ON DELETE CASCADE,
  name TEXT NOT NULL DEFAULT ''
);

DROP TABLE IF EXISTS show_times;
CREATE TABLE show_times (
  id SERIAL NOT NULL PRIMARY KEY,
  movie_theater_id INT NOT NULL REFERENCES movie_theaters(id) ON DELETE CASCADE,
  movie_theater_room_id INT NOT NULL REFERENCES movie_theater_rooms(id) ON DELETE CASCADE,
  movie_id INT NOT NULL REFERENCES movies(id) ON DELETE CASCADE,
  time_start TIMESTAMP DEFAULT NULL,
  time_end TIMESTAMP DEFAULT NULL,
  net_revenue REAL NOT NULL DEFAULT 0,
);
