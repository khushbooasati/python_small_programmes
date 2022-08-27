        mysql> create table user1(id int(10) not null primary key, name varchar(10), grade int(10));
ERROR 1050 (42S01): Table 'user1' already exists
mysql> drop table user1;
Query OK, 0 rows affected (0.05 sec)

mysql> create table user1(id int(10) not null primary key, name varchar(10), grade int(10));
Query OK, 0 rows affected, 2 warnings (0.12 sec)

mysql> create table user2(id int(10) not null primary key, name varchar(10), grade int(10));
Query OK, 0 rows affected, 2 warnings (0.11 sec)

mysql> insert into user1(id,name,grade)values(1,'khushboo',300);
Query OK, 1 row affected (0.02 sec)

mysql> insert into user1(id,name,grade)values(2,'shanvi',200);
Query OK, 1 row affected (0.02 sec)

mysql> insert into user1(id,name,grade)values(3,'siya',100);
Query OK, 1 row affected (0.02 sec)

mysql> update table user1 set grade=100 where id=1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table user1 set grade=100 where id=1' at line 1
mysql> update user1 set grade=100 where id=1;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> insert into user2(id,name,grade)values(1,'khushboo',300);
Query OK, 1 row affected (0.01 sec)

mysql> insert into user2(id,name,grade)values(2,'shanvi',100);
Query OK, 1 row affected (0.02 sec)

mysql> insert into user2(id,name,grade)values(3,'siya',300);
Query OK, 1 row affected (0.02 sec)

mysql> select * from user1;
+----+----------+-------+
| id | name     | grade |
+----+----------+-------+
|  1 | khushboo |   100 |
|  2 | shanvi   |   200 |
|  3 | siya     |   100 |
+----+----------+-------+
3 rows in set (0.00 sec)

mysql> select * from user2;
+----+----------+-------+
| id | name     | grade |
+----+----------+-------+
|  1 | khushboo |   300 |
|  2 | shanvi   |   100 |
|  3 | siya     |   300 |
+----+----------+-------+
3 rows in set (0.00 sec)

mysql> select * from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade>u2.grade;
+----+--------+-------+----+--------+-------+
| id | name   | grade | id | name   | grade |
+----+--------+-------+----+--------+-------+
|  2 | shanvi |   200 |  2 | shanvi |   100 |
+----+--------+-------+----+--------+-------+
1 row in set (0.00 sec)

mysql> select * from user1 u1 inner join user2 u2 on u1.id=u2.id;
+----+----------+-------+----+----------+-------+
| id | name     | grade | id | name     | grade |
+----+----------+-------+----+----------+-------+
|  1 | khushboo |   100 |  1 | khushboo |   300 |
|  2 | shanvi   |   200 |  2 | shanvi   |   100 |
|  3 | siya     |   100 |  3 | siya     |   300 |
+----+----------+-------+----+----------+-------+
3 rows in set (0.00 sec)

