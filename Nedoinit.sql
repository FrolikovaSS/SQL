-- SELECT * FROM Offers WHERE OfferID NOT IN (SELECT OfferID FROM OPrices)

 --DELETE FROM OPrices WHERE OfferID=80694  AND OPriceID >= 2057632
 --SELECT * FROM OPrices  WHERE OfferID=80694 Order by OPriceID

 -- SELECT * FROM Routes WHERE CountryID is NULL
 --UPDATE [dbo].RoutePoints SET CityID=337 WHERE CityID=1442

-- UPDATE Cities SET Latitude = 20.1306502 , Longitude = -72.9788419  Where CityID= 1442
--UPDATE Offers SET ShipID = 14 WHERE OfferID = 76341
--UPDATE Routes Set CompanyID = 49 WHERE RouteID = 21912
--EXEC dbo.MergeAll

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (13, '5*', 2, 'Celebrity Flora New Ship 2019', 'celebrity_flora', 2019);



SELECT * From Cities WHERE UName LIKE '% %'
SELECT * From Cities Order by CityID DESC
--Update Cities SET UName = 'zaliv_bjuken' Where CityID = 1981

--UPDATE Offers SET RouteID=22431 WHERE OfferID IN (80401)
--UPDATE Offers SET RouteID=21955 WHERE OfferID >=63360 and OfferID <=63364

--INSERT INTO [Topics] ( [RefID], [Type], [Name], [IsLocked]) VALUES ( 167, 'ship', 'Обсуждение лайнера Celebrity Infinity', 0);

SELECT [TopicID]
      ,[RefID]
      ,[Type]
      ,[Name]
      ,[IsLocked]
  FROM [dbo].[Topics]

  -- DELETE FROM Topics Where TopicID = 423

--UPDATE Ships SET TopicID=204 WHERE ShipID IN (167)

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (15, '5*', 2, 'MS Nieuw Statendam New Ship 2018', 'ms_nieuw_statendam', 2018);

-- Чтобы удалить оффер! Проверить связи:
--DELETE FROM NewOffers WHERE OfferID=80263

--- проверка заявок ----

SELECT BO.BOrderID
		,BO.StatusID
      ,BC.Date
	  ,BC.Duration
	  ,BC.ShipID
	  ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
	  ,BC.OfferID
    
  FROM [dbo].[BOrders] BO
  JOIN BCruises BC ON BO.BOrderID = BC.BOrderID
   LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  Where BC.ShipID IN (14) and (BC.Date = '2018-03-06')-- or BC.Date = '2017-08-26')


  --- Авторизация пользователя

  --UPDATE aspnet_Membership SET IsApproved = 1 WHERE Email IN ('alex_zel#mail.ru@cruclub.ru')


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
  WHERE ME.Email LIKE '%alex_zelu%'


  --- Проверка существования оффера
  GO

	 SELECT       [OfferID]  ,[ShipID]   ,[Date]   
	 FROM [dbo].[Offers] WHERE Date = '2018-06-19' and ShipID = 349
  GO

  -- Символы кириллицы с ударением в названии города
  -- SELECT Name, CityID FROM [dbo].[Cities] WHERE Name Like N'%[а́е́и́о́у́ы́э́ю́я́]%'
