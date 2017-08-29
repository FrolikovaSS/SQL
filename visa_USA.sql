USE [u183189]
GO

SELECT distinct BO.BOrderID, BC.Date, BC.OfferID, CONCAT(P.LName, ' ' ,P.FName) AS Manager
FROM BOrders as BO
Left JOIN BCruises BC ON BO.BOrderID = BC.BOrderID
 LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
WHERE BC.OfferID IN(


SELECT 
  O.OfferID
  FROM [dbo].[ARoutes] AR
  LEFT JOIN Offers as O ON O.RouteID = AR.RouteID
  WHERE AR.iuv = 1  and OfferID is not NULL) --and AR.RCountries LIKE '%US%'
  and BO.StatusID = 100
  Order by  Manager
GO


