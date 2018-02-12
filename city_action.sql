USE [u183189]
GO

SELECT [CityID]
      ,[CountryID]    
      ,[Name]
      
  FROM [dbo].[Cities] 
   WHERE  Name LIKE '%(%)%'
   Order by CountryID

----------- проверка на количество заявок активных
GO

SELECT BO.BOrderID, BC.OfferID
     
  FROM [dbo].[BOrders] as BO
  JOIN BCruises BC ON BO.BOrderID=BC.BOrderID
  WHERE BC.Trace LIKE '%Ашдод%' and BO.StatusID = 100
  Order by OfferID
GO

----- "Тихий режим"
SELECT OfferID, CountryID, Trace From AOffers Where OfferID = 69288
--UPDATE BCruises Set Trace = 'Ном - Порт Провидения - зал. Дежнёва - село Уэлен  - Колючинская губа - о-в Колючин - о-в Айон - Медвежьи о-ва - пр. Дмитрия Лаптева - о-в Ляховский - о-ва Де-Лонга - о-в Врангеля - пр. Сенявина - Порт Провидения - Ном' Where OfferID = 69288
SELECT Trace From BCruises Where OfferID = 69288
