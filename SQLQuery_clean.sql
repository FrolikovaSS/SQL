--CLEAR DEAD COMPANY LEVEL
/*
GO
DECLARE @CompanyID int;
DECLARE @SessionID int;
SET @CompanyID = 40;
SET @SessionID = 8800
UPDATE OPrices SET op=-1,sp=null,op1=null,sp1=null,op2=null,sp2=null,op3=null,sp3=null,op4=null,sp4=null,op5=null,sp5=null,op6=null,sp6=null WHERE OfferID IN (SELECT OfferID FROM Offers WHERE ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID=@CompanyID) AND Date>GETDATE() AND IsManual=0 AND SessionID > 1 AND SessionID < @SessionID AND (PackageID IS NULL OR PackageID NOT LIKE 'C_%')) 
UPDATE Offers SET SessionID=1 WHERE OfferID IN (SELECT OfferID FROM Offers WHERE ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID=@CompanyID) AND Date>GETDATE() AND IsManual=0 AND SessionID > 1 AND SessionID < @SessionID AND (PackageID IS NULL OR PackageID NOT LIKE 'C_%')) 
GO
*/
--
SELECT TOP 15 SessionID, Name, Created FROM RSessions ORDER BY Created DESC

SELECT * FROM RSessions WHERE SessionID=6719
--CHECK DEAD COMPANY LEVEL
GO
DECLARE @CompanyID int;
DECLARE @SessionID int;
SET @CompanyID = 40;
SET @SessionID = 8800
SELECT OfferID, ShipID, RouteID, Date, CruiseID, PackageID, SessionID FROM Offers WHERE ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID=@CompanyID) AND Date > GETDATE() AND IsManual = 0 AND SessionID > 1 AND (PackageID IS NULL OR PackageID NOT LIKE 'C_%') AND SessionID < @SessionID ORDER BY ShipID, Date
GO

EXEC dbo.MergeAll
SELECT COUNT(*) FROM AOffers

SELECT * FROM Offers WHERE OfferID='69636' 

SELECT * FROM Ships WHERE ShipID IN (347, 340)

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (13, '5*', 2, 'Celebrity Xperience', 'celebrity_xperience', 2017);

SELECT TOP 5 * FROM Offers

--UPDATE Offers SET RouteID=19034 WHERE OfferID IN (58614, 58616, 58618, 58620, 58622, 58624, 58626, 64411, 64413, 64415, 64420, 64421)

--UPDATE Offers SET IsManual=1 WHERE OfferID IN (60319, 60321, 60324, 60331, 60333, 53464, 53465, 53468, 53469, 53470, 53472, 66345, 53477, 53478)

SELECT TOP 20 * FROM COrders

--SELECT COrderID, CO.Name, Contact, CO.Created, P.LName AS Manager, CO.Comment FROM COrders AS CO JOIN Profiles AS P ON CO.ManagerID=P.UserID WHERE CO.Created > '2016-07-25 18:30:40.423' AND QURL LIKE '%morder.aspx' ORDER BY CO.Created ASC

--SELECT COrderID, CO.Name, Contact, CO.Created, P.LName AS Manager, CO.Comment FROM COrders AS CO JOIN Profiles AS P ON CO.ManagerID=P.UserID WHERE CO.Name='Рузиль' AND QURL LIKE '%morder.aspx' ORDER BY CO.Created ASC

SELECT COrderID, CO.Name, CO.QURL, Contact, CO.Created, P.LName AS Manager, CO.Comment FROM COrders AS CO JOIN Profiles AS P ON CO.ManagerID=P.UserID WHERE CO.Name='%Александр%'  ORDER BY CO.Created ASC

--SELECT TOP 5 * FROM BPersons WHERE BOrderID='744BC4F5-8CC7-4A58-A55E-0005C6A4FAED'

--SELECT TOP 5 * FROM BOrders 

--1 и 2

