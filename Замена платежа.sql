USE [u183189]
GO

SELECT BO.BOrderID
   
    
    , BPI.BPItemID, BPI.Amount, BPI.Currency, BPI.Rate
    

      ,[CRMID]

    
  FROM [dbo].[BOrders] BO
  JOIN BPayments as BP ON BP.BOrderID = BO.BOrderID
  JOIN BPaymentItems as BPI ON BPI.BPaymentID = BP.BPaymentID
   Where BO.BOrderID ='f7a9ce92-f755-45c4-b023-8a74ff8de01b'

GO

--UPDATE BPaymentItems SET Amount = 176 WHERE BPItemID = '30130A83-3DDA-4031-A55C-9B75215840C0'
