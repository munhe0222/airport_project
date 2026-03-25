DROP DATABASE IF EXISTS airport_db;
CREATE DATABASE airport_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE airport_db;

CREATE TABLE aircrafts (
    aircraft_id  INT          NOT NULL AUTO_INCREMENT,
    model        VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100) NOT NULL,
    capacity     INT          NOT NULL,
    reg_number   VARCHAR(20)  NOT NULL UNIQUE,
    PRIMARY KEY (aircraft_id)
);

CREATE TABLE flights (
    flight_id     INT          NOT NULL AUTO_INCREMENT,
    flight_number VARCHAR(20)  NOT NULL UNIQUE,
    origin        VARCHAR(100) NOT NULL,
    destination   VARCHAR(100) NOT NULL,
    departure     DATETIME     NOT NULL,
    arrival       DATETIME     NOT NULL,
    aircraft_id   INT          NOT NULL,
    PRIMARY KEY (flight_id),
    CONSTRAINT fk_flight_aircraft FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id)
);

CREATE TABLE passengers (
    passenger_id INT          NOT NULL AUTO_INCREMENT,
    first_name   VARCHAR(100) NOT NULL,
    last_name    VARCHAR(100) NOT NULL,
    passport_no  VARCHAR(20)  NOT NULL UNIQUE,
    email        VARCHAR(150) NOT NULL UNIQUE,
    phone        VARCHAR(20)  NOT NULL,
    PRIMARY KEY (passenger_id)
);

CREATE TABLE tickets (
    ticket_id     INT           NOT NULL AUTO_INCREMENT,
    ticket_number VARCHAR(30)   NOT NULL UNIQUE,
    passenger_id  INT           NOT NULL,
    flight_id     INT           NOT NULL,
    seat_number   VARCHAR(10)   NOT NULL,
    price         DECIMAL(10,2) NOT NULL,
    booking_date  DATE          NOT NULL,
    PRIMARY KEY (ticket_id),
    CONSTRAINT fk_ticket_passenger FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    CONSTRAINT fk_ticket_flight    FOREIGN KEY (flight_id)    REFERENCES flights(flight_id)
);

INSERT INTO aircrafts (model, manufacturer, capacity, reg_number) VALUES
('Boeing 737-800', 'Boeing',  189, 'MNG-737-01'),
('Airbus A320',    'Airbus',  180, 'MNG-A320-02'),
('Boeing 787-9',   'Boeing',  296, 'MNG-787-03'),
('Airbus A321neo', 'Airbus',  220, 'MNG-A321-04'),
('Embraer E190',   'Embraer', 100, 'MNG-E190-05');

INSERT INTO flights (flight_number, origin, destination, departure, arrival, aircraft_id) VALUES
('MN101', 'Ulaanbaatar', 'Beijing',     '2025-06-01 08:00:00', '2025-06-01 12:00:00', 1),
('MN202', 'Ulaanbaatar', 'Tokyo',       '2025-06-02 10:30:00', '2025-06-02 18:30:00', 2),
('MN303', 'Ulaanbaatar', 'Seoul',       '2025-06-03 07:00:00', '2025-06-03 13:00:00', 3),
('MN404', 'Beijing',     'Ulaanbaatar', '2025-06-04 14:00:00', '2025-06-04 18:00:00', 1),
('MN505', 'Tokyo',       'Ulaanbaatar', '2025-06-05 20:00:00', '2025-06-06 04:00:00', 4),
('MN606', 'Ulaanbaatar', 'Frankfurt',   '2025-06-06 23:00:00', '2025-06-07 06:00:00', 3);

INSERT INTO passengers (first_name, last_name, passport_no, email, phone) VALUES
('Batbold',  'Dorj',     'MN1234567', 'batbold@example.mn',  '+97699001122'),
('Oyunaa',   'Ganbayar', 'MN2345678', 'oyunaa@example.mn',   '+97699003344'),
('Enkhtuyaa','Bold',     'MN3456789', 'enkh@example.mn',     '+97699005566'),
('Munkhbayar','Tsedev',  'MN4567890', 'munkh@example.mn',    '+97699007788'),
('Solongo',  'Batsuren', 'MN5678901', 'solongo@example.mn',  '+97699009900'),
('Ariunaa',  'Nyamdorj', 'MN6789012', 'ariunaa@example.mn',  '+97699001234'),
('Tegshbayar','Lkhagva', 'MN7890123', 'tegsh@example.mn',    '+97699005678');

INSERT INTO tickets (ticket_number, passenger_id, flight_id, seat_number, price, booking_date) VALUES
('TKT-0001', 1, 1, '12A', 250.00, '2025-05-01'),
('TKT-0002', 2, 1, '12B', 250.00, '2025-05-01'),
('TKT-0003', 3, 2, '05C', 480.00, '2025-05-02'),
('TKT-0004', 4, 2, '07A', 480.00, '2025-05-03'),
('TKT-0005', 5, 3, '15B', 320.00, '2025-05-04'),
('TKT-0006', 1, 3, '20A', 320.00, '2025-05-04'),
('TKT-0007', 2, 4, '08C', 260.00, '2025-05-05'),
('TKT-0008', 6, 5, '01A', 510.00, '2025-05-06'),
('TKT-0009', 7, 6, '22D', 890.00, '2025-05-07'),
('TKT-0010', 3, 6, '22E', 890.00, '2025-05-07');

SELECT p.passenger_id, CONCAT(p.first_name,' ',p.last_name) AS passenger_name,
       t.ticket_number, f.flight_number, f.origin, f.destination, a.model
FROM tickets t
JOIN passengers p ON t.passenger_id = p.passenger_id
JOIN flights    f ON t.flight_id    = f.flight_id
JOIN aircrafts  a ON f.aircraft_id  = a.aircraft_id
ORDER BY f.departure;


SELECT f.flight_number, f.origin, f.destination, COUNT(t.ticket_id) AS passenger_count
FROM flights f
LEFT JOIN tickets t ON f.flight_id = t.flight_id
GROUP BY f.flight_id, f.flight_number, f.origin, f.destination
ORDER BY passenger_count DESC;

SELECT f.flight_number, f.origin, f.destination, COUNT(t.ticket_id) AS passenger_count
FROM flights f
JOIN tickets t ON f.flight_id = t.flight_id
GROUP BY f.flight_id, f.flight_number, f.origin, f.destination
HAVING COUNT(t.ticket_id) = (
    SELECT MAX(cnt) FROM (SELECT COUNT(ticket_id) AS cnt FROM tickets GROUP BY flight_id) s
);


SELECT p.passenger_id, CONCAT(p.first_name,' ',p.last_name) AS passenger_name,
       COUNT(t.ticket_id) AS flight_count
FROM passengers p
JOIN tickets t ON p.passenger_id = t.passenger_id
GROUP BY p.passenger_id, p.first_name, p.last_name
HAVING COUNT(t.ticket_id) >= 2
ORDER BY flight_count DESC;

CREATE USER IF NOT EXISTS 'admin_user'@'localhost'  IDENTIFIED BY 'Admin@2025!';
CREATE USER IF NOT EXISTS 'report_user'@'localhost' IDENTIFIED BY 'Report@2025!';
GRANT ALL PRIVILEGES ON airport_db.* TO 'admin_user'@'localhost';
GRANT SELECT         ON airport_db.* TO 'report_user'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'admin_user'@'localhost';
SHOW GRANTS FOR 'report_user'@'localhost';
