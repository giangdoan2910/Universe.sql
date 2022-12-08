postgres=> CREATE DATABASE universe;
ERROR:  database "universe" already exists
postgres=> \c universe
You are now connected to database "universe" as user "freecodecamp".
universe=> \d galaxy\d
                          Table "public.galaxy"
+--------------+-----------------------+-----------+----------+---------+
|    Column    |         Type          | Collation | Nullable | Default |
+--------------+-----------------------+-----------+----------+---------+
| galaxy_types | text                  |           |          |         |
| name         | character varying(30) |           |          |         |
| galaxy_id    | integer               |           |          |         |
+--------------+-----------------------+-----------+----------+---------+
Indexes:
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> ALTER TABLE galaxy DROP COLUMN galaxy_id;
ALTER TABLE
universe=> \d galaxy
                          Table "public.galaxy"
+--------------+-----------------------+-----------+----------+---------+
|    Column    |         Type          | Collation | Nullable | Default |
+--------------+-----------------------+-----------+----------+---------+
| galaxy_types | text                  |           |          |         |
| name         | character varying(30) |           |          |         |
+--------------+-----------------------+-----------+----------+---------+
Indexes:
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> ALTER TABLE galaxy ADD COLUMN galaxy_id SERIAL;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN distance_from_earth_in_mly NUMERIC(4,1);
ALTER TABLE
universe=> \d galaxy
                                                  Table "public.galaxy"
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
|           Column           |         Type          | Collation | Nullable |                  Default                  |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_types               | text                  |           |          |                                           |
| name                       | character varying(30) |           |          |                                           |
| galaxy_id                  | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| distance_from_earth_in_mly | numeric(4,1)          |           |          |                                           |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> \d galaxy
                                                  Table "public.galaxy"
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
|           Column           |         Type          | Collation | Nullable |                  Default                  |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_types               | text                  |           |          |                                           |
| name                       | character varying(30) |           |          |                                           |
| galaxy_id                  | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| distance_from_earth_in_mly | numeric(4,1)          |           |          |                                           |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> \d galaxy
                                                  Table "public.galaxy"
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
|           Column           |         Type          | Collation | Nullable |                  Default                  |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_types               | text                  |           |          |                                           |
| name                       | character varying(30) |           |          |                                           |
| galaxy_id                  | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| distance_from_earth_in_mly | numeric(4,1)          |           |          |                                           |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> SELECT * FROM galaxy;
+--------------+------+-----------+----------------------------+
| galaxy_types | name | galaxy_id | distance_from_earth_in_mly |
+--------------+------+-----------+----------------------------+
+--------------+------+-----------+----------------------------+
(0 rows)

universe=> SELECT * FROM galaxy ORDER BY galaxy_id;
+--------------+------+-----------+----------------------------+
| galaxy_types | name | galaxy_id | distance_from_earth_in_mly |
+--------------+------+-----------+----------------------------+
+--------------+------+-----------+----------------------------+
(0 rows)

universe=> ALTER TABLE galaxy ADD PRIMARY KEY(galaxy_id);
ALTER TABLE
universe=> \d galaxy
                                                  Table "public.galaxy"
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
|           Column           |         Type          | Collation | Nullable |                  Default                  |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_types               | text                  |           |          |                                           |
| name                       | character varying(30) |           |          |                                           |
| galaxy_id                  | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| distance_from_earth_in_mly | numeric(4,1)          |           |          |                                           |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> INSERT INTO galaxy(name, distance_from_earth_in_mly) VALUES('Milky Way Galaxy', 0),('Canis Major Dwarf', 0.025);
INSERT 0 2
universe=> \d galaxy
                                                  Table "public.galaxy"
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
|           Column           |         Type          | Collation | Nullable |                  Default                  |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_types               | text                  |           |          |                                           |
| name                       | character varying(30) |           |          |                                           |
| galaxy_id                  | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| distance_from_earth_in_mly | numeric(4,1)          |           |          |                                           |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> SELECT * FROM galaxy;
+--------------+-------------------+-----------+----------------------------+
| galaxy_types |       name        | galaxy_id | distance_from_earth_in_mly |
+--------------+-------------------+-----------+----------------------------+
|              | Milky Way Galaxy  |         1 |                        0.0 |
|              | Canis Major Dwarf |         2 |                        0.0 |
+--------------+-------------------+-----------+----------------------------+
(2 rows)+
universe=> CREATE TABLE galaxy();
CREATE TABLE
universe=> ALTER TABLE galaxy ADD COLUMN galaxy_id SERIAL;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN name VARCHAR(50) NOT NULL;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN galaxy_types text NOT NULL;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN distance_from_earth NUMERIC(4,2) NOT NULL;
ALTER TABLE
universe=> ALTER COLUMN galaxy_id NOT NULL;
ERROR:  syntax error at or near "COLUMN"
LINE 1: ALTER COLUMN galaxy_id NOT NULL;
              ^
universe=> ALTER COLUMN galaxy_id SERIAL NOT NULL;
ERROR:  syntax error at or near "COLUMN"
LINE 1: ALTER COLUMN galaxy_id SERIAL NOT NULL;
              ^
universe=> \d galaxy
                                              Table "public.galaxy"
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
|       Column        |         Type          | Collation | Nullable |                  Default                  |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id           | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                | character varying(50) |           | not null |                                           |
| galaxy_types        | text                  |           | not null |                                           |
| distance_from_earth | numeric(4,2)          |           | not null |                                           |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+

universe=> SELECT * FROM galaxy;
+-----------+------+--------------+---------------------+
| galaxy_id | name | galaxy_types | distance_from_earth |
+-----------+------+--------------+---------------------+
+-----------+------+--------------+---------------------+
(0 rows)

universe=> INSERT INTO galaxy(galaxy_id,name,galaxy_types,distance_from_earth) VALUES(1, 'Milky Way Galaxy', 'Spiral', 0.00)
universe-> ;
INSERT 0 1
universe=> SELECT * FROM galaxy;
+-----------+------------------+--------------+---------------------+
| galaxy_id |       name       | galaxy_types | distance_from_earth |
+-----------+------------------+--------------+---------------------+
|         1 | Milky Way Galaxy | Spiral       |                0.00 |
+-----------+------------------+--------------+---------------------+
(1 row)

