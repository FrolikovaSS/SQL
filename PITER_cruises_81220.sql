USE [u183189]
GO

SELECT 
      OfferID
     ,CabinCode
      ,[op]  
      ,[op1]
	  ,[op2]
	,[op3]
	,[op4]
	,[op5]
	 ,[op6]
	   ,[sp]
      ,[sp1]
      ,[sp2]     
      ,[sp3]      
      ,[sp4]    
      ,[sp5]   
      ,[sp6]
	  ,bca
  FROM [dbo].[OPrices]
  Where OfferID = 81220 and (CabinCode IN ('IV','EV','BV'))
GO


