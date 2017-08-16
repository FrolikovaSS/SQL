USE [u183189]
GO
Select BO.BorderID,
		 CONCAT(P.LName, ' ' ,P.FName) AS Manager
		 FROM BOrders AS BO
		  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
		 WHERE BO.BOrderID IN

(SELECT BO.BOrderID

  FROM [dbo].[Profiles] AS P
  JOIN BOrders as BO ON BO.Phone = P.Phone
  Where BO.AgencyID is NULL and BO.AgencyID is NULL
  and (BO.LName <> P.LName or BO.FName <> P.FName or BO.MName <> P.MName) and BO.StatusID = 100
 )
 Order by BO.BOrderID
GO


