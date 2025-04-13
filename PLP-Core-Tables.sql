-- Creating a database
CREATE DATABASE bookstore;
USE bookstore;

-- Publisher table
CREATE TABLE publisher (
	publisher_id INT PRIMARY KEY,
	publisher_name VARCHAR(255)
);

-- book language table
CREATE TABLE book_language (
	language_id INT PRIMARY KEY,
	language_name VARCHAR(255)
);

-- book table
CREATE TABLE book (
	book_id INT PRIMARY KEY,
	title VARCHAR(255),
	publisher_id INT,
	language_id INT,
	publication_year INT,
	FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
	FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- author table
CREATE TABLE author (
	author_id INT PRIMARY KEY,
	author_name VARCHAR(255)
);

-- book author table
CREATE TABLE book_author (
	book_id INT,
	author_id INT,
	PRIMARY KEY (book_id, author_id),
	FOREIGN KEY (book_id) REFERENCES book(book_id),
	FOREIGN KEY (author_id) REFERENCES author(author_id)
);


