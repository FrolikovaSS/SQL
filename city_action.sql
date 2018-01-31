USE [u183189]
GO

SELECT [CityID]
      ,[CountryID]    
      ,[Name]
      
  FROM [dbo].[Cities] WHERE Name LIKE '%остров%'-- CityID IN(
 --125,130,145,147,208,231,275,279,303,332,337,416,568,586,593,637,638,650,654,694,705,706,723,764,775,780,795,806,850,
--1024,1165,1205,1208,1314,1494,1546,1547,1652,1698,1768,1791,1823,1824,1948,2002,2019,2073,2077)

----------- проверка на количество заявок активных
GO

SELECT BO.BOrderID
     
  FROM [dbo].[BOrders] as BO
  JOIN BCruises BC ON BO.BOrderID=BC.BOrderID
  WHERE BC.Trace LIKE '%остров%' and BO.StatusID = 100
GO