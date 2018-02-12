-- Перед тем, как убить каюту - удалить все фотографии этой каюты вручную в ЛК
GO

DECLARE @ShipID int;
SET @ShipID=368;

DELETE FROM CabinsInDeck WHERE CabinID IN (SELECT CabinID FROM Cabins WHERE ShipID=@ShipID AND Code IN ('Z',
'K','L','M','N','Q','Y','SO','F1','F2','F3','G','H','I','JS','W'));
DELETE FROM Galleries WHERE GalleryID IN (SELECT GalleryID FROM Cabins WHERE ShipID=@ShipID AND Code IN ('Z',
'K','L','M','N','Q','Y','SO','F1','F2','F3','G','H','I','JS','W'));
DELETE FROM Cabins WHERE ShipID=@ShipID AND Code IN ('Z',
'K','L','M','N','Q','Y','SO','F1','F2','F3','G','H','I','JS','W');
DELETE FROM OPrices WHERE OfferID IN (SELECT OfferID FROM Offers WHERE ShipID=@ShipID) AND CabinCode IN ('Z',
'K','L','M','N','Q','Y','SO','F1','F2','F3','G','H','I','JS','W');

GO
