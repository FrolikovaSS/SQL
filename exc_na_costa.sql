USE [u183189]
GO

Select  BO. BorderID, BC.OfferID, BC.Date, BC.ShipID, BC.BookingID, [CRMID], CONCAT(BP.LName, ' ' ,BP.FName) AS Client, BI.Name, BP.BDate
  
    FROM [dbo].[BOrders] as BO
  JOIN BCruises as BC ON BO.BOrderID = BC.BOrderID
  
    Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID

	LEFT JOIN  BItemPersons BIP ON BP.BPersonID = BIP.BPersonID
	 Left JOIN BItems AS BI ON BIP.BItemID = BI.BItemID
  WHERE BC.OfferID IN ( '80377', '79739', '79738')
  AND BO.StatusID = 100   
  AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) 
  AND BI.Type = 'EXC' AND BIP.p <> 0
 Order by BC.ShipID, OfferID, CRMID
 
GO



