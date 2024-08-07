ALTER TABLE Visit
ADD PRESENT_STATUS VARCHAR2(15) DEFAULT 'Nothing';

ALTER TABLE Agent_Person
ADD Visit_Rate NUMBER DEFAULT 100;

ALTER TABLE Agent_Person
ADD Sale_Rate NUMBER DEFAULT 0.8;

ALTER TABLE Agent_Person
ADD CONSTRAINT check_sale_rate
CHECK (Sale_Rate BETWEEN 0 AND 1);

ALTER TABLE Agent_Person
ADD Active_Status NUMBER(1) DEFAULT 1;

ALTER TABLE Agent_Person
ADD Exit_Date DATE DEFAULT NULL;

ALTER TABLE Apartment
ADD Sold NUMBER(1) DEFAULT 0;

ALTER TABLE Seller
MODIFY (Phone_Number NUMBER(15));
