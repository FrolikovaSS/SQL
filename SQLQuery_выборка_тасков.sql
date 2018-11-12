USE [u183189]
GO

SELECT 
	
	 BO.BOrderID
	 , BO.CRMID
  --  , BT.BTaskID
	--,Date
	,BO.Created
      ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
   --  ,BT.Status
      ,[StatusID]
     ,COUNT(BT.BTaskID) OVER (PARTITION BY BO.BOrderID) AS task
 --     ,BO.FName
  --    ,BO.LName 
     ,BT.Author
	 ,BT.Owner
	 ,BT.Name
	 ,BT.Severity
  FROM [dbo].[BOrders] AS BO
  Join BCruises AS BC ON BO.BOrderID = BC.BOrderID
  Left Outer join BTasks AS BT ON BT.BOrderID = BO.BOrderID
  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  Where (BO.StatusID =50 or BO.StatusID =100) and (BT.Status = 60) 
   and BT.Owner = 'M'
  ORDER BY Manager, BOrderID, StatusID

  -----//---Без таска о полной оплате

  USE [u183189]
GO

SELECT 
	
	distinct BO.BOrderID
	 , BO.CRMID
     ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
    
   --   ,[StatusID]
  
  --    ,BT.Name 
	  From [dbo].[BOrders] AS BO
	    Join BCruises AS BC ON BO.BOrderID = BC.BOrderID
  Left Outer join BTasks AS BT ON BT.BOrderID = BO.BOrderID
  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  WHERE BO.StatusID =100 and BO.BOrderID not IN 
  
  (SELECT BO.BOrderID
     
  FROM [dbo].[BOrders] AS BO
  Join BCruises AS BC ON BO.BOrderID = BC.BOrderID
  Left Outer join BTasks AS BT ON BT.BOrderID = BO.BOrderID
  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  Where BO.StatusID =100 and BT.Name LIKE '%полн%')
  
  ORDER BY Manager, BOrderID
