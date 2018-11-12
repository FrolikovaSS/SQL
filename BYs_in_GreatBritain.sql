GO

SELECT BC.OfferID,
    
    CONCAT(P.LName, ' ' ,P.FName) AS Manager,
	   BO.CRMID,  
	   BP.LName, BP.FName
	  ,BP.Nationality 	
	  ,BO.Phone	
	  ,StatusID
	  
  FROM [dbo].[BCruises] AS BC 
 Left JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
 Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 LEFT JOIN Profiles AS P ON BO.ManagerID=P.UserID 
 WHERE ( BO.StatusID = 100 or BO.StatusID = 60) 
		AND BC.OfferID IN ( SELECT OfferID FROM Offers as O
							JOIN (SELECT RouteID FROM ARoutes AS R						
							WHERE CHARINDEX('GB', R.RCountries) > 0) AS C ON C.RouteID = O.RouteID)
		AND( BP.Nationality = 'BY' /*OR BP.Nationality = 'UA'*/ )-- AND BC.Trace LIKE '%Танжер%'
		
  ORDER BY CRMID
 
GO