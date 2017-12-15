--Sql queries
--Select all the information from animals (SELECT EMXAMPLE)
SELECT * FROM ANIMALS;

--PROJECTION
--SELECT THE STOCK PRICE AND STOCK NAME
SELECT stockPrice,stockName from stock;


--AGGREGATION with filters on aggregates
--Count the total price of all sales
SELECT SUM(speciesPrice) as Total from species
join animals using(speciesID)
join purchase using(animalID)
where speciesPrice >10 ;

--UNION
--SELECT THE SPECIES TYPE FROM SPECIES AND ANIMALTYPE FROM ANIMALS THAT HAVE A SPECIES ID OF 1004
SELECT speciestype,speciesId from species
where speciesID =1004
UNION
SELECT animalType, speciesID from animals
where speciesID = 1004;

--MINUS
--SELECT ALL THE ORDERS WITH SPECIES PRICE OF 100 AND STOCK PRICE OVER 1 WHICH DONT HAVE A SUPPLIER ID OF 101
SELECT orderNumber FROM orders
JOIN stock using(stockID)
JOIN species using(speciesID)
where stockPrice > 1 and speciesPrice > 100
minus
select supplierID from supplier
where supplierID = 101;

--INTERSECT
--SELECT ALL THE ALL THE SPECIE TYPES THAT ARE NOT DISEASED
SELECT * FROM SPECIES
WHERE speciesPrice <100
intersect
SELECT * from species
where cageSize = 'Medium';

--INNER JOIN
--SELECT EVERYTHING FROM ANIMALS THAT HAVE A SPECIES PRICE OVER 20
SELECT * from animals
inner join species using(speciesID)
where speciesPrice >20;

--OUTER JOIN
--SELECT ALL animals and purcharse ID's
SELECT animalType,purchaseID from animals
FULL OUTER JOIN purchase using(purchaseID);

--SEMI-JOIN
--SELECT ALL ANIMAL TYPES WHICH HAVE A PURCHASE ID
SELECT animalType from animals
where purchaseID in 
(select purchaseID from purchase);

--ANTI-JOIN
--SELECT ALL ANIMALS WHICH ARE NOT BOUGHT
SELECT animalType from animals
where NOT EXISTS(
SELECT purchaseID from purchase
where animals.purchaseID = purchase.purchaseID);

--CORRELATION QUERY
--RETURN ALL THE ORDERS FOR CUSTOMER MARY BLACK
SELECT * from purchase
where customerID=(
Select customerID from customer
where customerName = 'Mary Black');

GRANT ALL ON species TO DDINKOV;
GRANT ALL ON animals TO DDINKOV;



COMMIT;