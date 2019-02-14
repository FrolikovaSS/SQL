-- Проиничены ли офферы? --
-- SELECT * FROM Offers WHERE OfferID NOT IN (SELECT OfferID FROM OPrices)

 --Если матрица проиничена несколько раз--
 --SELECT * FROM OPrices  WHERE OfferID= 100806 Order by OPriceID
 --DELETE FROM OPrices WHERE OfferID= 100806 AND OPriceID >= 2643854

 --DELETE FROM Cabins WHERE CabinID = 8536

 -- SELECT * FROM Routes WHERE CountryID is NULL
 --UPDATE [dbo].RoutePoints SET CityID= 1791 WHERE CityID= 913

-- UPDATE Cities SET Latitude = 20.1306502 , Longitude = -72.9788419  Where CityID= 1442
--UPDATE Offers SET ShipID = 14 WHERE OfferID = 76341
--UPDATE Routes Set CompanyID = 49 WHERE RouteID = 21912
--UPDATE Offers SET CruiseID = '' WHERE OfferID = 12345
--EXEC dbo.MergeAll

--Добавление корабля--
--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (4, '5*', 2, 'Carnival Mardi Gras New Ship 2020', 'сarnival_mardi_gras', 2020);
-- SELECT * FROM Ships

SELECT * From Cities WHERE UName LIKE '% %'
SELECT * From Cities Order by CityID DESC
--Update Cities SET UName = 'zaliv_bjuken' Where CityID = 1981

--Перенос офферов--
--UPDATE Offers SET RouteID = 15586 WHERE OfferID IN (93403,93402,93401,93400,93399,93403,93402,93401,93400,93399)
--UPDATE Offers SET RouteID = 21785 WHERE OfferID >= 100004 and OfferID <=100009

-- UPDATE Offers SET CruiseID = NULL WHERE OfferID IN (SELECt OfferID FROM AOffers WHERE CompanyID=58 and DATE > GETDATE())

--Открыть добавление отзывов у корабля--
--INSERT INTO [Topics] ( [RefID], [Type], [Name], [IsLocked]) VALUES ( 414, 'ship', 'Обсуждение лайнера Carnival Mardi Gras', 0);

SELECT [TopicID]
      ,[RefID]
      ,[Type]
      ,[Name]
      ,[IsLocked]
  FROM [dbo].[Topics]

  -- DELETE FROM Topics Where TopicID = 423

--UPDATE Ships SET TopicID=438 WHERE ShipID IN (414)

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (2, '5*', 2, 'Costa Venezia New Ship 2019', 'costa_venezia', 2019);

-- ###Чтобы удалить оффер! Проверить связи:
--DELETE FROM NewOffers WHERE OfferID IN (95728)

--- проверка заявок ----

SELECT BO.BOrderID
		,BO.StatusID
      ,BC.Date
	  ,BC.Duration
	  ,BC.ShipID
	  ,BO.ManagerID
	  ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
	  ,BC.OfferID
	  ,BO.Created
	  ,BO.CRMID
    
  FROM [dbo].[BOrders] BO
  JOIN BCruises BC ON BO.BOrderID = BC.BOrderID
   LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
 -- Where BC.OfferID IN (79512, 79735, 79734)-- and (BC.Date = '2018-11-30')-- or BC.Date = '2017-06-25')
  Order by Manager

  --- Авторизация пользователя

  --UPDATE aspnet_Membership SET IsApproved = 1 WHERE Email IN ('pshalaev#gmail.com@cruclub.ru')


  ---Pullman

--  UPDATE Offers SET IsManual = 0 WHERE Date > '2017-09-25' AND ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID IN (49, 51))
--  TODO SYNC UP
--	UPDATE Offers SET IsManual = 1 WHERE Date > '2017-09-25' AND ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID IN (49, 51)) AND OfferID NOT IN (78180)

 --md5
  SELECT (HASHBYTES('MD5', Lower('EB5D3D8F-9392-4312-8A80-5FF775DE9FA3')));-- UserID
  Select (LOWER ('634E927ADD46F4D99FDF566C9A2E3CAB')) -- подставить результат предыдущей строки
  --UPDATE Profiles SET PhotoPath = 'User/634e927add46f4d99fdf566c9a2e3cab.jpg' Where UserID = 'EB5D3D8F-9392-4312-8A80-5FF775DE9FA3'
  -- в Profiles добавить цитату и КК
  --UPDATE Profiles SET Position = 'MSC Crociere, Costa Cruises, Norwegian Cruise Line' Where UserID = 'EB5D3D8F-9392-4312-8A80-5FF775DE9FA3'

  --UPDATE Profiles SET Quote = 'Круизы - это возможность узнать мир в роскошных условиях!' Where UserID = 'EB5D3D8F-9392-4312-8A80-5FF775DE9FA3'
   --UPDATE Profiles SET OfficeID = 1  Where UserID = 'EB5D3D8F-9392-4312-8A80-5FF775DE9FA3'

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
 WHERE ME.Email LIKE '%valdoksana#yandex.ru@cruclub.ru%'
  --Where U.UserName LIKE ''

  --UPDATE aspnet_Membership SET Email = 'o.baeva@cruclub.ru' Where UserID = '76BC4E11-03B5-43EC-B0B8-C72A4738A0C5'

  --- Проверка существования оффера
  GO

	 SELECT       OFR.OfferID  ,OFR.ShipID   ,OFR.Date  , BC.Duration,IsManual, CruiseID 
	 FROM [dbo].[Offers] AS OFR
	 LEFT JOIN BCruises as BC ON   OFR.OfferID = BC.OfferID
	  WHERE  OFR.ShipID = 332 and IsManual= 0  and OFR.Date = '2019-04-27'
	 Order by OFR.Date
  GO

  -- Символы кириллицы с ударением в названии города
  -- SELECT Name, CityID FROM [dbo].[Cities] WHERE Name Like N'%[а́е́и́о́у́ы́э́ю́я́]%'
  SELECT * FROM Cities WHERE DATALENGTH(Name) <> DATALENGTH(LTRIM(RTRIM(Name)))