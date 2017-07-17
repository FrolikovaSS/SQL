USE [u183189]
GO

SELECT BO.CRMID
	  ,[BookingID]
	   ,[Category]  
      ,[Cabin]
	  ,BP.Position
         
	  ,BP.LName 
	  ,BP.FName
	 , BP.Type
		,BCP.p 
	  ,CONVERT(nchar(10),[Date],104) as Date
	  
	  , BO.StatusID
	  
	  , BPI.Amount
	    
  FROM [dbo].[BCruises] AS BC 
 JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
 JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 left JOIN BCruisePersons AS BCP ON BP.BPersonID = BCP.BPersonID
 JOIN BPayments AS BPY ON BC.BOrderID = BPY.BOrderID 
 Join BPaymentItems AS BPI ON BPI.BPaymentID = BPY.BPaymentID
 
  WHERE (BC.OfferID = 61923)  and AgencyID='a2a4caa0-929e-43e7-89ba-02599fc8f1dd' and BPY.Status = 200
  ORDER BY CRMID, Position