SELECT FName, LName, Created, CRMID, BOrderID FROM BOrders WHERE Created >= '2016-05-01' AND StatusID >= 100 ORDER BY Created

SELECT BOrders.FName, BOrders.LName, BOrders.Created FROM BOrders, BCruises WHERE BOrders.BOrderID=BCruises.BOrderID AND BOrders.Created > '2016-05-01' AND BOrders.StatusID > 100 AND BCruises.CompanyID=2 ORDER BY Created

SELECT TOP 5 * FROM BCruises

SELECT TOP 5 * FROM BOrders

--3
SELECT BOrders.FName, BOrders.LName, BOrders.Created, BTasks.BTaskID FROM BOrders LEFT JOIN BTasks ON BOrders.BOrderID = BTasks.BOrderID WHERE BTasks.BTaskID IS NULL AND BOrders.StatusID = 100 ORDER BY BOrders.Created

--4

SELECT BOrders.FName, BOrders.LName, BOrders.Created, BTasks.BTaskID, COUNT(BTasks.BOrderID) FROM BOrders LEFT JOIN BTasks ON BOrders.BOrderID = BTasks.BOrderID GROUP BY BTasks.BOrderID 

SELECT BOrderID, COUNT(BOrderID) FROM BTasks GROUP BY BOrderID

SELECT BO.LName, BO.FName, BC.CompanyID AS Company_name, BC.ShipID AS Ship, BC.Date AS Depature_date, BO.Created FROM BOrders AS BO LEFT JOIN BCruises AS BC ON BO.BOrderID = BC.BOrderID WHERE OfferID IN (SELECT O.OfferID FROM Offers AS O LEFT JOIN RoutePoints AS RP ON O.RouteID = RP.RouteID WHERE (RP.CityID IN (86, 87, 97, 1107, 1607) AND RP.IsBoarding=1) AND O.Date >= '2016-06-01') AND BO.StatusID >= 100 AND BC.CompanyID=1

SELECT TOP 5 * FROM Offers WHERE OfferID='68639'

--UPDATE Offers SET SessionID='123' WHERE OfferID='68639'

SELECT O.OfferID FROM Offers AS O LEFT JOIN RoutePoints AS RP ON O.RouteID = RP.RouteID WHERE (RP.CityID IN (86, 87, 97, 1107, 1607) AND RP.IsBoarding=1) AND O.Date >= '2016-06-01'

SELECT R.RouteID FROM Routes AS R  JOIN RoutePoints AS RP ON R.RouteID = RP.RouteID WHERE (RP.CityID IN (86, 87, 97, 1107, 1607) AND RP.IsBoarding=1 )  

--UPDATE Offers SET Offers.RouteID=17894 WHERE Offers.OfferID IN(61173)

 --AND Offers.OfferID<=61065

 SELECT * FROM Agents WHERE Name LIKE '%ИП Никитина%'

 SELECT  * FROM Agencies WHERE AgentID='F471C31C-DFC2-4F15-835F-201FF78ACB76'

 SELECT A.AgentID, A.Name, AG.Email, A.AWPath FROM Agents AS A 
 JOIN Agencies AS AG ON AG.AgentID=A.AgentID
 WHERE A.AWPath IS NOT NULL
 ORDER BY AgentID

  SELECT * FROM Agencies WHERE Email LIKE '%@gotravell.ru%'

 -- UPDATE Agencies SET Phone='+37410547347' WHERE AgencyID='f343bbc0-1bc7-4de9-803a-8718a870c5b8'

 --UPDATE Agents SET AWPath='http://teslatravel.ru/kruizy' WHERE AgentID='489FDFE4-41B5-4497-A64C-D7DA6C4CEC7C'

 SELECT TOP 5 * FROM Agencies WHERE AgentID='489FDFE4-41B5-4497-A64C-D7DA6C4CEC7C'

