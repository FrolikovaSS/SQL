USE [u183189]
GO

SELECT 
	 -- BP.Position
         
	 -- ,BP.LName 
	 -- ,BP.FName
	 --
	--  ,[BookingID]
	 -- ,[Category]  
    --  ,[Cabin]
	-- ,[Phone]
    --  ,[OfferID]
	--  ,CONVERT(nchar(10),[Date],104) as Date
	 -- ,[Duration]
	--  ,BO.CRMID,
	  distinct BO.Email

	    
  FROM [dbo].[BCruises] AS BC 
 JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
 JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 
  WHERE (BC.OfferID = 64713 or BC.OfferID = 73042 or BC.OfferID = 64628) and CRMID is not NULL and StatusID = 100 and BO.OCityID = 1
 -- ORDER BY Date, Cabin, Position
 
GO


