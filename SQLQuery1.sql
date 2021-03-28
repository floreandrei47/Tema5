INSERT into Brand
(IdBrand, BrandName)
VALUES
(1,'BMW'),
(2,'SEAT'),
(3,'AUDI')



INSERT into Model
(IdModel, ModelName,IdBrand,ModelYear,Price)
VALUES
(1,'X1',1,2010,8000),
(2,'X1',1,2011,8500),
(3,'116i',1,2008,4500),
(4,'520d',1,2012,9800),
(5,'Leon',2,2014,7800),
(6,'Leon',2,2011,6500),
(7,'Cupra',2,2012,8000),
(8,'Ibiza',2,2010,5900),
(9,'A4',3,2007,6000),
(10,'A4',3,2009,6450),
(11,'A3',3,2012,7150),
(12,'Q5',3,2015,11200)

INSERT into ActualFeature
(IdActualFeature,ActualFeaturename)
VALUES
(1,'Manual Transmission'),
(2,'Automatic Transmission'),
(3,'Diesel'),
(4,'Gas'),
(5,'Electric')

Select * from Model_ActualFeature

DELETE FROM Model_ActualFeature WHERE IdActualFeature=5


INSERT into Model_ActualFeature
(IdModel,IdActualFeature)
Values
(1,1),
(1,4),
(2,2),
(2,5),
(3,1),
(3,3),
(4,2),
(4,3),
(5,2),
(5,4),
(6,1),
(6,3),
(7,1),
(7,4),
(8,2),
(8,3),
(9,1),
(9,3),
(10,1),
(10,3),
(11,2),
(11,4),
(12,2),
(12,5)


Insert into Customer
(IdCustomer, CustomerName, CustomerPhone, IdModel,BuyDate)
Values
(1,'Vasile Ion','07512401235', 5, '20210320'),
(2,'Popescul Marius','07516201725', 4, '20210322'),
(3,'Postolache Maria','07442412235', 5, '20210120'),
(4,'Mariuca Alexandru Marian','07401101235', 1, '20210325'),
(5,'Huludet Sara','07662402135', 12, '20210212'),
(6,'Stingaciu Alin','07512401266', 7, '20210201')


INSERT into Inventory
(IdInventCar, IdModel)
VALUES
(1,2),
(2,10),
(3,6),
(4,8)

INSERT INTO PotentialCustomer
(IdPossCustomer,[Name], PhoneNumber,IdModel, InteresDate)
VALUES
(1,'Coroeanu Cosmin','0742320621',10,'20210224'),
(2,'Popa Alissa','0742320665',8,'20210304'),
(3,'Fotachi Rares','0712320621',6,'20210128'),
(4,'Rusu Adrian','0765320621',2,'20210209')




Insert into PossibleFeature
(IdPossibleFeature,PossiblefeatureName)
VALUES
(1,'Parking Sensors'),
(2,'Heated Seats')

INSERT into Model_PossibleFeature
(IdModel,IdPossibleFeature)
VALUES
(1,1),
(12,2)

--1

Select BrandName,ModelName FROM Brand
INNER JOIN Model
On Brand.IdBrand=Model.IdBrand
INNER JOIN Inventory
ON Model.IdModel=Inventory.IdModel
GROUP BY BrandName, ModelName


--2

Select ModelName, ActualFeaturename
FROM Model
INNER JOIN Model_ActualFeature
ON Model.IdModel=Model_ActualFeature.IdModel
INNER JOIN ActualFeature
ON Model_ActualFeature.IdActualFeature=ActualFeature.IdActualFeature
INNER JOIN Inventory
ON Model.IdModel=Inventory.IdInventCar


--3 

Select ModelName, PossiblefeatureName
FROM Model
INNER JOIN Model_PossibleFeature
ON Model.IdModel=Model_PossibleFeature.IdModel
INNER JOIN PossibleFeature
ON Model_PossibleFeature.IdPossibleFeature=PossibleFeature.IdPossibleFeature


--4 

SELECT * 
FROM Customer
WHERE DATEPART(m, BuyDate) = DATEPART(m, DATEADD(m, -1, getdate()))
AND DATEPART(yyyy, BuyDate) = DATEPART(yyyy, DATEADD(m, -1, getdate()))


--5

SELECT * 
FROM PotentialCustomer
WHERE DATEPART(m, InteresDate) = DATEPART(m, DATEADD(m, -1, getdate()))
AND DATEPART(yyyy, InteresDate) = DATEPART(yyyy, DATEADD(m, -1, getdate()))

--6 

Select ModelName, ModelYear from Model 
INNER JOIN Inventory
ON Model.IdModel=Inventory.IdModel
Where Model.ModelYear=2011

--7

Select ModelName, Price from Model
LEFT Join Customer
On Model.IdModel=Customer.IdModel
WHERE Customer.IdModel IS NULL

Select ModelName from Model


--8

Select ModelName, ActualFeaturename
FROM Model
INNER JOIN Model_ActualFeature
ON Model.IdModel=Model_ActualFeature.IdModel
INNER JOIN ActualFeature
ON Model_ActualFeature.IdActualFeature=ActualFeature.IdActualFeature
INNER JOIN Inventory
ON Model.IdModel=Inventory.IdInventCar
Where ActualFeaturename='Electric'