universe=> INSERT INTO galaxy(name,galaxy_types,distance_from_earth) VALUES('Canis Major Dwarf', 'Irregular', 0.02);
;
INSERT 0 1
universe=> SELECT * FROM galaxy;
+-----------+-------------------+--------------+---------------------+
| galaxy_id |       name        | galaxy_types | distance_from_earth |
+-----------+-------------------+--------------+---------------------+
|         1 | Milky Way Galaxy  | Spiral       |                0.00 |
|         1 | Canis Major Dwarf | Irregular    |                0.02 |
+-----------+-------------------+--------------+---------------------+
(2 rows)

universe=> ALTER TABLE galaxy ADD COLUMN galaxy_id SERIAL;
ERROR:  column "galaxy_id" of relation "galaxy" already exists
universe=> ALTER COLUMN galaxy_id SERIAL;
ERROR:  syntax error at or near "COLUMN"
LINE 1: ALTER COLUMN galaxy_id SERIAL;
              ^
universe=> \D galaxy;
invalid command \D
Try \? for help.
universe=> \d galaxy;
                                              Table "public.galaxy"
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
|       Column        |         Type          | Collation | Nullable |                  Default                  |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id           | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                | character varying(50) |           | not null |                                           |
| galaxy_types        | text                  |           | not null |                                           |
| distance_from_earth | numeric(4,2)          |           | not null |                                           |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
universe=> SELECT * FROM planet;
+-----------+--------------------+-----------------------------------+---------+----------+
| planet_id |    planet_types    |            description            |  name   | has_life |
+-----------+--------------------+-----------------------------------+---------+----------+
|         1 | Terrestrial Planet | Cratered surface                  | Mercury | f        |
|         2 | Terrestrial Planet | Earths twin                       | Venus   |          |
|         3 | Terrestrial Planet | Active surface                    | Earth   |          |
|         4 | Terrestrial Planet | Chemical reactions                | Mars    |          |
|         5 | Gas Giant          | Solid inner core                  | Jupiter |          |
|         6 | Gas Giant          | Do not have solid surface         | Saturn  |          |
|         7 | Gas Giant          | The third largest planet          | Uranus  |          |
|         8 | Ice Giant          | The third most massive planet     | Neptune |          |
|         9 | Dwarf              | Located in the inner solar system | Ceres   |          |
+-----------+--------------------+-----------------------------------+---------+----------+
(9 rows)

universe=> INSERT INTO planet(planet_id, planet_types, description, name) VALUES(10,'Dwarf', 'the largest known dwarf planet', 'Pluto');
INSERT 0 1
universe=> INSERT INTO planet(planet_id, planet_types, description, name) VALUES(11,'Double Dwarf', 'haft the sixe of Pluto', 'Charon');
INSERT 0 1
universe=> INSERT INTO planet(planet_id, planet_types, description, name) VALUES(12,'Dwarf', 'also called Eris', '2003 UB313');
INSERT 0 1
universe=> SELECT * FROM planet;
+-----------+--------------------+-----------------------------------+------------+----------+
| planet_id |    planet_types    |            description            |    name    | has_life |
+-----------+--------------------+-----------------------------------+------------+----------+
|         1 | Terrestrial Planet | Cratered surface                  | Mercury    | f        |
|         2 | Terrestrial Planet | Earths twin                       | Venus      |          |
|         3 | Terrestrial Planet | Active surface                    | Earth      |          |
|         4 | Terrestrial Planet | Chemical reactions                | Mars       |          |
|         5 | Gas Giant          | Solid inner core                  | Jupiter    |          |
|         6 | Gas Giant          | Do not have solid surface         | Saturn     |          |
|         7 | Gas Giant          | The third largest planet          | Uranus     |          |
|         8 | Ice Giant          | The third most massive planet     | Neptune    |          |
|         9 | Dwarf              | Located in the inner solar system | Ceres      |          |
|        10 | Dwarf              | the largest known dwarf planet    | Pluto      |          |
|        11 | Double Dwarf       | haft the sixe of Pluto            | Charon     |          |
|        12 | Dwarf              | also called Eris                  | 2003 UB313 |          |
+-----------+--------------------+-----------------------------------+------------+----------+
(12 rows)

universe=> UPDATE planet SET has_life='no' WHERE name='Venus';
UPDATE 1
universe=> UPDATE planet SET has_life='no' WHERE name='Mars';
UPDATE 1
universe=> UPDATE planet SET has_life='no' WHERE name='Jupiter';
UPDATE 1
universe=> UPDATE planet SET has_life='no' WHERE name='Saturn';
UPDATE 1
universe=> UPDATE planet SET has_life='no' WHERE name='Uranus';
UPDATE 1
universe=> UPDATE planet SET has_life='no' WHERE name='Neptune';
UPDATE 1
universe=> UPDATE planet SET has_life='no' WHERE name='Ceres';
UPDATE 1
universe=> UPDATE planet SET has_life='no' WHERE name='Charon';
UPDATE 1
universe=> UPDATE planet SET has_life='no' WHERE name='2003 UB313';
UPDATE 1
universe=> UPDATE planet SET has_life='no' WHERE name='Pluto';
UPDATE 1
universe=> UPDATE planet SET has_life='yes' WHERE name='Earth';
UPDATE 1
universe=> SELECT * FROM planet;
+-----------+--------------------+-----------------------------------+------------+----------+
| planet_id |    planet_types    |            description            |    name    | has_life |
+-----------+--------------------+-----------------------------------+------------+----------+
|         1 | Terrestrial Planet | Cratered surface                  | Mercury    | f        |
|         2 | Terrestrial Planet | Earths twin                       | Venus      | f        |
|         4 | Terrestrial Planet | Chemical reactions                | Mars       | f        |
|         5 | Gas Giant          | Solid inner core                  | Jupiter    | f        |
|         6 | Gas Giant          | Do not have solid surface         | Saturn     | f        |
|         7 | Gas Giant          | The third largest planet          | Uranus     | f        |
|         8 | Ice Giant          | The third most massive planet     | Neptune    | f        |
|         9 | Dwarf              | Located in the inner solar system | Ceres      | f        |
|        11 | Double Dwarf       | haft the sixe of Pluto            | Charon     | f        |
|        12 | Dwarf              | also called Eris                  | 2003 UB313 | f        |
|        10 | Dwarf              | the largest known dwarf planet    | Pluto      | f        |
|         3 | Terrestrial Planet | Active surface                    | Earth      | t        |
+-----------+--------------------+-----------------------------------+------------+----------+
(12 rows)