-- UPDATE Agencies SET Email='sales@kraskimira.ru' WHERE AgencyID='EFAAE990-7A43-4A7C-A6E2-F33624AFB5AF'
--UPDATE Agencies SET Phone='+78632266147' WHERE AgencyID='252BA022-8790-49D5-97A0-A1725FE633D1'

 SELECT TOP 5 * FROM Profiles WHERE LName='старкова'

 --SELECT TOP 5 * FROM BOrders WHERE CRMID='4792015'

 --SELECT S.ShipID, S.Name, C.Name, C.Code FROM Cabins AS C
 --JOIN Ships AS S ON S.ShipID=C.ShipID
 --JOIN Companies AS Com ON Com.CompanyID=S.CompanyID
 -- WHERE C.Description IS NULL AND Com.IsLocked=0

  SELECT TOP 5 * FROM Companies 

 --User/43feaeeecd7b2fe2ae2e26d917b647vt.jpg

 SELECT TOP 30 * FROM BOrders DECS WHERE ManagerID='69E20932-CE81-4904-8A2F-6FEBF8B4A9B5'

 SELECT TOP 5 * FROM Agencies


 --UPDATE Profiles SET Birthday='1993-12-12' WHERE UserID='05E43D4B-3BFF-46B7-93F0-C8A3788929E3'

SELECT OfferID, ShipID, RouteID, SessionID, Date FROM Offers WHERE IsManual=1 AND Date >= '2016-09-20' AND MComment IS NULL

--UPDATE Offers SET IsManual=1 WHERE OfferID IN (60319, 60324, 53841, 60333, 53465, 51274, 50629, 50790, 51246, 50559, 64856, 68387, 63465)

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [Name], [UName], [Year]) VALUES (4, '5*', 'Carnival Horizon New Ship 2018', 'carnival_horizon', '2018');

SELECT TOP 5 * FROM Ships WHERE Name='Celebrity Xploration New Ship 2017'

SELECT * FROM BTasks WHERE Status=60 AND Owner='M'

SELECT * FROM BTasks WHERE Status=60
SELECT * FROM BTasks WHERE Author='C'

SELECT * FROM COrders WHERE QURL LIKE '%wedding%'

SELECT TOP 5 * FROM RoutePoints

SELECT * FROM Offers WHERE PackageID IS NOT NULL AND Date>='2016-11-03' AND SessionID<>'1' AND apf='0'

SELECT O.OfferID, S.CompanyID, S.Name FROM Offers AS O
JOIN Ships AS S ON S.ShipID=O.ShipID AND O.SessionID<>1 AND O.Date >='2016-11-03'
WHERE S.CompanyID='1' AND O.IsManual='1'

SELECT OfferID, RouteID, S.CompanyID FROM Offers
JOIN Ships AS S ON s.ShipID=Offers.ShipID 
Where IsManual='1' AND Date>='2016-11-17' AND SessionID<>'1'
ORDER BY S.CompanyID

SELECT R.RouteID FROM Routes AS R
JOIN RoutePoints AS RP ON RP.RouteID=R.RouteID
WHERE RP.CityID='519' 

SELECT TOP 5 * FROM RoutePoints

SELECT TOP 5 * FROM Companies WHERE MealTypeID='2'

--INSERT INTO Ships ( CompanyID, Name, ShipCategoryID, UName) values ( '59', 'Le Laperouse', '5*', 'le_laperouse')



SELECT SUM( FLOOR(AM.Payed)) FROM BOrders AS BO 
LEFT OUTER JOIN (SELECT BP.BOrderID, SUM(BPI.Amount*BPI.Rate) AS Payed FROM BPayments AS BP
LEFT OUTER JOIN BPaymentItems AS BPI ON BPI.BPaymentID=BP.BPaymentID WHERE BP.Status >=200
GROUP BY BP.BOrderID) AS AM ON AM.BOrderID=BO.BOrderID
WHERE BO.CRMID='8412'

SELECT TOP 5 * FROM BPayments


