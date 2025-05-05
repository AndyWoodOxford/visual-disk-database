# visual-disk-database
A `mySQL` database that describes my DVD and BluRay collection.

This code was developed on MacOs.

## Initialising the Database

In case of root password loss:

```shell
sudo launchctl [un]load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist
mysql> sudo mysqld_safe --skip-grant-tables;
mysql> UPDATE mysql.user SET authentication_string=null WHERE User='root';
mysql> FLUSH PRIVILEGES;
```

## Backing Up
*TODO* document how to create `disks-mysqldump.sql`.


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