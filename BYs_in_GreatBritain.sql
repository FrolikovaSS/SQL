GO

SELECT BC.OfferID,
    
    CONCAT(P.LName, ' ' ,P.FName) AS Manager,
	   BO.CRMID, 
	   BC.Date, 
	   MQ.LName, MQ.FName
	  ,MQ.Nationality 	
	  ,BO.Phone	
	 -- ,BC.Trace
	  ,StatusID
	  
  FROM [dbo].[BCruises] AS BC 
 Left JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
 Left JOIN (Select * FROM BPersons WHERE Position=1) AS MQ ON MQ.BOrderID = BO.BOrderID
 LEFT JOIN Profiles AS P ON BO.ManagerID=P.UserID 
 WHERE ( BO.StatusID = 100 or BO.StatusID = 60) 
		AND BC.OfferID IN ( SELECT OfferID FROM Offers as O
							JOIN (SELECT RouteID FROM ARoutes AS R						
							WHERE( CHARINDEX('MQ', R.RCountries)>0  or CHARINDEX('GP', R.RCountries)> 0)) AS C ON C.RouteID = O.RouteID)
		--AND( BP.Nationality = 'BY' /*OR BP.Nationality = 'UA'*/ )-- AND BC.Trace LIKE '%Танжер%'
		
  ORDER BY Date
 
GO