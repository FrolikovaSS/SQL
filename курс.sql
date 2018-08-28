USE [u183189]
GO

SELECT BO.BOrderID
      ,BO.CRMID    
      ,BP.EDate
	  ,BP.Status
	  ,BPI.Amount
	  ,BPI.Currency
	  ,BPI.Rate
	  ,BPI.Amount*BPI.Rate as Rub
	  ,BP.Created
	  ,BP.Updated
     
  FROM [dbo].[BOrders] as BO
  JOIN BCruises as BC ON BO.BOrderID = BC.BOrderID
  LEFT JOIN BPayments AS BP ON BO.BOrderID = BP.BOrderID
  LEFT JOIN BPaymentItems AS BPI ON BP.BPaymentID = BPI.BPaymentID
  WHERE BP.Created >= '2018-08-23' and BP.Status = 200  AND BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201'
  AND BPI.Currency = 'EUR'
 -- AND BC.CompanyID <> 1

  Order by Created
GO


