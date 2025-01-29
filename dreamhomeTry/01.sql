.open dreamHomeTry.sqlite 
--creates the database file
DROP TABLE IF EXISTS branch;

CREATE TABLE branch (
    branchno    CHAR(4)         NOT NULL    UNIQUE   PRIMARY KEY    CHECK(branchno LIKE'b%'), --LIKE 'b[0-9][0-9][0-9]'
    street      VARCHAR(60),
    city        VARCHAR,
    postcode    VARCHAR(6)      NOT NULL    CHECK(LENGTH(postcode) = 8)  
);

INSERT INTO branch (branchno, street, city, postcode) 
VALUES('b005', '22 Deer Rd', 'London', 'SW1 4EH');