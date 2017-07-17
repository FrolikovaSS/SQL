use u183189;

--INSERT INTO [Cabins] ([ShipID], [CabinTypeID], [Name], [Code]) VALUES (386, 1, '¬нутренн€€', 'T1');
--INSERT INTO [Cabins] ([ShipID], [CabinTypeID], [Name], [Code]) VALUES (388, 2, '¬нешн€€', 'PT');
--INSERT INTO [Cabins] ([ShipID], [CabinTypeID], [Name], [Code]) VALUES (388, 3, '¬нешн€€ с балконом', 'BL');
--INSERT INTO [Cabins] ([ShipID], [CabinTypeID], [Name], [Code]) VALUES (387, 4, '—ьют', 'PH');

DECLARE @Ship int, @Code nvarchar(50), @Date DateTime, @offer_id int, @count int; DECLARE @msg nvarchar(100);
SET @Date=GETDATE(); SET @count=1;

SET @Code='T1'; SET @Ship=386;

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
