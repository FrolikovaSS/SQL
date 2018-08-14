USE [u183189]
GO

SELECT BO.BOrderID
		,BO.CRMID
      ,CONCAT (PR.LName,' ',PR.FName) AS Manager  
      ,[StatusID]
      ,BT.Status
	  ,BT.Name
	  ,BT.NDate
	  ,BO.Created
  FROM [dbo].[BOrders] as BO
  LEFT OUTER JOIN Profiles AS PR ON BO.ManagerID = PR.UserID
  Join BTasks AS BT ON BT.BOrderID = BO.BOrderID
  WHERE BO.StatusID = 50 and BT.Status = 100 and BT.Owner = 'C' and BT.NDate is not NULL
  Order by Manager
GO


