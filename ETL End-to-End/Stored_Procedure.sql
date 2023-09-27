USE gold_db
GO

CREATE or ALTER PROC CreateSQLView_GOLD1 @ViewName NVARCHAR(100)
AS
BEGIN

DECLARE @statement VARCHAR(MAX)
   
   SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' AS 
       SELECT
       FROM
           OPENROWSET(
           BULK''https://stgacdataengprj.dfs.core.windows.net/gold/OrganisationLT/'+ @ViewName + '/'',
           FORMAT = ''DELTA''
           ) AS [result]
           '
EXECUTE(@statement)

END
GO
