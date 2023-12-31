IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ToDos]') AND type in (N'U'))
ALTER TABLE [dbo].[ToDos] DROP CONSTRAINT IF EXISTS [FK_ToDos_Categories]
GO
/****** Object:  Table [dbo].[ToDos]    Script Date: 10/29/2023 11:18:14 PM ******/
DROP TABLE IF EXISTS [dbo].[ToDos]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/29/2023 11:18:14 PM ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/29/2023 11:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](25) NOT NULL,
	[CatDesc] [nvarchar](100) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToDos]    Script Date: 10/29/2023 11:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToDos](
	[ToDoId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[Done] [bit] NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_ToDos] PRIMARY KEY CLUSTERED 
(
	[ToDoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CatName], [CatDesc]) VALUES (1, N'School', N'Work relating to my Centriq training course')
INSERT [dbo].[Categories] ([CategoryId], [CatName], [CatDesc]) VALUES (2, N'Git', N'Work from my github repo''s')
INSERT [dbo].[Categories] ([CategoryId], [CatName], [CatDesc]) VALUES (3, N'Network', N'Work relating to social networking / career building')
INSERT [dbo].[Categories] ([CategoryId], [CatName], [CatDesc]) VALUES (4, N'Unity', N'Work relating to the game building engine Unity')
INSERT [dbo].[Categories] ([CategoryId], [CatName], [CatDesc]) VALUES (5, N'Home', N'Work relating to tasks I need to complete at home')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[ToDos] ON 

INSERT [dbo].[ToDos] ([ToDoId], [Name], [Done], [CategoryId]) VALUES (1, N'Learn more Javascript                                                                               ', 0, 1)
INSERT [dbo].[ToDos] ([ToDoId], [Name], [Done], [CategoryId]) VALUES (2, N'Work on PKMN script                                                                                 ', 0, 2)
INSERT [dbo].[ToDos] ([ToDoId], [Name], [Done], [CategoryId]) VALUES (3, N'Get verified on LinkedIn                                                                            ', 0, 3)
INSERT [dbo].[ToDos] ([ToDoId], [Name], [Done], [CategoryId]) VALUES (4, N'Continue Unity lessons                                                                              ', 0, 4)
INSERT [dbo].[ToDos] ([ToDoId], [Name], [Done], [CategoryId]) VALUES (8, N'Purchase another laptop charger                                                                     ', 0, 5)
INSERT [dbo].[ToDos] ([ToDoId], [Name], [Done], [CategoryId]) VALUES (9, N'Testing                                                                                             ', 1, 2)
INSERT [dbo].[ToDos] ([ToDoId], [Name], [Done], [CategoryId]) VALUES (10, N'Create To-Do React App                                                                              ', 0, 1)
INSERT [dbo].[ToDos] ([ToDoId], [Name], [Done], [CategoryId]) VALUES (11, N'Centriq Career fair                                                                                 ', 0, 1)
SET IDENTITY_INSERT [dbo].[ToDos] OFF
GO
ALTER TABLE [dbo].[ToDos]  WITH CHECK ADD  CONSTRAINT [FK_ToDos_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[ToDos] CHECK CONSTRAINT [FK_ToDos_Categories]
GO
