CREATE DATABASE ayds_proyect;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    email TEXT
);

INSERT INTO users (name, email)
    VALUES ('robert', 'robert@robert.com'),
    ('joaquin', 'joaquin@joaquin.com');

select * from users;