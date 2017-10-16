-- SELECT * FROM Offers WHERE OfferID NOT IN (SELECT OfferID FROM OPrices)

 --DELETE FROM OPrices WHERE OfferID=80694  AND OPriceID >= 2057632
 --SELECT * FROM OPrices  WHERE OfferID=80694 Order by OPriceID

 -- SELECT * FROM Routes WHERE CountryID is NULL
 --UPDATE [dbo].RoutePoints SET CityID=608 WHERE CityID=1412

-- UPDATE Cities SET Latitude = 20.1306502 , Longitude = -72.9788419  Where CityID= 661
--UPDATE Offers SET ShipID = 14 WHERE OfferID = 76341

--EXEC dbo.MergeAll

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (15, '5*', 2, 'MS Nieuw Statendam New Ship 2018', 'ms_nieuw_statendam', 2018);

SELECT * From Cities WHERE UName LIKE '% %'
SELECT * From Cities Order by CityID DESC
--Update Cities SET UName = 'zaliv_bjuken' Where CityID = 1981

--UPDATE Offers SET RouteID=15841 WHERE OfferID IN (80481)
--UPDATE Offers SET RouteID=20703 WHERE OfferID >=79015 and OfferID <=79039

--INSERT INTO [Topics] ( [RefID], [Type], [Name], [IsLocked]) VALUES ( 363, 'ship', 'Обсуждение лайнера MSC Meraviglia', 0);

SELECT [TopicID]
      ,[RefID]
      ,[Type]
      ,[Name]
      ,[IsLocked]
  FROM [dbo].[Topics]

--UPDATE Ships SET TopicID=421 WHERE ShipID IN (363)

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (15, '5*', 2, 'MS Nieuw Statendam New Ship 2018', 'ms_nieuw_statendam', 2018);

-- Чтобы удалить оффер! Проверить связи:
--DELETE FROM NewOffers WHERE OfferID=81138

--- проверка заявок ----

SELECT BO.BOrderID
      ,BC.Date
	  ,BC.Duration
	  ,BC.ShipID
	  ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
    
  FROM [dbo].[BOrders] BO
  JOIN BCruises BC ON BO.BOrderID = BC.BOrderID
   LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  Where BC.ShipID IN ( 12, 318) and (BC.Date = '2017-09-02' or BC.Date = '2017-08-26')


  --- Авторизация пользователя
  SELECT Email, UserID From aspnet_Membership Where Email = 'avk2324#yandex.ru@cruclub.ru'

  --UPDATE aspnet_Membership SET IsApproved = 1 WHERE Email IN ('baksheew#rambler.ru@cruclub.ru')
  --
  --md5
  SELECT (HASHBYTES('MD5', Lower('A18F5D0B-DC7A-4A98-BED1-5A721649EA98')));-- UserID
  Select (LOWER ('75AB261FA26C08A686CBD1B2D0EFC96D')) -- подставить результат предыдущей строки
  --UPDATE Profiles SET PhotoPath = 'User/75ab261fa26c08a686cbd1b2d0efc96d.jpg' Where UserID = 'A18F5D0B-DC7A-4A98-BED1-5A721649EA98'
  
  
  ---Pullman

--  UPDATE Offers SET IsManual = 0 WHERE Date > '2017-09-25' AND ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID IN (49, 51))
--  TODO SYNC UP
--	UPDATE Offers SET IsManual = 1 WHERE Date > '2017-09-25' AND ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID IN (49, 51)) AND OfferID NOT IN (78180)
