USE [u183189]
GO

SELECT [OfferID]
      ,[CruiseID]
  
      ,[CompanyID]
     
      ,[Trace]
     
  FROM [dbo].[AOffers] Where (CompanyID NOT IN (1,2)) and (Trace LIKE '���%' or Trace LIKE '%���������%') and OfferID NOT IN (
  SELECT OfferID FROM NewOffers WHERE NewID = 1732)
  Order by CompanyID
GO

--INSERT INTO NewOffers (NewID, OfferID) SELECT 1732, OfferID FROM AOffers WHERE (CompanyID NOT IN (1,2)) and (Trace LIKE '%���%' or Trace LIKE '%���������%') and OfferID NOT IN (
  SELECT OfferID FROM NewOffers WHERE NewID = 1732)

--DELETE FROM NewOffers WHERE NewID=1732