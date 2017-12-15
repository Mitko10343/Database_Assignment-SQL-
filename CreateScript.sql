DROP TABLE ORDERS;
DROP TABLE ANIMALS;
DROP TABLE STOCK;
DROP TABLE PURCHASE;
DROP TABLE IS_DISEASED;
DROP TABLE DISEASE;
DROP TABLE TREATMENT;
DROP TABLE STAFF;
DROP TABLE CUSTOMER;
DROP TABLE SPECIES;
DROP TABLE SUPPLIER;

-- Create tbales. 

CREATE TABLE SUPPLIER
(
  supplierID number not null,
  supplierName varchar2(32) not null unique,
  supplierAddress varchar2(50) not null,
  supplierEmail varchar2(32) not null,
  
  PRIMARY KEY(supplierID)
);

CREATE TABLE SPECIES
(
  speciesID NUMBER NOT NULL ,
  speciesType VARCHAR2(32) not null unique,
  speciesPrice number not null,
  cageSize varchar2(20) not null,
  speciesInstructs varchar2(100) not null,
  vetCertificate varchar2(20),
  units number not null,
  
  PRIMARY KEY(speciesID)
);

CREATE TABLE CUSTOMER
(
  customerID number not null,
  customerName varchar2(32) not null,
  customerEmail varchar2(32) not null,
  customerAddress varchar2(50) not null,
  
  PRIMARY KEY(customerID)
  
);

--sample pl/sql you could write is to add units to stock when an order comes in

CREATE TABLE STAFF
(
  staffID number not null,
  staffName varchar2(32) not null,
  
  PRIMARY KEY(staffID)
);



CREATE TABLE TREATMENT
(
  treatmentNumber number not null,
  treatmentResult varchar2(20) ,
  
  Primary Key(treatmentNumber)
);


create table DISEASE
(

  diseaseName varchar2(20),
  diseaseDesc varchar2(40) not null,
  
  PRIMARY KEY(diseaseName)
);

CREATE TABLE IS_DISEASED
(

  isDiseased number not null,
  treatmentNumber number,
  diseaseName varchar2(20),
  
  PRIMARY KEY(isDiseased),
  foreign key(treatmentNumber) references treatment(treatmentNumber),
  foreign key(diseaseName) references disease(diseaseName)
);

CREATE TABLE PURCHASE
(
   purchaseID number not null,
   staffID number not null,
   customerID number not null,
   
   PRIMARY KEY(purchaseID),
   foreign key(staffID) references staff(staffID),
   foreign key(customerID) references customer(customerID)
 
);

CREATE TABLE STOCK 
(
  stockID number not null,
  stockName varchar2(32) not null,
  sotckDesc varchar2(50) not null,
  stockPrice number not null,
  stockLevels number not null,
  purchaseID number,
  
  PRIMARY KEY(stockID),
  foreign key(purchaseID) references purchase(purchaseID)
);


CREATE TABLE ANIMALS
(
  animalID number not null,
  purchaseID number,
  speciesID number not null,
  isDiseased number not null,
  animalType varchar2(32) not null,
  
  
  PRIMARY KEY(animalID),
  FOREIGN KEY(speciesID) references species(speciesID),
  FOREIGN KEY(isDiseased) references is_diseased(isDiseased),
  FOREIGN KEY(purchaseID) references purchase(purchaseID)
);


--sample pl/sql you could write is an order is made when stock units drop
CREATE TABLE ORDERS
(
  orderNumber number not null,
  speciesID number,
  stockID number,
  supplierID number,
  staffID number not null,
  numberOfUnits number ,
  numberOfSpecies number ,
  
  FOREIGN KEY(stockID) references stock(stockID),
  FOREIGN KEY(staffID) references staff(staffID),
  FOREIGN KEY(supplierID) references supplier(supplierID),
  FOREIGN KEY(speciesID) references species(speciesID)
);

--INSERTS

--SUPPLIER TABLE
INSERT INTO SUPPLIER (supplierID,supplierName, supplierAddress, supplierEmail) 
  VALUES (101,'Canine Good','5 Grove Rd', 'canine_goods@gmail.com');
INSERT INTO SUPPLIER (supplierID,supplierName, supplierAddress, supplierEmail) 
  VALUES (102,'Fish Masters','2404 Dock Ave', 'fish_masters@gmail.com');
