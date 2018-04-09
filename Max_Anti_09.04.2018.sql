
GO
SELECT BO.BOrderID, BO.CRMID, BC.Date--, BPR.FName, BPR.LName
FROM BOrders as BO 
JOIN BPayments as BP ON BP.BOrderID = BO.BOrderID
JOIN BPaymentItems as BPI ON BPI.BPaymentID = BP.BPaymentID
JOIN BCruises as BC ON BC.BOrderID = BO.BOrderID
--JOIN BPersons AS BPR ON BO.BOrderID = BPR.BOrderID
WHERE	BO.StatusID = 100 
		and BP.Status = 200 
		and BC.OfferID IN (SELECT OfferID
						   FROM Offers WHERE (Trace LIKE 'Рим%' or Trace LIKE '%Барселона%'))
		

GO