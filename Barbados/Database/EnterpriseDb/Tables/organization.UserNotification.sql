CREATE TABLE [organization].[UserNotification]
(
[UserNotificationID] [int] NOT NULL IDENTITY(1, 1),
[UserID] [int] NOT NULL,
[DatePosted] [datetime] NOT NULL,
[DateRead] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [organization].[UserNotification] ADD CONSTRAINT [PK_UserNotification] PRIMARY KEY CLUSTERED  ([UserNotificationID]) ON [PRIMARY]
GO
ALTER TABLE [organization].[UserNotification] ADD CONSTRAINT [FK_UserNotification_User] FOREIGN KEY ([UserID]) REFERENCES [organization].[User] ([UserID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date notification will be posted', 'SCHEMA', N'organization', 'TABLE', N'UserNotification', 'COLUMN', N'DatePosted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date user read notification', 'SCHEMA', N'organization', 'TABLE', N'UserNotification', 'COLUMN', N'DateRead'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Parent RecordID', 'SCHEMA', N'organization', 'TABLE', N'UserNotification', 'COLUMN', N'UserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'RecordID', 'SCHEMA', N'organization', 'TABLE', N'UserNotification', 'COLUMN', N'UserNotificationID'
GO
