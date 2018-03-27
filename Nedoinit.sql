-- SELECT * FROM Offers WHERE OfferID NOT IN (SELECT OfferID FROM OPrices)

 --DELETE FROM OPrices WHERE OfferID=89921  AND OPriceID >= 2332054
 --SELECT * FROM OPrices  WHERE OfferID=89921 Order by OPriceID

 -- SELECT * FROM Routes WHERE CountryID is NULL
 --UPDATE [dbo].RoutePoints SET CityID=1671 WHERE CityID=1144

-- UPDATE Cities SET Latitude = 20.1306502 , Longitude = -72.9788419  Where CityID= 1442
--UPDATE Offers SET ShipID = 14 WHERE OfferID = 76341
--UPDATE Routes Set CompanyID = 49 WHERE RouteID = 21912
--EXEC dbo.MergeAll

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (4, '5*', 2, 'Carnival Panorama New Ship 2019', 'carnival_panorama', 2019);



SELECT * From Cities WHERE UName LIKE '% %'
SELECT * From Cities Order by CityID DESC
--Update Cities SET UName = 'zaliv_bjuken' Where CityID = 1981

--UPDATE Offers SET RouteID=19178 WHERE OfferID IN (64435)
--UPDATE Offers SET RouteID=21955 WHERE OfferID >=63360 and OfferID <=63364

--INSERT INTO [Topics] ( [RefID], [Type], [Name], [IsLocked]) VALUES ( 402, 'ship', 'Обсуждение лайнера Carnival Panorama', 0);

SELECT [TopicID]
      ,[RefID]
      ,[Type]
      ,[Name]
      ,[IsLocked]
  FROM [dbo].[Topics]

  -- DELETE FROM Topics Where TopicID = 423

--UPDATE Ships SET TopicID=426 WHERE ShipID IN (402)

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (2, '5*', 2, 'Costa Venezia New Ship 2019', 'costa_venezia', 2019);

-- Чтобы удалить оффер! Проверить связи:
--DELETE FROM NewOffers WHERE OfferID=88519

--- проверка заявок ----

SELECT BO.BOrderID
		,BO.StatusID
      ,BC.Date
	  ,BC.Duration
	  ,BC.ShipID
	  ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
	  ,BC.OfferID
	  ,BO.Created
	  ,BO.CRMID
    
  FROM [dbo].[BOrders] BO
  JOIN BCruises BC ON BO.BOrderID = BC.BOrderID
   LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  Where BC.OfferID IN (79512, 79735, 79734)-- and (BC.Date = '2018-11-30')-- or BC.Date = '2017-08-26')
  Order by Manager

  --- Авторизация пользователя

  --UPDATE aspnet_Membership SET IsApproved = 1 WHERE Email IN ('alexandreev1992#mail.ru@cruclub.ru')


  ---Pullman

--  UPDATE Offers SET IsManual = 0 WHERE Date > '2017-09-25' AND ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID IN (49, 51))
--  TODO SYNC UP
--	UPDATE Offers SET IsManual = 1 WHERE Date > '2017-09-25' AND ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID IN (49, 51)) AND OfferID NOT IN (78180)

 --md5
  SELECT (HASHBYTES('MD5', Lower('8831E721-28EB-4928-B0A0-9A39A955CCA7')));-- UserID
  Select (LOWER ('1CED39635F69E6533CB1427FD828D0F6')) -- подставить результат предыдущей строки
  --UPDATE Profiles SET PhotoPath = 'User/1ced39635f69e6533cb1427fd828d0f6.jpg' Where UserID = '8831E721-28EB-4928-B0A0-9A39A955CCA7'
  -- в Profiles добавить цитату и КК

---Поиск для отзыва

SELECT 
       U.UserId
	   , U.UserName
      ,[MobilePIN]
      ,[Email]
      ,[LoweredEmail]
      ,[PasswordQuestion]  
      ,[IsApproved]
  
  FROM [dbo].[aspnet_Membership] as ME
  JOIN aspnet_Users as U ON U.UserId = ME.UserId
  WHERE ME.Email LIKE '%ls2005902@yandex.ru%'


  --- Проверка существования оффера
  GO

	 SELECT       [OfferID]  ,[ShipID]   ,[Date]  , IsManual 
	 FROM [dbo].[Offers] WHERE  ShipID = 216 and IsManual= 0  and Date = '2018-03-26'
	 Order by Date
  GO

  -- Символы кириллицы с ударением в названии города
  -- SELECT Name, CityID FROM [dbo].[Cities] WHERE Name Like N'%[а́е́и́о́у́ы́э́ю́я́]%'
  SELECT * FROM Cities WHERE DATALENGTH(Name) <> DATALENGTH(LTRIM(RTRIM(Name)))