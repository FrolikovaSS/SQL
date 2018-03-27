USE [u183189]
GO
SELECT 
BO.BOrderID,
BC.Date,
BO.CRMID
,CONCAT(P.LName, ' ' ,P.FName) AS Manager
FROM dbo.BOrders as BO
JOIN BCruises as BC ON BC.BOrderID = BO.BOrderID
LEFT OUTER JOIN Profiles AS P ON BO.ManagerID= P.UserID
 Where BC.Date >= '2018-03-20' and BO.StatusID = 100 and BO.BOrderID IN

(SELECT 
      [BOrderID]
       
  FROM [dbo].[BItems] as BI

  where Type = 'IPF')
  Order by Manager
GO