universe=> \d planet
                                           Table "public.planet"
+--------------+-----------------------+-----------+----------+-------------------------------------------+
|    Column    |         Type          | Collation | Nullable |                  Default                  |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id    | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| planet_types | text                  |           |          |                                           |
| description  | character varying(60) |           |          |                                           |
| name         | character varying(40) |           |          |                                           |
| has_life     | boolean               |           |          |                                           |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> \d galaxy
                                              Table "public.galaxy"
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
|       Column        |         Type          | Collation | Nullable |                  Default                  |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id           | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                | character varying(50) |           | not null |                                           |
| galaxy_types        | text                  |           | not null |                                           |
| distance_from_earth | numeric(4,2)          |           | not null |                                           |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> \d universe
Did not find any relation named "universe".
universe=> SELECT * FROM universe
universe-> SELECT * FROM universe;
ERROR:  syntax error at or near "SELECT"
LINE 2: SELECT * FROM universe;
        ^
universe=> \d moon;
               Table "public.moon"
+--------+------+-----------+----------+---------+
| Column | Type | Collation | Nullable | Default |
+--------+------+-----------+----------+---------+
+--------+------+-----------+----------+---------+

universe=> SELECT * FROM moon;
+--+
+--+
+--+
(0 rows)

universe=> ALTER TABLE moon ADD COLUMN moon_id SERIAL;
ALTER TABLE
universe=> SELECT * FROM moon;
+---------+
| moon_id |
+---------+
+---------+
(0 rows)

universe=> \d star;
               Table "public.star"
+--------+------+-----------+----------+---------+
| Column | Type | Collation | Nullable | Default |
+--------+------+-----------+----------+---------+
+--------+------+-----------+----------+---------+

universe=> ALTER TABLE star ADD COLUMN star_id SERIAL;
ALTER TABLE
universe=> SELECT * FROM galaxy
universe-> SELECT * FROM galaxy;
ERROR:  syntax error at or near "SELECT"
LINE 2: SELECT * FROM galaxy;
        ^
universe=> SELECT * FROM galaxy;
+-----------+------------------------------+--------------+---------------------+
| galaxy_id |             name             | galaxy_types | distance_from_earth |
+-----------+------------------------------+--------------+---------------------+
|         1 | Milky Way Galaxy             | Spiral       |                0.00 |
|         2 | Canis Major Dwarf            | Irregular    |                0.02 |
|         3 | Virgo Stella Stream          | Irregular    |                0.03 |
|         4 | Large Magellanic Cloud       | Irregular    |                0.16 |
|         5 | Small Magellanic Cloud       | Irregular    |                0.19 |
|         6 | Sagittarius Dwarf Elliptical | Elliptical   |                0.08 |
|         7 | Andromeda                    | Spiral       |                2.50 |
+-----------+------------------------------+--------------+---------------------+
(7 rows)

universe=> ALTER TABLE star ADD COLUMN name VARCHAR(50);
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN age_in_millions_of_year INT NOT NULL;
universe=> SELECT * FROM galaxy;
+-----------+------------------------------+--------------+---------------------+
| galaxy_id |             name             | galaxy_types | distance_from_earth |
+-----------+------------------------------+--------------+---------------------+
|         1 | Milky Way Galaxy             | Spiral       |                0.00 |
|         2 | Canis Major Dwarf            | Irregular    |                0.02 |
|         3 | Virgo Stella Stream          | Irregular    |                0.03 |
|         4 | Large Magellanic Cloud       | Irregular    |                0.16 |
|         5 | Small Magellanic Cloud       | Irregular    |                0.19 |
|         6 | Sagittarius Dwarf Elliptical | Elliptical   |                0.08 |
|         7 | Andromeda                    | Spiral       |                2.50 |
+-----------+------------------------------+--------------+---------------------+
(7 rows)

universe=> \d
                     List of relations
+--------+----------------------+----------+--------------+
| Schema |         Name         |   Type   |    Owner     |
+--------+----------------------+----------+--------------+
| public | galaxy               | table    | freecodecamp |
| public | galaxy_galaxy_id_seq | sequence | freecodecamp |
| public | moon                 | table    | freecodecamp |
| public | moon_moon_id_seq     | sequence | freecodecamp |
| public | planet               | table    | freecodecamp |
| public | planet_planet_id_seq | sequence | freecodecamp |
| public | star                 | table    | freecodecamp |
| public | star_star_id_seq     | sequence | freecodecamp |
+--------+----------------------+----------+--------------+
(8 rows)

universe=> UPDATE galaxy(name) NOT NULL;
ERROR:  syntax error at or near "("
LINE 1: UPDATE galaxy(name) NOT NULL;
                     ^
universe=> \d galaxy
                                              Table "public.galaxy"
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
|       Column        |         Type          | Collation | Nullable |                  Default                  |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id           | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                | character varying(50) |           | not null |                                           |
| galaxy_types        | text                  |           | not null |                                           |
| distance_from_earth | numeric(4,2)          |           | not null |                                           |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> ALTER TABLE galaxy ADD COLUMN is_spiral BOOLEAN;
ALTER TABLE
universe=> SELECT * FROM galaxy;
+-----------+------------------------------+--------------+---------------------+-----------+
| galaxy_id |             name             | galaxy_types | distance_from_earth | is_spiral |
+-----------+------------------------------+--------------+---------------------+-----------+
|         1 | Milky Way Galaxy             | Spiral       |                0.00 |           |
|         2 | Canis Major Dwarf            | Irregular    |                0.02 |           |
|         3 | Virgo Stella Stream          | Irregular    |                0.03 |           |
|         4 | Large Magellanic Cloud       | Irregular    |                0.16 |           |
|         5 | Small Magellanic Cloud       | Irregular    |                0.19 |           |
|         6 | Sagittarius Dwarf Elliptical | Elliptical   |                0.08 |           |
|         7 | Andromeda                    | Spiral       |                2.50 |           |
+-----------+------------------------------+--------------+---------------------+-----------+
(7 rows)

