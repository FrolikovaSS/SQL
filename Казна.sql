USE [u183189]
GO
Select BO.BOrderID     
    ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
    ,[CRMID]
	,BO.Created
	FROM BOrders BO
	LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
	JOIN BCruises BC ON BC.BOrderID = BO.BOrderID
	Where BO.BOrderID IN
(SELECT BO.BOrderID         
  FROM [dbo].[BOrders] BO
  JOIN BPayments as BP ON BP.BOrderID = BO.BOrderID
  JOIN BPaymentItems as BPI ON BPI.BPaymentID = BP.BPaymentID
  WHERE CRMID is not NULL and BO.StatusID = 50 and BP.Status = 200 
  Group by BO.BOrderID HAVING SUM(BPI.Amount) = 0)
  Order by Manager, BO.Created
GO


