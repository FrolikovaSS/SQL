select
CruiseID, COUNT(OFR.OfferID) as Num --OFR.OfferID--, SessionID, BC.Duration,IsManual
 FROM Offers as OFR
--LEFT JOIN BCruises as BC ON   OFR.OfferID = BC.OfferID
WHERE  OFR.DATE > GETDATE() and ShipID = 376
GROUP by CruiseID HAVING COUNT(OFR.OfferID) >1



---
DELETE FROM NewOffers WHERE OfferID IN(

select
OFR.OfferID
 FROM Offers as OFR
LEFT JOIN BCruises as BC ON   OFR.OfferID = BC.OfferID
WHERE  OFR.DATE > GETDATE() and OFR.ShipID = 376 and CruiseID LIKE '%EUR%' and OFR.OfferID >='89344')