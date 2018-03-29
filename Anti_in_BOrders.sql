USE [u183189]
GO
Select BO.BOrderID, BC.CompanyID, BC.Date
FROM BOrders as BO
Join BCruises as BC ON BC.BOrderID = BO.BOrderID
Where BO.StatusID = 100 and BC.OfferID in 
(Select 
      [OfferID]
    
	  FROM Offers as O
	  
	   Where OfferID IN (SELECT  [OfferID], BO.BOrderID, BC.Date, BC.CompanyID
 
     
  FROM [dbo].[BCruises] as BC
  JOIN BOrders as BO ON BO.BOrderID = BC.BOrderID
  WHERE BO.StatusID = 100 and (BC.Date > '2018-03-31' and BC.Date <= '2018-04-30')  and --BC.CompanyID = 1 and 
BC.Trace LIKE 'Рим%') --or
 --BC.Trace LIKE '%Барселона%') 
 --and IsRus = 1)
 Order by Date
GO


