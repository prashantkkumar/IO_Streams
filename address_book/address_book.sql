mysql> create database address_book
    -> ;
Query OK, 1 row affected (0.12 sec)

mysql> use address_book;
Database changed

mysql>
mysql> CREATE TABLE address_book (
    -> firstName varchar(255),
    -> lastName varchar(255),
    -> address varchar(255),
    -> city varchar(255),
    -> state varchar(255),
    -> zip int,
    -> phoneNumber int(10),
    -> email varchar(255)
    -> );
Query OK, 0 rows affected, 1 warning (0.16 sec)

mysql> INSERT INTO address_book (firstName, lastName, address, city, state, zip, phoneNumber, email)
    -> VALUES
    -> ('Prashant', 'Kumar', 'Ganga Nagar', 'Meerut', 'Uttar Pradesh', 251425, 12345678, 'prashant@gmail.com'),
    -> ('Rahul', 'Patel', 'Sector26', 'Panchkula', 'Haryana', 134119, 89546711, 'rahul@yahoo.com'),
    -> ('Bhuvan', 'Nanda', 'Trikuta Nagar', 'Jammu', 'J&K', 180020, 9087654, 'bhuvan11@gmail.com');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book;
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+
| firstName | lastName | address       | city      | state         | zip    | phoneNumber | email              |
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+
| Prashant      | Kumar | Ganga Nagar   | Meerut    | Uttar Pradesh | 251425 |    12345678 | Prashant@gmai.com      |
| Rahul     | Patel    | Sector26      | Panchkula | Haryana       | 134119 |    89546711 | rahul@yahoo.com    |
| Bhuvan    | Nanda    | Trikuta Nagar | Jammu     | J&K           | 180020 |     9087654 | bhuvan11@gmail.com |
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+
3 rows in set (0.02 sec)

mysql> Terminal close -- exit!

