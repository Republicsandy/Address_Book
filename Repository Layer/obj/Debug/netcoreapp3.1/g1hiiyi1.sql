IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [UserTable] (
    [UserId] bigint NOT NULL IDENTITY,
    [FirstName] nvarchar(max) NULL,
    [LastName] nvarchar(max) NULL,
    [Email] nvarchar(max) NULL,
    [Password] nvarchar(max) NULL,
    CONSTRAINT [PK_UserTable] PRIMARY KEY ([UserId])
);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20221031130305_FirstMigration', N'3.1.0');

GO

CREATE TABLE [NotesTable] (
    [NoteID] bigint NOT NULL IDENTITY,
    [Title] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [Reminder] datetime2 NOT NULL,
    [Color] nvarchar(max) NULL,
    [Image] nvarchar(max) NULL,
    [Archive] bit NOT NULL,
    [Pin] bit NOT NULL,
    [Trash] bit NOT NULL,
    [Created] datetime2 NOT NULL,
    [Edited] datetime2 NOT NULL,
    [UserId] bigint NOT NULL,
    CONSTRAINT [PK_NotesTable] PRIMARY KEY ([NoteID]),
    CONSTRAINT [FK_NotesTable_UserTable_UserId] FOREIGN KEY ([UserId]) REFERENCES [UserTable] ([UserId]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_NotesTable_UserId] ON [NotesTable] ([UserId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20221104015454_UserNotesMigration', N'3.1.0');

GO

