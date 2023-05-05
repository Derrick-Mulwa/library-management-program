DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
USE library;

CREATE TABLE books(
book_id INT PRIMARY KEY AUTO_INCREMENT,
ISBN_NO VARCHAR(100),
book_name VARCHAR(200),
edition VARCHAR(100),
author VARCHAR(200),
publisher VARCHAR(200),
date_published DATE,
book_type VARCHAR(100));

INSERT INTO books(ISBN_NO, book_name, edition, author, publisher, date_published, book_type) VALUES
('9780262539968', 'Technology & Society','Second Edition', 'Deborah G. Johnson and Jameson M. Wetmore', 'The MIT Press', '2021-08-24', 'Non-Fiction'),
('9780262542463', 'Technology in World Civilization', 'Revised And Expanded Edition', 'Arnold Pacey and Francesca Bray', 'The MIT Press', '2021-08-3', 'History'),
('9780263263102', 'Communicating with Data', 'First Edition', 'Carl Allchin', 'The MIT Press', '2021-11-09', 'Non-Fiction'),
('9781400030651', 'A Fine Balance', 'First Edition', 'Hernan Diaz', 'Vintage', '1997-01-01', 'Historical Fiction'),
('9400243698894', 'Trust', 'First Edition', 'Hernan Diaz', 'Riverhead Books', '2022-05-03', 'Historical Fiction'),
('9780571230563', 'Tales from Firozsha Baag', 'Main Edition', 'Rohinton Mistry', 'Faber & Faber', '2006-10-19', 'Mistry'),
('9400243618827', 'Such a Long Journey', 'First Edition', 'Rohinton Mistry', 'Vintage', '2010-11-03', 'Mistry'),
('9400243670361', 'The Autobiography of Malcolm X', 'First Edition', 'Malcolm X, Alex Haley', 'Riverhead Books', '1965-09-29', 'Autobiography'),
('9400243698894', 'I Am Malala: How One Girl Stood Up for Education and Changed the World', 'First Edition', 'Malala Yousafzai, Christina Lamb', 'Hachette Audio', '2013-09-08', 'Autobiography'),
('9780262542463', 'Technology in World Civilization', 'Revised And Expanded Edition', 'Arnold Pacey and Francesca Bray', 'The MIT Press', '2021-08-3', 'History');

CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(200),
last_name VARCHAR(200),
user_type VARCHAR(100),
date_joined DATE,
phone_number VARCHAR(100),
email_address VARCHAR(100),
total_books_borrowed INT,
on_date_return decimal(5,2));

INSERT INTO users(first_name, last_name, user_type, date_joined, phone_number, email_address, total_books_borrowed, on_date_return) VALUES 
('John', 'Ouko', 'Student', '2023-03-21', '254701996841', 'johnouko@students.jkuat.ac.ke', 7, 100),
('Winnie', 'Nyaboke', 'Student', '2023-03-11', '254712740988', 'nyaokewinnie@students.jkuat.ac.ke', 3, 30),
('Philip', 'Mutinda', 'Librarian', '2023-01-01', '254777036014', 'philipmutinda@jkuat.ac.ke', 0, 0),
('Agnes', 'Njururi', 'Lecturer', '2023-01-28', '254743026366', 'agnesnjururi@jkuat.ac.ke', 17, 90),
('Pius', 'Muiru', 'Lecturer', '2023-04-28', '254771214978', 'muiru.pius@jkuat.ac.ke', 10, 90),
('Alex', 'Simiyu', 'Lecturer', '2023-02-4', '254768097282', 'alex.simiyu@jkuat.ac.ke', 1, 100),
('Bridgit', 'Mwagudza', 'Student', '2022-09-28', '254743473001', 'bridgit.mwagudza@students.jkuat.ac.ke', 8, 75),
('Margeret', 'Chebet', 'Lecturer', '2023-02-14', '254797020348', 'margeretchebet@jkuat.ac.ke', 22, 100)
;


CREATE TABLE login_details(
phone_number VARCHAR(100) PRIMARY KEY,
email VARCHAR(100),
pass VARCHAR(100));

