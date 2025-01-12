-- CREATE DATABASE TGroomers;
-- 1. creating the database for my groomers scenario.

-- USE TGroomers;
-- 2. telling SQL to use my database so I can start creating my tables

-- 3. creating my tables:
-- wherever I'm creating an ID column, I've made a PK and used AUTO_INCREMENT so that avoids duplicates being made and it doesn't require me to make this up
-- In the appointments table I'm declaring that the table has FKs and is referencing the PKs in the other 3 tables
-- I've used ENUM to declare different experience levels and to use a variety of data types instead of repeating VARCHAR()
CREATE TABLE servicesList
(
serviceID INT primary key AUTO_INCREMENT NOT NULL,
serviceName VARCHAR (250) NOT NULL,
servicePrice DECIMAL (6,2) NOT NULL,
serviceDuration TIME NOT NULL,
serviceAvailable BOOLEAN NOT NULL
);

CREATE TABLE clientList
(
clientID INT AUTO_INCREMENT primary key NOT NULL,
firstName VARCHAR(250) NOT NULL,
lastName VARCHAR(250),
emailAddress VARCHAR(250) NOT NULL,
dogName VARCHAR(250) NOT NULL,
dogBreed VARCHAR(250)
);

CREATE TABLE groomers
(
groomerID INT AUTO_INCREMENT primary key NOT NULL,
firstName VARCHAR(250) NOT NULL,
lastName VARCHAR(250) NOT NULL,
experienceLevel ENUM ('Junior', 'Mid', 'Senior') NOT NULL,
available BOOLEAN
);

CREATE TABLE appointments
(
appointmentID INT AUTO_INCREMENT primary key NOT NULL,
clientID INT NOT NULL,
serviceID INT,
groomerID INT NOT NULL,
appointmentDate DATE NOT NULL,
appointmentTime TIME NOT NULL,
amountDue DECIMAL (6,2),
FOREIGN KEY (clientID) REFERENCES clientList (clientID),
FOREIGN KEY (serviceID) REFERENCES servicesList (serviceID),
FOREIGN KEY (groomerID) REFERENCES groomers (groomerID)
);

-- 4. adding a constraint to the clientList 'emailAddress' column so that each entry is unique and satisfies assignment requirements
ALTER TABLE clientList
ADD CONSTRAINT UNIQUE
(emailAddress);

-- 5. inserting values into my tables:
INSERT INTO servicesList
(serviceID, serviceName, servicePrice, serviceDuration, serviceAvailable)
VALUES
(1, 'Full Adult Doggo Groom', 75.00, '01:30:00', TRUE),
(2, 'Fully Puppy Groom', 45.00, '01:00:00', TRUE),
(3, 'Ears, nails and teeth clean', 35.00, '00:45:00', TRUE),
(4, 'Hand strip only', 70.00, '02:00:00', TRUE),
(5, 'Hand strip with ears, nails and teeth clean', 100.00, '03:00:00', TRUE),
(6, 'Puppy pamper', 60.00, '01:00:00', FALSE),
(7, 'Adult Doggo pamper', 90.00, '01:30:00', TRUE),
(8, 'Home Groom Visit', 150.00, '02:00:00', FALSE),
(9, 'Coat treatment', 30.00, '00:45:00', TRUE),
(10, 'Dog show prep', 300.00, '04:00:00', FALSE);

INSERT INTO clientList
(firstName, lastName, emailAddress, dogName, dogBreed)
VALUES
("Helly", "Law", "hellylaw@gmail.com", "Pip", "Whippet"),
("Milly", "George", "mgeorge@aol.com", "Lazlo", "Vizla"),
("Amanda", "", "mandycs@gmail.com", "Ken", "Shiba Inu"),
("Georgina", "", "agnesgeorgie@aol.com", "Ethel", ""),
("Richard", "Clarke", "clarker96@hotmail.com", "Lizzy", "French Bulldog"),
("Felix", "Karne", "karne.fe@gmail.com", "Button", ""),
("Tash", "", "nutmegjo@gmail.com", "Nutmeg", "Border Terrier"),
("Dee", "Pas", "pascjax@dogmail.com", "Jax", "Border Collie"),
("Tizzy", "Richardson", "tizzy@catmail.com", "Sofia", "");

