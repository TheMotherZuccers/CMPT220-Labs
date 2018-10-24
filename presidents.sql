# Presidents of the United States

# Author: Maria Molloy, Victoria Spychalski, William Kluge, Damion Neth, Daniel Simpson



DROP DATABASE IF EXISTS site_db;

CREATE DATABASE site_db;
USE site_db;


DROP TABLE IF EXISTS presidents;

CREATE TABLE presidents
(

    id int PRIMARY KEY AUTO_INCREMENT,

    fname TEXT NOT NULL,

    lname TEXT NOT NULL,

    num int NOT NULL,

    dob DATETIME NOT NULL
);


INSERT INTO presidents (fname, lname, num, dob) 
VALUES ('Martin', 'Van Buren', 8, '1782-12-05 00:00:00'),

       ('John', 'Tyler', 10, '1790-03-29 00:00:00'),

       ('Millard', 'Fillmore', 13, '1800-01-07 00:00:00'),

       ('Franklin', 'Pierce', 14, '1804-11-23 00:00:00'),

       ('Theodore', 'Roosevelt', 26, '1858-10-27 00:00:00');


SELECT * FROM presidents;


SELECT lname, num, dob FROM presidents ORDER BY num;


SELECT lname, num, dob FROM presidents ORDER BY lname;


SELECT lname, num, dob FROM presidents ORDER BY dob DESC;