USE [u183189]
GO

SELECT 
     

   
      [RouteID]
    
    
     
   
  
  FROM [dbo].[AOffers]
  Where PackageID is not NULL
  Group by RouteID
GO


