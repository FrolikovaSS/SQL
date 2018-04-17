USE [u183189]
GO
 
SELECT BO.BOrderID
        ,BO.CRMID
      ,CONCAT(PR.LName, ' ' ,PR.FName) AS Manager
    
     -- ,[StatusID] as  Active    
    
    ,B.Summa
    ,DSC.Discount as AddServices
    , P.Paid
      ,BC.OfferID
 
  FROM [dbo].[BOrders] as BO
  LEFT JOIN Profiles AS PR ON BO.ManagerID=PR.UserID 
  
   LEFT JOIN (SELECT 
      [BOrderID]    
      ,SUM(BPI.Amount) as Paid
         
  FROM [dbo].[BPayments] as BP
  LEFT JOIN BPaymentItems as BPI ON BP.BPaymentID = BPI.BPaymentID
  Where Status=200
  Group by BOrderID) AS P ON BO.BOrderID = P.BOrderID
   Left Join BCruises BC ON BC.BOrderID = BO.BOrderID
 
 LEFT Join ( SELECT SUM(BCP.p) as Summa,
                 COUNT(BCP.p) as pax,
                 BCruiseID
 
                FROM BCruisePersons BCP 
Group by BCruiseID) as B ON BC.BCruiseID = B.BCruiseID
 LEFT JOIN (SELECT 
     [BOrderID]
      
     ,SUM(BIP.p) as Discount
     
  FROM [dbo].[BItems] as BI
 LEFT JOIN BItemPersons as BIP ON BIP.BItemID = BI.BItemID
 
   Group by BOrderID) as DSC ON DSC.BOrderID = BO.BOrderID
 
  Where BO.StatusID = 100 and P.Paid < (B.Summa) and BC.OfferID IN ( 68390, 68391) --and BT.Status = 100 and BT.Name LIKE '%?????%' and BT.Owner = 'C'
  Order by Manager
GO