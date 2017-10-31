USE [u183189]
GO
Select BO.BOrderID    ,[CRMID]    
      ,CONCAT(P.LName, ' ' ,P.FName) AS Manager ,BC.Date
      ,[StatusID]   
      ,BO.[LName]    
    
	  From [dbo].[BOrders] as BO
	   JOIN BCruises as BC ON BO.BOrderID = BC.BOrderID
	  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
	  Where BC.CompanyID = 2 and BC.Date > '2017-12-31' and BC.date < '2019-01-01' and BO.StatusID = 100 AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) and BO.BOrderID not IN (

SELECT BO.BOrderID
   
     
  FROM [dbo].[BOrders] as BO
  JOIN BCruises as BC ON BO.BOrderID = BC.BOrderID
 
  Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
  JOIN BItemPersons AS BIP ON BP.BPersonID = BIP.BPersonID
   JOIN BItems AS BI ON BIP.BItemID = BI.BItemID
  Where BC.Date > '2017-10-31' and BC.CompanyID = 2 and BI.Type = 'oth' and BI.Name LIKE '%costa%70%' AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL))
  Order by Manager, Date
GO


