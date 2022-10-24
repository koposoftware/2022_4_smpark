DROP TABLE prime_rate;

CREATE TABLE prime_rate
(
    prime_rate    NUMBER(5,2) NOT NULL,
    saving_code    number(5) NOT NULL,
    condition    NUMBER(10) NOT NULL
);

INSERT INTO prime_rate VALUES (1.5, 1, 50000);
INSERT INTO prime_rate VALUES (2.0, 1, 200000);
INSERT INTO prime_rate VALUES (2.6, 1, 400000);
INSERT INTO prime_rate VALUES (3.2, 1, 600000);
INSERT INTO prime_rate VALUES (4.0, 1, 800000);
INSERT INTO prime_rate VALUES (5.0, 1, 1000000);
    
SELECT * FROM PRIME_RATE;



