



Create table #cities2
(Name nvarchar(128),
Country nvarchar(128)
)

INSERT #cities2
SELECT CI.Name, CO.Name as Country FROM Cities as CI 
Left JOIN Countries as CO On CO.ISO2 = CI.CountryID WHERE Description IS NULL
--SELECT * FROM #cities2
Order by Country


Create table #cities3
(Num int
)
While (Select COUNT(*) From #cities2) > 0
Begin
    Declare @Name nvarchar(128)
    Select Top 1 @Name = '%'+ Name + '%' From #cities2

	 INSERT #cities3
    Select COUNT(OfferID)as Num From AOffers Where Trace Like @Name
	--SELECT * FROM #cities3
     Select Top 1 @Name = Name From #cities2
	Delete #cities2 Where Name = @Name

End

DROP TABLE #cities3