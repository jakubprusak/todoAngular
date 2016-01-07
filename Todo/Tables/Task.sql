CREATE TABLE [dbo].[Task]
(
	[TaskId] INT NOT NULL  IDENTITY, 
    [Name] NVARCHAR(1000) NOT NULL, 
    [DateAdd] DATETIME NOT NULL DEFAULT getdate(), 
    [UserAddId] INT NOT NULL, 
    [UserId] INT NOT NULL, 
    [done] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_Task] PRIMARY KEY ([TaskId]), 
    CONSTRAINT [FK_Task_User] FOREIGN KEY ([UserId]) REFERENCES [User]([UserId]),
	CONSTRAINT [FK_Task_Added] FOREIGN KEY ([UserAddId]) REFERENCES [User]([UserId])
)
