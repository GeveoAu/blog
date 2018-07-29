
CREATE TABLE [dbo].[StudentMarks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Mark] [int] NOT NULL,
 CONSTRAINT [PK_StudentMarks] PRIMARY KEY CLUSTERED 
([Id] ASC))
GO


SET IDENTITY_INSERT [dbo].[StudentMarks] ON 
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (1, N'Student 1', 87)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (2, N'Student 2', 73)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (3, N'Student 3', 49)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (4, N'Student 4', 61)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (5, N'Student 5', 59)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (6, N'Student 6', 92)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (7, N'Student 7', 64)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (8, N'Student 8', 56)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (9, N'Student 9', 60)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (10, N'Student 10', 72)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (11, N'Student 11', 78)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (12, N'Student 12', 64)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (13, N'Student 13', 58)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (14, N'Student 14', 48)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (15, N'Student 15', 86)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (16, N'Student 16', 74)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (17, N'Student 17', 94)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (18, N'Student 18', 60)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (19, N'Student 19', 59)
GO
INSERT [dbo].[StudentMarks] ([Id], [Name], [Mark]) VALUES (20, N'Student 20', 74)
GO
SET IDENTITY_INSERT [dbo].[StudentMarks] OFF
GO

SELECT * FROM StudentMarks