USE [u183189]
GO

SELECT [PhotoID]
      ,[GalleryID]
      ,[Name]
      ,[Path]
      ,[Type]
      ,[Size]
      ,[Order]
  FROM [dbo].[Photos]
  Order by Type
GO

--UPDATE Photos SET Type ='image/jpeg'  WHERE PhotoID = 9041 
