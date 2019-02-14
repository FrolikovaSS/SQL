USE [u183189]
-------------#1
GO
SELECT  O.Date, BC.Duration, O.ShipID, O.RouteID, COUNT (*) as NUM     
  FROM ARoutes as BC
  LEFT JOIN Offers as O ON O.RouteID = BC.RouteID
  WHERE O.Date > GetDate() 
  GROUP BY O.Date, O.ShipID,O.RouteID, BC.Duration HAVING COUNT(*) > 1
  Order by O.RouteID
GO

--------------#2
GO
SELECT  O.Date, BC.Duration, O.ShipID, BC.Trace, COUNT (*) as NUM     
  FROM ARoutes as BC
  LEFT JOIN Offers as O ON O.RouteID = BC.RouteID
  WHERE O.Date > GetDate() 
  GROUP BY O.Date, O.ShipID,BC.Trace, BC.Duration HAVING COUNT(*) > 1
GO

------------#3

GO
SELECT  O.Date, BC.Duration, O.ShipID, O.PackageID, COUNT (*) as NUM     
  FROM ARoutes as BC
  LEFT JOIN Offers as O ON O.RouteID = BC.RouteID
  WHERE O.Date > GetDate() 
  GROUP BY O.Date, O.ShipID, O.PackageID, BC.Duration HAVING COUNT(*) > 1
GO
