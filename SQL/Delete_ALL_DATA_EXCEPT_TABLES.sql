
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL' 
GO 

EXEC sp_MSForEachTable @command1 = 'TRUNCATE TABLE ?', 
@whereand = ' And Object_id In (Select Object_id From sys.objects Where name not like ''%DM_Loai%'' OR name not like ''%DM_Nhom%'' OR name not like ''%DM_Hinh%'')'
GO 

-- enable referential integrity again 
EXEC sp_MSForEachTable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL' 
GO