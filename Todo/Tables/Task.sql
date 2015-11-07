CREATE TABLE [dbo].[Task]
(
	[TaskId] INT NOT NULL  IDENTITY, 
    [Name] NVARCHAR(1000) NOT NULL, 
    [DateAdd] DATETIME NOT NULL DEFAULT getdate(), 
    [UserAddId] INT NOT NULL, 
    [UserId] INT NOT NULL, 
    CONSTRAINT [PK_Task] PRIMARY KEY ([TaskId])
)