universe=> UPDATE galaxy SET is_spiral='no' WHERE galaxy_types='Irregular';
UPDATE 4
universe=> SELECT * FROM galaxy;
+-----------+------------------------------+--------------+---------------------+-----------+
| galaxy_id |             name             | galaxy_types | distance_from_earth | is_spiral |
+-----------+------------------------------+--------------+---------------------+-----------+
|         1 | Milky Way Galaxy             | Spiral       |                0.00 |           |
|         6 | Sagittarius Dwarf Elliptical | Elliptical   |                0.08 |           |
|         7 | Andromeda                    | Spiral       |                2.50 |           |
|         2 | Canis Major Dwarf            | Irregular    |                0.02 | f         |
|         3 | Virgo Stella Stream          | Irregular    |                0.03 | f         |
|         4 | Large Magellanic Cloud       | Irregular    |                0.16 | f         |
|         5 | Small Magellanic Cloud       | Irregular    |                0.19 | f         |
+-----------+------------------------------+--------------+---------------------+-----------+
(7 rows)

universe=> UPDATE galaxy SET is_spiral='no' WHERE galaxy_types='Elliptical';
UPDATE 1
universe=> UPDATE galaxy SET is_spiral='yes' WHERE galaxy_types='Spiral';
UPDATE 2
universe=> SELECT * FROM galaxy;
+-----------+------------------------------+--------------+---------------------+-----------+
| galaxy_id |             name             | galaxy_types | distance_from_earth | is_spiral |
+-----------+------------------------------+--------------+---------------------+-----------+
|         2 | Canis Major Dwarf            | Irregular    |                0.02 | f         |
|         3 | Virgo Stella Stream          | Irregular    |                0.03 | f         |
|         4 | Large Magellanic Cloud       | Irregular    |                0.16 | f         |
|         5 | Small Magellanic Cloud       | Irregular    |                0.19 | f         |
|         6 | Sagittarius Dwarf Elliptical | Elliptical   |                0.08 | f         |
|         1 | Milky Way Galaxy             | Spiral       |                0.00 | t         |
|         7 | Andromeda                    | Spiral       |                2.50 | t         |
+-----------+------------------------------+--------------+---------------------+-----------+
(7 rows)

universe=> \d galaxy
                                              Table "public.galaxy"
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
|       Column        |         Type          | Collation | Nullable |                  Default                  |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id           | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                | character varying(50) |           | not null |                                           |
| galaxy_types        | text                  |           | not null |                                           |
| distance_from_earth | numeric(4,2)          |           | not null |                                           |
| is_spiral           | boolean               |           |          |                                           |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> \d planet
                                           Table "public.planet"
+--------------+-----------------------+-----------+----------+-------------------------------------------+
|    Column    |         Type          | Collation | Nullable |                  Default                  |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id    | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| planet_types | text                  |           |          |                                           |
| description  | character varying(60) |           |          |                                           |
| name         | character varying(40) |           |          |                                           |
| has_life     | boolean               |           |          |                                           |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> UPDATE planet SET name NOT NULL;
ERROR:  syntax error at or near "NOT"
LINE 1: UPDATE planet SET name NOT NULL;
                               ^
universe=> ALTER TABLE planet ADD CONSTRAINT NOT NULL;
ERROR:  syntax error at or near "NOT"
LINE 1: ALTER TABLE planet ADD CONSTRAINT NOT NULL;
                                          ^
universe=> ALTER TABLE planet ALTER COLUMN name NOT NULL;
ERROR:  syntax error at or near "NOT"
LINE 1: ALTER TABLE planet ALTER COLUMN name NOT NULL;
                                             ^
universe=> SELECT * FROM planet
universe-> SELECT * FROM planet;
ERROR:  syntax error at or near "SELECT"
LINE 2: SELECT * FROM planet;
        ^
universe=> SELECT * FROM planet;
+-----------+--------------------+-----------------------------------+------------+----------+
| planet_id |    planet_types    |            description            |    name    | has_life |
+-----------+--------------------+-----------------------------------+------------+----------+
|         1 | Terrestrial Planet | Cratered surface                  | Mercury    | f        |
|         2 | Terrestrial Planet | Earths twin                       | Venus      | f        |
|         4 | Terrestrial Planet | Chemical reactions                | Mars       | f        |
|         5 | Gas Giant          | Solid inner core                  | Jupiter    | f        |
|         6 | Gas Giant          | Do not have solid surface         | Saturn     | f        |
|         7 | Gas Giant          | The third largest planet          | Uranus     | f        |
|         8 | Ice Giant          | The third most massive planet     | Neptune    | f        |
|         9 | Dwarf              | Located in the inner solar system | Ceres      | f        |
|        11 | Double Dwarf       | haft the sixe of Pluto            | Charon     | f        |
|        12 | Dwarf              | also called Eris                  | 2003 UB313 | f        |
|        10 | Dwarf              | the largest known dwarf planet    | Pluto      | f        |
|         3 | Terrestrial Planet | Active surface                    | Earth      | t        |
+-----------+--------------------+-----------------------------------+------------+----------+
(12 rows)

universe=> ALTER COLUMN name NOT NULL;
ERROR:  syntax error at or near "COLUMN"
LINE 1: ALTER COLUMN name NOT NULL;
              ^
universe=> ALTER COLUMN name INT NOT NULL;
ERROR:  syntax error at or near "COLUMN"
LINE 1: ALTER COLUMN name INT NOT NULL;
              ^
universe=> ALTER TABLE planet
universe-> ALTER COLUMN name NOT NULL;
ERROR:  syntax error at or near "NOT"
LINE 2: ALTER COLUMN name NOT NULL;
                          ^
universe=> \d moon
                                Table "public.moon"
+---------+---------+-----------+----------+---------------------------------------+
| Column  |  Type   | Collation | Nullable |                Default                |
+---------+---------+-----------+----------+---------------------------------------+
| moon_id | integer |           | not null | nextval('moon_moon_id_seq'::regclass) |
+---------+---------+-----------+----------+---------------------------------------+

universe=> ALTER TABLE moon ADD PRIMARY KEY (moon_id);
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN name VARCHAR(40) UNIQUE NOT NULL;
ALTER TABLE
universe=> \d moon
                                       Table "public.moon"
