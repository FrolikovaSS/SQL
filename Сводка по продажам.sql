
SELECT * FROM 
(SELECT BC.OfferID,
BO.CRMID,
BO.Created, 
BP.Position, 
BC.Category,
BCP.p,
BP.Type,
UPPER(BO.LName) AS LName, 
COUNT(BCP.BPersonID) OVER (PARTITION BY BCP.BCruiseID) AS pax,
 
CONCAT(P.LName, ' ' , P.FName) AS Manager
FROM BCruisePersons AS BCP 
JOIN BPersons AS BP ON BCP.BPersonID=BP.BPersonID
JOIN BOrders AS BO ON BO.BOrderID=BP.BOrderID 	
JOIN BCruises AS BC ON BO.BOrderID=BC.BOrderID 
LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
Where BO.StatusID >= 60) AS Q WHERE Position=1 and OfferID = 79933 and pax <> 1
Order by Category, p