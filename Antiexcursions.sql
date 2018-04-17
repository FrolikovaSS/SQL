GO
DECLARE @CityID int;
DECLARE @ArrivalHour int;
DECLARE @DockTime int;

SET @CityID = 16; -- Барселона = 16, Рим = 15
SET @ArrivalHour = 9;
SET @DockTime = 17;

SELECT SuperOrders.BOrderID,
	   Email,
	   CRMID,
	   BC.Date,
	   RoutePointTimeWindow.ArrivalDate,
	   RoutePointTimeWindow.ArrivalHour,
	   RoutePointTimeWindow.Duration,
	   SuperOrders.ACount,
	   SuperOrders.CCount,
	   SuperOrders.FN,
	   SuperOrders.LN
	   

	   FROM (SELECT RP.RouteID, RP.PointID, O.OfferID, O.Date, Arrival, RP.IsBoarding,
  DATEADD(day, CAST(RP.Arrival AS INT) / 24, O.Date) AS ArrivalDate,
  (CAST(RP.Arrival * 60 AS INT) % 1440 / 60) AS ArrivalHour, RP.Duration
  FROM RoutePoints RP
  JOIN Offers O ON O.RouteID = RP.RouteID
  WHERE RP.CityID = @CityID) RoutePointTimeWindow

 JOIN BCruises AS BC ON BC.OfferID = RoutePointTimeWindow.OfferID

 JOIN (SELECT BO.BOrderID, BO.CRMID, BO.Email, COALESCE(CCount, 0) AS CCount, ACount, EmailMan.FName AS FN, EmailMan.LName AS LN
FROM BOrders AS BO 

LEFT JOIN (SELECT TOP 1 BOrderID FROM BPayments 
		WHERE Status = 200) AS BP ON BP.BOrderID = BO.BOrderID
LEFT JOIN (SELECT COUNT(*) AS CCount, BOrderID FROM BPersons AS BPR
		WHERE BPR.Type ='C'
		GROUP BY BOrderID) AS Children ON Children.BOrderID = BO.BOrderID
LEFT JOIN (SELECT COUNT(*) AS ACount, BOrderID FROM BPersons AS BPR
		WHERE BPR.Type ='A'
		GROUP BY BOrderID) AS Adults ON Adults.BOrderID = BO.BOrderID
LEFT JOIN (SELECT BOrderID, FName, LName FROM BPersons
		WHERE Position = 1) AS EmailMan ON EmailMan.BOrderID = BO.BOrderID

WHERE	BO.StatusID = 100  ) as SuperOrders ON SuperOrders.BOrderID = BC.BOrderID
				
		WHERE ArrivalHour <= @ArrivalHour AND (RoutePointTimeWindow.Duration + ArrivalHour) > @DockTime
		AND (BC.Date >='2018-05-05' AND BC.Date <='2018-05-31') OR (ArrivalHour >= @DockTime AND RoutePointTimeWindow.IsBoarding = 1) 
		OR (ArrivalHour >= @ArrivalHour AND RoutePointTimeWindow.Duration = 0 AND RoutePointTimeWindow.IsBoarding <> 1)
Order by SuperOrders.BOrderID

GO