+---------+-----------------------+-----------+----------+---------------------------------------+
| Column  |         Type          | Collation | Nullable |                Default                |
+---------+-----------------------+-----------+----------+---------------------------------------+
| moon_id | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name    | character varying(40) |           | not null |                                       |
+---------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> ALTER TABLE moon ADD COLUMN planet_id NOT NULL;
ERROR:  syntax error at or near "NOT"
LINE 1: ALTER TABLE moon ADD COLUMN planet_id NOT NULL;
                                              ^
universe=> ALTER TABLE moon ADD COLUMN planet_iD;
ERROR:  syntax error at or near ";"
LINE 1: ALTER TABLE moon ADD COLUMN planet_iD;
                                             ^
universe=> ALTER TABLE moon ADD COLUMN planet_id;
ERROR:  syntax error at or near ";"
LINE 1: ALTER TABLE moon ADD COLUMN planet_id;
                                             ^
universe=> ALTER TABLE moon ADD COLUMN planet_id CHAR(2);
ALTER TABLE
universe=> ALTER TABLE moon REFERENCES planet(planet_id);
ERROR:  syntax error at or near "REFERENCES"
LINE 1: ALTER TABLE moon REFERENCES planet(planet_id);
                         ^
universe=> ALTER TABLE moon(planet_id) REFERENCES planet(planet_id);
ERROR:  syntax error at or near "("
LINE 1: ALTER TABLE moon(planet_id) REFERENCES planet(planet_id);
                        ^
universe=> SELECT * FROM moon;
+---------+------+-----------+
| moon_id | name | planet_id |
+---------+------+-----------+
+---------+------+-----------+
(0 rows)

universe=> ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet(planet_id);
ERROR:  foreign key constraint "moon_planet_id_fkey" cannot be implemented
DETAIL:  Key columns "planet_id" and "planet_id" are of incompatible types: character and integer.
universe=> \d planet
                                           Table "public.planet"
+--------------+-----------------------+-----------+----------+-------------------------------------------+
|    Column    |         Type          | Collation | Nullable |                  Default                  |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id    | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| planet_types | text                  |           |          |                                           |
| description  | character varying(60) |           |          |                                           |
| name         | character varying(40) |           |          |                                           |
| has_life     | boolean               |           |          |                                           |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> ALTER TABLE moon DROP CONSTRAINT CHAR(2);
ERROR:  syntax error at or near "("
LINE 1: ALTER TABLE moon DROP CONSTRAINT CHAR(2);
                                             ^
universe=> ALTER TABLE moon DROP COLUMN planet_id;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN planet_id INT;
ALTER TABLE
universe=> ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet(planet_id);
ALTER TABLE
universe=> SELECT * FROM moon;
+---------+------+-----------+
| moon_id | name | planet_id |
+---------+------+-----------+
+---------+------+-----------+
(0 rows)

universe=> ALTER TABLE moon(moon_id, name) VALUES(1,'Earth Moon');
ERROR:  syntax error at or near "("
LINE 1: ALTER TABLE moon(moon_id, name) VALUES(1,'Earth Moon');
                        ^
universe=> INSERT INTO moon(moon_id, name) VALUES(1,'Earth Moon');
INSERT 0 1
universe=> ALTER TABLE moon ADD COLUMN moon_size INT;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN moon_shape TEXT;
ALTER TABLE
universe=> UPDATE moon SET moon_size=1 WHERE moon_id=1;
UPDATE 1
universe=> UPDATE moon SET moon_shape='egg-shaped' WHERE moon_id=1;
UPDATE 1
universe=> SELECT * FROM moon;
+---------+------------+-----------+-----------+------------+
| moon_id |    name    | planet_id | moon_size | moon_shape |
+---------+------------+-----------+-----------+------------+
|       1 | Earth Moon |           |         1 | egg-shaped |
+---------+------------+-----------+-----------+------------+
(1 row)

universe=> UPDATE moon SET planet_id=3 WHERE moon_id=1;
UPDATE 1
universe=> SELECT * FROM moon;
+---------+------------+-----------+-----------+------------+
| moon_id |    name    | planet_id | moon_size | moon_shape |
+---------+------------+-----------+-----------+------------+
|       1 | Earth Moon |         3 |         1 | egg-shaped |
+---------+------------+-----------+-----------+------------+
(1 row)

universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(1,'Mars Moon',4,2,'Irregular');
ERROR:  duplicate key value violates unique constraint "moon_pkey"
DETAIL:  Key (moon_id)=(1) already exists.
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(2,'Mars Moon',4,2,'Irregular');
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(3,'Jupiter Moon',5,80,'Spherical');
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(4,'Saturn Moon',6,83,'Ravioli and Potatoes');
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(5,'Uranus Moon',7,6,'Spherical');
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(6,'Neptune Moon',8,14,'Irregular');
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(7,'Pluto Moon',10,5,'Heart_shaped');
INSERT 0 1
universe=> SELECT * FROM moon;
+---------+--------------+-----------+-----------+----------------------+
| moon_id |     name     | planet_id | moon_size |      moon_shape      |
+---------+--------------+-----------+-----------+----------------------+
|       1 | Earth Moon   |         3 |         1 | egg-shaped           |
|       2 | Mars Moon    |         4 |         2 | Irregular            |
|       3 | Jupiter Moon |         5 |        80 | Spherical            |
|       4 | Saturn Moon  |         6 |        83 | Ravioli and Potatoes |
|       5 | Uranus Moon  |         7 |         6 | Spherical            |
|       6 | Neptune Moon |         8 |        14 | Irregular            |
|       7 | Pluto Moon   |        10 |         5 | Heart_shaped         |
+---------+--------------+-----------+-----------+----------------------+
(7 rows)
postgres=> \c universe
You are now connected to database "universe" as user "freecodecamp".
universe=> SELECT * FROM galaxy;
+-----------+------------------------------+--------------+---------------------+-----------+
| galaxy_id |             name             | galaxy_types | distance_from_earth | is_spiral |
+-----------+------------------------------+--------------+---------------------+-----------+
|         2 | Canis Major Dwarf            | Irregular    |                0.02 | f         |
|         3 | Virgo Stella Stream          | Irregular    |                0.03 | f         |
|         4 | Large Magellanic Cloud       | Irregular    |                0.16 | f         |
|         5 | Small Magellanic Cloud       | Irregular    |                0.19 | f         |
|         6 | Sagittarius Dwarf Elliptical | Elliptical   |                0.08 | f         |
|         1 | Milky Way Galaxy             | Spiral       |                0.00 | t         |
|         7 | Andromeda                    | Spiral       |                2.50 | t         |
+-----------+------------------------------+--------------+---------------------+-----------+
(7 rows)

