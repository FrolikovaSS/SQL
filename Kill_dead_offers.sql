SELECT * FROM Offers WHERE ShipID IN (164) AND Date>GETDATE() AND IsManual=0 ORDER BY SessionID, Date
SELECT * FROM Offers WHERE ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID=9) AND Date>GETDATE() AND IsManual=0 ORDER BY SessionID, ShipID, Date
SELECT * FROM Offers WHERE ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID=29) AND Date>GETDATE() AND IsManual=0 AND OfferID NOT IN (SELECT OfferID FROM AOffers) ORDER BY SessionID, Date

--UPDATE OPrices SET op=-1,sp=null,op1=null,sp1=null,op2=null,sp2=null,op3=null,sp3=null,op4=null,sp4=null,op5=null,sp5=null,op6=null,sp6=null WHERE OfferID IN ()
--UPDATE Offers SET SessionID=1 WHERE OfferID IN ()

--CLEAR DEAD COMPANY LEVEL
/*
GO
DECLARE @CompanyID int;
DECLARE @SessionID int;
SET @CompanyID = 2;
SET @SessionID = 12829;
UPDATE OPrices SET op=-1,sp=null,op1=null,sp1=null,op2=null,sp2=null,op3=null,sp3=null,op4=null,sp4=null,op5=null,sp5=null,op6=null,sp6=null WHERE OfferID IN (SELECT OfferID FROM Offers WHERE ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID=@CompanyID) AND Date>GETDATE() AND IsManual=0 AND SessionID > 1 AND SessionID < @SessionID AND (PackageID IS NULL OR PackageID NOT LIKE 'C_%')) 
UPDATE Offers SET SessionID=1 WHERE OfferID IN (SELECT OfferID FROM Offers WHERE ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID=@CompanyID) AND Date>GETDATE() AND IsManual=0 AND SessionID > 1 AND SessionID < @SessionID AND (PackageID IS NULL OR PackageID NOT LIKE 'C_%')) 
GO
*/
--
SELECT TOP 19 SessionID, Name, Created FROM RSessions ORDER BY Created DESC
--CHECK DEAD COMPANY LEVEL
GO
DECLARE @CompanyID int;
DECLARE @SessionID int;
SET @CompanyID = 2;
SET @SessionID = 12829;
SELECT OfferID, ShipID, RouteID, Date, CruiseID, PackageID, SessionID FROM Offers WHERE ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID=@CompanyID) AND Date > GETDATE() AND IsManual = 0 AND SessionID > 1 AND (PackageID IS NULL OR PackageID NOT LIKE 'C_%') AND SessionID < @SessionID ORDER BY ShipID, Date
GO

EXEC dbo.MergeAll
SELECT COUNT(*) FROM AOffers