INSERT INTO login_details VALUES
('254701996841', 'johnouko@students.jkuat.ac.ke', 'john1234'),
('254712740988', 'nyaokewinnie@students.jkuat.ac.ke', 'Winrar00'),
('254777036014', 'philipmutinda@jkuat.ac.ke', 'Iammutinda'),
('254743026366', 'agnesnjururi@jkuat.ac.ke', 'Annpierra'),
('254771214978', 'muiru.pius@jkuat.ac.ke', 'mwiru0100'),
('254768097282', 'alex.simiyu@jkuat.ac.ke', 'alexbest'),
('254743473001', 'bridgit.mwagudza@students.jkuat.ac.ke', 'pwanifinest'),
('254797020348', 'margeretchebet@jkuat.ac.ke', 'margaritas');

CREATE TABLE issued_books(
issue_id INT PRIMARY KEY AUTO_INCREMENT,
ISBN_NO VARCHAR(100),
book_name VARCHAR(100),
issued_to_id VARCHAR(200),
issued_to_name VARCHAR(200),
date_issued DATE,
expected_return_date DATE,
actual_return_date DATE,
issue_status VARCHAR(100),
returned VARCHAR(100),
penalty DECIMAL(8,2));

INSERT INTO issued_books(ISBN_NO, book_name, issued_to_id, issued_to_name, date_issued, expected_return_date, actual_return_date, issue_status,returned, penalty) VALUES
('9780263263102', 'Communicating with Data', 'nyaokewinnie@students.jkuat.ac.ke', 'Winnie Nyaboke', '2023-04-11', '2023-04-17', null, 'OVERDUE', 'NO', 1000),
('9781400030651', 'A Fine Balance', 'nyaokewinnie@students.jkuat.ac.ke', 'Winnie Nyaboke', '2023-04-11', '2023-04-27', '2023-04-24', 'ON TIME', 'YES', 0),
('9780262542463', 'Technology in World Civilization', 'alex.simiyu@jkuat.ac.ke', 'Alex Simiyu', '2023-03-12', '2023-04-7', '2023-04-17', 'OVERDUE', 'YES', 1000),
('9780571230563', 'Tales from Firozsha Baag', 'alex.simiyu@jkuat.ac.ke', 'Alex Simiyu', '2023-04-12', '2023-04-30', null, 'STILL VALID', 'NO', 0),
('9400243698894', 'Trust', 'nyaokewinnie@students.jkuat.ac.ke', 'Winnie Nyaboke', '2023-04-22', '2023-04-26', null, 'STILL VALID', 'NO', 0),
('9400243670361', 'The Autobiography of Malcolm X', 'margeretchebet@jkuat.ac.ke', 'Margeret Chebet', '2023-04-27', '2023-05-17', null, 'STILL VALID', 'NO', 0);

CREATE TABLE courses (
  id INT PRIMARY KEY AUTO_INCREMENT,
  course VARCHAR(100)
);

