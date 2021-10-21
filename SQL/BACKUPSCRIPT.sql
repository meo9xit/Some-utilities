DECLARE @name VARCHAR(50) —database name
DECLARE @path VARCHAR(256) —duong dan file backup
DECLARE @fileName VARCHAR(256) —ten file backup
DECLARE @fileDate VARCHAR(20) —lay ngay backup

SET @path = ‘C:\backupDB\DB\’

SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112)

DECLARE db_cursor CURSOR FOR
SELECT name
FROM master.dbo.sysdatabases
WHERE name NOT IN (‘master’,’model’,’msdb’,’tempdb’)

OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @name

WHILE @@FETCH_STATUS = 0
BEGIN
SET @fileName = @path + @name + ‘_’ + @fileDate + ‘.BAK’
BACKUP DATABASE @name TO DISK = @fileName

FETCH NEXT FROM db_cursor INTO @name
END

CLOSE db_cursor
DEALLOCATE db_cursor