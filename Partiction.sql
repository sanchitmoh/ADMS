//Partiction 
CREATE TABLE employee_range (
    emp_id   NUMBER,
    emp_name VARCHAR2(20),
    salary   NUMBER,
    join_year NUMBER
)
PARTITION BY RANGE (join_year) (
    PARTITION p_2019 VALUES LESS THAN (2020),
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_max  VALUES LESS THAN (MAXVALUE)
);
INSERT INTO employee_range VALUES (1, 'Amit', 50000, 2019);
INSERT INTO employee_range VALUES (2, 'Rahul', 60000, 2020);
INSERT INTO employee_range VALUES (3, 'Neha', 55000, 2021);
INSERT INTO employee_range VALUES (4, 'Karan', 65000, 2023);

SELECT table_name, partition_name
FROM user_tab_partitions
WHERE table_name = 'employee_range';

CREATE TABLE employee_list (
    emp_id   NUMBER,
    emp_name VARCHAR2(20),
    dept     VARCHAR2(20),
    salary   NUMBER
)
PARTITION BY LIST (dept) (
    PARTITION p_it     VALUES ('IT'),
    PARTITION p_hr     VALUES ('HR'),
    PARTITION p_sales  VALUES ('Sales'),
    PARTITION p_other  VALUES (DEFAULT)
);

INSERT INTO employee_list VALUES (1, 'Amit', 'IT', 50000);
INSERT INTO employee_list VALUES (2, 'Neha', 'HR', 45000);
INSERT INTO employee_list VALUES (3, 'Riya', 'Sales', 55000);
INSERT INTO employee_list VALUES (4, 'Karan', 'Admin', 40000);

SELECT table_name, partition_name
FROM user_tab_partitions
WHERE table_name = 'employee_list';

CREATE TABLE employee_hash (
    emp_id   NUMBER,
    emp_name VARCHAR2(20),
    salary   NUMBER
)
PARTITION BY HASH (emp_id)
PARTITIONS 4;

INSERT INTO employee_hash VALUES (1, 'Amit', 50000);
INSERT INTO employee_hash VALUES (2, 'Rahul', 60000);
INSERT INTO employee_hash VALUES (3, 'Neha', 55000);
INSERT INTO employee_hash VALUES (4, 'Riya', 65000);

SELECT table_name, partition_name
FROM user_tab_partitions
WHERE table_name = 'employee_hash';
