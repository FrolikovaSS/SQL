USE [u183189]
GO

SELECT [CityID]
      ,[CountryID]    
      ,[Name]
      
  FROM [dbo].[Cities] 
   WHERE  Name LIKE '%(%)%'
   Order by CountryID

----------- �������� �� ���������� ������ ��������
GO

SELECT BO.BOrderID, BC.OfferID
     
  FROM [dbo].[BOrders] as BO
  JOIN BCruises BC ON BO.BOrderID=BC.BOrderID
  WHERE BC.Trace LIKE '%�����%' and BO.StatusID = 100
  Order by OfferID
GO

----- "����� �����"
SELECT OfferID, CountryID, Trace From AOffers Where OfferID = 69288
--UPDATE BCruises Set Trace = '��� - ���� ���������� - ���. ������ - ���� �����  - ����������� ���� - �-� ������� - �-� ���� - �������� �-�� - ��. ������� ������� - �-� ��������� - �-�� ��-����� - �-� �������� - ��. �������� - ���� ���������� - ���' Where OfferID = 69288
SELECT Trace From BCruises Where OfferID = 69288
