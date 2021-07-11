CREATE DATABASE ayds_proyect;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    email TEXT
);

INSERT INTO users (name, email)
    VALUES ('robert', 'robert@robert.com'),
    ('joaquin', 'joaquin@joaquin.com');

INSERT INTO profesores (name, email)
    VALUES ('robert', 'robert@robert.com'),
    ('joaquin', 'joaquin@joaquin.com');

INSERT INTO director (name, email)
    VALUES ('robert', 'robert@robert.com');

select * from users;