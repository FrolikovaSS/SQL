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

--UPDATE Offers SET RouteID=20923 WHERE OfferID IN (83310)
--UPDATE Offers SET RouteID=20703 WHERE OfferID >=79015 and OfferID <=79039

--INSERT INTO [Topics] ( [RefID], [Type], [Name], [IsLocked]) VALUES ( 393, 'ship', 'Обсуждение лайнера "Князь Владимир"', 0);
--UPDATE Ships SET TopicID=420 WHERE ShipID IN (393)

--INSERT INTO [Ships] ([CompanyID], [ShipCategoryID], [StatusID], [Name], [UName], [Year]) VALUES (15, '5*', 2, 'MS Nieuw Statendam New Ship 2018', 'ms_nieuw_statendam', 2018);

--DELETE FROM NewOffers WHERE OfferID=80263

--- проверка заявок ----

SELECT BO.BOrderID
		,BO.StatusID
      ,BC.Date
	  ,BC.Duration
	  ,BC.ShipID
	  ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
    
  FROM [dbo].[BOrders] BO
  JOIN BCruises BC ON BO.BOrderID = BC.BOrderID
   LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  Where BC.ShipID IN (309) and (BC.Date = '2017-11-04')-- or BC.Date = '2017-08-26')


  --- Авторизация пользователя

  --UPDATE aspnet_Membership SET IsApproved = 1 WHERE Email IN ('mikebax888#gmail.com@cruclub.ru')


  ---Pullman

--  UPDATE Offers SET IsManual = 0 WHERE Date > '2017-09-25' AND ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID IN (49, 51))
--  TODO SYNC UP
--	UPDATE Offers SET IsManual = 1 WHERE Date > '2017-09-25' AND ShipID IN (SELECT ShipID FROM Ships WHERE CompanyID IN (49, 51)) AND OfferID NOT IN (78180)


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
  WHERE ME.Email LIKE '%boush%'


  --- Проверка существования оффера
  GO

	 SELECT       [OfferID]  ,[ShipID]   ,[Date]   
	 FROM [dbo].[Offers] WHERE Date = '2017-12-01' and ShipID = 369
  GO
