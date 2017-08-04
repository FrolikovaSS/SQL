USE [u183189]
GO

SELECT 
    O.RouteID,
     O.OfferID,
	  BC.Duration,
	  BC.Date

  FROM [dbo].[Offers] AS O
  LEFT JOIN BCruises BC ON BC.BOfferID = O.OfferID
  WHERE RouteID = 10536 or RouteID = 14475
 Order by O.RouteID

GO


