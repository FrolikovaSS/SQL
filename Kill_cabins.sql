-- Перед тем, как убить каюту - удалить все фотографии этой каюты вручную в ЛК


GO

DECLARE @ShipID int;
SET @ShipID= 407;

DELETE FROM CabinsInDeck WHERE CabinID IN (SELECT CabinID FROM Cabins WHERE ShipID=@ShipID AND Code IN ('O1'));
DELETE FROM Galleries WHERE GalleryID IN (SELECT GalleryID FROM Cabins WHERE ShipID=@ShipID AND Code IN ('O1'));
DELETE FROM Cabins WHERE ShipID=@ShipID AND Code IN ('O1');
DELETE FROM OPrices WHERE OfferID IN (SELECT OfferID FROM Offers WHERE ShipID=@ShipID) AND CabinCode IN ('O1');

GO

-- 'M','N','Q','Z','K','L','J','G','G1','G2','H','I','Y','F','PV','FO','FF'


