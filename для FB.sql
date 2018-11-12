USE [u183189]
GO


Select distinct CONCAT(LName,' ', FName) as Name, MAX(BDate)
FROM BPersons As BP
WHERE CONCAT(LName,' ', FName) IN

(SELECT CONCAT(LName,' ', FName)
  
  FROM BPersons)
  Group by CONCAT(LName,' ', FName)
 
GO


