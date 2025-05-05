# visual-disk-database
A `mySQL` database that describes my DVD and BluRay collection.

## Setting up the Database

[Homebrew](https://brew.sh/) is used to manage MySQL on macOS.

Install MySQL:
```shell
brew install mysql
```

Set a root password (as well as other security steps):
```shell
mysql_secure_installation
```

To connect with a password prompt:
```shell
mysql -u root -p
```

Create the schema:
```shell
mysql -uroot -p < VisualDiscsDatabase.sql
```

Connect to the database and view the tables:
```shell
mysql -uroot -p disks
SHOW tables;
```

Backing up the database to a file:
```shell
mysqldump -u root -p disks > disks-dump.sql
```

## Sample Queries
Connect to the database (as above).

Summary of the entire collection (title, year, rating, format):
```shell
mysql> SELECT disks.title AS Title, disks.year AS Year, classifications.name AS Rating, formats.name AS Format
    -> FROM disks
    -> INNER JOIN disk_classifications ON disks.id = disk_classifications.disk_id
    -> INNER JOIN classifications ON disk_classifications.classification_id = classifications.id
    -> INNER JOIN disk_formats ON disks.id = disk_formats.disk_id INNER JOIN formats ON disk_formats.format_id = formats.id
    -> ORDER BY disks.sort_title;
 ```
Show only UHD disks:
```shell
mysql> SELECT disks.title AS Title, disks.year AS Year, formats.name AS Format
    -> FROM disks
    -> INNER JOIN disk_formats ON disks.id = disk_formats.disk_id
    -> INNER JOIN formats ON disk_formats.format_id = formats.id
    -> WHERE disk_formats.format_id = 3
    -> ORDER BY disks.sort_title;
```

## Appendix - Reset the Root Password
**TODO** these commands seem to be out-of-date, fix me!

```shell
brew services stop mysql
sudo mysqld_safe --skip-grant-tables &
mysql> UPDATE mysql.user SET authentication_string=null WHERE User='root';
mysql> FLUSH PRIVILEGES;
```

Quit and resume.

```shell
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'NEW_PASSWORD';
```


## Appendix - James Bond Films
The James Bond files are ordered chronologically. Use these commands if an alphabetical ordering is preferred.

```shell
CALL disks.create_disk('James Bond - Dr. No', 'James Bond - Dr. No', 'Terence Young', 1962, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - From Russia With Love', 'James Bond - From Russia With Love', 'Terence Young', 1963, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Goldfinger', 'James Bond - Goldfinger', 'Guy Hamilton', 1964, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Thunderball', 'James Bond - Thunderball', 'Terence Young', 1965, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - You Only Live Twice', 'James Bond - You Only Live Twice', 'Lewis Gilbert', 1967, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - On Her Majesty''s Secret Service', 'James Bond - On Her Majesty''s Secret Service', 'Peter R. Hunt', 1969, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Diamonds Are Forever', 'James Bond - Diamonds Are Forever', 'Guy Hamilton', 1971, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Live and Let Die', 'James Bond - Live and Let Die', 'Guy Hamilton', 1973, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - The Man with the Golden Gun', 'James Bond - Man with the Golden Gun', 'Guy Hamilton', 1974, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - The Spy Who Loved Me', 'James Bond - Spy Who Loved Me', 'Lewis Gilbert', 1977, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Moonraker', 'James Bond - Moonraker', 'Lewis Gilbert', 1979, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - For Your Eyes Only', 'James Bond - For Your Eyes Only', 'John Glen', 1981, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Octopussy', 'James Bond - Octopussy', 'John Glen', 1983, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - A View to a Kill', 'James Bond - View to a Kill', 'John Glen', 1985, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - The Living Daylights', 'James Bond - Living Daylights', 'John Glen', 1987, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Licence to Kill', 'James Bond - Licence to Kill', 'John Glen', 1989, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - GoldenEye', 'James Bond - GoldenEye', 'Martin Campbell', 1995, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Tomorrow Never Dies', 'James Bond - Tomorrow Never Dies', 'Roger Spottiswoode', 1997, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - The World is Not Enough', 'James Bond - World is Not Enough', 'Michael Apted', 1999, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Die Another Day', 'James Bond - Die Another Day', 'Lee Tamahori', 2002, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Casino Royale', 'James Bond - Casino Royale', 'Martin Campbell', 2006, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Quantum of Solace', 'James Bond - Quantum of Solace', 'Marc Foster', 2008, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Skyfall', 'James Bond - Skyfall', 'Sam Mendes', 2012, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - Spectre', 'James Bond - Spectre', 'Sam Mendes', 2015, 1, 'Film', '15', 'Blu-Ray');
CALL disks.create_disk('James Bond - No Time To Die', 'James Bond - No Time To Die', 'Cary Joji Fukunaga', 2021, 1, 'Film', '12', 'Blu-Ray');
CALL disks.create_disk('James Bond - Never Say Never Again', 'James Bond - Never Say Never Again', 'Irvin Kershner', 1983, 1, 'Film', '12', 'DVD');

```