mysql> use address_book
Database changed
mysql> UPDATE address_book SET zip='100211' WHERE firstName='Prashant';
Query OK, 1 row affected (0.12 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM address_book WHERE firstName='Rahul';
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM address_book WHERE city='Jammu';
+-----------+----------+---------------+-------+-------+--------+-------------+--------------------+
| firstName | lastName | address       | city  | state | zip    | phoneNumber | email              |
+-----------+----------+---------------+-------+-------+--------+-------------+--------------------+
| Bhuvan    | Nanda    | Trikuta Nagar | Jammu | J&K   | 180020 |     9087654 | bhuvan11@gmail.com |
+-----------+----------+---------------+-------+-------+--------+-------------+--------------------+
1 row in set (0.01 sec)

mysql> SELECT COUNT(city) FROM address_book GROUP BY city;
+-------------+
| COUNT(city) |
+-------------+
|           1 |
|           1 |
+-------------+
2 rows in set (0.01 sec)

mysql>  INSERT INTO address_book (firstName, lastName, address, city, state, zip, phoneNumber, email)
    ->     -> VALUES
    -> ('Rahul', 'Patel', 'Sector26', 'Meerut', 'Uttar Pradesh', 134119, 89546711, 'rahul@yahoo.com');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> VALUES
('Rahul', 'Patel', 'Sector26', 'Meerut', 'Uttar Pradesh', 134119, 8954' at line 2
mysql>  INSERT INTO address_book (firstName, lastName, address, city, state, zip, phoneNumber, email)
    -> VALUES
    -> ('Rahul', 'Patel', 'Sector26', 'Meerut', 'Uttar Pradesh', 134119, 89546711, 'rahul@yahoo.com');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM address_book WHERE city='Meerut' ORDER BY first_name DESC;
ERROR 1054 (42S22): Unknown column 'first_name' in 'order clause'
mysql> SELECT * FROM address_book WHERE city='Meerut' ORDER BY firstName DESC;
+-----------+----------+-------------+--------+---------------+--------+-------------+-----------------+
| firstName | lastName | address     | city   | state         | zip    | phoneNumber | email           |
+-----------+----------+-------------+--------+---------------+--------+-------------+-----------------+
| Rahul     | Patel    | Sector26    | Meerut | Uttar Pradesh | 134119 |    89546711 | rahul@yahoo.com |
| Prashant      | Kumar | Ganga Nagar | Meerut | Uttar Pradesh | 100211 |    12345678 | Prashant@gmai.com   |
+-----------+----------+-------------+--------+---------------+--------+-------------+-----------------+
2 rows in set (0.01 sec)

mysql> ALTER TABLE address_book ADD COLUMN type VARCHAR(20);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE address_book SET type='friend' WHERE state='Uttar Pradesh';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT type, COUNT(type) FROM address_book GROUP BY type;
+--------+-------------+
| type   | COUNT(type) |
+--------+-------------+
| friend |           2 |
| NULL   |           0 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> INSERT INTO address_type VALUES
    ->     (1, 'Anmol', 'Family'),
    ->     (2, 'Anmol', 'Friend'),
    -> ^C
mysql> INSERT INTO address_type VALUES
    -> ('Anshuman', 'Sharma', 'Sector26', 'Pathankot', 'Punjab', 134119, 89546719, 'ansh@yahoo.com', family),
    -> ('Anshuman', 'Sharma', 'Sector26', 'Pathankot', 'Punjab', 134119, 89546719, 'ansh@yahoo.com', friend);
ERROR 1146 (42S02): Table 'address_book.address_type' doesn't exist
mysql> select * from address_book;
+-----------+----------+---------------+--------+---------------+--------+-------------+--------------------+--------+
| firstName | lastName | address       | city   | state         | zip    | phoneNumber | email              | type   |
+-----------+----------+---------------+--------+---------------+--------+-------------+--------------------+--------+
| Prashant      | Kumar | Ganga Nagar   | Meerut | Uttar Pradesh | 100211 |    12345678 | Prashant@gmai.com      | friend |
| Bhuvan    | Nanda    | Trikuta Nagar | Jammu  | J&K           | 180020 |     9087654 | bhuvan11@gmail.com | NULL   |
| Rahul     | Patel    | Sector26      | Meerut | Uttar Pradesh | 134119 |    89546711 | rahul@yahoo.com    | friend |
+-----------+----------+---------------+--------+---------------+--------+-------------+--------------------+--------+
3 rows in set (0.01 sec)

mysql> INSERT INTO address_type VALUES
    -> ('Anshuman', 'Sharma', 'Sector26', 'Pathankot', 'Punjab', 134119, 89546719, 'ansh@yahoo.com', 'family'),
    -> ('Anshuman', 'Sharma', 'Sector26', 'Pathankot', 'Punjab', 134119, 89546719, 'ansh@yahoo.com', 'friend');
ERROR 1146 (42S02): Table 'address_book.address_type' doesn't exist
mysql> CREATE TABLE address_type(
    ->      id int NOT NULL UNIQUE AUTO_INCREMENT,
    ->      first_name VARCHAR(10),
    ->      contact_type VARCHAR(20),
    ->      primary key (id),
    ->      foreign key (first_name) REFERENCES address_book(first_name)
    ->  );
ERROR 3734 (HY000): Failed to add the foreign key constraint. Missing column 'first_name' for constraint 'address_type_ibfk_1' in the referenced table 'address_book'
mysql> CREATE TABLE address_type(
    ->      id int NOT NULL UNIQUE AUTO_INCREMENT,
    ->      firstName VARCHAR(10),
    ->      contact_type VARCHAR(20),
    ->      primary key (id),
    ->      foreign key (firstName) REFERENCES address_book(firstName)
    -> );
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'address_type_ibfk_1' in the referenced table 'address_book'
mysql> ALTER TABLE address_book
    -> ADD UNIQUE (firstName);
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE address_type(
    ->      id int NOT NULL UNIQUE AUTO_INCREMENT,
    ->      firstName VARCHAR(10),
    ->      contact_type VARCHAR(20),
    ->      primary key (id),
    ->      foreign key (firstName) REFERENCES address_book(firstName)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> INSERT INTO address_type VALUES
    -> (1, 'Prashant', 'Family'),
    -> (2, 'Rahul', 'Friend'),
    -> (3, 'Prashant', 'Friend');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book ab LEFT JOIN address_type at ON ab.first_name = at.first_name;
ERROR 1054 (42S22): Unknown column 'ab.first_name' in 'on clause'
mysql> SELECT * FROM address_book ab LEFT JOIN address_type at ON ab.firstName = at.firstName;
+-----------+----------+---------------+--------+---------------+--------+-------------+--------------------+--------+------+-----------+--------------+
| firstName | lastName | address       | city   | state         | zip    | phoneNumber | email              | type   | id   | firstName | contact_type |
+-----------+----------+---------------+--------+---------------+--------+-------------+--------------------+--------+------+-----------+--------------+
| Prashant      | Kumar | Ganga Nagar   | Meerut | Uttar Pradesh | 100211 |    12345678 | Prashant@gmai.com      | friend |    1 | Prashant      | Family       |
| Prashant      | Kumar | Ganga Nagar   | Meerut | Uttar Pradesh | 100211 |    12345678 | Prashant@gmai.com      | friend |    3 | Prashant      | Friend       |
| Bhuvan    | Nanda    | Trikuta Nagar | Jammu  | J&K           | 180020 |     9087654 | bhuvan11@gmail.com | NULL   | NULL | NULL      | NULL         |
| Rahul     | Patel    | Sector26      | Meerut | Uttar Pradesh | 134119 |    89546711 | rahul@yahoo.com    | friend |    2 | Rahul     | Friend       |
+-----------+----------+---------------+--------+---------------+--------+-------------+--------------------+--------+------+-----------+--------------+
4 rows in set (0.01 sec)

mysql> Terminal close -- exit!