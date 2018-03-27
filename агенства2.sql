USE [u183189]

Select Ag.Name,
 SUM(Main.pax) as Pax 
 
 From 
 
(Select BO.AgencyID,  BO.BOrderID, COUNT(distinct BPS.BPersonID) AS pax
From BPayments as BP
Left Join BPaymentItems as BPI ON BPI.BPaymentID = BP.BPaymentID
Left Join BOrders as BO ON BO.BOrderID = BP.BOrderID
JOIN BCruises as BC ON BC.BOrderID = BO.BOrderID
JOIN BPersons AS BPS ON BPS.BOrderID=BO.BOrderID
 
where BO.BOrderID IN
(Select BO.BOrderID
From BOrders As BO
Where BO.AgencyID is not NULL and BO.StatusID >=100 and BO.Created >= '2017-01-01' and BC.CompanyID = 1)
Group by BO.AgencyID, BO.BOrderID
 
) as Main
Join Agencies as A ON Main.AgencyID = A.AgencyID
Join Agents as Ag ON Ag.AgentID = A.AgentID
Group BY Ag.Name
Order BY Pax DESC