INSERT INTO SUPPLIER (supplierID,supplierName, supplierAddress, supplierEmail) 
  VALUES (103,'Pet Stop','24 Dawson St', 'pet_stop@gmail.com');
INSERT INTO SUPPLIER (supplierID,supplierName, supplierAddress, supplierEmail) 
  VALUES (104,'Dalmation Nation','55 Pukka Rd','dalmation_nation@gmail.com');
INSERT INTO SUPPLIER (supplierID,supplierName, supplierAddress, supplierEmail) 
  VALUES (105,'Guicci','24 Grove Rd', 'guicci_goods@gmail.com');

--SPECIES TABLE - need to change instructions I think
INSERT INTO SPECIES (speciesID, speciesType, speciesPrice, cageSize, speciesInstructs, vetCertificate, units) 
  VALUES (1001, 'Labrador', 300, 'Large', 'Feed Twice Daily', 'yes', 3);
INSERT INTO SPECIES (speciesID, speciesType, speciesPrice, cageSize, speciesInstructs, vetCertificate, units) 
  VALUES (1002, 'Hamster', 20, 'Medium', 'Feed Daily, Clean Cage weekly', 'no', 8);
INSERT INTO SPECIES (speciesID, speciesType, speciesPrice, cageSize, speciesInstructs, vetCertificate, units) 
  VALUES (1003, 'Gold Fish', 6, 'Small', 'Feed Daily, Clean tank monthly', 'no', 45);
INSERT INTO SPECIES (speciesID, speciesType, speciesPrice, cageSize, speciesInstructs, units) 
  VALUES (1004, 'Gerbil', 25, 'Medium', 'Feed Daily, Clean Cage weekly', 4);
INSERT INTO SPECIES (speciesID, speciesType, speciesPrice, cageSize, speciesInstructs, vetCertificate, units) 
  VALUES (1005,'Angel Fish', 35, 'Medium', 'Feed Daily, Clean Tank monthly', 'no', 12);
INSERT INTO SPECIES (speciesID, speciesType, speciesPrice, cageSize, speciesInstructs, vetCertificate, units) 
  VALUES (1006,'Monkey', 395, 'Medium', 'Feed Daily', 'yes', 3);
  
--CUSTOMER TABLE
INSERT INTO CUSTOMER (customerID,customerName,customerEmail,customerAddress)
  VALUES (2001, 'John White', 'white@gmail.com', '33 Rounder Rd');
INSERT INTO CUSTOMER (customerID,customerName,customerEmail,customerAddress)
  VALUES (2002, 'Mary Black', 'mblack@gmail.com', '22 Pen Rd');
INSERT INTO CUSTOMER (customerID,customerName,customerEmail,customerAddress)
  VALUES (2003, 'Sean Perry', 'sperry@gmail.com', '9009 Binder Ave');
INSERT INTO CUSTOMER (customerID,customerName,customerEmail,customerAddress)
  VALUES (2004, 'Jade Kinder', 'jkinder@gmail.com', '123 abc St');
INSERT INTO CUSTOMER (customerID,customerName,customerEmail,customerAddress)
  VALUES (2005, 'Dan Byrne', 'dbyrne@gmail.com', '1 Commons Rd');
  
--STOCK TABLE 
INSERT INTO STOCK (stockID, stockName, sotckDesc, stockPrice, stockLevels)
  VALUES(3001, 'RodentStraw','Hamster Bedding', 4.5, 15);
INSERT INTO STOCK (stockID, stockName, sotckDesc, stockPrice, stockLevels)
  VALUES(3002, 'Fish Flakes','Fish Food', 2, 20);
INSERT INTO STOCK (stockID, stockName, sotckDesc, stockPrice, stockLevels)
  VALUES(3003, 'Pedigree','Dog Food', 7, 10);
INSERT INTO STOCK (stockID, stockName, sotckDesc, stockPrice, stockLevels)
  VALUES(3004, 'Lab Leather','Dog Leash', 6, 2);
INSERT INTO STOCK (stockID, stockName, sotckDesc, stockPrice, stockLevels)
  VALUES(3005, 'Whiskas','Cat Milk', 3, 10);

--STAFF TABLE 
INSERT INTO STAFF (staffID,staffName)
  VALUES(001, 'Peter Owner');
INSERT INTO STAFF (staffID,staffName)
  VALUES(002, 'Brendan Carroll');

