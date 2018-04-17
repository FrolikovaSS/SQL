USE [u183189]
GO

Select  BO. BorderID, BC.OfferID, BC.BookingID, [CRMID], CONCAT(BP.LName, ' ' ,BP.FName) AS Client, BI.Name
  -- ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
    FROM [dbo].[BOrders] as BO
  JOIN BCruises as BC ON BO.BOrderID = BC.BOrderID
  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID= P.UserID
    Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
	Left JOIN BItems AS BI ON BO.BOrderID = BI.BOrderID
	LEFT JOIN (SELECT BPI.BItemID, SUM(BPI.p) as NUM FROM BItemPersons AS BPI
	GROUP BY BPI.BItemID HAVING SUM(BPI.p)<> 0) as BIP ON BI.BItemID = BIP.BItemID

  WHERE BC.OfferID IN ('79073','79074', '81667', '81668', '88604', '88605')
  AND BO.StatusID = 100   
  AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) 
  AND BI.Type = 'EXC' --AND BIP.p <> 0
 Order by OfferID, CRMID
 
GO



