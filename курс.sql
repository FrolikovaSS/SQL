USE [u183189]
GO

SELECT BO.BOrderID
		--,BO.AgencyID
      ,BO.CRMID  
	 -- ,LEN(BO.CRMID)  
      --,BP.EDate
	  ,BP.Status
	  ,BPI.Amount
	  ,BPI.Currency
	  ,BPI.Rate
	  ,BPI.Amount*BPI.Rate as Rub
	  ,BC.CompanyID
	  ,BP.Created
	  ,BP.Updated
     
  FROM [dbo].[BOrders] as BO
  JOIN BCruises as BC ON BC.BOrderID = BO.BOrderID
  LEFT JOIN BPayments AS BP ON BP.BOrderID = BO.BOrderID
  LEFT JOIN BPaymentItems AS BPI ON BPI.BPaymentID = BP.BPaymentID
  WHERE BP.Created >= '2018-08-08' and BP.Status = 200 AND (BO.AgencyID <> '150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID is NULL)
	AND BPI.Currency = 'EUR'
	AND BC.CompanyID <> 1
	AND LEN(BO.CRMID) < 7
  Order by BP.Created
GO