INSERT INTO courses (course) VALUES
  ('BSc Actuarial Science'),
  ('BSc Agricultural Economics and Rural Development'),
  ('BSc Agricultural Education and Extension'),
  ('BSc Agriculture'),
  ('BSc Agribusiness Management and Trade'),
  ('BSc Agricultural Resource Management'),
  ('BSc Animal Health, Production and Processing'),
  ('BSc Animal Science and Technology'),
  ('BSc Biostatistics'),
  ('BSc Chemistry'),
  ('BSc Civil Engineering'),
  ('BSc Clinical Medicine and Community Health'),
  ('BSc Computer Science'),
  ('BSc Construction Management'),
  ('BSc Electrical and Electronic Engineering'),
  ('BSc Entrepreneurship'),
  ('BSc Environmental Horticulture and Landscaping'),
  ('BSc Environmental Science'),
  ('BSc Food Science and Nutrition'),
  ('BSc Geomatic Engineering and Geospatial Information Systems'),
  ('BSc Hospitality and Tourism Management'),
  ('BSc Human Resource Management'),
  ('BSc Industrial Chemistry'),
  ('BSc Information Technology'),
  ('BSc Land Resource Planning and Management'),
  ('BSc Landscape Architecture'),
  ('BSc Leather Technology'),
  ('BSc Manufacturing Engineering'),
  ('BSc Marine Engineering'),
  ('BSc Mathematics'),
  ('BSc Mechanical Engineering'),
  ('BSc Mechatronics Engineering'),
  ('BSc Medical Laboratory Sciences'),
  ('BSc Nursing'),
  ('BSc Occupational Safety and Health'),
  ('BSc Physics'),
  ('BSc Public Health'),
  ('BSc Quantity Surveying'),
  ('BSc Real Estate'),
  ('BSc Statistics'),
  ('BSc Telecommunication and Information Engineering'),
  ('BSc Textile Engineering'),
  ('BSc Agroforestry and Rural Development'),
  ('BSc Sustainable Energy and Climate Change'),
  ('BSc Architecture'),
  ('BSc Pharmacy'),
  ('BSc Petroleum Engineering'),
  ('Diploma in Information Technology'),
  ('Diploma in Computer Science'),
  ('Diploma in Food Science and Technology'),
  ('Diploma in Horticulture'),
  ('Diploma in Landscape Architecture'),
  ('Diploma in Medical Laboratory Sciences'),
  ('Diploma in Nursing'),
  ('Diploma in Nutrition and Dietetics'),
  ('Diploma in Occupational Safety and Health'),
  ('Diploma in Pharmaceutical Technology'),
  ('Diploma in Quantity Surveying'),
  ('Diploma in Real Estate Management'),
  ('Diploma in Telecommunication Engineering'),
  ('Diploma in Electrical and Electronic Engineering'),
  ('Diploma in Mechanical Engineering'),
  ('Diploma in Civil Engineering'),
  ('Certificate in Information Technology'),
  ('Certificate in Computer Science'),
  ('Certificate in Food Science and Technology'),
  ('Certificate in Horticulture'),
  ('Certificate in Medical Laboratory Sciences'),
  ('Certificate in Nursing'),
  ('Certificate in Nutrition and Dietetics'),
  ('Certificate in Occupational Safety and Health'),
  ('Certificate in Pharmaceutical Technology'),
  ('Certificate in Quantity Surveying'),
  ('Certificate in Real Estate Management'),
  ('Certificate in Telecommunication Engineering'),
  ('Certificate in Electrical and Electronic Engineering'),
  ('Certificate in Mechanical Engineering');

CREATE TABLE student_details(
student_email VARCHAR(100) PRIMARY KEY,
course VARCHAR(200),
lecturers VARCHAR(2000));

INSERT INTO student_details VALUES
('johnouko@students.jkuat.ac.ke', 'Diploma in Information Technology', 'Margeret Chebet, Pius Muiru'),
('nyaokewinnie@students.jkuat.ac.ke', 'Diploma in Information Technology', 'Pius Muiru, Agnes Njururi, Alex Simiyu'),
('bridgit.mwagudza@students.jkuat.ac.ke', 'BSc Mechatronics Engineering', 'Agnes Njururi, Alex Simiyu, Margeret Chebet');

CREATE TABLE lecturer_details(
email VARCHAR(100) PRIMARY KEY,
courses VARCHAR(2000));

INSERT INTO lecturer_details VALUES
('agnesnjururi@jkuat.ac.ke', 'BSc Industrial Chemistry,BSc Mechatronics Engineering,BSc Information Technology,BSc Leather Technology,Diploma in Information Technology,Diploma in Computer Science,Diploma in Food Science and Technology'),
('muiru.pius@jkuat.ac.ke', 'BSc Information Technology, BSc Land Resource Planning and Management,BSc Landscape Architecture,Diploma in Information Technology,Diploma in Computer Science,Diploma in Food Science and Technology'),
('alex.simiyu@jkuat.ac.ke', 'BSc Manufacturing Engineering,BSc Marine Engineering,BSc Information Technology,BSc Mathematics,BSc Mechanical Engineering,Diploma in Information Technology,Diploma in Computer Science,Diploma in Food Science and Technology'),
('margeretchebet@jkuat.ac.ke', 'BSc Information Technology,BSc Land Resource Planning and Management,BSc Mechatronics Engineering,Diploma in Computer Science,Diploma in Food Science and Technology');

CREATE TABLE borrow_request(
borrow_id INT PRIMARY KEY AUTO_INCREMENT,
borrower VARCHAR(100),
book_id INT,
ISBN_NO VARCHAR(100),
book_name VARCHAR(200),
edition VARCHAR(100),
author VARCHAR(200),
publisher VARCHAR(200),
date_published DATE,
book_type VARCHAR(100), 
expected_return_date DATE);

