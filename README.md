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

