USE [u183189]
GO
Select  Name1, Name2, Country1, Country2, Round(Distance,0)As Distance
From (
SELECT CC.CityID
      ,CC.CountryID AS Country1
	  ,C.CountryID AS Country2
      ,CC.Name As Name1    
      ,CC.Latitude AS Latitude1
      ,CC.Longitude AS Longitude1
	  ,C.Name AS Name2
	  ,C.Latitude
	  ,C.Longitude
	  , SQRT(Power((CC.Latitude - C.Latitude)*111.194926645, 2) + Power((CC.Longitude - C.Longitude)*70.158308514, 2)) AS Distance
    
      
  FROM [dbo].[Cities] AS CC
 FULL outer Join Cities AS C On C.CityID != CC.CityID) AS FT
 Where Distance < 4
 Order by Country2
 
GO


