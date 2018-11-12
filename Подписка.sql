USE [u183189]
GO


  Select distinct Email, MAX(Phone) as Phone From BOrders
  

 Where AgencyID is not Null
 Group by Email
 Order by Email
GO