INSERT INTO groomers
(firstName, lastName, experienceLevel, available)
VALUES
("Elise", "Vig", "Junior", TRUE),
("Aneed", "Javi", "Senior", TRUE),
("Ibrah", "Tor", "Mid", TRUE),
("Jas", "Hey", "Junior", FALSE),
("Tia", "Hey", "Senior", TRUE),
("Bushra", "Abodl", "Junior", FALSE),
("Micah", "Bluetop", "Mid", TRUE),
("Joy", "Privot", "Junior", TRUE);

INSERT INTO appointments
(clientID, serviceID, groomerID, appointmentDate, appointmentTime, amountDue)
VALUES
(3, 1, 5, '2024-09-30', '09:30:00', 75.00),
(8, 9, 8, '2024-08-03', '12:00:00', 30.00),
(5, 2, 2, '2024-10-05', '09:00:00', 45.00),
(4, 5, 1, '2024-10-01', '15:00:00', 100.00),
(1, 3, 8, '2024-11-22', '13:30:00', 35.00);

-- 6. writing 5 queries to retrieve data:
-- query 1 (retrieval) = ordering appointments using ORDER BY keyword to show appointments happening later in the year first:
SELECT *
FROM appointments
ORDER BY appointmentDate DESC
;

-- query 2 (retrieval) = ordering the 'Junior' level groomers using ORDER BY and IN:
SELECT *
FROM groomers
WHERE experienceLevel IN ('Junior')
ORDER BY firstName ASC
;

-- query 3 (retrieval) = building on query 2 to filter out the available 'Junior' level groomers using the AND operator:
SELECT *
FROM groomers
WHERE experienceLevel IN ('Junior') AND available = TRUE
;

-- query 4 (retrieval) = finding the name and price of grooming services under 70.00 and saving them to the table alias 'services_under_70quid' with the prices shown in descending order:
SELECT serviceName, servicePrice AS services_under_70quid
FROM servicesList
WHERE servicePrice <= 70.00
ORDER BY services_under_70quid DESC
;

-- query 5 (retrieval) = finding out the appointment times and presenting them in a nice format using seconds using TIME FORMAT '%H:%i' to show hours and minutes:
SELECT serviceName, servicePrice,
TIME_FORMAT(serviceDuration, '%H:%i')
AS shortTime_serviceDuration
FROM servicesList
;

-- 7. writing a DELETE FROM query to delete the groomers who's status is not active:
DELETE FROM groomers
WHERE available = FALSE
;

-- 8. writing an INSERT INTO query to add a new groomer who's status is active:
INSERT INTO groomers
(firstName, lastName, experienceLevel, available)
VALUES
("Stef", "Bach", "Senior", TRUE)
;

-- 9. Ibrah is going on holiday, so we need to set his availability to not active using an UPDATE statement:
UPDATE groomers
SET available = False
WHERE firstName = "Ibrah" AND lastName = "Tor"
;

-- 10. updating the appointments table because some new appointments were booked in:
INSERT INTO appointments
(clientID, serviceID, groomerID, appointmentDate, appointmentTime, amountDue)
VALUES
(7, 7, 9, '2024-12-20', '11:30:00', 90.00),
(2, 5, 1, '2025-01-09', '15:45:00', 100.00),
(9, 2, 2, '2025-01-14', '09:55:00', 45.00),
(4, 1, 5, '2024-11-05', '17:15:00', 75.00),
(1, 3, 5, '2024-03-29', '19:00:00', 35.00),
(5, 3, 7, '2024-07-21', '15:15:00', 35.00),
(9, 9, 2, '2024-06-02', '08:30:00', 30.00)
;

-- we're doing our books and need to use some aggregate functions to figure out how we're doing financially:
-- 11. using SUM() to find out how much money was made in 2024s appointments
-- using an INENER JOIN to link the appointments table and servicesList using the serviceID:
SELECT SUM(amountDue) AS total_earnings2024
FROM appointments
JOIN servicesList  ON appointments.serviceID = servicesList.serviceID -- joining the appointments and servicesList tables
WHERE YEAR (appointments.appointmentDate) = 2024 -- specifying the year as 2024
;

