-- Recreate Database
DROP DATABASE IF EXISTS disks;
CREATE DATABASE disks;

USE disks;

-- Create user(s)
DELIMITER $$
CREATE PROCEDURE disks.drop_user_if_exists()
BEGIN
  DECLARE row_count BIGINT DEFAULT 0 ;
  SELECT COUNT(*)
  INTO @row_count
    FROM mysql.user
      WHERE User = 'andy' and  Host = 'localhost';
   IF @row_count > 0 THEN
         DROP USER 'andy'@'localhost' ;
  END IF;
END ;$$
DELIMITER ;
CALL disks.drop_user_if_exists() ;
DROP PROCEDURE IF EXISTS disks.drop_users_if_exists ;

CREATE USER 'andy'@'localhost' IDENTIFIED BY 'LazySunday1234!!!';
GRANT ALL PRIVILEGES ON disks.* TO 'andy'@'localhost';

-- Create tables
CREATE table disks
(
  id          SMALLINT unsigned NOT NULL AUTO_INCREMENT,
  title       VARCHAR(255) NOT NULL,
  sort_title  VARCHAR(255) NOT NULL,
  director    VARCHAR(255),
  year        YEAR,
  duration    SMALLINT signed,
  disk_count  TINYINT DEFAULT 1,

  PRIMARY KEY (id)
);

