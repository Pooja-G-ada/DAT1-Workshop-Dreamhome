.open driver.sqlite

.mode column

DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS drivers;


CREATE TABLE vehicles (
    vehicleID   INT NOT NULL    UNIQUE  PRIMARY KEY,
    odoReading  INT NOT NULL,
    name TEXT
);

CREATE TABLE drivers (
    driverID    INT NOT NULL    UNIQUE  PRIMARY KEY,
    age         INT NOT NULL,
    car         INT,
    FOREIGN KEY (car)           REFERENCES vehicles(vehicleID)
);

INSERT INTO vehicles (vehicleID, odoReading, name)
VALUES (1, 15000, 'Ford Focus');

INSERT INTO vehicles (vehicleID, odoReading, name)
VALUES (2, 85000, 'Honda Civic');

INSERT INTO vehicles (vehicleID, odoReading, name)
VALUES (3, 250000, 'Toyota Camry');

INSERT INTO vehicles (vehicleID, odoReading, name)
VALUES (4, 5500, 'Tesla Model 3');

INSERT INTO vehicles (vehicleID, odoReading, name)
VALUES (5, 120000, 'Chevrolet Silverado');

INSERT INTO vehicles (vehicleID, odoReading, name)
VALUES (6, 35000, 'BMW X5');

--drivers info
INSERT INTO drivers (driverID, age, car)
VALUES (1, 35, 3);

INSERT INTO drivers (driverID, age, car)
VALUES (2, 28, 1);

INSERT INTO drivers (driverID, age, car)
VALUES (3, 52, 5);

INSERT INTO drivers (driverID, age, car)
VALUES (4, 22, 4);

--Inner Join query
SELECT * 
FROM drivers dr
INNER JOIN vehicles vh
ON dr.car = vh.vehicleID;

--left Join query
SELECT * 
FROM vehicles vh
LEFT JOIN drivers dr
ON dr.car = vh.vehicleID;