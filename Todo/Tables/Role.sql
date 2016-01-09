CREATE TABLE [dbo].[Role]
(
	[RoleId] INT NOT NULL IDENTITY, 
    [RoleName] NVARCHAR(50) NULL, 
    CONSTRAINT [PK_Role] PRIMARY KEY ([RoleId]) 
)
