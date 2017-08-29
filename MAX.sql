GO

DECLARE @city nvarchar(256);
DECLARE @date date;
SET @city = '%рим%';
SET @date = '2017-09-08'; 

SELECT BO.BOrderID, StatusID, OfferID, ShipID, Date, Duration, Trace
 FROM BORders AS BO JOIN BCruises AS BC ON BO.BorderID=BC.BorderID
  WHERE BO.StatusID=100 AND BC.Trace LIKE @city AND BC.Date <= @date AND DATEADD(DAY,BC.Duration, BC.Date) >= @date  

GO
