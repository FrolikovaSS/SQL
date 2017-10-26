USE [u183189]
GO

SELECT BO.BOrderID
   
    
    , BPI.BPItemID, BPI.Amount, BPI.Currency, BPI.Rate
    

      ,[CRMID]

    
  FROM [dbo].[BOrders] BO
  JOIN BPayments as BP ON BP.BOrderID = BO.BOrderID
  JOIN BPaymentItems as BPI ON BPI.BPaymentID = BP.BPaymentID
   Where BO.BOrderID ='cae22f91-cb42-43b1-9919-91c67e5b4178'

GO

--UPDATE BPaymentItems SET Rate = 69.66  WHERE BPItemID = '133C5DB9-0066-4F92-99D2-487926BBD74D'