CREATE TABLE return_request(
return_id INT PRIMARY KEY AUTO_INCREMENT,
user_email VARCHAR(100),
issue_id INT,
ISBN_NO VARCHAR(100),
book_name VARCHAR(200),
date_issued DATE,
expected_return_date DATE,
issue_status VARCHAR(100),
penalty DECIMAL(8,2));


CREATE TABLE lec_reading_list_names(
list_ID INT PRIMARY KEY AUTO_INCREMENT,
lec_email VARCHAR(100),
course VARCHAR(100),
list_name VARCHAR(100));

INSERT INTO lec_reading_list_names(lec_email, course, list_name) VALUES
('agnesnjururi@jkuat.ac.ke', 'Diploma in Information Technology', 'Master Programming'),
('alex.simiyu@jkuat.ac.ke', 'Diploma in Information Technology', 'Understanding History'),
('agnesnjururi@jkuat.ac.ke', 'BSc Mechatronics Engineering', 'Master Programming'),
('muiru.pius@jkuat.ac.ke', 'Diploma in Information Technology', 'Black History'),
('muiru.pius@jkuat.ac.ke', 'Diploma in Information Technology', 'Enhance Creativity');


CREATE TABLE reading_list(
list_id INT PRIMARY KEY AUTO_INCREMENT,
course VARCHAR(100),
list_name VARCHAR(100),
ISBN_NO VARCHAR(30),
book_name VARCHAR(1000),
edition VARCHAR(100),
author VARCHAR(200),
lecturer_name VARCHAR(100),
lecturer_email VARCHAR(100));

INSERT INTO reading_list(course, list_name, ISBN_NO, book_name, edition, author,  lecturer_name, lecturer_email) VALUES
('Diploma in Information Technology', 'Master Programming', '9780263263102', 'Communicating with Data', 'First Edition', 'Carl Allchin', 'Agnes Njururi', 'agnesnjururi@jkuat.ac.ke'),
('Diploma in Information Technology', 'Master Programming', '9780262542463', 'Technology in World Civilization', 'Revised And Expanded Edition', 'Arnold Pacey and Francesca Bray', 'Agnes Njururi', 'agnesnjururi@jkuat.ac.ke'),
('Diploma in Information Technology', 'Master Programming', '9780262539968', 'Technology & Society', 'Second Edition', 'Deborah G. Johnson and Jameson M. Wetmore', 'Agnes Njururi', 'agnesnjururi@jkuat.ac.ke'),
('Diploma in Information Technology', 'Understanding History', '9400243670361', 'The Autobiography of Malcolm X', 'First Edition', 'Malcolm X, Alex Haley', 'Alex Simiyu', 'alex.simiyu@jkuat.ac.ke'),
('Diploma in Information Technology', 'Understanding History', '9400243698894', 'I Am Malala: How One Girl Stood Up for Education and Changed the World', 'First Edition', 'Malala Yousafzai, Christina Lamb', 'Alex Simiyu', 'alex.simiyu@jkuat.ac.ke'),
('BSc Mechatronics Engineering', 'Master Programming', '9780263263102', 'Communicating with Data', 'First Edition', 'Carl Allchin', 'Agnes Njururi', 'agnesnjururi@jkuat.ac.ke'),
('BSc Mechatronics Engineering', 'Master Programming', '9780263263102', 'Communicating with Data', 'First Edition', 'Carl Allchin', 'Agnes Njururi', 'agnesnjururi@jkuat.ac.ke'),
('Diploma in Information Technology', 'Enhance Creativity', '9780262542463', 'Technology in World Civilization', 'Revised And Expanded Edition', 'Arnold Pacey and Francesca Bray', 'Pius Muiru', 'muiru.pius@jkuat.ac.ke'),
('Diploma in Information Technology', 'Enhance Creativity', '9780571230563', 'Tales from Firozsha Baag', 'Main Edition', 'Rohinton Mistry', 'Pius Muiru', 'muiru.pius@jkuat.ac.ke'),
('Diploma in Information Technology', 'Black History', '9400243670361', 'The Autobiography of Malcolm X', 'First Edition', 'Malcolm X, Alex Haley', 'Pius Muiru', 'muiru.pius@jkuat.ac.ke'),
('Diploma in Information Technology', 'Black History', '9400243698894', 'I Am Malala: How One Girl Stood Up for Education and Changed the World', 'First Edition', 'Malala Yousafzai, Christina Lamb', 'Pius Muiru', 'muiru.pius@jkuat.ac.ke');