universe=> SELECT * FROM planet;
+-----------+--------------------+-----------------------------------+------------+----------+
| planet_id |    planet_types    |            description            |    name    | has_life |
+-----------+--------------------+-----------------------------------+------------+----------+
|         1 | Terrestrial Planet | Cratered surface                  | Mercury    | f        |
|         2 | Terrestrial Planet | Earths twin                       | Venus      | f        |
|         4 | Terrestrial Planet | Chemical reactions                | Mars       | f        |
|         5 | Gas Giant          | Solid inner core                  | Jupiter    | f        |
|         6 | Gas Giant          | Do not have solid surface         | Saturn     | f        |
|         7 | Gas Giant          | The third largest planet          | Uranus     | f        |
|         8 | Ice Giant          | The third most massive planet     | Neptune    | f        |
|         9 | Dwarf              | Located in the inner solar system | Ceres      | f        |
|        11 | Double Dwarf       | haft the sixe of Pluto            | Charon     | f        |
|        12 | Dwarf              | also called Eris                  | 2003 UB313 | f        |
|        10 | Dwarf              | the largest known dwarf planet    | Pluto      | f        |
|         3 | Terrestrial Planet | Active surface                    | Earth      | t        |
+-----------+--------------------+-----------------------------------+------------+----------+
(12 rows)

universe=> SELECT * FROM moon;
+---------+--------------+-----------+-----------+----------------------+
| moon_id |     name     | planet_id | moon_size |      moon_shape      |
+---------+--------------+-----------+-----------+----------------------+
|       1 | Earth Moon   |         3 |         1 | egg-shaped           |
|       2 | Mars Moon    |         4 |         2 | Irregular            |
|       3 | Jupiter Moon |         5 |        80 | Spherical            |
|       4 | Saturn Moon  |         6 |        83 | Ravioli and Potatoes |
|       5 | Uranus Moon  |         7 |         6 | Spherical            |
|       6 | Neptune Moon |         8 |        14 | Irregular            |
|       7 | Pluto Moon   |        10 |         5 | Heart_shaped         |
+---------+--------------+-----------+-----------+----------------------+
(7 rows)

universe=> INSERT INTO moon(moon_id, name, planet_id) VALUES(8,'Mercury Moon',1)
universe-> ;
INSERT 0 1
universe=> SELECT * FROM moon;
+---------+--------------+-----------+-----------+----------------------+
| moon_id |     name     | planet_id | moon_size |      moon_shape      |
+---------+--------------+-----------+-----------+----------------------+
|       1 | Earth Moon   |         3 |         1 | egg-shaped           |
|       2 | Mars Moon    |         4 |         2 | Irregular            |
|       3 | Jupiter Moon |         5 |        80 | Spherical            |
|       4 | Saturn Moon  |         6 |        83 | Ravioli and Potatoes |
|       5 | Uranus Moon  |         7 |         6 | Spherical            |
|       6 | Neptune Moon |         8 |        14 | Irregular            |
|       7 | Pluto Moon   |        10 |         5 | Heart_shaped         |
|       8 | Mercury Moon |         1 |           |                      |
+---------+--------------+-----------+-----------+----------------------+
(8 rows)

universe=> ALTER TABLE moon ADD CONSTRAINT moon_size TEXT NOT NULL;
ERROR:  syntax error at or near "TEXT"
LINE 1: ALTER TABLE moon ADD CONSTRAINT moon_size TEXT NOT NULL;
                                                  ^
universe=> ALTER TABLE moon ADD CONSTRAINT moon_shape TEXT NOT NULL;
ERROR:  syntax error at or near "TEXT"
LINE 1: ALTER TABLE moon ADD CONSTRAINT moon_shape TEXT NOT NULL;
                                                   ^