--DISEASE
INSERT INTO DISEASE(diseaseName,diseaseDesc)
VALUES('Anthrax','Disease cause by Bacteria');
INSERT INTO DISEASE(diseaseName,diseaseDesc)
VALUES('Blue Tongue','Non-contagious viral disease');
INSERT INTO DISEASE(diseaseName,diseaseDesc)
VALUES('Fowl Pox','Viral Disease');
INSERT INTO DISEASE(diseaseName,diseaseDesc)
VALUES('Lumpy Jaw','bacterial Disease');
INSERT INTO DISEASE(diseaseName,diseaseDesc)
VALUES('Nosema','Microsporidiam Disease');
INSERT INTO DISEASE(diseaseName,diseaseDesc)
VALUES('Rabies','Viral Diesease, Causes inflation');

--TREATMENT
INSERT INTO TREATMENT(treatmentNumber,treatmentResult)
VALUES(100, 'Positive');
INSERT INTO TREATMENT(treatmentNumber,treatmentResult)
VALUES(200 , 'Negative');
INSERT INTO TREATMENT(treatmentNumber,treatmentResult)
VALUES(300 , 'Positive');
INSERT INTO TREATMENT(treatmentNumber,treatmentResult)
VALUES(400 , 'Positive');

--IS_DISEASED
INSERT INTO IS_DISEASED(ISDISEASED,TREATMENTNUMBER,DISEASENAME)
VALUES(1,100,'Rabies');
INSERT INTO IS_DISEASED(ISDISEASED,TREATMENTNUMBER,DISEASENAME)
VALUES(0,null ,null);
INSERT INTO IS_DISEASED(ISDISEASED,TREATMENTNUMBER,DISEASENAME)
VALUES(2,200,'Lumpy Jaw');
INSERT INTO IS_DISEASED(ISDISEASED,TREATMENTNUMBER,DISEASENAME)
VALUES(3,300,'Anthrax');
INSERT INTO IS_DISEASED(ISDISEASED,TREATMENTNUMBER,DISEASENAME)
VALUES(4,null,'Nosema');

--PRUCHASE
INSERT INTO PURCHASE (purchaseID, staffID, customerID)
  VALUES (001, 002, 2001);
INSERT INTO PURCHASE (purchaseID, staffID, customerID)
  VALUES (002, 002, 2002);
INSERT INTO PURCHASE (purchaseID, staffID, customerID)
  VALUES (003, 002, 2001);
INSERT INTO PURCHASE (purchaseID, staffID, customerID)
  VALUES (004, 001, 2005);
INSERT INTO PURCHASE (purchaseID, staffID, customerID)
  VALUES (005, 001, 2004);
  
--ANIMALS

INSERT INTO ANIMALS(animalID,purchaseID,speciesID,isDiseased,animalType)
VALUES(001,002,1001,0,'Brown Lablador');
INSERT INTO ANIMALS(animalID,purchaseID,speciesID,isDiseased,animalType)
VALUES(002,003,1002, 3,'black Orbin');
INSERT INTO ANIMALS(animalID,purchaseID, speciesID,isDiseased,animalType)
VALUES(003,004,1003 , 2,'White lens');
INSERT INTO ANIMALS(animalID,purchaseID, speciesID,isDiseased,animalType)
VALUES(004,001,1004, 4,'Brown fast');
INSERT INTO ANIMALS(animalID,purchaseID, speciesID,isDiseased,animalType)
VALUES(005,005,1005, 1,'White shoro');
INSERT INTO ANIMALS(animalID,purchaseID, speciesID,isDiseased,animalType)
VALUES(006,null,1006, 0,'Finger Monkey');

  
--ORDERS
INSERT INTO ORDERS (orderNumber, stockID, supplierID, staffID, numberOfUnits)
  VALUES (001, 3001, 103, 002, 10);
INSERT INTO ORDERS (orderNumber, stockID, supplierID, staffID, numberOfUnits)
  VALUES (002, 3002, 102, 002, 5);
INSERT INTO ORDERS (orderNumber, speciesID, supplierID, staffID,  numberOfSpecies)
  VALUES (003,1003,102, 001, 10);
INSERT INTO ORDERS (orderNumber, speciesID, supplierID, staffID,  numberOfSpecies)
  VALUES (004,1004,103, 001, 3);
INSERT INTO ORDERS (orderNumber, speciesID,stockID, supplierID, staffID,  numberOfSpecies)
  VALUES (004,1001,3001,103, 001, 3);7

COMMIT;