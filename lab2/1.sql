--DDL = Data Definition Language Commands
CREATE DATABASE lab2;
CREATE TABLE test(
    id serial,
    username varchar,
    password int
);
DROP TABLE test;
ALTER TABLE test ADD email varchar(50);

--DML = Data Manipulation Commands
INSERT INTO test(username, password) VALUES ('kuralbaev', 123456);
UPDATE test SET email = 'kuralbaev@gmail.com' WHERE username = 'kuralbaev';
SELECT email FROM test;
DELETE FROM test WHERE username = 'kuralbaev';