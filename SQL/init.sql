CREATE database library;

USE library;

CREATE TABLE IF NOT EXISTS author
(
    id            INT auto_increment
    PRIMARY KEY,
    firstName     VARCHAR(255) NOT NULL,
    lastName      VARCHAR(255) NOT NULL,
    year_of_birth INT          NOT NULL
    );

CREATE TABLE IF NOT EXISTS book
(
    id               INT auto_increment
    PRIMARY KEY,
    name             VARCHAR(255) NOT NULL,
    publication_year INT          NOT NULL,
    author_id        INT          NOT NULL,
    CONSTRAINT book_ibfk_1
    FOREIGN KEY (author_id) REFERENCES author (id)
    );

CREATE INDEX author_id
    ON book (author_id);

INSERT INTO author(firstName, lastName, year_of_birth)
VALUES ('John Ronald Reuel', 'Tolkien', 1892);
INSERT INTO author(firstName, lastName, year_of_birth)
VALUES ('Jane', 'Austen', 1775);
INSERT INTO author(firstName, lastName, year_of_birth)
VALUES ('George', 'Orwell', 1903);
INSERT INTO author(firstName, lastName, year_of_birth)
VALUES ('Daniel Gerhard', 'Brown', 1964);

INSERT INTO book(name, publication_year, author_id)
VALUES ('The Lord of the Rings', 1954, (SELECT id FROM author WHERE lastName = 'Tolkien'));
INSERT INTO book(name, publication_year, author_id)
VALUES ('The Hobbit', 1937, (SELECT id FROM author WHERE lastName = 'Tolkien'));
INSERT INTO book(name, publication_year, author_id)
VALUES ('Pride and Prejudice', 1813, (SELECT id FROM author WHERE lastName = 'Austen'));
INSERT INTO book(name, publication_year, author_id)
VALUES ('1984', 1949, (SELECT id FROM author WHERE lastName = 'Orwell'));
INSERT INTO book(name, publication_year, author_id)
VALUES ('Animal Farm', 1945, (SELECT id FROM author WHERE lastName = 'Orwell'));
INSERT INTO book(name, publication_year, author_id)
VALUES ('The Da Vinci code', 2003, (SELECT id FROM author WHERE lastName = 'Brown'));