universe=> INSERT INTO moon(moon_size, moon_shape) VALUES('null','null')
;
ERROR:  invalid input syntax for type integer: "null"
LINE 1: INSERT INTO moon(moon_size, moon_shape) VALUES('null','null'...
                                                       ^
universe=> INSERT INTO moon(moon_size, moon_shape) VALUES(0,'null')
;
ERROR:  null value in column "name" violates not-null constraint
DETAIL:  Failing row contains (1, null, null, 0, null).
universe=> UPDATE moon SET moon_size=0, moon_shape='null' WHERE moon_id=8;
UPDATE 1
universe=> SELECT * FROM moon;
+---------+--------------+-----------+-----------+----------------------+
| moon_id |     name     | planet_id | moon_size |      moon_shape      |
+---------+--------------+-----------+-----------+----------------------+
|       1 | Earth Moon   |         3 |         1 | egg-shaped           |
|       2 | Mars Moon    |         4 |         2 | Irregular            |
|       3 | Jupiter Moon |         5 |        80 | Spherical            |
|       4 | Saturn Moon  |         6 |        83 | Ravioli and Potatoes |
|       5 | Uranus Moon  |         7 |         6 | Spherical            |
|       6 | Neptune Moon |         8 |        14 | Irregular            |
|       7 | Pluto Moon   |        10 |         5 | Heart_shaped         |
|       8 | Mercury Moon |         1 |         0 | null                 |
+---------+--------------+-----------+-----------+----------------------+
(8 rows)

universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(9,'Venus Moon',2,0,'null')
;
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(10,'Dwarf Ceres Moon',9,0,'null')
;
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(11,'Titan',6,1,'Ellipsoid')
;
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(12,'Ganymede',5,1,'Oval-shaped mass')
;
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(13,'Ganymede',5,1,'Elliptical')
;
ERROR:  duplicate key value violates unique constraint "moon_name_key"
DETAIL:  Key (name)=(Ganymede) already exists.
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(13,'Europa',5,1,'Elliptical')
;
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(14,'Elara',5,1,'Irregular')
;
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(15,'Dione',6,1,'Oval-shaped')
;
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(16,'Mimas',6,1,'Bowl-shaped')
;
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(17,'Janus',6,1,'Potato-shaped')
;
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(18,'Ariel',7,1,'Bowl-shaped')
;
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(19,'Triton',8,1,'Spherical')
;
INSERT 0 1
universe=> INSERT INTO moon(moon_id, name, planet_id, moon_size, moon_shape) VALUES(20,'Nix',10,1,'Elongated')
;
INSERT 0 1
universe=> SELECT * FROM moon;
+---------+------------------+-----------+-----------+----------------------+
| moon_id |       name       | planet_id | moon_size |      moon_shape      |
+---------+------------------+-----------+-----------+----------------------+
|       1 | Earth Moon       |         3 |         1 | egg-shaped           |
|       2 | Mars Moon        |         4 |         2 | Irregular            |
|       3 | Jupiter Moon     |         5 |        80 | Spherical            |
|       4 | Saturn Moon      |         6 |        83 | Ravioli and Potatoes |
|       5 | Uranus Moon      |         7 |         6 | Spherical            |
|       6 | Neptune Moon     |         8 |        14 | Irregular            |
|       7 | Pluto Moon       |        10 |         5 | Heart_shaped         |
|       8 | Mercury Moon     |         1 |         0 | null                 |
|       9 | Venus Moon       |         2 |         0 | null                 |
|      10 | Dwarf Ceres Moon |         9 |         0 | null                 |
|      11 | Titan            |         6 |         1 | Ellipsoid            |
|      12 | Ganymede         |         5 |         1 | Oval-shaped mass     |
|      13 | Europa           |         5 |         1 | Elliptical           |
|      14 | Elara            |         5 |         1 | Irregular            |
|      15 | Dione            |         6 |         1 | Oval-shaped          |
|      16 | Mimas            |         6 |         1 | Bowl-shaped          |
|      17 | Janus            |         6 |         1 | Potato-shaped        |
|      18 | Ariel            |         7 |         1 | Bowl-shaped          |
|      19 | Triton           |         8 |         1 | Spherical            |
|      20 | Nix              |        10 |         1 | Elongated            |
+---------+------------------+-----------+-----------+----------------------+
(20 rows)

universe=> \d star
                                               Table "public.star"
+-------------------------+-----------------------+-----------+----------+---------------------------------------+
|         Column          |         Type          | Collation | Nullable |                Default                |
+-------------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id                 | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name                    | character varying(50) |           |          |                                       |
| age_in_millions_of_year | integer               |           | not null |                                       |
+-------------------------+-----------------------+-----------+----------+---------------------------------------+

universe=> \d moon
                                         Table "public.moon"
+------------+-----------------------+-----------+----------+---------------------------------------+
|   Column   |         Type          | Collation | Nullable |                Default                |
+------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id    | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name       | character varying(40) |           | not null |                                       |
| planet_id  | integer               |           |          |                                       |
| moon_size  | integer               |           |          |                                       |
| moon_shape | text                  |           |          |                                       |
+------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> ALTER TABLE star DROP COLUMN name;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN name UNIQUE VARCHAR(40) NOT NULL;
ERROR:  syntax error at or near "UNIQUE"
LINE 1: ALTER TABLE star ADD COLUMN name UNIQUE VARCHAR(40) NOT NULL...
                                         ^
universe=> ALTER TABLE star ADD COLUMN name VARCHAR(40) UNIQUE NOT NULL;
ALTER TABLE
universe=> ALTER TABLE star ADD PRIMARY KEY star_id;
ERROR:  syntax error at or near "star_id"
LINE 1: ALTER TABLE star ADD PRIMARY KEY star_id;
                                         ^
universe=> ALTER TABLE star ADD PRIMARY KEY (star_id);
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN galaxy_id INT;
ALTER TABLE
universe=> SELECT * FROM star;
+---------+-------------------------+------+-----------+
| star_id | age_in_millions_of_year | name | galaxy_id |
+---------+-------------------------+------+-----------+
+---------+-------------------------+------+-----------+
(0 rows)

universe=> \d star;
                                               Table "public.star"
+-------------------------+-----------------------+-----------+----------+---------------------------------------+
|         Column          |         Type          | Collation | Nullable |                Default                |
+-------------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id                 | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| age_in_millions_of_year | integer               |           | not null |                                       |
| name                    | character varying(40) |           | not null |                                       |
| galaxy_id               | integer               |           |          |                                       |
+-------------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);
ALTER TABLE
universe=> \d galaxy
                                              Table "public.galaxy"
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
|       Column        |         Type          | Collation | Nullable |                  Default                  |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id           | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                | character varying(50) |           | not null |                                           |
| galaxy_types        | text                  |           | not null |                                           |
| distance_from_earth | numeric(4,2)          |           | not null |                                           |
| is_spiral           | boolean               |           |          |                                           |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> SELECT * FROM galaxy;
+-----------+------------------------------+--------------+---------------------+-----------+
| galaxy_id |             name             | galaxy_types | distance_from_earth | is_spiral |
+-----------+------------------------------+--------------+---------------------+-----------+
|         2 | Canis Major Dwarf            | Irregular    |                0.02 | f         |
|         3 | Virgo Stella Stream          | Irregular    |                0.03 | f         |
|         4 | Large Magellanic Cloud       | Irregular    |                0.16 | f         |
|         5 | Small Magellanic Cloud       | Irregular    |                0.19 | f         |
|         6 | Sagittarius Dwarf Elliptical | Elliptical   |                0.08 | f         |
|         1 | Milky Way Galaxy             | Spiral       |                0.00 | t         |
|         7 | Andromeda                    | Spiral       |                2.50 | t         |
+-----------+------------------------------+--------------+---------------------+-----------+
(7 rows)

universe=> ALTER TABLE star ADD COLUMN star_types VARCHAR(30);
ALTER TABLE
universe=> \d star
                                               Table "public.star"
