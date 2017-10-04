GO

DECLARE @ShipID int;
SET @ShipID=361;

DELETE FROM CabinsInDeck WHERE CabinID IN (SELECT CabinID FROM Cabins WHERE ShipID=@ShipID AND Code IN ('M', 'N', 'Q', 'K', 'L', 'IC', 'OC', 'BC', 'FC'));
DELETE FROM Galleries WHERE GalleryID IN (SELECT GalleryID FROM Cabins WHERE ShipID=@ShipID AND Code IN ('M', 'N', 'Q', 'K', 'L', 'IC', 'OC', 'BC', 'FC'));
DELETE FROM Cabins WHERE ShipID=@ShipID AND Code IN ('M', 'N', 'Q', 'K', 'L', 'IC', 'OC', 'BC', 'FC');
DELETE FROM OPrices WHERE OfferID IN (SELECT OfferID FROM Offers WHERE ShipID=@ShipID) AND CabinCode IN ('M', 'N', 'Q', 'K', 'L', 'IC', 'OC', 'BC', 'FC');

GO
