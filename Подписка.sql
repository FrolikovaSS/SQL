USE [u183189]
GO


  Select FName, LName, Email From BOrders
  

 Where Created > '2017-07-25' and AgencyID is Null and Email not IN (
 Select  Email From BOrders
 Where Created < '2017-07-25' and AgencyID is Null)
  Order by Email
GO


