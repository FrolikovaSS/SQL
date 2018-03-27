USE [u183189]
GO
Select  BC.ShipID,[CRMID]
   ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
    FROM [dbo].[BOrders] as BO
  JOIN BCruises as BC ON BO.BOrderID = BC.BOrderID
  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID= P.UserID
  WHERE CRMID IN
(SELECT     [CRMID]
   
  FROM [dbo].[BOrders] as BO
  JOIN BCruises as BC ON BO.BOrderID = BC.BOrderID
  Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
   JOIN BItems AS BI ON BO.BOrderID = BI.BOrderID
    JOIN BItemPersons as BIP ON BI.BItemID = BIP.BItemID
  WHERE BC.ShipID = 345 and (BC.Date >= '2018-03-29' and BC.Date <= '2018-11-24') and BO.StatusID = 100 and BI.Type = 'EXC' and BIP.p <> 0)
  Order by Manager, CRMID
GO


