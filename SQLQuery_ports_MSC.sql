USE [u183189]
GO
SELECT OfferID, CompanyID from AOffers WHERE OfferID IN (
SELECT AO.OfferID
      
  FROM [dbo].[AOffers] AS AO
  Left JOIN OPrices AS OP ON OP.OfferID = AO.OfferID
  where apf = 0 and OP.bca <> 0
  GROUP BY AO.OfferID)
GO

---//---

SELECT AO.OfferID, CompanyID
      
  FROM [dbo].[AOffers] AS AO
 
  where IsManual = 1 and apf = 0 --and CompanyID = 1
 
GO

