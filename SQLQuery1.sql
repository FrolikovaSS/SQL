
SELECT-- OfferID,
    BO.BOrderID,
    CONCAT(P.LName, ' ' ,P.FName) AS Manager,
	   CAST(BO.CRMID AS int) as CRMID
	  ,BP.Position,
	   BP.LName, BP.FName

	  ,BP.Nationality
	  ,BO.StatusID
	  
  FROM [dbo].[BCruises] AS BC 
 Left JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
 Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
 Where BP.Nationality IN ('RB', 'H<','ÐÁ')--,'UA'--,'RB','RK','RÀ','BU','D', 'FN', 'UR', 'UÀ', 'Ñà','-', 'HG', 'èð', 'ÊÐ',
--'G','TU','UC', ,'IZ','ã', 'EU','ÅÅ') --and BO.StatusID = 100
 Order by Manager, CRMID, BP.Position, BO.StatusID