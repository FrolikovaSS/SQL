SELECT 
	 BO.BOrderID
	, BO.CRMID
	,BO.Created
	,BC.Dining	
    ,CONCAT(P.LName, ' ' ,P.FName) AS Manager   
    ,[StatusID]
   
  FROM [dbo].[BOrders] AS BO
  Join BCruises AS BC ON BO.BOrderID = BC.BOrderID
 
  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  Where BC.Dining NOT in ('M','O','L','U','X')
  
  ORDER BY Dining