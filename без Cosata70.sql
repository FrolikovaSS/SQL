USE [u183189]
GO
Select BO.BOrderID    ,[CRMID]    
      ,CONCAT(P.LName, ' ' ,P.FName) AS Manager ,BC.Date
      ,[StatusID]   
      ,BO.[LName]    

	  From [dbo].[BOrders] as BO
	   JOIN BCruises as BC ON BO.BOrderID = BC.BOrderID
	   
	  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
	  Where BC.CompanyID = 2 and BC.Date > '2017-12-31' and BC.date < '2019-01-01' and BO.StatusID = 100  and BO.BOrderID not IN (

SELECT BO.BOrderID
    
  FROM [dbo].[BOrders] as BO
  JOIN BCruises as BC ON BO.BOrderID = BC.BOrderID
--  JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 -- JOIN BItemPersons AS BIP ON BP.BPersonID = BIP.BPersonID
  -- JOIN BItems AS BI ON BIP.BItemID = BI.BItemID
  JOIN BItems AS BI ON BO.BOrderID= BI.BOrderID
  Where BC.Date > '2017-10-31' and BC.date < '2019-01-01' and BC.CompanyID = 2 and (BI.Name LIKE '%упон%' or BI.Name LIKE '%osta%' or BI.Name Like '%70%'))
  Order by Manager, CRMID
GO


