SELECT 
	 BO.OCityID
	 ,BO.BOrderID
	 , BO.CRMID
   
	,Date
	,BO.Created
	,BC.Dining
	,BC.Cabin
	,BC.BookingID
      ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
     
      ,[StatusID]
     
      ,BO.FName
      ,BO.LName 
     
  FROM [dbo].[BOrders] AS BO
  Join BCruises AS BC ON BO.BOrderID = BC.BOrderID
 
  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  Where BO.Created > '2017-04-01' and (BC.Dining = 'X' or BC.Cabin LIKE 'X' or BC.BookingID is NULL)
  
  ORDER BY Manager