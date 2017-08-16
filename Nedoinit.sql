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

--UPDATE Offers SET RouteID=20703 WHERE OfferID IN (79133)
--UPDATE Offers SET RouteID=20703 WHERE OfferID >=79015 and OfferID <=79039