.open vet.sqlite --creates the database file

DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS payments;

CREATE TABLE customer(
    customer_id             INT         NOT NULL    PRIMARY KEY,
    name                    TEXT        NOT NULL,
    phone                   INT         NOT NULL,
    address1                TEXT        NOT NULL, 
    address2                TEXT
);

INSERT INTO pet (pet_id, name, type, age, customer_id) 
VALUES(1, 'Brown', 'Charlie', '9939 Springfield Road', 'Wood Green');

CREATE TABLE pet(
    pet_id      INT         NOT NULL    PRIMARY KEY,
    name        TEXT        NOT NULL,
    type        TEXT        NOT NULL,
    age         INT         NOT NULL, 
    customer_id     INT         FOREIGN KEY
);

INSERT INTO pet (pet_id, name, type, age, customer_id) 
VALUES(1, 'Brown', 'Charlie', '9939 Springfield Road', 'Wood Green');