﻿--MERGE generated by 'sp_generate_merge' stored procedure, Version 0.93
--Originally by Vyas (http://vyaskn.tripod.com): sp_generate_inserts (build 22)
--Adapted for SQL Server 2008/2012 by Daniel Nolan (http://danere.com)

SET NOCOUNT ON

SET IDENTITY_INSERT [User] ON

MERGE INTO [User] AS Target
USING (VALUES
  (1,'jakubprusak','YC+uWA9YY6v7Mb81bez9xzvxIkpiqs9rSCn/otvlg5A=',2)
 ,(2,'kamilOwsik','YC+uWA9YY6v7Mb81bez9xzvxIkpiqs9rSCn/otvlg5A=',1)
) AS Source ([UserId],[Username],[Password],[RoleId])
ON (Target.[UserId] = Source.[UserId])
WHEN MATCHED AND (
	NULLIF(Source.[Username], Target.[Username]) IS NOT NULL OR NULLIF(Target.[Username], Source.[Username]) IS NOT NULL OR 
	NULLIF(Source.[Password], Target.[Password]) IS NOT NULL OR NULLIF(Target.[Password], Source.[Password]) IS NOT NULL OR 
	NULLIF(Source.[RoleId], Target.[RoleId]) IS NOT NULL OR NULLIF(Target.[RoleId], Source.[RoleId]) IS NOT NULL) THEN
 UPDATE SET
  [Username] = Source.[Username], 
  [Password] = Source.[Password], 
  [RoleId] = Source.[RoleId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([UserId],[Username],[Password],[RoleId])
 VALUES(Source.[UserId],Source.[Username],Source.[Password],Source.[RoleId])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [User]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[User] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO

SET IDENTITY_INSERT [User] OFF
GO
SET NOCOUNT OFF
GO
