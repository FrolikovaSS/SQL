USE [u183189]
GO
SELECT  BO.CRMID, BC.BookingID, BC.OfferID,
		M.BOrderID , CONCAT(BP.LName, ' ' ,BP.FName) AS Client, M.Name,
		M.p
		FROM BPersons As BP
		JOIN
(SELECT 
      BIP.p,
     BP.BPersonID
     ,BO.BOrderID
    ,Name
	
  FROM [dbo].[BItems] As BI
   LEFT JOIN BItemPersons AS BIP ON BIP.BItemID = BI.BItemID
    LEFT JOIN BOrders AS BO ON BI.BOrderID = BO.BOrderID
  LEFT JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
   
   WHERE BI.TYPE = 'EXC' AND BIP.p <> 0
   Group by BP.BPersonID, Name,BO.BOrderID, BIP.p) AS M ON M.BPersonID = BP.BPersonID
   JOIN BCruises as BC ON BC.BOrderID = M.BOrderID
   JOIN BOrders As BO ON BO.BOrderID = M.BOrderID
   WHERE BC.OfferID IN ('79073','79074', '81667', '81668', '88604', '88605') AND BO.StatusID = 100
   AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL)
   Order by BC.OfferID
GO

