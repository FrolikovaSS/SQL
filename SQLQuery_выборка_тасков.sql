USE [u183189]
GO

SELECT 
	
	 BO.BOrderID
	 , BO.CRMID
  --  , BT.BTaskID
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
  Where (BO.StatusID >=60 and BO.StatusID <=100) and (BT.Status = 60) 
  
  ORDER BY Manager
