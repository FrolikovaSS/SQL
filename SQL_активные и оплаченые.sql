USE [u183189]
GO

SELECT BO.BOrderID
		,BO.CRMID
      ,CONCAT(PR.LName, ' ' ,PR.FName) AS Manager
    ,BO.Created
      ,[StatusID] as  Active
    
      ,BT.Status as Waiting
	  ,BT.Name
	  ,BT.NDate
	  ,DATEDIFF ( dd , GETDATE() , NDate ) as Days
	
	  ,Getdate() as Today

  FROM [dbo].[BOrders] as BO
  LEFT OUTER JOIN Profiles AS PR ON BO.ManagerID=PR.UserID 
   JOIN (SELECT 
      [BOrderID]
    
	  ,SUM(BPI.Amount) as Paid
	     
  FROM [dbo].[BPayments] as BP
  JOIN BPaymentItems as BPI ON BP.BPaymentID = BPI.BPaymentID
  Where Status=200
  Group by BOrderID) AS P ON BO.BOrderID = P.BOrderID
   Left Join BCruises BC ON BC.BOrderID = BO.BOrderID
 
 Join ( SELECT SUM(BCP.p) as Summa,
				 COUNT(BCP.p) as pax,
				 BCruiseID

				FROM BCruisePersons BCP 
Group by BCruiseID) as B ON BC.BCruiseID = B.BCruiseID
Left Outer join BTasks AS BT ON BT.BOrderID = BO.BOrderID

  Where BO.StatusID = 100 and B.Summa = P.Paid and BT.Status = 100 and BT.Name LIKE '%оплат%' and BT.Owner = 'C'
  Order by BOrderID, Manager
GO


--------

GO
SELECT * FROM (
SELECT BO.BOrderID
		,BO.CRMID
      ,CONCAT(PR.LName, ' ' ,PR.FName) AS Manager
      ,BO.Created
      ,[StatusID] as  Active   
      ,BT.Status as Waiting
	  ,BT.Name
	  ,BT.NDate
	  ,DATEDIFF ( dd , GETDATE() , NDate ) as Days	
	  ,Getdate() as Today

  FROM [dbo].[BOrders] as BO
   LEFT OUTER JOIN Profiles AS PR ON BO.ManagerID=PR.UserID 
   Left Join BCruises BC ON BC.BOrderID = BO.BOrderID
   Left Outer join BTasks AS BT ON BT.BOrderID = BO.BOrderID

  Where BO.StatusID = 100 and BT.Status = 100 and BT.Name LIKE '%оплат%' and BT.Owner = 'C') as M Where M.Days <5 or M.Days is NULL
  Order by Days
GO