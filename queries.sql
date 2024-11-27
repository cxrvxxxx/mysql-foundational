-- Create database 
CREATE DATABASE dbblog;
-- Select the database 
USE dbblog;
-- Create the users table 
CREATE TABLE tblusers (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    password VARCHAR(255) NOT NULL,
	INDEX (email)
);
-- Create the posts table
CREATE TABLE tblposts (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    author_id INTEGER NOT NULL,
    title VARCHAR(255),
    body TEXT,
	FOREIGN KEY (author_id) REFERENCES tblusers (id)
);
-- Populate the users table
INSERT INTO
	tblusers (email, firstname, lastname, password)
VALUES
	("jane.doe@email.com", "Jane", "Doe", "password123"),
    ("john.doe@email.com", "John", "Doe", "password123")
;
-- Populate the posts table
INSERT INTO
	tblposts (author_id, title, body)
VALUES
	(1, 'Post #1', "This is a post."),
    (1, "Post #2", "This is a post."),
    (2, "Post #2", "This is a post."),
    (2, "Post #4", "This is a post.")
;
-- View the data
SELECT
	p.title, p.body, CONCAT(u.firstname, ' ', u.lastname) AS author
FROM
	tblposts AS p
JOIN
	tblusers as u
WHERE
	p.author_id = u.id
;
-- Update a user
UPDATE
	tblusers
SET
	firstname = 'Mary'
WHERE
	id = 1
;
-- Update a post
UPDATE
	tblposts
SET
	body = "This is an updated post."
WHERE
	id = 1
;
-- Delete a post
DELETE FROM
	tblposts
WHERE
	author_id = 2
;
-- Delete a user
DELETE FROM
	tblusers
WHERE
	id = 2
;