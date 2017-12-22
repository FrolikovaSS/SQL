use u183189;

--SELECT * FROM Cabins WHERE ShipID= 186 AND Code='3H';

--INSERT INTO [Cabins] ([ShipID], [CabinTypeID], [Name], [Code]) VALUES (398, 1, '¬нутренн€€', 'IF');
--INSERT INTO [Cabins] ([ShipID], [CabinTypeID], [Name], [Code]) VALUES (398, 2, '¬нешн€€', 'O6');
--INSERT INTO [Cabins] ([ShipID], [CabinTypeID], [Name], [Code]) VALUES (398, 3, '¬нешн€€ с балконом', 'DC');
--INSERT INTO [Cabins] ([ShipID], [CabinTypeID], [Name], [Code]) VALUES (398, 4, '—ьют', 'S2');

DECLARE @Ship int, @Code nvarchar(50), @Date DateTime, @offer_id int, @count int; DECLARE @msg nvarchar(100);
SET @Date=GETDATE(); SET @count=1;

SET @Code='S2'; SET @Ship= 398;

DECLARE offer_cursor CURSOR FAST_FORWARD FOR 
SELECT OfferID FROM Offers WHERE (ShipID = @Ship) AND (Date > @Date) AND (OfferID NOT IN 
(SELECT OfferID FROM OPrices WHERE (OfferID IN (SELECT OfferID FROM Offers WHERE (ShipID = @Ship) AND (Date > @Date))) AND CabinCode = @Code));

PRINT '<res>';

OPEN offer_cursor;

FETCH NEXT FROM offer_cursor INTO @offer_id;
WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @msg = ' ' + CAST(@count AS nchar(3)) + ': ' + CAST(@offer_id AS nchar(5));
    PRINT @msg;
    SET @count = @count + 1;
    
    EXEC dbo.InsertOPrice @OfferID = @offer_id, @CabinCode = @Code, @op= -1;
    
    FETCH NEXT FROM offer_cursor INTO @offer_id;
END;
CLOSE offer_cursor;
DEALLOCATE offer_cursor;

PRINT '</res>';
