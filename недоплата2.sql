USE [u183189]
GO
 
SELECT    BO.BOrderID, BO.AgencyID, AGM.Com
         ,BO.CRMID ,CONCAT(PR.LName, ' ' ,PR.FName) AS Manager
    	 ,B.Summa
		 ,B.NCF
		 ,DSC.Discount as AddServices
		 , P.Paid
		 ,BC.OfferID
			, Summa - CAST(CEILING(B.Summa-B.NCF)*BC.Commission/100 AS INT) as With_Com
  FROM [dbo].[BOrders] as BO
  LEFT JOIN Profiles AS PR ON BO.ManagerID=PR.UserID 
  LEFT JOIN ( SELECT DISTINCT AG.AgencyID, FIRST_VALUE(AGC.Commission ) OVER (PARTITION BY AG.AgencyID ORDER BY  AG.AgencyID ASC) as Com FROM  Agencies as AG 
  LEFT JOIN AgencyCompanies as AGC ON AGC.AgencyID = AG.AgencyID
 ) as AGM ON AGM.AgencyID = BO.AgencyID
  JOIN (SELECT 
      [BOrderID]    
      ,SUM(BPI.Amount) as Paid       
	  FROM [dbo].[BPayments] as BP
	  LEFT JOIN BPaymentItems as BPI ON BP.BPaymentID = BPI.BPaymentID
	  Where Status=200
	  Group by BOrderID) AS P ON BO.BOrderID = P.BOrderID
  Join BCruises BC ON BC.BOrderID = BO.BOrderID
 
  Join ( SELECT SUM(BCP.p) as Summa,
                -- COUNT(BCP.p) as pax,
				 SUM(BCP.ncf) as NCF,
                 BCruiseID
 
                FROM BCruisePersons BCP 
				Group by BCruiseID) as B ON BC.BCruiseID = B.BCruiseID
  Left JOIN (SELECT 
     [BOrderID]     
     ,SUM(BIP.p) as Discount     
	  FROM [dbo].[BItems] as BI
      JOIN BItemPersons as BIP ON BIP.BItemID = BI.BItemID
      Group by BOrderID) as DSC ON DSC.BOrderID = BO.BOrderID
 
  Where BO.StatusID = 100 and BC.OfferID IN ( 68390, 68391) --AND
   --(P.Paid < (B.Summa + DSC.Discount) AND BO.AgencyID is NULL) --OR 
  -- (P.Paid = (B.Summa + DSC.Discount) AND PR.LName = 'Старкова')
 --(BO.AgencyID is not NULL and P.Paid > B.Summa - CAST(CEILING((B.Summa-B.NCF)*AGM.Com/100) AS INT))
  Order by Manager
GO