+-------------------------+-----------------------+-----------+----------+---------------------------------------+
|         Column          |         Type          | Collation | Nullable |                Default                |
+-------------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id                 | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| age_in_millions_of_year | integer               |           | not null |                                       |
| name                    | character varying(40) |           | not null |                                       |
| galaxy_id               | integer               |           |          |                                       |
| star_types              | character varying(30) |           |          |                                       |
+-------------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(1, 242, 'Sirius', 1, 'A0 or A1');
INSERT 0 1
universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(2, 10, 'Canopus', 1, 'A9 II');
INSERT 0 1
universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(3, 455, 'Vega', 1, 'A0V');
INSERT 0 1
universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(4, 8055, 'Rigel', 1, 'B8lab');
INSERT 0 1
universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(5, 1701000, 'Procyon', 2, 'F5 IV-V');
INSERT 0 1
universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(6, 37, 'Acherna', 1, 'B6 Vep');
INSERT 0 1
universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(7, 12, 'Spica', 3, 'B1V');
INSERT 0 1
universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(8, 11, 'Antares', 1, 'M1');
INSERT 0 1
universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(9, 724, 'Pollux', 1, 'K0IIIb');
INSERT 0 1
universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(10, 10, 'Deneb', 1, 'A2');
INSERT 0 1
universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(11, 11, 'Mimosa', 1, 'B0.5 III');
INSERT 0 1
universe=> INSERT INTO star(star_id, age_in_millions_of_year, name, galaxy_id, star_types) VALUES(12, 10, 'Betelgeuse', 1, 'M2lab');
INSERT 0 1
universe=> SELECT * FROM star;
+---------+-------------------------+------------+-----------+------------+
| star_id | age_in_millions_of_year |    name    | galaxy_id | star_types |
+---------+-------------------------+------------+-----------+------------+
|       1 |                     242 | Sirius     |         1 | A0 or A1   |
|       2 |                      10 | Canopus    |         1 | A9 II      |
|       3 |                     455 | Vega       |         1 | A0V        |
|       4 |                    8055 | Rigel      |         1 | B8lab      |
|       5 |                 1701000 | Procyon    |         2 | F5 IV-V    |
|       6 |                      37 | Acherna    |         1 | B6 Vep     |
|       7 |                      12 | Spica      |         3 | B1V        |
|       8 |                      11 | Antares    |         1 | M1         |
|       9 |                     724 | Pollux     |         1 | K0IIIb     |
|      10 |                      10 | Deneb      |         1 | A2         |
|      11 |                      11 | Mimosa     |         1 | B0.5 III   |
|      12 |                      10 | Betelgeuse |         1 | M2lab      |
+---------+-------------------------+------------+-----------+------------+
(12 rows)

universe=> \d universe
Did not find any relation named "universe".
universe=> \d
                     List of relations
+--------+----------------------+----------+--------------+
| Schema |         Name         |   Type   |    Owner     |
+--------+----------------------+----------+--------------+
| public | galaxy               | table    | freecodecamp |
| public | galaxy_galaxy_id_seq | sequence | freecodecamp |
| public | moon                 | table    | freecodecamp |
| public | moon_moon_id_seq     | sequence | freecodecamp |
| public | planet               | table    | freecodecamp |
| public | planet_planet_id_seq | sequence | freecodecamp |
| public | star                 | table    | freecodecamp |
| public | star_star_id_seq     | sequence | freecodecamp |
+--------+----------------------+----------+--------------+
(8 rows)

universe=> CREATE TABLE uni();
CREATE TABLE
universe=> ALTER TABLE uni ADD COLUMN uni_id SERIAL PRIMARY KEY NOT NULL;
ALTER TABLE
universe=> ALTER TABLE uni ADD COLUMN galaxy_id INT NOT NULL;
ALTER TABLE
universe=> ALTER TABLE uni ADD FOREIGN KEY galaxy_id REFERENCES galaxy(galaxy_id);
ERROR:  syntax error at or near "galaxy_id"
LINE 1: ALTER TABLE uni ADD FOREIGN KEY galaxy_id REFERENCES galaxy(...
                                        ^
universe=> ALTER TABLE uni ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);
ALTER TABLE
universe=> ALTER TABLE uni ADD COLUMN planet_id INT NOT NULL;
ALTER TABLE
universe=> ALTER TABLE uni ADD FOREIGN KEY (planet_id) REFERENCES planet(planet_id);
ALTER TABLE
universe=> ALTER TABLE uni ADD COLUMN star_id INT NOT NULL;
ALTER TABLE
universe=> ALTER TABLE uni ADD FOREIGN KEY (star_id) REFERENCES star(star_id);
ALTER TABLE
universe=> ALTER TABLE uni ADD COLUMN moon_id INT NOT NULL;
ALTER TABLE
universe=> ALTER TABLE uni ADD FOREIGN KEY (moon_id) REFERENCES moon(moon_id);
ALTER TABLE
universe=> SELECT * FROM uni;
+--------+-----------+-----------+---------+---------+
| uni_id | galaxy_id | planet_id | star_id | moon_id |
+--------+-----------+-----------+---------+---------+
+--------+-----------+-----------+---------+---------+
(0 rows)

universe=> ALTER TABLE uni ADD COLUMN satellite VARCHAR(30);
ALTER TABLE
universe=> ALTER TABLE uni DROP COLUMN star_id;
ALTER TABLE
universe=> ALTER TABLE uni DROP COLUMN moon_id;
ALTER TABLE
universe=> SELECT * FROM uni;
+--------+-----------+-----------+-----------+
| uni_id | galaxy_id | planet_id | satellite |
+--------+-----------+-----------+-----------+
+--------+-----------+-----------+-----------+
(0 rows)

universe=> ALTER TABLE uni DROP COLUMN planet_id;
ALTER TABLE
universe=> ALTER TABLE uni ADD COLUMN name VARCHAR(30) UNIQUE;
ALTER TABLE
universe=> SELECT * FROM uni;
+--------+-----------+-----------+------+
| uni_id | galaxy_id | satellite | name |
+--------+-----------+-----------+------+
+--------+-----------+-----------+------+
(0 rows)

universe=> ALTER TABLE uni ADD COLUMN nation VARCHAR(30);
ALTER TABLE
universe=> SELECT * FROM uni;
+--------+-----------+-----------+------+--------+
| uni_id | galaxy_id | satellite | name | nation |
+--------+-----------+-----------+------+--------+
+--------+-----------+-----------+------+--------+
(0 rows)
universe=> ALTER TABLE planet ALTER COLUMN planet_types SET NOT NULL;
ALTER TABLE
