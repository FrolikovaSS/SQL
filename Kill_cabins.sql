GO

DECLARE @ShipID int;
SET @ShipID=339;

DELETE FROM CabinsInDeck WHERE CabinID IN (SELECT CabinID FROM Cabins WHERE ShipID=@ShipID AND Code IN ('J', 'F', 'D', 'B', 'H'));
DELETE FROM Galleries WHERE GalleryID IN (SELECT GalleryID FROM Cabins WHERE ShipID=@ShipID AND Code IN ('J', 'F', 'D', 'B', 'H'));
DELETE FROM Cabins WHERE ShipID=@ShipID AND Code IN ('J', 'F', 'D', 'B', 'H');
DELETE FROM OPrices WHERE OfferID IN (SELECT OfferID FROM Offers WHERE ShipID=@ShipID) AND CabinCode IN ('J', 'F', 'D', 'B', 'H');

GO
