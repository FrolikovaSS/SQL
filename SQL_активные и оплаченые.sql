USE [u183189]
GO

SELECT BO.BOrderID

      ,CONCAT(PR.LName, ' ' ,PR.FName) AS Manager
    ,BO.Created
      ,[StatusID]
    
      ,[CRMID]
      
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

  Where BO.StatusID = 100 and B.Summa = P.Paid
  Order by Manager
GO


