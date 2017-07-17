USE [u183189]
GO

SELECT O.OfferID
  
      ,[ShipID]
 
      ,[RouteID]
    
  
      ,[Date]
	  ,OP.OPriceID
      ,[IsManual]
     
  FROM [dbo].[Offers] AS O
  left join OPrices AS OP ON O.OfferID = OP.OfferID 
  where OP.OPriceID is NULL
 
GO


