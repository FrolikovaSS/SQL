USE [u183189]
GO --/Deposit for option
Select B.BOrderID,
B.CRMID,
B.Num
	,BT.Name
	,CONCAT(P.LName, ' ' ,P.FName) AS Manager
	,BO.Created	
From
(SELECT BO.BOrderID
	,Count(BTaskID)as Num
	,BO.CRMID

   
  FROM [dbo].[BOrders] AS BO
  Left Join BTasks AS BT ON BO.BOrderID = BT.BOrderID
  Where BO.StatusID = 100
  Group by BO.BOrderID, BO.CRMID)AS B
  Left Join BTasks AS BT ON B.BOrderID = BT.BOrderID
   Left Join BOrders AS BO ON BO.BOrderID = BT.BOrderID
  Left JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  Where (B.Num =1 and BT.Name LIKE '%deposit for option%')
  Order by Manager
GO --/Deposit for option

GO --/Additional services

SELECT BO.BOrderID
      
      ,[StatusID]
      ,BC.CompanyID
      , BC.Date
      ,[CRMID]
	    ,BC.Category
     ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
      ,BO.Created
   
  FROM [dbo].[BOrders] as BO
  LEFT JOIN BItems AS BI ON BO.BOrderID = BI.BOrderID
  LEFT Join BCruises AS BC ON BC.BOrderID = BO.BOrderID
   Left JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  Where BO.StatusID = 100 and BC.CompanyID = 49 and BI.BItemID is NULL-- and BC.Date >= '2018-04-01' and (BC.Category <> 'IV'and BC.Category <> 'EV' and BC.Category <> 'BV')
  Order by Manager

Go --/Additional services