SELECT TOP 5 BP.BOrderID, SUM(BPI.Amount) AS Payed, BPI.Rate FROM BPayments AS BP
LEFT OUTER JOIN BPaymentItems AS BPI ON BPI.BPaymentID=BP.BPaymentID WHERE BP.Status >=100
GROUP BY BP.BOrderID


DECLARE @first nvarchar(10), @second nvarchar(10), @first_time nvarchar(10), @second_time nvarchar(10);
SET @first='90'; SET @second='120'; SET @first_time='12:00'; SET @second_time='12:30';    
SELECT * FROM COrders AS CO 
WHERE
CO.OCityID<>'4' AND CO.Created>='2016-11-01' AND CO.Created<'2016-12-01' AND
(
(DATEDIFF(minute, CO.Created, CO.Updated)>@first AND DATEDIFF(MINUTE, CO.Created, CO.Updated)<=@second
AND DATEPART(WEEKDAY, CO.Created)>='2' AND DATEPART(WEEKDAY, CO.Created)<='6' 
AND DATEPART(HOUR, CO.Created)>='10' AND DATEPART(HOUR, CO.Created)<'20')
OR 
(DATEPART(WEEKDAY, CO.Created)='7' 
AND DATEPART(HOUR, CO.Created)>='10' AND DATEPART(HOUR, CO.Created)<'17' AND
DATEDIFF(minute, CO.Created, CO.Updated)>@first AND DATEDIFF(MINUTE, CO.Created, CO.Updated)<=@second)
OR
(DATEPART(WEEKDAY, CO.Created)>='2' AND DATEPART(WEEKDAY, CO.Created)<='6'
 AND ( DATEPART(HOUR, CO.Created)>'20' OR DATEPART(HOUR, CO.Created)<'10') 
 AND (CAST(CO.Updated AS time)>=@first_time AND CAST(CO.Updated AS time)<=@second_time) 
)
OR
(DATEPART(WEEKDAY, CO.Created)='7'
 AND ( DATEPART(HOUR, CO.Created)>'17' OR DATEPART(HOUR, CO.Created)<'10') 
 AND (CAST(CO.Updated AS time)>=@first_time AND CAST(CO.Updated AS time)<=@second_time) 
)
OR
(DATEPART(WEEKDAY, CO.Created)='1'
 AND (CAST(CO.Updated AS time)>=@first_time AND CAST(CO.Updated AS time)<=@second_time) 
 AND DATEPART(WEEKDAY, CO.Updated)='2'
))
ORDER BY CO.Created DESC


SELECT TOP 100 * FROM COrders AS CO WHERE
CO.Created<'2016-12-01' AND CO.Created>'2016-11-01'
AND CO.OCityID<>'4'
ORDER BY CO.Created DESC

SELECT BO.BOrderID, BO.CRMID, BC.BookingID, CONCAT(P.LName, ' ' ,P.FName) AS Manager, BO.FName, BO.LName, BO.Email, BO.Phone  FROM BOrders AS BO
JOIN BCruises AS BC ON BC.BOrderID=BO.BOrderID
JOIN Profiles AS P ON BO.ManagerID=P.UserID 
WHERE BC.OfferID IN ('60473') AND BO.StatusID >= '100' AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL)

SELECT * FROM Routes WHERE Structure IS NULL ORDER BY RouteID DESC

SELECT TOP 5 * FROM BCruises AS BC WHERE BC.OfferID IN (64502, 64873, 64874, 64875, 64876, 64881, 64882, 64883, 64884, 64885, 64890, 64891, 64892, 64893, 64899, 64900, 64902, 64901)

SELECT TOP 5 * FROM BCruises AS BC WHERE BC.BookingID IN ('19715979', '19716094', '19716963', '19718321', '19719798', '19720284', '19720990', '19721044', '19721218', '19726370', '19726403', '19725841') 

SELECT O.OfferID, O.ShipID, O.RouteID, O.Date FROM Offers AS O WHERE O.IsManual='1' AND O.Date >'2016-12-21' 

