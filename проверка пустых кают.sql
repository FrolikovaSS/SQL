USE [u183189]
GO

SELECT [CabinID],CA.Code
      ,CA.ShipID
     ,SH.CompanyID
      ,CA.Description
      
  FROM [dbo].[Cabins] AS CA
  Left JOIN Ships AS SH ON CA.ShipID = SH.ShipID
  WHERE CA.Description IS NULL and CompanyID <> 52
  Order by CompanyID
GO


