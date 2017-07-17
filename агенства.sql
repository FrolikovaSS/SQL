USE [u183189]

Select Ag.Name,
 SUM(Main.Summa) as Sum_Rub_Payed
 
-- ,SUM(Main.SummaFull) as Sum_Full
 ,SUM(Main.pax) as Pax 
 From 
 
(Select BO.AgencyID,  BO.BOrderID, COUNT(distinct BPS.BPersonID) AS pax, SUM(BPI.Amount*BPI.Rate)/Count(distinct BPS.BPersonID) as Summa --, SUM (BCP.p*BPI.Rate) as SummaFull
From BPayments as BP
Left Join BPaymentItems as BPI ON BPI.BPaymentID = BP.BPaymentID
Left Join BOrders as BO ON BO.BOrderID = BP.BOrderID
JOIN BPersons AS BPS ON BPS.BOrderID=BO.BOrderID
--Join BCruises BC ON BC.BOrderID = BO.BOrderID
--Join BCruisePersons BCP ON BCP.BCruiseID = BC.BCruiseID
 
where BP.Status=200  and BO.BOrderID IN
(Select BO.BOrderID
From BOrders As BO
Where BO.AgencyID is not NULL and BO.StatusID >=60 and BO.Created > '2016-07-01')
Group by BO.AgencyID, BO.BOrderID
 
) as Main
Join Agencies as A ON Main.AgencyID = A.AgencyID
Join Agents as Ag ON Ag.AgentID = A.AgentID
Group BY Ag.Name
Order BY Sum_Rub_Payed DESC