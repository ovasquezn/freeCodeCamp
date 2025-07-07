-- CREATE DATABASE universe;
-- \c universe

CREATE TABLE galaxy_type (
  galaxy_type_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  description TEXT
);

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_type TEXT NOT NULL,
  distance_from_earth INT NOT NULL,
  has_life BOOLEAN NOT NULL,
  age_in_millions_of_years NUMERIC(8,2) NOT NULL
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  star_type TEXT NOT NULL,
  mass INT NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  age_in_millions_of_years NUMERIC(8,2) NOT NULL
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  has_life BOOLEAN NOT NULL,
  planet_type TEXT NOT NULL,
  distance_from_star INT NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  diameter INT NOT NULL
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  is_spherical BOOLEAN NOT NULL,
  diameter INT NOT NULL,
  has_water BOOLEAN NOT NULL,
  discovery_year INT NOT NULL
);

INSERT INTO galaxy_type (name, description) VALUES
  ('Spiral', 'Has spiral arms'),
  ('Elliptical', 'Elliptical shape'),
  ('Irregular', 'No defined shape');

INSERT INTO galaxy (name, galaxy_type, distance_from_earth, has_life, age_in_millions_of_years) VALUES
  ('Milky Way', 'Spiral', 0, TRUE, 13600.50),
  ('Andromeda', 'Spiral', 2500000, FALSE, 10000.00),
  ('Triangulum', 'Spiral', 3000000, FALSE, 11000.00),
  ('Sombrero', 'Elliptical', 29000000, FALSE, 9000.00),
  ('Whirlpool', 'Spiral', 23000000, FALSE, 8000.00),
  ('Pinwheel', 'Spiral', 21000000, FALSE, 7000.00);

INSERT INTO star (name, galaxy_id, star_type, mass, is_spherical, age_in_millions_of_years) VALUES
  ('Sun', 1, 'G-type', 1, TRUE, 4600.00),
  ('Proxima Centauri', 1, 'M-type', 0, TRUE, 4500.00),
  ('Sirius', 1, 'A-type', 2, TRUE, 300.00),
  ('Alpha Centauri A', 2, 'G-type', 1, TRUE, 5000.00),
  ('Betelgeuse', 1, 'Red Supergiant', 20, TRUE, 8000.00),
  ('Rigel', 1, 'Blue Supergiant', 18, TRUE, 10000.00);

INSERT INTO planet (name, star_id, has_life, planet_type, distance_from_star, is_spherical, diameter) VALUES
  ('Earth', 1, TRUE, 'Terrestrial', 150, TRUE, 12742),
  ('Mars', 1, FALSE, 'Terrestrial', 228, TRUE, 6779),
  ('Jupiter', 1, FALSE, 'Gas Giant', 778, TRUE, 139820),
  ('Venus', 1, FALSE, 'Terrestrial', 108, TRUE, 12104),
  ('Neptune', 1, FALSE, 'Ice Giant', 4495, TRUE, 49244),
  ('Proxima b', 2, FALSE, 'Exoplanet', 7500, TRUE, 11900),
  ('Sirius b', 3, FALSE, 'White Dwarf', 35000, TRUE, 12000),
  ('Alpha Centauri Bb', 4, FALSE, 'Exoplanet', 5000, TRUE, 11000),
  ('Betelgeuse I', 5, FALSE, 'Gas Giant', 100000, TRUE, 120000),
  ('Rigel I', 6, FALSE, 'Gas Giant', 100000, TRUE, 120000),
  ('Rigel II', 6, FALSE, 'Ice Giant', 120000, TRUE, 100000),
  ('Andromeda I', 4, FALSE, 'Exoplanet', 20000, TRUE, 14000);

INSERT INTO moon (name, planet_id, is_spherical, diameter, has_water, discovery_year) VALUES
  ('Moon', 1, TRUE, 3474, FALSE, 0),
  ('Phobos', 2, FALSE, 22, FALSE, 1877),
  ('Deimos', 2, FALSE, 12, FALSE, 1877),
  ('Io', 3, TRUE, 3643, FALSE, 1610),
  ('Europa', 3, TRUE, 3122, TRUE, 1610),
  ('Ganymede', 3, TRUE, 5268, TRUE, 1610),
  ('Callisto', 3, TRUE, 4820, TRUE, 1610),
  ('Amalthea', 3, FALSE, 167, FALSE, 1892),
  ('Himalia', 3, FALSE, 140, FALSE, 1904),
  ('Thebe', 3, FALSE, 99, FALSE, 1979),
  ('Triton', 5, TRUE, 2706, TRUE, 1846),
  ('Nereid', 5, FALSE, 340, FALSE, 1949),
  ('Proteus', 5, FALSE, 420, FALSE, 1989),
  ('Miranda', 5, FALSE, 471, FALSE, 1948),
  ('Oberon', 5, FALSE, 1523, FALSE, 1787),
  ('Proxima b I', 6, FALSE, 800, FALSE, 2020),
  ('Sirius b I', 7, FALSE, 700, FALSE, 2020),
  ('Alpha Centauri Bb I', 8, FALSE, 600, FALSE, 2021),
  ('Betelgeuse I a', 9, FALSE, 7000, FALSE, 2021),
  ('Rigel I a', 10, FALSE, 8000, FALSE, 2021);

