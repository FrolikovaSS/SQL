SELECT BO.Created,  BO.CRMID, 
BC.CompanyID, pax, MQ.p as price,  BO.StatusID
	FROM (SELECT * FROM (SELECT BCP.BCruiseID, BP.Position, COUNT(BCP.BPersonID) OVER (PARTITION BY BCP.BCruiseID) AS pax, SUM(BCP.p) OVER (PARTITION BY BCP.BCruiseID) AS p 
	FROM BCruisePersons AS BCP 
		JOIN BPersons AS BP ON BCP.BPersonID=BP.BPersonID) AS Q WHERE Position=1) AS MQ 
		JOIN BCruises AS BC ON MQ.BCruiseID = BC.BCruiseID 
		JOIN BOrders AS BO ON BO.BOrderID=BC.BOrderID 	
		LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
	WHERE ( StatusID = 100 or StatusID = 200) and CRMID is not NULL AND (BO.AgencyID='99044bce-a1cf-4774-b7cb-b8a4717dfa85') 
	ORDER BY Created, CompanyID, OfferID, CRMID, BO.BOrderID