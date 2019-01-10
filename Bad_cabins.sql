USE [u183189]
GO

SELECT [CabinID]
      ,C.ShipID
	  ,SH.CompanyID
      ,[CabinTypeID]
      ,[Dublicate]
    
      ,[NewGalleryID]
      ,C.Name
      ,[Code]
      ,[BGColor]
      ,[FGColor]
      ,C.Description
      ,[NDescription]
      ,[Capacity]
      ,[Size]
      ,[Order]
  FROM [dbo].[Cabins] AS C 
  LEFT JOIN Ships as SH ON SH.ShipID = C.ShipID
  WHERE C.Description Is NULL AND CompanyID NOT IN (51, 52, 3)
  Order by CompanyID
GO