mysql> select id,name,grade from user1 u1 inner join user2 u2 on u1.id=u2.id;
ERROR 1052 (23000): Column 'id' in field list is ambiguous
mysql> select u1.id,u1.name,max(grade) from user1 u1 inner join user2 u2 on u1.id=u2.id;
ERROR 1052 (23000): Column 'grade' in field list is ambiguous
mysql> select u1.id,u1.name,max(grade) from user1 u1 inner join user2 u2 on u1.id=u2.id;
ERROR 1052 (23000): Column 'grade' in field list is ambiguous
mysql> SELECT MAX(col)
    ->   FROM (SELECT col FROM TABLE_1
    ->         UNION ALL
    ->         
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> SELECT MAX(col)
    ->   FROM (SELECT col FROM TABLE_1
    ->         UNION ALL
    ->         SELECT col FROM TABLE_2);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> select MAX(grade) from (select grade from user1 join user2);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> select MAX(grade) from (select grade from user1);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> select MAX(grade) from (select grade from user1 union all select grade from user2);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> select MAX(grade) from (select grade from user1 union all select grade from user2);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> select * from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade>u2.grade or u1.grade<u2.grade;
+----+----------+-------+----+----------+-------+
| id | name     | grade | id | name     | grade |
+----+----------+-------+----+----------+-------+
|  1 | khushboo |   100 |  1 | khushboo |   300 |
|  2 | shanvi   |   200 |  2 | shanvi   |   100 |
|  3 | siya     |   100 |  3 | siya     |   300 |
+----+----------+-------+----+----------+-------+
3 rows in set (0.00 sec)

mysql> select * from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade=max(select u1.grade,u2.grade from user1 u1 inner join user2 u2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select u1.grade,u2.grade from user1 u1 inner join user2 u2)' at line 1
mysql> select max(grade) from s1 where grade in (select u1.grade,u2.grade from user1 u1 inner join user2 u2);
ERROR 1146 (42S02): Table 'dev.s1' doesn't exist
mysql> select max(grade) from s1 where grade in (select u1.grade,u2.grade from user1 u1 inner join user2 u2) as s1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as s1' at line 1
mysql> select max(grade) from s1 where grade in (select u1.grade,u2.grade from user1 u1 inner join user2 u2)  s1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 's1' at line 1
mysql> select max(grade) from user1 inner join user2 where grade in (select u1.grade,u2.grade from user1 u1 inner join user2 u2);
ERROR 1052 (23000): Column 'grade' in field list is ambiguous
mysql> select max(u1.grade) from user1 inner join user2 where grade in (select u1.grade,u2.grade from user1 u1 inner join user2 u2);
ERROR 1054 (42S22): Unknown column 'u1.grade' in 'field list'
mysql> select max(u1.grade) from user1 inner join user2 where grade in (select u1.grade,u2.grade from user1 u1 inner join user2 u2);
ERROR 1054 (42S22): Unknown column 'u1.grade' in 'field list'
mysql> select u1.grade,u2.grade from user1 u1 inner join user2 u2
    -> ;
+-------+-------+
| grade | grade |
+-------+-------+
|   100 |   300 |
|   200 |   300 |
|   100 |   300 |
|   100 |   100 |
|   200 |   100 |
|   100 |   100 |
|   100 |   300 |
|   200 |   300 |
|   100 |   300 |
+-------+-------+
9 rows in set (0.00 sec)

mysql> select u1.grade,u2.grade from user1 u1 inner join user2 u2 on u1.id=u2.id;
+-------+-------+
| grade | grade |
+-------+-------+
|   100 |   300 |
|   200 |   100 |
|   100 |   300 |
+-------+-------+
3 rows in set (0.00 sec)

mysql> select grade from user1 and select grade from user2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'and select grade from user2' at line 1
mysql> select grade from user1;
+-------+
| grade |
+-------+
|   100 |
|   200 |
|   100 |
+-------+
3 rows in set (0.01 sec)

mysql> select grade from user2;
+-------+
| grade |
+-------+
|   300 |
|   100 |
|   300 |
+-------+
3 rows in set (0.01 sec)

mysql> create table user_final as select * from user1 inner join user2;
ERROR 1060 (42S21): Duplicate column name 'id'
mysql> select u1.id,u1.name,grade from user1 u1 inner join user2 u2 on u1.id=u2.id where grade in max(select u1.grade,u2.grade from user1 join user2);  ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'max(select u1.grade,u2.grade from user1 join user2)' at line 1
ERROR: 
No query specified

mysql> select u1.id,u1.name,grade from user1 u1 inner join user2 u2 on u1.id=u2.id where grade in max(select u1.grade,u2.grade from user1 join user2);  
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'max(select u1.grade,u2.grade from user1 join user2)' at line 1
mysql> select u1.id,u1.name,grade from user1 u1 inner join user2 u2 on u1.id=u2.id where grade in max(select u1.grade,u2.grade from user1 join user2); 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'max(select u1.grade,u2.grade from user1 join user2)' at line 1
mysql> select max(grade) from user1 
    -> ;
+------------+
| max(grade) |
+------------+
|        200 |
+------------+
1 row in set (0.00 sec)

mysql> create table user_final as select u1.id, u1.name,u1.grade,u2.grade from user1 u1 inner join user2 u2;
ERROR 1060 (42S21): Duplicate column name 'grade'
mysql> create table user_final as select u1.id, u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> select max(rec_id) from 
    -> (
    ->   (select rec_id from tablea)
    ->  union all
    ->   (select rec_id from tableb)
    -> ) ;
ERROR 1248 (42000): Every derived table must have its own alias
mysql> select max(grade) from ((select grade from user1) union all (select grade from user2));
ERROR 1248 (42000): Every derived table must have its own alias
mysql> select max(grade) from ((select grade from user1) as u1 union all (select grade from user2) as u2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'union all (select grade from user2) as u2)' at line 1
mysql> select max(grade) from ((select grade from user1) as u1 union all (select grade from user2) as u2) as u3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'union all (select grade from user2) as u2) as u3' at line 1
mysql> (select grade from user1) as u1 union all (select grade from user2) as u2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as u1 union all (select grade from user2) as u2)' at line 1
mysql> (select grade from user1) union all (select grade from user2);
+-------+
| grade |
+-------+
|   100 |
|   200 |
|   100 |
|   300 |
|   100 |
|   300 |
+-------+
6 rows in set (0.00 sec)

mysql> (select grade from user1) union all (select grade from user2) where user1.id=user2.id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where user1.id=user2.id' at line 1
mysql> select * from ((select grade from user1) union all (select grade from user2) as u2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as u2)' at line 1
mysql> select * from ((select grade from user1) union all (select grade from user2));
ERROR 1248 (42000): Every derived table must have its own alias
mysql> select * from ((select grade from user1) union all (select grade from user2));
ERROR 1248 (42000): Every derived table must have its own alias
mysql> SELECT * 
    -> FROM (SELECT * FROM can
    ->     UNION
    ->     SELECT * FROM employee) as e
    -> WHERE e.id = 1;;
ERROR 1146 (42S02): Table 'dev.can' doesn't exist
ERROR: 
No query specified

mysql> select * from (select grade from user1 union select grade from user2) as e where e.grade>100;
+-------+
| grade |
+-------+
|   200 |
|   300 |
+-------+
2 rows in set (0.00 sec)

mysql> select * from (select grade from user1 as u1 union select grade from user2 as u2) as e where u1.id=u2.id ;
ERROR 1054 (42S22): Unknown column 'u1.id' in 'where clause'
mysql> select * from (select id,grade from user1 as u1 union select id, grade from user2 as u2) as e where u1.id=u2.id ;
ERROR 1054 (42S22): Unknown column 'u1.id' in 'where clause'
mysql> select * from ((select id,grade from user1) as u1 union (select id, grade from user2) as u2) as e where u.id=u2.id ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'union (select id, grade from user2) as u2) as e where u.id=u2.id' at line 1
mysql> SELECT *  FROM (SELECT * FROM can     UNION     SELECT * FROM employee) as e WHERE e.id = 1;
ERROR 1146 (42S02): Table 'dev.can' doesn't exist
mysql> select * from (select grade from user1 union select grade from user2) as e
    -> ;
+-------+
| grade |
+-------+
|   100 |
|   200 |
|   300 |
+-------+
3 rows in set (0.00 sec)

mysql> select * from (select grade from user1 union all select grade from user2) as e
    -> ;
+-------+
| grade |
+-------+
|   100 |
|   200 |
|   100 |
|   300 |
|   100 |
|   300 |
+-------+
6 rows in set (0.00 sec)

mysql> select * from (select grade from user1 union all select grade from user2) as e where e.id=1
    -> ;
ERROR 1054 (42S22): Unknown column 'e.id' in 'where clause'
mysql> select * from (select grade,id from user1 union all select grade,id from user2) as e 
    -> ;
+-------+----+
| grade | id |
+-------+----+
|   100 |  1 |
|   200 |  2 |
|   100 |  3 |
|   300 |  1 |
|   100 |  2 |
|   300 |  3 |
+-------+----+
6 rows in set (0.00 sec)

mysql> select grade from (select grade,id from user1 union all select grade,id from user2) as e
    -> ;
+-------+
| grade |
+-------+
|   100 |
|   200 |
|   100 |
|   300 |
|   100 |
|   300 |
+-------+
6 rows in set (0.00 sec)

mysql> select grade from (select grade,id from user1 union all select grade,id from user2) as e where user1.id=1
    -> ;
ERROR 1054 (42S22): Unknown column 'user1.id' in 'where clause'
mysql> select grade from (select grade,id from user1 union all select grade,id from user2) as e where e.id=1
    -> ;
+-------+
| grade |
+-------+
|   100 |
|   300 |
+-------+
2 rows in set (0.00 sec)

mysql> select max(grade) from (select grade,id from user1 union all select grade,id from user2) as e where e.id=1
    -> ;
+------------+
| max(grade) |
+------------+
|        300 |
+------------+
1 row in set (0.00 sec)

mysql> 
mysql> create table user_final as select id,name,grade from user1 where grade in(select max(grade) from (select grade,id from user1 union all select grade,id from user2) as e where e.id=1);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from user_final;
Empty set (0.00 sec)

mysql> select max(grade) from (select grade,id from user1 union all select grade,id from user2) as e where e.id=1
    -> ;
+------------+
| max(grade) |
+------------+
|        300 |
+------------+
1 row in set (0.00 sec)

mysql> select max(grade) from (select grade,id from user1 union all select grade,id from user2) as e where e.id=2;
+------------+
| max(grade) |
+------------+
|        200 |
+------------+
1 row in set (0.00 sec)

mysql> select max(grade) from (select grade,id from user1 union all select grade,id from user2) as e where e.id=3;
+------------+
| max(grade) |
+------------+
|        300 |
+------------+
1 row in set (0.00 sec)

mysql> select max(grade) from (select grade,id from user1 union all select grade,id from user2) as e where e.id in(1,2,3);
+------------+
| max(grade) |
+------------+
|        300 |
+------------+
1 row in set (0.00 sec)

mysql> select max(grade) from (select grade,id from user1 union all select grade,id from user2) as e where e.id=1;
+------------+
| max(grade) |
+------------+
|        300 |
+------------+
1 row in set (0.00 sec)

mysql> select max(grade) from (select grade,id from user1 union all select grade,id from user2) as e 
    -> ;
+------------+
| max(grade) |
+------------+
|        300 |
+------------+
1 row in set (0.00 sec)

mysql> select grade from (select grade,id from user1 union all select grade,id from user2) as e
    -> ;
+-------+
| grade |
+-------+
|   100 |
|   200 |
|   100 |
|   300 |
|   100 |
|   300 |
+-------+
6 rows in set (0.00 sec)

mysql> select grade from (select grade,id from user1 union all select grade,id from user2) as e where e.id=1;
+-------+
| grade |
+-------+
|   100 |
|   300 |
+-------+
2 rows in set (0.00 sec)

mysql> select grade from (select grade,id from user1 union all select grade,id from user2) as e where e.name='khushboo';
ERROR 1054 (42S22): Unknown column 'e.name' in 'where clause'
mysql> select grade from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='khushboo';
+-------+
| grade |
+-------+
|   100 |
|   300 |
+-------+
2 rows in set (0.00 sec)

mysql> select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='khushboo';
+------------+
| max(grade) |
+------------+
|        300 |
+------------+
1 row in set (0.00 sec)

mysql> select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='siya';
+------------+
| max(grade) |
+------------+
|        300 |
+------------+
1 row in set (0.00 sec)

mysql> select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='shanvi';
+------------+
| max(grade) |
+------------+
|        200 |
+------------+
1 row in set (0.00 sec)

mysql> select * from user1 u1 inner join user2 u2;
+----+----------+-------+----+----------+-------+
| id | name     | grade | id | name     | grade |
+----+----------+-------+----+----------+-------+
|  3 | siya     |   100 |  1 | khushboo |   300 |
|  2 | shanvi   |   200 |  1 | khushboo |   300 |
|  1 | khushboo |   100 |  1 | khushboo |   300 |
|  3 | siya     |   100 |  2 | shanvi   |   100 |
|  2 | shanvi   |   200 |  2 | shanvi   |   100 |
|  1 | khushboo |   100 |  2 | shanvi   |   100 |
|  3 | siya     |   100 |  3 | siya     |   300 |
|  2 | shanvi   |   200 |  3 | siya     |   300 |
|  1 | khushboo |   100 |  3 | siya     |   300 |
+----+----------+-------+----+----------+-------+
9 rows in set (0.00 sec)

mysql> select * from user1 u1 inner join user2 u2 on u1.id=u2.id;
+----+----------+-------+----+----------+-------+
| id | name     | grade | id | name     | grade |
+----+----------+-------+----+----------+-------+
|  1 | khushboo |   100 |  1 | khushboo |   300 |
|  2 | shanvi   |   200 |  2 | shanvi   |   100 |
|  3 | siya     |   100 |  3 | siya     |   300 |
+----+----------+-------+----+----------+-------+
3 rows in set (0.00 sec)

mysql> select u1.id,u1.name,u1.grade in(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where
e.name='shanvi') from user1 u1 inner join user2 ur2; 
+----+----------+--------------------------------------------------------------------------------------------------------------------------------------------+
| id | name     | u1.grade in(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='shanvi') |
+----+----------+--------------------------------------------------------------------------------------------------------------------------------------------+
|  3 | siya     |                                                                                                                                          0 |
|  2 | shanvi   |                                                                                                                                          1 |
|  1 | khushboo |                                                                                                                                          0 |
|  3 | siya     |                                                                                                                                          0 |
|  2 | shanvi   |                                                                                                                                          1 |
|  1 | khushboo |                                                                                                                                          0 |
|  3 | siya     |                                                                                                                                          0 |
|  2 | shanvi   |                                                                                                                                          1 |
|  1 | khushboo |                                                                                                                                          0 |
+----+----------+--------------------------------------------------------------------------------------------------------------------------------------------+
9 rows in set (0.00 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'u2 on u1.id=u2.id' at line 1
mysql> select u1.id,u1.name,u1.grade in(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where
e.name='shanvi') from user1 u1 inner join user2 u2; u2 on u1.id=u2.id;
+----+----------+--------------------------------------------------------------------------------------------------------------------------------------------+
| id | name     | u1.grade in(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='shanvi') |
+----+----------+--------------------------------------------------------------------------------------------------------------------------------------------+
|  3 | siya     |                                                                                                                                          0 |
|  2 | shanvi   |                                                                                                                                          1 |
|  1 | khushboo |                                                                                                                                          0 |
|  3 | siya     |                                                                                                                                          0 |
|  2 | shanvi   |                                                                                                                                          1 |
|  1 | khushboo |                                                                                                                                          0 |
|  3 | siya     |                                                                                                                                          0 |
|  2 | shanvi   |                                                                                                                                          1 |
|  1 | khushboo |                                                                                                                                          0 |
+----+----------+--------------------------------------------------------------------------------------------------------------------------------------------+
9 rows in set (0.01 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'u2 on u1.id=u2.id' at line 1
mysql> select u1.id,u1.name,u1.grade in(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where
e.name='shanvi') from user1 u1 inner join user2 u2 on u1.id=u2.id;
+----+----------+--------------------------------------------------------------------------------------------------------------------------------------------+
| id | name     | u1.grade in(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='shanvi') |
+----+----------+--------------------------------------------------------------------------------------------------------------------------------------------+
|  1 | khushboo |                                                                                                                                          0 |
|  2 | shanvi   |                                                                                                                                          1 |
|  3 | siya     |                                                                                                                                          0 |
+----+----------+--------------------------------------------------------------------------------------------------------------------------------------------+
3 rows in set (0.01 sec)

mysql> select u1.id,u1.name,u1.grade in(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e) from
user1 u1 inner join user2 u2 on u1.id=u2.id;
+----+----------+----------------------------------------------------------------------------------------------------------------------+
| id | name     | u1.grade in(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e) |
+----+----------+----------------------------------------------------------------------------------------------------------------------+
|  1 | khushboo |                                                                                                                    0 |
|  2 | shanvi   |                                                                                                                    0 |
|  3 | siya     |                                                                                                                    0 |
+----+----------+----------------------------------------------------------------------------------------------------------------------+
3 rows in set (0.00 sec)

mysql> select u1.id,u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade=(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e);
Empty set (0.00 sec)

mysql> select u1.id,u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade in(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e);
Empty set (0.01 sec)

mysql> select u1.id,u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade=(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='shanvi');
+----+--------+-------+
| id | name   | grade |
+----+--------+-------+
|  2 | shanvi |   200 |
+----+--------+-------+
1 row in set (0.00 sec)

mysql> select u1.id,u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade=(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='siya');
Empty set (0.00 sec)

mysql> select u1.id,u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade=(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='siya');
Empty set (0.00 sec)

mysql> select u1.id,u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade=(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='khushboo');
Empty set (0.00 sec)

mysql> select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='khushboo')
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='khushboo';
+------------+
| max(grade) |
+------------+
|        300 |
+------------+
1 row in set (0.00 sec)

mysql> select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='shanvi';
+------------+
| max(grade) |
+------------+
|        200 |
+------------+
1 row in set (0.00 sec)

mysql> select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='siya';
+------------+
| max(grade) |
+------------+
|        300 |
+------------+
1 row in set (0.01 sec)

mysql> select u1.id,u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade=(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='shanvi');
+----+--------+-------+
| id | name   | grade |
+----+--------+-------+
|  2 | shanvi |   200 |
+----+--------+-------+
1 row in set (0.00 sec)

mysql> select u1.id,u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade=(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.name='siya');
Empty set (0.00 sec)

mysql> select u1.id,u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade=(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.id=1);
Empty set (0.00 sec)

mysql> select u1.id,u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade=(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.id=2);
+----+--------+-------+
| id | name   | grade |
+----+--------+-------+
|  2 | shanvi |   200 |
+----+--------+-------+
1 row in set (0.00 sec)

mysql> select u1.id,u1.name,u1.grade from user1 u1 inner join user2 u2 on u1.id=u2.id where u1.grade=(select max(grade) from (select grade,id,name from user1 union all select grade,id,name from user2) as e where e.id=3);
Empty set (0.00 sec)

mysql> select * from user1 join user2;
+----+----------+-------+----+----------+-------+
| id | name     | grade | id | name     | grade |
+----+----------+-------+----+----------+-------+
|  3 | siya     |   100 |  1 | khushboo |   300 |
|  2 | shanvi   |   200 |  1 | khushboo |   300 |
|  1 | khushboo |   100 |  1 | khushboo |   300 |
|  3 | siya     |   100 |  2 | shanvi   |   100 |
|  2 | shanvi   |   200 |  2 | shanvi   |   100 |
|  1 | khushboo |   100 |  2 | shanvi   |   100 |
|  3 | siya     |   100 |  3 | siya     |   300 |
|  2 | shanvi   |   200 |  3 | siya     |   300 |
|  1 | khushboo |   100 |  3 | siya     |   300 |
+----+----------+-------+----+----------+-------+
9 rows in set (0.00 sec)

mysql> select * from user1 join user2 where user1.id=user2.id;
+----+----------+-------+----+----------+-------+
| id | name     | grade | id | name     | grade |
+----+----------+-------+----+----------+-------+
|  1 | khushboo |   100 |  1 | khushboo |   300 |
|  2 | shanvi   |   200 |  2 | shanvi   |   100 |
|  3 | siya     |   100 |  3 | siya     |   300 |
+----+----------+-------+----+----------+-------+
3 rows in set (0.01 sec)

mysql> select * from user1 left join user2 where user1.id=user2.id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where user1.id=user2.id' at line 1
mysql> select * from user1 u1 left join user2 u2 where u1.id=u2.id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where u1.id=u2.id' at line 1
mysql> select * from user1 u1 left join user2 u2 on u1.id=u2.id;
+----+----------+-------+------+----------+-------+
| id | name     | grade | id   | name     | grade |
+----+----------+-------+------+----------+-------+
|  1 | khushboo |   100 |    1 | khushboo |   300 |
|  2 | shanvi   |   200 |    2 | shanvi   |   100 |
|  3 | siya     |   100 |    3 | siya     |   300 |
+----+----------+-------+------+----------+-------+
3 rows in set (0.00 sec)

mysql> select * from user1 u1 left join user2 u2 on u1.id=u2.id where u1.grade>u2.grade;
+----+--------+-------+------+--------+-------+
| id | name   | grade | id   | name   | grade |
+----+--------+-------+------+--------+-------+
|  2 | shanvi |   200 |    2 | shanvi |   100 |
+----+--------+-------+------+--------+-------+
1 row in set (0.00 sec)

mysql> select u1.id, u1.name, u1.grade from user1 u1 left join user2 u2 on u1.id=u2.id where u1.grade>u2.grade;
+----+--------+-------+
| id | name   | grade |
+----+--------+-------+
|  2 | shanvi |   200 |
+----+--------+-------+
1 row in set (0.00 sec)

mysql> (select u1.id, u1.name, u1.grade from user1 u1 left join user2 u2 on u1.id=u2.id where u1.grade>u2.grade)union (select u1.id, u1.name, u1.grade from user2 u1 left join user1 u2 on u1.id=u2.id where u1.grade>u2.grade) ;
+----+----------+-------+
| id | name     | grade |
+----+----------+-------+
|  2 | shanvi   |   200 |
|  1 | khushboo |   300 |
|  3 | siya     |   300 |
+----+----------+-------+
3 rows in set (0.00 sec)

mysql> select * from salesman;
+-------------+---------+----------+------------+
| salesman_id | name    | city     | commission |
+-------------+---------+----------+------------+
|           1 | anamika | indore   |      0.400 |
|           2 | bala    | bhopal   |      0.500 |
|           3 | chanda  | hata     |      0.400 |
|           4 | deepa   | hata     |      0.500 |
|           5 | enaya   | banglore |      0.300 |
+-------------+---------+----------+------------+
5 rows in set (0.00 sec)

mysql> select * from customer;
+-------------+-----------+--------+-------+-------------+
| customer_id | cust_name | city   | grade | salesman_id |
+-------------+-----------+--------+-------+-------------+
|           1 | Annu      | indore | 100   |           1 |
|           2 | Bnnu      | bhopal | 200   |           2 |
|           3 | channu    | damoh  | 300   |           3 |
+-------------+-----------+--------+-------+-------------+
3 rows in set (0.00 sec)

mysql> select * from salesman s inner join customer c on s.salesman_id = c.salesman_id where s.commission > 0.1;
+-------------+---------+--------+------------+-------------+-----------+--------+-------+-------------+
| salesman_id | name    | city   | commission | customer_id | cust_name | city   | grade | salesman_id |
+-------------+---------+--------+------------+-------------+-----------+--------+-------+-------------+
|           1 | anamika | indore |      0.400 |           1 | Annu      | indore | 100   |           1 |
|           2 | bala    | bhopal |      0.500 |           2 | Bnnu      | bhopal | 200   |           2 |
|           3 | chanda  | hata   |      0.400 |           3 | channu    | damoh  | 300   |           3 |
+-------------+---------+--------+------------+-------------+-----------+--------+-------+-------------+
3 rows in set (0.00 sec)

mysql> select * from salesman s inner join customer c on s.salesman_id = c.salesman_id where s.commission > 0.2;
+-------------+---------+--------+------------+-------------+-----------+--------+-------+-------------+
| salesman_id | name    | city   | commission | customer_id | cust_name | city   | grade | salesman_id |
+-------------+---------+--------+------------+-------------+-----------+--------+-------+-------------+
|           1 | anamika | indore |      0.400 |           1 | Annu      | indore | 100   |           1 |
|           2 | bala    | bhopal |      0.500 |           2 | Bnnu      | bhopal | 200   |           2 |
|           3 | chanda  | hata   |      0.400 |           3 | channu    | damoh  | 300   |           3 |
+-------------+---------+--------+------------+-------------+-----------+--------+-------+-------------+
3 rows in set (0.00 sec)

mysql> select a.cust_name as "customer name",a.city,b.name as "salesman",b.commission from customer a inner join salesman b on a.ssalesman_id = b.salesman_id where b.commission>.3;
ERROR 1054 (42S22): Unknown column 'a.ssalesman_id' in 'on clause'
mysql> select a.cust_name as "customer name",a.city,b.name as "salesman",b.commission from customer a inner join salesman b on a.salesman_id = b.salesman_id where b.commission>.3;
+---------------+--------+----------+------------+
| customer name | city   | salesman | commission |
+---------------+--------+----------+------------+
| Annu          | indore | anamika  |      0.400 |
| Bnnu          | bhopal | bala     |      0.500 |
| channu        | damoh  | chanda   |      0.400 |
+---------------+--------+----------+------------+
3 rows in set (0.00 sec)

mysql> select a.cust_name as "customer name",a.city,b.name as "salesman",b.commission from customer a inner join salesman b on a.salesman_id = b.salesman_id where b.commission>.4;
+---------------+--------+----------+------------+
| customer name | city   | salesman | commission |
+---------------+--------+----------+------------+
| Bnnu          | bhopal | bala     |      0.500 |
+---------------+--------+----------+------------+
1 row in set (0.00 sec)

mysql> select a.cust_name as "customer",a.city,b.name as "salesman",b.commission from customer a inner join salesman b on a.salesman_id = b.salesman_id where b.commission>.4;
+----------+--------+----------+------------+
| customer | city   | salesman | commission |
+----------+--------+----------+------------+
| Bnnu     | bhopal | bala     |      0.500 |
+----------+--------+----------+------------+
1 row in set (0.00 sec)

mysql> select * from salesman;
+-------------+---------+----------+------------+
| salesman_id | name    | city     | commission |
+-------------+---------+----------+------------+
|           1 | anamika | indore   |      0.400 |
|           2 | bala    | bhopal   |      0.500 |
|           3 | chanda  | hata     |      0.400 |
|           4 | deepa   | hata     |      0.500 |
|           5 | enaya   | banglore |      0.300 |
+-------------+---------+----------+------------+
5 rows in set (0.00 sec)

mysql> select * from customer;
+-------------+-----------+--------+-------+-------------+
| customer_id | cust_name | city   | grade | salesman_id |
+-------------+-----------+--------+-------+-------------+
|           1 | Annu      | indore | 100   |           1 |
|           2 | Bnnu      | bhopal | 200   |           2 |
|           3 | channu    | damoh  | 300   |           3 |
+-------------+-----------+--------+-------+-------------+
3 rows in set (0.00 sec)

mysql> select * from user_final;
Empty set (0.00 sec)

mysql> (select u1.id, u1.name, u1.grade from user1 u1 left join user2 u2 on u1.id=u2.id where u1.grade>u2.grade)union (select u1.id, u1.name, u1.grade from user2 u1 left join user1 u2 on u1.id=u2.id where u1.grade>u2.grade) ;
+----+----------+-------+
| id | name     | grade |
+----+----------+-------+
|  2 | shanvi   |   200 |
|  1 | khushboo |   300 |
|  3 | siya     |   300 |
+----+----------+-------+
3 rows in set (0.00 sec)

mysql> create table user_final as (select u1.id, u1.name, u1.grade from user1 u1 left join user2 u2 on u1.id=u2.id where u1.grade>u2.grade)union (select u1.id, u1.name, u1.grade from user2 u1 left join user1 u2 on u1.id=u2.id where u1.grade>u2.grade);
ERROR 1050 (42S01): Table 'user_final' already exists
mysql> drop table user_final;
Query OK, 0 rows affected (0.06 sec)

mysql> create table user_final as (select u1.id, u1.name, u1.grade from user1 u1 left join user2 u2 on u1.id=u2.id where u1.grade>u2.grade)union (select u1.id, u1.name, u1.grade from user2 u1 left join user1 u2 on u1.id=u2.id where u1.grade>u2.grade);
Query OK, 3 rows affected (0.15 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from user_final;
+----+----------+-------+
| id | name     | grade |
+----+----------+-------+
|  2 | shanvi   |   200 |
|  1 | khushboo |   300 |
|  3 | siya     |   300 |
+----+----------+-------+
3 rows in set (0.01 sec)

mysql> select u1.id, u1.name, u1.grade,u1.source as source from user1 u1 left join user2 u2 on u1.id=u2.id where u1.grade>u2.grade)union (select u1.id
, u1.name, u1.grade, u1.source as source from user2 u1 left join user1 u2 on u1.id=u2.id where u1.grade>u2.grade;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')union (select u1.id, u1.name, u1.grade, u1.source as source from user2 u1 left ' at line 1
mysql> select u1.id, u1.name, u1.grade,u1.source as source from user1 u1 left join user2 u2 on u1.id=u2.id where u1.grade>u2.grade;
ERROR 1054 (42S22): Unknown column 'u1.source' in 'field list'
mysql> alter table user1 add source varchar(10);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select u1.id, u1.name, u1.grade,"user1" as source from user1 ;
ERROR 1054 (42S22): Unknown column 'u1.id' in 'field list'
mysql> select u1.id, u1.name, u1.grade,"user1" as source from user1 u1 ;
+----+----------+-------+--------+
| id | name     | grade | source |
+----+----------+-------+--------+
|  1 | khushboo |   100 | user1  |
|  2 | shanvi   |   200 | user1  |
|  3 | siya     |   100 | user1  |
+----+----------+-------+--------+
3 rows in set (0.00 sec)

mysql> create table user_final1 as (select u1.id, u1.name, u1.grade, "user1" as source from user1 u1 left join user2 u2 on u1.id=u2.id where u1.grade>
u2.grade)union (select u1.id, u1.name, u1.grade, "user2" as source from user2 u1 left join user1 u2 on u1.id=u2.id where u1.grade>u2.grade);
Query OK, 3 rows affected (0.25 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from user_final1;
+----+----------+-------+--------+
| id | name     | grade | source |
+----+----------+-------+--------+
|  2 | shanvi   |   200 | user1  |
|  1 | khushboo |   300 | user2  |
|  3 | siya     |   300 | user2  |
+----+----------+-------+--------+
3 rows in set (0.01 sec)

mysql> select u1.id, u1.name, u1.grade,"user1" as source from user2 u1 ;
+----+----------+-------+--------+
| id | name     | grade | source |
+----+----------+-------+--------+
|  1 | khushboo |   300 | user1  |
|  2 | shanvi   |   100 | user1  |
|  3 | siya     |   300 | user1  |
+----+----------+-------+--------+
3 rows in set (0.00 sec)

mysql> select u1.id, u1.name, u1.grade,"user2" as source from user2 u1 ;
+----+----------+-------+--------+
| id | name     | grade | source |
+----+----------+-------+--------+
|  1 | khushboo |   300 | user2  |
|  2 | shanvi   |   100 | user2  |
|  3 | siya     |   300 | user2  |
+----+----------+-------+--------+
3 rows in set (0.00 sec)

mysql> mysql> select u1.id, u1.name, u1.grade,"user1" as source from user1 ;
ERROR 1054 (42S22): Unknown column 'u1.id' in 'field list'
mysql> select u1.id, u1.name, u1.grade,"user1" as source from user1 u1 ;
+----+----------+-------+--------+
| id | name     | grade | source |m
+----+----------+-------+--------+
|  1 | khushboo |   100 | user1  |
|  2 | shanvi   |   200 | user1  |
|  3 | siya     |   100 | user1  |
+----+----------+-------+--------+
3 rows in set (0.00 sec)

mysql> create table user_final1 as (select u1.id, u1.name, u1.grade, "user1" as source from user1 u1 left join user2 u2 on u1.id=u2.id where u1.grade>
u2.grade)union (select u1.id, u1.name, u1.grade, "user2" as source from user2 u1 left join user1 u2 on u1.id=u2.id where u1.grade>u2.grade);
Query OK, 3 rows affected (0.25 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from user_final1;
+----+----------+-------+--------+
| id | name     | grade | source |
+----+----------+-------+--------+
|  2 | shanvi   |   200 | user1  |
|  1 | khushboo |   300 | user2  |
|  3 | siya     |   300 | user2  |
+----+----------+-------+--------+
3 rows in set (0.01 sec)

mysql> select u1.id, u1.name, u1.grade,"user1" as source from user2 u1 ;
+----+----------+-------+--------+
| id | name     | grade | source |
+----+----------+-------+--------+
|  1 | khushboo |   300 | user1  |
|  2 | shanvi   |   100 | user1  |
|  3 | siya     |   300 | user1  |
+----+----------+-------+--------+
3 rows in set (0.00 sec)

mysql> select u1.id, u1.name, u1.grade,"user2" as source from user2 u1 ;
+----+----------+-------+--------+
| id | name     | grade | source |
+----+----------+-------+--------+
|  1 | khushboo |   300 | user2  |
|  2 | shanvi   |   100 | user2  |
|  3 | siya     |   300 | user2  |
+----+----------+-------+--------+
ysql> select u1.id, u1.name, u1.grade,"user1" as source from user1 ;
^C
mysql> ERROR 1054 (42S22): Unknown column 'u1.id' in 'field list'
    -> mysql> select u1.id, u1.name, u1.grade,"user1" as source from user1 u1 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ERROR 1054 (42S22): Unknown column 'u1.id' in 'field list'
mysql> select u1.id, ' at line 1
mysql> +----+----------+-------+--------+
    -> | id | name     | grade | source |
    -> +----+----------+-------+--------+
    -> |  1 | khushboo |   100 | user1  |
    -> |  2 | shanvi   |   200 | user1  |
    -> |  3 | siya     |   100 | user1  |
    -> +----+----------+-------+--------+
    -> 3 rows in set (0.00 sec)
    -> 
    -> mysql> create table user_final1 as (select u1.id, u1.name, u1.grade, "user1" as source from user1 u1 left join user2 u2 on u1.id=u2.id where u1.grade>
    -> u2.grade)union (select u1.id, u1.name, u1.grade, "user2" as source from user2 u1 left join user1 u2 on u1.id=u2.id where u1.grade>u2.grade);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+----+----------+-------+--------+
| id | name     | grade | source |
+----+----' at line 1
mysql> Query OK, 3 rows affected (0.25 sec)
    -> Records: 3  Duplicates: 0  Warnings: 0
    -> 
    -> mysql> select * from user_final1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 3 rows affected (0.25 sec)
Records: 3  Duplicates: 0  Warnings: 0

mys' at line 1
mysql> +----+----------+-------+--------+
    -> | id | name     | grade | source |
    -> +----+----------+-------+--------+
    -> |  2 | shanvi   |   200 | user1  |
    -> |  1 | khushboo |   300 | user2  |
    -> |  3 | siya     |   300 | user2  |
    -> +----+----------+-------+--------+
    -> 3 rows in set (0.01 sec)
    -> 
    -> mysql> select u1.id, u1.name, u1.grade,"user1" as source from user2 u1 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+----+----------+-------+--------+
| id | name     | grade | source |
+----+----' at line 1
mysql> +----+----------+-------+--------+
    -> | id | name     | grade | source |
    -> +----+----------+-------+--------+
    -> |  1 | khushboo |   300 | user1  |
    -> |  2 | shanvi   |   100 | user1  |
    -> |  3 | siya     |   300 | user1  |
    -> +----+----------+-------+--------+
    -> 3 rows in set (0.00 sec)
    -> 
    -> mysql> select u1.id, u1.name, u1.grade,"user2" as source from user2 u1 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+----+----------+-------+--------+
| id | name     | grade | source |
+----+----' at line 1
mysql> +----+----------+-------+--------+
    -> | id | name     | grade | source |
    -> +----+----------+-------+--------+
    -> |  1 | khushboo |   300 | user2  |
    -> |  2 | shanvi   |   100 | user2  |
    -> |  3 | siya     |   300 | user2  |
    -> +----+----------+-------+--------+
    -> | id | name     | grade | source |
    -> +----+----------+-------+--------+
    -> |  1 | khushboo |   300 | user2  |
    -> |  2 | shanvi   |   100 | user2  |
    -> |  3 | siya     |   300 | user2  |
    -> +----+----------+-------+--------+
    -> ysql> select u1.id, u1.name, u1.grade,"user1" as source from user1 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+----+----------+-------+--------+
| id | name     | grade | source |
+----+----' at line 1
mysql> ^C
    -> mysql> ERROR 1054 (42S22): Unknown column 'u1.id' in 'field list'
    ->     -> mysql> select u1.id, u1.name, u1.grade,"user1" as source from user1 u1 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '^C
mysql> ERROR 1054 (42S22): Unknown column 'u1.id' in 'field list'
    -> mysq' at line 1
mysql> ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ERROR 1054 (42S22): Unknown column 'u1.id' in 'field list'
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ERROR 1064 (42000): You have an error in your SQL syntax' at line 1
    '> mysql> select u1.id, ' at line 1
    -> mysql> +----+----------+-------+--------+
    ->     -> | id | name     | grade | source |
    ->     -> +----+----------+-------+--------+
    ->     -> |  1 | khushboo |   100 | user1  |
    ->     -> |  2 | shanvi   |   200 | user1  |
    ->     -> |  3 | siya     |   100 | user1  |
    ->     -> +----+----------+-------+--------+
    ->     -> 3 rows in set (0.00 sec)
    -> 