SELECT BC.BOrderID, BC.OfferID FROM BCruises AS BC
JOIN BOrders AS BO ON BO.BOrderID=BC.BOrderID
WHERE BC.OfferID IN (64502, 64873, 64874, 64875, 64876, 64881, 64882, 64883, 64884, 64885, 64890, 64891, 64892, 64893, 64899, 64900, 64902, 64901)

SELECT * FROM Offers AS O WHERE O.OfferID NOT IN (SELECT OP.bc FROM OPrices AS OP WHERE OP.OfferID=O.OfferID) 


SELECT TOP 5 * FROM Offers

SELECT TOP 5 * FROM Offers WHERE Offers.OfferID='73886'

SELECT RP.RouteID, COUNT(RP.RouteID) AS Amount FROM RoutePoints AS RP 
JOIN Offers AS O ON O.RouteID=RP.RouteID 
WHERE (RP.CityID='84' OR RP.CityID='86' OR RP.CityID='53') AND O.SessionID>'1' AND O.Date >'2017-01-10' GROUP BY RP.RouteID HAVING COUNT(RP.RouteID) >='3'

SELECT TOP 5 * FROM Ships WHERE ShipID='364' OR ShipID='363'

SELECT TOP 5 * FROM Routes WHERE RouteID='17083'

SELECT * FROM BCruises AS BC
JOIN BOrders AS BO ON BO.BOrderID=BC.BOrderID
WHERE BC.Trace LIKE '%Амстердам%' AND BO.StatusID = '100' AND 
(BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) AND BC.Date >='2017-01-12'
ORDER BY BC.Date

SELECT TOP 5 * FROM BCruises WHERE ShipID='24' and Date='2017-04-01'


SELECT Trace, CompanyID, COUNT(RouteID) AS rcount, SUM(OCount) as ocount, Duration FROM ARoutes
WHERE OCount > 0
GROUP BY Trace, CompanyID, Duration
HAVING COUNT(RouteID) > 1
ORDER BY rcount DESC

SELECT TOP 5 * FROM ARoutes

EXEC dbo.MergeAll

--UPDATE Offers SET RouteID=16191 WHERE OfferID IN (54534, 66833, 66813, 55518, 55519, 55520, 55521)

--Сан-Диего - Виктория - Ванкувер
--Порт Канаверал - Нассау - Порт Канаверал (2)
--Марсель (Прованс) - Генуя (3)
--Новый Орлеан - Косумель - Роатан (Махогани Бэй) - Харвест-Кей - Коста Майя - Новый Орлеан (3)
--Сидней - Сидней


SELECT BO.BOrderID, BO.FName, BO.LName, CONCAT(P.LName, ' ' ,P.FName) AS Manager, BO.Created,  BO.CRMID, BO.Comment FROM BOrders AS BO 
JOIN Profiles AS P ON P.UserID=BO.ManagerID
WHERE BO.StatusID='50' AND BO.Created>='2016-01-01' AND BO.Comment IS NULL
AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL)
ORDER BY Manager, BO.Created

SELECT TOP 5 * FROM BOrders WHERE BOrderID='7e72bc29-887a-4903-b938-3efa25f29d10'

SELECT Ag.AgencyID, CONCAT(P.LName, ' ' ,P.FName) AS Manager, A.Name, Ag.Email, A.CRMID, A.AWpath,  A.Created FROM Agencies AS Ag
JOIN Agents AS A ON Ag.AgentID=A.AgentID
JOIN Profiles AS P ON P.UserID=A.ManagerID
WHERE Ag.AgencyID NOT IN(
		SELECT Pr.AgencyID FROM Profiles AS Pr
		WHERE AgencyID IS NOT NULL)
ORDER BY Manager, A.Created

SELECT TOP 5 * FROM Agents

SELECT P.FName, P.LName FROM Profiles AS P
JOIN Agencies AS Ag ON Ag.AgencyID=P.AgencyID

