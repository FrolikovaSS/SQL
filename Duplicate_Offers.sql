USE [u183189]
GO

CREATE TABLE #arp2
(
	OfferID int,	
	Date date,
	Duration int,
	ShipID int
)

SELECT * from #arp2

INSERT #arp2
SELECT O.OfferID, BC.Date, BC.Duration, BC.ShipID FROM dbo.Offers AS O 
Inner JOIN BCruises as BC ON BC.OfferID = O.OfferID
WHERE BC.Date > GETDATE()
	
	SELECT Race FROM
	      ( SELECT distinct BC.OfferID,
                  STUFF(
   (SELECT distinct ','+ Cast(( OfferID) as varchar)  FROM #arp2 AS RT
                   WHERE BC.Date = RT.Date
                   and RT.Duration =BC.Duration
				   and RT.ShipID = BC.ShipID
				   and RT.Date > GETDATE()
                   FOR XML PATH('')), 1, 1, '') as Race  
		
			FROM BCruises as BC) as M
			 WHERE len(Race) > 5
						
		
  DROP TABLE #arp2;
GO
