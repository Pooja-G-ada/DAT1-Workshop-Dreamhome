.open sample.sqlite

.mode column 

DROP TABLE IF EXISTS contacts; 
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS voter;

CREATE TABLE contacts (
    contact_id  INTEGER PRIMARY KEY,
    first_name  TEXT    NOT NULL,
    last_name   TEXT    NOT NULL DEFAULT 'No Surname',
    email       TEXT    UNIQUE, 
    phone       TEXT    NOT NULL
);

INSERT INTO contacts (contact_id, first_name, last_name, email, phone)
VALUES (1, 'Pooja', 'Gurung', 'pooja.gurung@email.com', '123123123');

INSERT INTO contacts (contact_id, first_name, last_name, email, phone)
VALUES (2, 'Dave', ' ', 'dave.brown@email.com', '123123124');

CREATE TABLE products (
    product_id      INTEGER PRIMARY KEY,
    product_name    TEXT NOT NULL, 
    product_price   DECIMAL (10, 2) NOT NULL, --CHECK(product_price >= discount) CHECK(product_price >= 0) ,
    discount        DECIMAL (10, 2) NOT NULL --CHECK(discount >= 0)
);

INSERT INTO products (product_id, product_name, product_price, discount)
VALUES (1, 'phone', 500, 0);

CREATE TABLE voter (
    voter_id    INTEGER PRIMARY KEY,
    name        TEXT, 
    age         INTEGER CHECK (age >= 18),
    dob         DATE
);

INSERT INTO voter (voter_id, name, age, dob)
VALUES (1, 'Alex', 18, 2006-01-31);