USE [u183189]
GO
Select BI.Name, C.Name From BItems AS BI
 LEFT Join BCruises AS BC ON BC.BOrderID = BI.BOrderID
 LEFT Join Companies AS C ON BC.CompanyID = C.CompanyID
where BI.Name IN
(SELECT
     
  
	BI.Name

     



  FROM [dbo].[BOrders] AS BO

  LEFT JOIN BItems AS BI ON BO.BOrderID = BI.BOrderID
  LEFT Join BCruises AS BC ON BC.BOrderID = BO.BOrderID
  Where (Type='OTH') and (Name NOT Like '%траф%' and Name NOT like '%удержание%' and Name NOT like '%чаевые%') 
  )
 
  
  
  Group by BI.Name,  C.Name HAVING count(*) > 1
  
GO


