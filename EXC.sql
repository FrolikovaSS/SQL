USE [u183189]
GO
SELECT BO.BOrderID, BO.CRMID, CONCAT(P.LName, ' ' ,P.FName) AS Manager	
FROM dbo.BOrders as BO
LEFT OUTER JOIN Profiles AS P ON BO.ManagerID= P.UserID 
Where BO.BOrderID IN

(SELECT
	BO.BOrderID
	
	  
  FROM [dbo].[BCruises] AS BC 
 Left JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 
 
  JOIN BItemPersons AS BIP ON BP.BPersonID = BIP.BPersonID
   JOIN BItems AS BI ON BIP.BItemID = BI.BItemID

 WHERE ( StatusID = 100) and BC.CompanyID = 2 and BI.Type = 'EXC')
 
ORDER BY Manager
 
GO


