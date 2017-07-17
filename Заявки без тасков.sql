SELECT 
	 BO.OCityID
	 ,BO.BOrderID
	 , BO.CRMID
    , BT.BTaskID
	,Date
	,BO.Created
      ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
     ,BT.Status
      ,[StatusID]
     
      ,BO.FName
      ,BO.LName 
     
  FROM [dbo].[BOrders] AS BO
  Join BCruises AS BC ON BO.BOrderID = BC.BOrderID
  Left Outer join BTasks AS BT ON BT.BOrderID = BO.BOrderID
  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  Where BT.BTaskID is NULL and BO.Created > '2017-04-01' and BO.StatusID = 100
  
  ORDER BY Manager, StatusID