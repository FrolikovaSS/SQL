USE [u183189]
GO

SELECT BO.BOrderID
      ,[CRMID]
	  ,BC.Cabin
	  ,BC.Category
	  
	  ,BC.BookingID
	  ,B.pax
	  ,BP.Position
	  ,BCP.p
	  ,BCP.ncf
	  
	  ,BP.FName
	  ,BP.LName
	  ,BI.Name
	  ,BIP.p
	  ,BIP.ncf
     
  FROM [dbo].[BOrders] AS BO
  
   Left JOIN BCruises AS BC ON BC.BOrderID = BO.BOrderID
   JOIN (
	SELECT  
			
			COUNT(BCP.p) AS pax			
		,BCP.BCruiseID
	FROM BCruisePersons BCP
	
	JOIN BCruises as BC ON BC.BCruiseID = BCP.BCruiseID
	GROUP BY BCP.BCruiseID
	) AS B ON BC.BCruiseID = B.BCruiseID
    Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
   Left JOIN BCruisePersons BCP ON BP.BPersonID = BCP.BPersonID
  Left JOIN BItemPersons AS BIP ON BIP.BPersonID = BP.BPersonID
  Left JOIN BItems AS BI ON BIP.BItemID = BI.BItemID

   WHERE BO.StatusID = 100 and CRMID >= '13774' and CRMID <= '13794'

   Order by CRMID, BO.BOrderID,  BP.Position
GO


