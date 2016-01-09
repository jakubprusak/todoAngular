CREATE TABLE [dbo].[User]
(
	[UserId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Username] NVARCHAR(225) NOT NULL, 
    [Password] NVARCHAR(225) NOT NULL, 
    [RoleId] INT NULL
)