-- 12. using AVG() to find out the average spend of our clients from 2024s appointments
SELECT AVG(amountDue) AS average_spend2024
FROM appointments
;
-- 13. the average from our average spend includes too many decimal places so we're rounding the figure to 2 decimaal places using the ROUND() function:
SELECT ROUND(62.954545, 2) AS rounded_average_spend2024
;

-- 14. we're rewarding our top 3 clients who booked the most appointments with a surprise £15 off coupon, using COUNT() we're going to find out who they are:
SELECT clientList.firstName, clientList.emailAddress,
COUNT(appointments.appointmentID) AS total_appointments -- counting number of appointments per client
FROM appointments
JOIN clientList ON appointments.clientID = clientList.clientID -- joining the appointments table with client list using the clientID column
GROUP BY clientList.clientID, clientList.firstName, clientList.emailAddress
ORDER BY total_appointments DESC -- ordering the results to return more entries
LIMIT 3 -- specifying that we want 3 results to be returned
;

-- 15. updating Tizzy's email address because it was input incorrectly using a "@catmail.com" domain and needs to be updated so they can recieve their cupon:
UPDATE clientList
SET emailAddress = "tizzy@dogmail.com"
WHERE firstName = "Tizzy" AND lastName = "Richardson"
;

-- Stored Procedure:
-- use case:
-- our booking system is quite limited because our clients can't book multiple services in their appointments and we want to improve our system to manage that and improve our profits for 2025
-- using a stored procedure to do this is handy, but I need to first create a junction table to link the appointments and servicesList and enable this new functionality
-- 1. creating a junction table using the PKs and FKs from the appointments and servicesList tables:

CREATE TABLE multipleServiceAppointments
(
appointmentID INT NOT NULL,
serviceID INT NOT NULL,
PRIMARY KEY (appointmentID, serviceID), -- using the appointmentID and serviceID columns as the PK
FOREIGN KEY (appointmentID) REFERENCES appointments(appointmentID),
FOREIGN KEY (serviceID) REFERENCES servicesList(serviceID)
);

-- now that the junction table has been made to capture appointments with mutliple services booked, I can create the stored procedure:
-- 2. stored procedure script:

DELIMITER // -- changing the DELIMITER
CREATE PROCEDURE adding_multipleServiceAppointments -- naming the stored procedure
(
IN clientID INT, -- using IN to define that these values are input to the stored procedure so this needs to be specified when we use the procedure to INSERT INTO the multipleServiceAppointments table
IN groomerID INT,
IN appointmentDate DATE,
IN appointmentTime TIME,
IN amountDue DECIMAL(6,2),
IN servicesList VARCHAR(250)
)
BEGIN

DECLARE appointmentID INT; -- putting the appointment into the appointments table

INSERT INTO
appointments (clientID, groomerID, appointmentDate, appointmentTime, amountDue)
VALUES
(clientID, groomerID, appointmentDate, appointmentTime, amountDue);

SET
appointmentID = LAST_INSERT_ID(); -- using the LAST_INSERT_ID() function to autoincrement the new data in line with the appointmentID column

INSERT INTO
multipleServiceAppointments (appointmentID, serviceID)
VALUES
(newAppointmentID, curServiceID);

INSERT INTO
multipleServiceAppointments (appointmentID, serviceID)
VALUES
(newAppointmentID, serviceIDs);

END //

DELIMITER ; -- changing the DELIMITER back to default

-- 3. calling the stored procedure:
-- adding an appointment for client Amanda with groomer Tia on 3-10-2024 at 9am
-- for services 1.Full Adult Doggo Groom and 3.Ears, nails and teeth clean
-- which totals to £120.00
-- I think I made a mistake somewhere because the procedure is saved but it won't add the info when I CALL it
CALL
adding_multipleServiceAppointments
(3, 5, '2024-10-03', '09:00:00', 120.00, '1,3')
;