CREATE TABLE categories
(
  id          TINYINT unsigned NOT NULL AUTO_INCREMENT,
  name        VARCHAR(24) NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE disk_categories
(
  disk_id SMALLINT unsigned NOT NULL,
  category_id TINYINT unsigned NOT NULL
);

CREATE TABLE formats
(
  id          TINYINT unsigned NOT NULL AUTO_INCREMENT,
  name        VARCHAR(32) NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE disk_formats
(
  disk_id SMALLINT unsigned NOT NULL,
  format_id TINYINT unsigned NOT NULL
);

CREATE TABLE classifications
(
  id          TINYINT unsigned NOT NULL AUTO_INCREMENT,
  name        VARCHAR(8) NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE disk_classifications
(
  disk_id SMALLINT unsigned NOT NULL,
  classification_id TINYINT unsigned NOT NULL
);

CREATE TABLE notes
(
  disk_id SMALLINT unsigned NOT NULL,
  note VARCHAR(255)
);

-- Populate 'enumeration' tables
INSERT INTO categories (name) VALUES
  ('Film'),
  ('TV Series'),
  ('TV Adaptation'),
  ('Music'),
  ('Bonus Material');

INSERT INTO formats (name) VALUES
  ('DVD'),
  ('Blu-Ray'),
  ('4K Ultra HD');

INSERT INTO classifications (name) VALUES
  ('E'),
  ('U'),
  ('Uc'),
  ('12'),
  ('12A'),
  ('PG'),
  ('PG-13'),
  ('15'),
  ('18'),
  ('R18'),
  ('TODO');

-- Main "create disk" procedure
DELIMITER $$
CREATE PROCEDURE disks.create_disk(
  IN
    title VARCHAR(255),
    sort_title VARCHAR(255),
    director VARCHAR(255),
    year YEAR,
    duration SMALLINT signed,
    disk_count TINYINT,
    category VARCHAR(20),
    classification VARCHAR(8),
    format VARCHAR(32)
)
BEGIN
  DECLARE category_id TINYINT;
  DECLARE classification_id TINYINT;
  DECLARE format_id TINYINT;

  INSERT INTO disks (title, sort_title, director, year, duration, disk_count)
  VALUES (
    title, sort_title, director, year, duration, disk_count
  );

  SELECT id INTO @category_id FROM categories WHERE name = category;
  INSERT INTO disk_categories(disk_id, category_id)
  VALUES (
    LAST_INSERT_ID(), @category_id
  );

  SELECT id INTO @classification_id FROM classifications WHERE name = classification;
  INSERT INTO disk_classifications(disk_id, classification_id)
  VALUES (
    LAST_INSERT_ID(), @classification_id
  );

  SELECT id INTO @format_id FROM formats WHERE name = format;
  INSERT INTO disk_formats(disk_id, format_id)
  VALUES (
    LAST_INSERT_ID(), @format_id
  );
END $$
DELIMITER ;

-- "Add a note on a disk" function
DELIMITER $$
CREATE PROCEDURE disks.add_note(
  IN
    disk_title VARCHAR(255),
    note VARCHAR(255)
)
BEGIN
  DECLARE disk_id SMALLINT;
  SELECT id INTO @disk_id FROM disks WHERE title = disk_title;
  INSERT INTO notes(disk_id, note)
  VALUES (
    @disk_id, note
  );
END $$
DELIMITER ;

-- Create the disk collection!
-- (TITLE, SORT TITLE, DIRECTOR, YEAR, DISK COUNT, Category, Rating, Format)
CALL disks.create_disk('Airplane!', 'Airplane', 'Jim Abrahams, David Zucker, Jerry Zucker', 1980, 84, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Airplane II: The Sequel', 'Airplane II: The Sequel', 'Ken Finkleman', 1982, 81, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('American Beauty', 'American Beauty', 'Sam Mendes', 2000, 117, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('American Psycho', 'American Psycho', 'Mary Harron', 2000, 98, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('Austin Powers: International Man of Mystery', 'Austin Powers - 1. International Man of Mystery', 'Jay Roach', 1997, 91, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Austin Powers: The Spy Who Shagged Me', 'Austin Powers - 2. The Spy Who Shagged Me', 'Jay Roach', 1999, 91, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('Austin Powers in Goldmember', 'Austin Powers - 3. Goldmember', 'Jay Roach', 2002, 90, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('Back to the Future', 'Back to the Future I', 'Robert Zemeckis', 1985, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Back to the Future II', 'Back to the Future II', 'Robert Zemeckis', 1989, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Back to the Future III', 'Back to the Future III', 'Robert Zemeckis', 1990, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Beavis and Butt-Head Do America', 'Beavis and Butt-Head Do America', 'Mike Judge', 1996, 78, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('The Complete Blackadder - All Four Series', 'Blackadder Boxed Set (Series 1-4)', 'Martin Shardlow, Mandie Fletcher, Richard Boden', 2001, 720, 4, 'TV Series', '15', 'DVD');
CALL disks.create_disk('The Bourne Identity', 'Bourne Identity', 'Doug Liman', 2002, 114, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('The Bourne Supremacy', 'Bourne Supremacy', 'Paul Greengrass', 2004, 104, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('The Bourne Ultimatum', 'Bourne Ultimatum', 'Paul Greengrass', 2007, 115, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('Bridget Jones’s Diary', 'Bridget Jones’s Diary', 'Sharon Maguire', 2001, 93, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('A Bug’s Life', 'Bug’s Life', 'John Lasseter', 1998, 91, 1, 'Film', 'U', 'DVD');
CALL disks.create_disk('Chocolat', 'Chocolat', 'Lasse Hallström', 2000, 117, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('A Clockwork Orange', 'Clockwork Orange', 'Stanley Kubrick', 1971, 131, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('Terry Pratchett''s Colour of Magic', 'Colour of Magic', 'Vadim Jean', 2008, 189, 1, 'TV Adaptation', 'PG', 'DVD');
CALL disks.create_disk('Crouching Tiger, Hidden Dragon', 'Crouching Tiger, Hidden Dragon', 'Ang Lee', 2000, 115, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('The Da Vinci Code', 'Da Vinci Code', 'Ron Howard', 2006, 142, 2, 'Film', '12', 'DVD');
CALL disks.create_disk('The Day After Tomorrow', 'Day After Tomorrow', 'Roland Emmerich', 2004, 118, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('The Day of the Jackal', 'Day of the Jackal', 'Fred Zinnemann', 1973, 143, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Die Hard - Die Hard', 'Die Hard 1', 'John McTieran', 1988, 127, 1, 'Film', '18', 'Blu-Ray');
CALL disks.create_disk('Die Hard - Die Hard 2', 'Die Hard 2', 'Renny Harlin', 1990, 118, 1, 'Film', '18', 'Blu-Ray');
CALL disks.create_disk('Die Hard - Die Hard with a Vengeance', 'Die Hard 3', 'John McTieran', 1995, 123, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Die Hard - Die Hard 4.0', 'Die Hard 4', 'Len Wiseman', 2007, 123, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Die Hard - A Good Day to Die Hard', 'Die Hard 5', 'John Moore', 2013, 93, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Die Hard - Decoding Die Hard (bonus disk)', 'Die Hard Bonus', 'N/A', 2013, 98, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Dune', 'Dune', 'David Lynch', 1984, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Evita', 'Evita', 'Alan Parker', 1996, 129, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Family Guy - Season Six (Disk Two)', 'Family Guy - Season Six (Disk Two)', 'n/a', 2007, 0, 1, 'TV Series', '15', 'DVD');
CALL disks.create_disk('Family Guy - Season Six (Special Features)', 'Family Guy - Season Six (Special Features)', 'n/a', 2007, 0, 1, 'Bonus Material', '15', 'DVD');
CALL disks.create_disk('Family Guy - Blue Harvest', 'Family Guy - Blue Harvest', 'Dominic Polcino, Peter Shin', 2007, 45, 2, 'Film', '15', 'DVD');
CALL disks.create_disk('Family Guy - It''s a Trap', 'Family Guy - It''s a Trap', 'Dominic Polcino, Peter Shin', 2010, 54, 2, 'Film', '15', 'DVD');
CALL disks.create_disk('Family Guy - Something Something Something Dark Side', 'Family Guy - Something Something Something Dark Side', 'Dominic Polcino, Peter Shin', 2009, 52, 2, 'Film', '15', 'DVD');
CALL disks.create_disk('Father Ted - The Complete Box Set', 'Father Ted - The Complete Box Set', 'Declan Lowney, Graham Linehan', 1999, 632, 5, 'TV Series', '15', 'DVD');
CALL disks.create_disk('Fight Club', 'Fight Club', 'David Fincher', 1999, 133, 2, 'Film', '18', 'DVD');
CALL disks.create_disk('Finding Nino', 'Finding Nino', 'Andrew Stanton', 2003, 96, 2, 'Film', 'U', 'DVD');
CALL disks.create_disk('A Fish Called Wanda', 'Fish Called Wanda', 'Charles Crichton', 1988, 108, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Four Weddings and a Funeral', 'Four Weddings and a Funeral', 'Mike Newell', 1994, 113, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Gladiator', 'Gladiator', 'Ridley Scott', 2000, 149, 2, 'Film', '15', 'DVD');
CALL disks.create_disk('Terry Pratchett''s Going Postal', 'Going Postal', 'Jon Jones', 2010, 182, 1, 'TV Adaptation', '12', 'DVD');
CALL disks.create_disk('Goodfellas', 'Goodfellas', 'Martin Scorsese', 1990, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('The Hangover', 'Hangover', 'Todd Phillips', 2009, 108, 1, 'Film', '18', 'Blu-Ray');
CALL disks.create_disk('The Hangover - Part II', 'Hangover 2', 'Todd Phillips', 2011, 102, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('The Hangover - Part III', 'Hangover 3', 'Todd Phillips', 2013, 100, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Hannibal', 'Hannibal', 'Ridley Scott', 2001, 131, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('Harry Potter and the Philosopher''s Stone', 'Harry Potter 1', 'Chris Columbus', 2001, 0, 2, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Harry Potter and the Chamber of Secrets', 'Harry Potter 2', 'Chris Columbus', 2002, 0, 2, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Harry Potter and the Prisoner of Azkaban',  'Harry Potter 3','Alfonso Cuarón', 2004, 136, 2, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Harry Potter and the Goblet of Fire',  'Harry Potter 4', 'Mike Newell', 2005, 151, 2, 'Film', '12', 'DVD');
CALL disks.create_disk('Harry Potter and the Order of the Phoenix',  'Harry Potter 5','David Yates', 2007, 132, 1, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('Highlander', 'Highlander', 'Russell Mulcahy', 1986, 111, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('The Hobbit: An Unexpected Journey', 'Hobbit 1', 'Peter Jackson', 2012, 169, 2, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('The Hobbit: The Desolation Of Smaug', 'Hobbit 2', 'Peter Jackson', 2013, 161, 2, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('The Hobbit: The Battle Of The Five Armies', 'Hobbit 3', 'Peter Jackson', 2014, 144, 2, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('Terry Pratchett''s Hogfather', 'Hogfather', 'Vadim Jean', 2006, 185, 1, 'TV Adaptation', 'PG', 'DVD');
CALL disks.create_disk('Inception', 'Inception', 'Christopher Nolan', 2010, 142, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('The Incredibles', 'Incredibles', 'Brad Bird', 2004, 0, 2, 'Film', 'U', 'DVD');
CALL disks.create_disk('Independence Day', 'Independence Day', 'Roland Emmerich', 1996, 0, 1, 'Film', '12', '4K Ultra HD');
CALL disks.create_disk('Indiana Jones - Raiders of the Lost Ark', 'Indiana Jones 1', 'Steven Spielberg', 1981, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Indiana Jones and the Temple of Doom', 'Indiana Jones 2','Steven Spielberg', 1984, 0, 1, 'Film', 'PG-13', 'DVD');
CALL disks.create_disk('Indiana Jones and the Last Crusade', 'Indiana Jones 3', 'Steven Spielberg', 1989, 0, 1, 'Film', 'PG-13', 'DVD');
CALL disks.create_disk('Indiana Jones and the Kingdom of the Crystal Skull', 'Indiana Jones 4', 'Steven Spielberg', 2008, 0, 2, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('Inglorious Basterds', 'Inglorious Basterds', 'Quentin Tarantino', 2009, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('James Bond - Dr. No', 'James Bond 01', 'Terence Young', 1962, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - From Russia With Love', 'James Bond 02', 'Terence Young', 1963, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Goldfinger', 'James Bond 03', 'Guy Hamilton', 1964, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Thunderball', 'James Bond 04', 'Terence Young', 1965, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - You Only Live Twice', 'James Bond 05', 'Lewis Gilbert', 1967, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - On Her Majesty''s Secret Service', 'James Bond 06', 'Peter R. Hunt', 1969, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Diamonds Are Forever', 'James Bond 07', 'Guy Hamilton', 1971, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Live and Let Die', 'James Bond 08', 'Guy Hamilton', 1973, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - The Man with the Golden Gun', 'James Bond 09', 'Guy Hamilton', 1974, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - The Spy Who Loved Me', 'James Bond 10', 'Lewis Gilbert', 1977, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Moonraker', 'James Bond 11', 'Lewis Gilbert', 1979, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - For Your Eyes Only', 'James Bond 12', 'John Glen', 1981, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Octopussy', 'James Bond 13', 'John Glen', 1983, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Never Say Never Again', 'James Bond 14', 'Irvin Kershner', 1983, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('James Bond - A View to a Kill', 'James Bond 15', 'John Glen', 1985, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - The Living Daylights', 'James Bond 16', 'John Glen', 1987, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Licence to Kill', 'James Bond 17', 'John Glen', 1989, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - GoldenEye', 'James Bond 18', 'Martin Campbell', 1995, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Tomorrow Never Dies', 'James Bond 19', 'Roger Spottiswoode', 1997, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - The World is Not Enough', 'James Bond 20', 'Michael Apted', 1999, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Die Another Day', 'James Bond 21', 'Lee Tamahori', 2002, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Casino Royale', 'James Bond 22', 'Martin Campbell', 2006, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Quantum of Solace', 'James Bond 23', 'Marc Foster', 2008, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Skyfall', 'James Bond 24', 'Sam Mendes', 2012, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Spectre', 'James Bond 25', 'Sam Mendes', 2015, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - No Time To Die', 'James Bond 26', 'Cary Joji Fukunaga', 2021, 0, 1, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('James Bond - No Time To Die', 'James Bond 26', 'Cary Joji Fukunaga', 2021, 0, 1, 'Film', '12', '4K Ultra HD');
CALL disks.create_disk('Jurassic Park', 'Jurassic Park 1', 'Steven Spielberg', 1993, 0, 1, 'Film', 'PG', 'Blu-Ray');
CALL disks.create_disk('The Lost World: Jurassic Park', 'Jurassic Park 2', 'Steven Spielberg', 1997, 0, 1, 'Film', 'PG', 'Blu-Ray');
CALL disks.create_disk('Jurassic Park III', 'Jurassic Park 3', 'Joe Johnston', 2003, 0, 1, 'Film', 'PG', 'Blu-Ray');
CALL disks.create_disk('Jurassic World', 'Jurassic Park 4', 'Colin Trevorrow', 2015, 0, 1, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('Jurassic World: Fallen Kingdom', 'Jurassic Park 5', 'J. A. Bayona', 2018, 0, 2, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('Jurassic World: Fallen Kingdom', 'Jurassic Park 5', 'J. A. Bayona', 2018, 0, 2, 'Film', '12', '4K Ultra HD');
CALL disks.create_disk('Kill Bill: Volume 1', 'Kill Bill: Volume 1', 'Quentin Tarantino', 2003, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('Kill Bill: Volume 2 ', 'Kill Bill: Volume 2', 'Quentin Tarantino', 2004, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('King Kong', 'King Kong', 'Peter Jackson', 2005, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('L.A. Confidential', 'L.A. Confidential', 'Curtis Hanson', 1997, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('Monty Python''s Life of Brian', 'Life of Brian', 'Terry Jones', 1979, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Lock, Stock and Two Smoking Barrels', 'Lock, Stock and Two Smoking Barrels', 'Guy Ritchie', 1998, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('The Lord of the Rings - The Fellowship of the Ring', 'Lord of the Rings 1', 'Peter Jackson', 2001, 0, 5, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('The Lord of the Rings - The Two Towers', 'Lord of the Rings 2', 'Peter Jackson', 2002, 0, 5, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('The Lord of the Rings - The Return of the King', 'Lord of the Rings 3', 'Peter Jackson', 2003, 0, 5, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('The Man Who Would Be King', 'Man Who Would Be King', 'John Huston', 1975, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('The Martian', 'Martian', 'Ridley Scott', 2015, 0, 1, 'Film', '12', '4K Ultra HD');
CALL disks.create_disk('The Matrix', 'Matrix 1', 'Lana Wachowski, Lilly Wachowski', 1999, 0, 2, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('The Matrix', 'Matrix 1', 'Lana Wachowski, Lilly Wachowski', 1999, 0, 1, 'Film', '15', '4K Ultra HD');
CALL disks.create_disk('The Matrix Reloaded', 'Matrix 2', 'Lana Wachowski, Lilly Wachowski', 2003, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('The Matrix Revolutions', 'Matrix 3', 'Lana Wachowski, Lilly Wachowski', 2003, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Minority Report', 'Minority Report', 'Steven Spielberg', 2002, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('Mission: Impossible', 'Mission: Impossible 1', 'Brian De Palma', 1996, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Mission: Impossible 2', 'Mission: Impossible 2', 'John Woo', 2000, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Mission: Impossible III', 'Mission: Impossible 3', 'J. J. Abrams', 2006, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Mission: Impossible - Ghost Protocol', 'Mission: Impossible 4', 'Brad Bird', 2011, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Mission: Impossible - Rogue Nation', 'Mission: Impossible 5', 'Christopher McQuarrie', 2015, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Monsters, Inc.', 'Monsters, Inc.', 'Pete Docter', 2001, 0, 1, 'Film', 'U', 'DVD');
CALL disks.create_disk('Monty Python and the Holy Grail', 'Monty Python and the Holy Grail', 'Terry Gilliam, Terry Jones', 1975, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('The Mummy', 'Mummy', 'Stephen Sommers', 1999, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('The Mummy Returns', 'Mummy Returns', 'Stephen Sommers', 2001, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('My Name is Earl - Season One', 'My Name is Earl - Season One', 'Mark Buckland', 2006, 0, 4, 'TV Series', '12', 'DVD');
CALL disks.create_disk('Naked Gun - From the Files of Police Squad!', 'Naked Gun 1', 'David Zucker', 1988, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Naked Gun - The Smell of Fear', 'Naked Gun 2', 'David Zucker', 1991, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Naked Gun - The Final Insult', 'Naked Gun 3', 'Peter Segal', 1994, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('La Femme Nikita', 'Nikita', 'Luc Besson', 1990, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('Ocean’s Eleven', 'Ocean’s Eleven', 'Steven Soderbergh', 2001, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('The Passion of the Christ', 'Passion of the Christ', 'Mel Gibson', 2004, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('Performance', 'Performance', 'Donald Cammell, Nicolas Roeg', 1970, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('Pink Panther - The Pink Panther', 'Pink Panther 1', 'Blake Edwards', 1963, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Pink Panther - A Shot in the Dark', 'Pink Panther 2', 'Blake Edwards', 1964, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Pink Panther - The Return of the Pink Panther', 'Pink Panther 3', 'Blake Edwards', 1975, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Pink Panther - The Pink Panther Strikes Again', 'Pink Panther 4', 'Blake Edwards', 1976, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Pink Panther - Revenge of the Pink Panther', 'Pink Panther 5', 'Blake Edwards', 1978, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Pink Panther - Trail of the Pink Panther', 'Pink Panther 6', 'Blake Edwards', 1982, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Pink Panther - Pink Panther Cartoon Collection', 'Pink Panther 7', 'N/A', 2003, 0, 1, 'Film', 'U', 'DVD');
CALL disks.create_disk('Pirates of the Caribbean - The Curse of the Black Pearl', 'Pirates of the Caribbean 1', 'Gore Verbinski', 2003, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('Pirates of the Caribbean - Dead Man''s Chest', 'Pirates of the Caribbean 2', 'Gore Verbinski', 2006, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('Pirates of the Caribbean - At World''s End', 'Pirates of the Caribbean 3', 'Gore Verbinski', 2007, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('Pixar Short Films Collection Volume 1', 'Pixar Short Films Collection Volume 1', 'N/A', 2007, 0, 1, 'Bonus Material', 'U', 'Blu-Ray');
CALL disks.create_disk('Planet Earth II', 'Planet Earth II', 'N/A', 2016, 0, 2, 'TV Series', 'PG', 'Blu-Ray');
CALL disks.create_disk('Planet Earth II', 'Planet Earth II', 'N/A', 2016, 0, 2, 'TV Series', 'PG', '4K Ultra HD');
CALL disks.create_disk('Prometheus', 'Prometheus', 'Ridley Scott', 2012, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Pulp Fiction', 'Pulp Fiction', 'Quentin Tarantino', 1994, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('Ratatouille', 'Ratatouille', 'Brad Bird', 2007, 0, 1, 'Film', 'PG', 'Blu-Ray');
CALL disks.create_disk('Red Dragon', 'Red Dragon', 'Brett Ratner', 2002, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Reservoir Dogs', 'Reservoir Dogs', 'Quentin Tarantino', 1992, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('The Revenant', 'Revenant', 'Alejandro González Iñárritu', 2015, 0, 1, 'Film', '15', '4K Ultra HD');
CALL disks.create_disk('The Rocky Horror Picture Show', 'Rocky Horror Picture Show', 'Jim Sharman', 1975, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('The Best of Rod Stewart and the Faces', 'The Best of Rod Stewart and the Faces', 'N/A', 2003, 0, 1, 'Music', 'E', 'DVD');
CALL disks.create_disk('The Rolling Stones: Havana Moon', 'Rolling Stones - Havana Moon', 'Paul Dugdale', 2016, 0, 1, 'Music', 'TODO', 'Blu-Ray');
CALL disks.create_disk('Ladies and Gentlemen: The Rolling Stones', 'Rolling Stones - Ladies & Gentlemen', 'Rollin Binzer', 1974, 0, 1, 'Music', 'E', 'Blu-Ray');
CALL disks.create_disk('The Rolling Stones Rock and Roll Circus', 'Rolling Stones - Rock and Roll Circus', 'Michael Lindsay-Hogg', 1996, 0, 1, 'Music', 'E', 'DVD');
CALL disks.create_disk('The Rolling Stones - Shine a Light', 'Rolling Stones - Shine a Light', 'Martin Scorsese', 2008, 0, 1, 'Music', '15', 'Blu-Ray');
CALL disks.create_disk('Secretary', 'Secretary', 'Steven Shainberg', 2002, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('Se7en', 'Se7en', 'David Fincher', 1995, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('The Silence of the Lambs', 'Silence of the Lambs', 'Jonathan Demme', 1991, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('The Simpsons - The Complete Third Season', 'Simpsons - Season 3', 'Various', 2003, 0, 4, 'TV Series', 'PG', 'DVD');
CALL disks.create_disk('The Simpsons - The Complete Sixth Season', 'Simpsons - Season 6', 'Various', 2005, 0, 4, 'TV Series', '12', 'DVD');
CALL disks.create_disk('The Simpsons - The Complete Eighth Season', 'Simpsons - Season 8', 'Various', 2006, 0, 4, 'TV Series', '12', 'DVD');
CALL disks.create_disk('The Simpsons - The Complete Ninth Season', 'Simpsons - Season 9', 'Various', 2007, 0, 4, 'TV Series', '12', 'DVD');
CALL disks.create_disk('The Simpsons Movie', 'Simpsons Movie', 'David Silverman', 2007, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('The Sixth Sense', 'Sixth Sense', 'M. Night Shyamalan', 1999, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Sliding Doors', 'Sliding Doors', 'Peter Howitt', 1998, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Snatch', 'Snatch', 'Guy Ritchie', 2000, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('There''s Something About Mary', 'Something About Mary', 'Bobby Farrelly, Peter Farrelly', 1998, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('South Park - Complete Series 1', 'South Park - Complete Series 1', 'Trey Parker, Matt Stone', 1999, 0, 3, 'TV Series', '15', 'DVD');
CALL disks.create_disk('South Park - Complete Series 2', 'South Park - Complete Series 2', 'Trey Parker, Matt Stone', 2001, 0, 4, 'TV Series', '15', 'DVD');
CALL disks.create_disk('South Park - Complete Series 3', 'South Park - Complete Series 3', 'Trey Parker, Matt Stone', 2000, 0, 4, 'TV Series', '18', 'DVD');
CALL disks.create_disk('South Park - Complete Series 4', 'South Park - Complete Series 4', 'Trey Parker, Matt Stone', 2001, 0, 4, 'TV Series', '15', 'DVD');
CALL disks.create_disk('Spider-Man', 'Spider-Man 1', 'Sam Raimi', 2002, 0, 1, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('Spider-Man 2', 'Spider-Man 2', 'Sam Raimi', 2004, 0, 1, 'Film', 'PG', 'Blu-Ray');
CALL disks.create_disk('Spider-Man 3', 'Spider-Man 3', 'Sam Raimi', 2007, 0, 2, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('Star Wars - Episode I: The Phantom Menace', 'Star Wars 1', 'George Lucas', 1999, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Star Wars - Episode II: Attack of the Clones', 'Star Wars 2', 'George Lucas', 2002, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Star Wars - Episode III: Revenge of the Sith', 'Star Wars 3', 'George Lucas', 2005, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('Star Wars - Episode IV - A New Hope', 'Star Wars 4', 'George Lucas', 1977, 0, 1, 'Film', 'U', 'DVD');
CALL disks.create_disk('Star Wars - Episode V: The Empire Strikes Back', 'Star Wars 5', 'Irvin Kershner', 1980, 0, 1, 'Film', 'U', 'DVD');
CALL disks.create_disk('Star Wars - Episode VI: Return of the Jedi', 'Star Wars 6', 'Richard Marquand', 1983, 0, 1, 'Film', 'U', 'DVD');
CALL disks.create_disk('Star Wars - Episode VII: The Force Awakens', 'Star Wars 7', 'J. J. Abrams', 2015, 0, 1, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('Star Wars - Episode VIII - The Last Jedi', 'Star Wars 8', 'Rian Johnson', 2018, 0, 2, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('Star Wars - Episode VIII - The Last Jedi', 'Star Wars 8', 'Rian Johnson', 2018, 0, 1, 'Film', '12', '4K Ultra HD');
CALL disks.create_disk('Star Wars - Rogue One: A Star Wars Story', 'Rogue One', 'Gareth Edwards', 2016, 0, 1, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('Starship Troopers', 'Starship Troopers', 'Paul Verhoeven', 1997, 0, 1, 'Film', '18', 'Blu-Ray');
CALL disks.create_disk('The Talented Mr Ripley', 'Talented Mr Ripley', 'Anthony Minghella', 1999, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Taxi Driver', 'Taxi Driver', 'Martin Scorsese', 1976, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('Team America: World Police', 'Team America: World Police', 'Trey Parker', 2005, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Tenet', 'Tenet', 'Christopher Nolan', 2020, 0, 1, 'Film', '12', '4K Ultra HD');
CALL disks.create_disk('Tenet', 'Tenet', 'Christopher Nolan', 2020, 0, 2, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('The Terminator', 'Terminator 1', 'James Cameron', 1984, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Terminator - Terminator 2: Judgement Day', 'Terminator 2', 'James Cameron', 1991, 0, 1, 'Film', '15', 'DVD');
CALL disks.create_disk('Terminator - Terminator 3: Rise Of The Machines', 'Terminator 3', 'Jonathan Mostow', 2003, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('Lara Croft: Tomb Raider', 'Tomb Raider 1', 'Simon West', 2001, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('Lara Croft: Tomb Raider - The Cradle Of Life', 'Tomb Raider 2', 'Jan de Bont', 2003, 0, 1, 'Film', '12', 'DVD');
CALL disks.create_disk('Tommy', 'Tommy', 'Ken Russell', 1975, 0, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('Top Gear - The Complete Specials Box Set', 'Top Gear - The Complete Specials Box Set', 'Chris Donovan, Brian Klein', 2015, 0, 13, 'TV Series', '12', 'DVD');
CALL disks.create_disk('Total Recall', 'Total Recall', 'Paul Verhoeven', 1990, 0, 1, 'Film', '18', 'Blu-Ray');
CALL disks.create_disk('Toy Story', 'Toy Story 1', 'John Lasseter', 1995, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Toy Story 2', 'Toy Story 2', 'John Lasseter', 1999, 0, 1, 'Film', 'U', 'DVD');
CALL disks.create_disk('Toy Story 3', 'Toy Story 3', 'Lee Unkrich', 2010, 0, 1, 'Film', 'U', 'DVD');
CALL disks.create_disk('Trainspotting', 'Trainspotting 1', 'Danny Boyle', 1996, 0, 1, 'Film', '18', 'DVD');
CALL disks.create_disk('T2 Trainspotting', 'Trainspotting 2', 'Danny Boyle', 2017, 0, 1, 'Film', '18', 'Blu-Ray');
CALL disks.create_disk('T2 Trainspotting', 'Trainspotting 2', 'Danny Boyle', 2017, 0, 1, 'Film', '18', '4K Ultra HD');
CALL disks.create_disk('The Usual Suspects', 'Usual Suspects', 'Bryan Singer', 1995, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Wallace & Gromit: Curse Of The Were Rabbit', 'Wallace & Gromit: Curse Of The Were Rabbit', 'Nick Park, Steve Box', 2005, 0, 1, 'Film', 'PG', 'DVD');
CALL disks.create_disk('Wallace & Gromit: The Complete Collection', 'Wallace & Gromit: The Complete Collection', 'Nick Park', 2009, 0, 1, 'TV Series', 'PG', 'DVD');
CALL disks.create_disk('War of the Worlds', 'War of the Worlds', 'Steven Spielberg', 2005, 0, 1, 'Film', '12', '4K Ultra HD');
CALL disks.create_disk('War of the Worlds', 'War of the Worlds', 'Steven Spielberg', 2005, 0, 1, 'Film', '12', 'Blu-Ray');

-- Notes on disks
CALL disks.add_note('James Bond - Never Say Never Again', 'German edition ("Sag Niemals Nie") - with original English language option');
CALL disks.add_note('James Bond - Licence to Kill', 'Disc maybe dodgy, pauses occasionally');
CALL disks.add_note('South Park - Complete Series 3', 'An episode on Volume 11 causes the 18 rating');
CALL disks.add_note('The Day of the Jackal', 'Audio soundtrack is 1.0, i.e. mono through a centre speaker');
