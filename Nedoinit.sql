-- SELECT * FROM Offers WHERE OfferID NOT IN (SELECT OfferID FROM OPrices)

 --DELETE FROM OPrices WHERE OfferID= 93513 AND OPriceID >= 2422295
 --SELECT * FROM OPrices  WHERE OfferID= 93513 Order by OPriceID

 -- SELECT * FROM Routes WHERE CountryID is NULL
 --UPDATE [dbo].RoutePoints SET CityID= 1791 WHERE CityID= 913

-- UPDATE Cities SET Latitude = 20.1306502 , Longitude = -72.9788419  Where CityID= 1442
--UPDATE Offers SET ShipID = 14 WHERE OfferID = 76341
--UPDATE Routes Set CompanyID = 49 WHERE RouteID = 21912
--UPDATE Offers SET CruiseID = '' WHERE OfferID = 12345
--EXEC dbo.MergeAll

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (4, '4*', 1, 'Carnival Sunrise', 'сarnival_sunrise', 1999);
-- SELECT * FROM Ships

SELECT * From Cities WHERE UName LIKE '% %'
SELECT * From Cities Order by CityID DESC
--Update Cities SET UName = 'zaliv_bjuken' Where CityID = 1981

--UPDATE Offers SET RouteID= 24523 WHERE OfferID IN (93318, 93319, 93320)
--UPDATE Offers SET RouteID = 24399 WHERE OfferID >=88830 and OfferID <=88856

--INSERT INTO [Topics] ( [RefID], [Type], [Name], [IsLocked]) VALUES ( 407, 'ship', 'Обсуждение лайнера  Carnival Sunrise', 0);

SELECT [TopicID]
      ,[RefID]
      ,[Type]
      ,[Name]
      ,[IsLocked]
  FROM [dbo].[Topics]

  -- DELETE FROM Topics Where TopicID = 423

--UPDATE Ships SET TopicID=429 WHERE ShipID IN (405)

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (2, '5*', 2, 'Costa Venezia New Ship 2019', 'costa_venezia', 2019);

-- Чтобы удалить оффер! Проверить связи:
--DELETE FROM NewOffers WHERE OfferID=88519

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

  --UPDATE aspnet_Membership SET IsApproved = 1 WHERE Email IN ('elenamashov#mail.ru@cruclub.ru')


  ---Pullman

--  UPDATE Offers SET IsManual = 0 WHERE Date > '2017-09-25' AND ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID IN (49, 51))
--  TODO SYNC UP
--	UPDATE Offers SET IsManual = 1 WHERE Date > '2017-09-25' AND ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID IN (49, 51)) AND OfferID NOT IN (78180)

 --md5
  SELECT (HASHBYTES('MD5', Lower('145623A5-C376-4611-8C0E-EE61572B63A4')));-- UserID
  Select (LOWER ('A6952DB778B14D782EC48243AA942CB9')) -- подставить результат предыдущей строки
  --UPDATE Profiles SET PhotoPath = 'User/a6952db778b14d782ec48243aa942cb9.jpg' Where UserID = 'E3D97DA7-A5F9-4E37-AFF2-2A9D576E4FCE'
  -- в Profiles добавить цитату и КК
  --UPDATE Profiles SET Position = 'MSC Crociere, Costa Cruises, Norwegian Cruise Line, Oceania Cruises' Where UserID = 'DEAB7B82-18EF-4788-844F-BA26646BDDDE'

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
  WHERE ME.Email LIKE '%tatianadreamtour@gmail.com%'
  --Where ME.UserID = 'E3D97DA7-A5F9-4E37-AFF2-2A9D576E4FCE'
  --UPDATE aspnet_Membership SET Email = 'a.teplova@cruclub.ru' Where UserID = '145623A5-C376-4611-8C0E-EE61572B63A4'

  --- Проверка существования оффера
  GO

	 SELECT       OFR.OfferID  ,OFR.ShipID   ,OFR.Date  , BC.Duration,IsManual 
	 FROM [dbo].[Offers] AS OFR
	 LEFT JOIN BCruises as BC ON   OFR.OfferID = BC.OfferID
	  WHERE  OFR.ShipID = 237 and IsManual= 0  and OFR.Date = '2018-10-08'
	 Order by OFR.Date
  GO

  -- Символы кириллицы с ударением в названии города
  -- SELECT Name, CityID FROM [dbo].[Cities] WHERE Name Like N'%[а́е́и́о́у́ы́э́ю́я́]%'
  SELECT * FROM Cities WHERE DATALENGTH(Name) <> DATALENGTH(LTRIM(RTRIM(Name)))