GO

DECLARE @ShipID int;
SET @ShipID=372;

DELETE FROM CabinsInDeck WHERE CabinID IN (SELECT CabinID FROM Cabins WHERE ShipID=@ShipID AND Code IN ('W'));
DELETE FROM Galleries WHERE GalleryID IN (SELECT GalleryID FROM Cabins WHERE ShipID=@ShipID AND Code IN ('W'));
DELETE FROM Cabins WHERE ShipID=@ShipID AND Code IN ('W');
DELETE FROM OPrices WHERE OfferID IN (SELECT OfferID FROM Offers WHERE ShipID=@ShipID) AND CabinCode IN ('W');

GO