SELECT DISTINCT Ag.AgencyID, CONCAT(P.LName, ' ' ,P.FName) AS Manager, A.Name, Ag.Email, A.CRMID, A.Created, A.StatusID FROM Agents AS A 
JOIN Agencies AS Ag ON Ag.AgentID=A.AgentID
JOIN BOrders AS BO ON BO.AgencyID=Ag.AgencyID
JOIN Profiles AS P ON P.UserID=A.ManagerID
WHERE A.StatusID>='100' AND BO.StatusID>='100'
ORDER BY Manager

SELECT AgentID, Name, Created FROM Agents WHERE ManagerID='D3FE888C-0C7D-42AE-97C3-1281514E7ADE' ORDER BY Created

SELECT TOP 5 * FROM BOrders WHERE AgentID='06AC9DE4-6BD3-4903-BC41-33F02CD04368' BOrderID='f7c47263-50e9-4b3f-90a5-94050d404522'
SELECT TOP 5 * FROM Agencies WHERE Agencies.AgentID='78385888-A0EC-46E9-B5A5-065DA8E757F2'
SELECT TOP 5 * FROM Agencies WHERE AgencyID='F73BAD1F-82D9-4701-A053-5F36E77B4A79'

SELECT BO.BOrderID, CONCAT(P.LName, ' ' ,P.FName) AS Manager, BO.FName, BO.LName, BO.Email, BO.Created, BI.Type FROM BOrders AS BO
JOIN BItems AS BI ON BI.BOrderID=BO.BOrderID
JOIN Profiles AS P ON P.UserID=BO.ManagerID
WHERE BI.Type='IPF' AND BO.StatusID='100' AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL)
ORDER BY Manager


SELECT * from Offers AS O WHERE Date>='2017-02-16' AND Date <='2017-12-31' AND ShipID='338' ORDER BY Date

--UPDATE Offers SET IsRus='1' WHERE Date>='2017-04-15' AND Date <='2017-10-31' AND ShipID='309'

SELECT * FROM BCruises AS BC 
JOIN BOrders AS BO ON BO.BOrderID=BC.BOrderID
WHERE BC.OfferID='60473'

SELECT DISTINCT BO.CRMID, BC.Date, CONCAT(P.LName, ' ' ,P.FName) AS Manager, BO.LName, BO.FName, BO.Created FROM BOrders AS BO  
JOIN BCruises AS BC ON BC.BOrderID=BO.BOrderID
JOIN BItems AS BI ON BI.BOrderID=BO.BOrderID
JOIN Profiles AS P ON P.UserID=BO.ManagerID
WHERE BO.StatusID='100'
AND (BC.Trace LIKE '%Дубай%' OR BC.Trace LIKE '%Абу-Даби%' OR BC.Trace LIKE '%о. Сир-Бани-Яс%' OR BC.Trace LIKE '%Фуджейра%' OR BC.Trace LIKE '%Хор-Факкан%') 
AND BI.Type='VIS'
ORDER BY BO.Created


SELECT DISTINCT BO.CRMID, BC.Date, CONCAT(P.LName, ' ' ,P.FName) AS Manager, BO.LName, BO.FName, BO.Created FROM BOrders AS BO  
JOIN BCruises AS BC ON BC.BOrderID=BO.BOrderID
JOIN BItems AS BI ON BI.BOrderID=BO.BOrderID
JOIN Profiles AS P ON P.UserID=BO.ManagerID
WHERE BO.StatusID='100' AND BC.OfferID='64703'
AND BI.Type='TRA'
ORDER BY BO.Created

SELECT TOP 5 * FROM Offers WHERE ShipID='216' AND Date='2017-06-05'

SELECT OfferID, Date FROM Offers WHERE ShipID='216' AND Date>='2017-12-04' AND Date<='2017-12-11' ORDER BY Date

SELECT TOP 5 * FROM Profiles WHERE surname='немтырева'

UPDATE Profiles SET OfficeID='1' WHERE UserID='C4BDD583-D81C-497E-B836-6059038EB9CD'

