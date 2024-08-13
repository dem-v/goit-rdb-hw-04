CREATE SCHEMA LibraryManagement;
USE LibraryManagement;
CREATE TABLE authors (
	author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255)
);
CREATE TABLE genres (
	genre_id  INT AUTO_INCREMENT PRIMARY KEY,
    genre_name  VARCHAR(255)
);
CREATE TABLE books (
	book_id   INT AUTO_INCREMENT PRIMARY KEY,
    title   VARCHAR(255),
    publication_year YEAR,
    author_id  INT,
    genre_id  INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);
CREATE TABLE users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    email  VARCHAR(255)
);
CREATE TABLE borrowed_books (
	borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- =========================
-- Fill data
-- =========================

USE LibraryManagement;
INSERT INTO authors (author_name)
VALUES ('worms')
	  ,('coca-cola')
      ,('Darles Chickens');

INSERT INTO genres (genre_name)
VALUES ('romance')
	  ,('horror')
      ,('weird');
      
INSERT INTO books (title, publication_year, author_id, genre_id)
VALUES  ('Oomph', 1975, 1, 3)
	,	('Flying with the wind', 2020, 3, 1)
    ,	('1Q85', 2005, 2, 2)
    ,	('drinkit', 2055, 1, 2);
    
INSERT INTO users (username, email)
VALUES	('good', 'g@mail.com')
	,	('bad', 'b@hush.com')
    ,	('ugly', 'uuu@yahoo.com');
    
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date)
VALUES	(1, 1, '2024-08-13', NULL)
	,	(2, 2, '1999-01-01', '2000-01-01')
    ,	(4, 3, '2020-01-01', '2020-02-02');