USE [Quiz_Online]
GO
ALTER TABLE [dbo].[tblQuestion] DROP CONSTRAINT [FK__tblQuesti__subje__619B8048]
GO
ALTER TABLE [dbo].[tblQuestion] DROP CONSTRAINT [FK__tblQuesti__email__628FA481]
GO
ALTER TABLE [dbo].[tblHistoryQuiz] DROP CONSTRAINT [FK__tblHistor__subje__787EE5A0]
GO
ALTER TABLE [dbo].[tblHistoryQuiz] DROP CONSTRAINT [FK__tblHistor__email__778AC167]
GO
ALTER TABLE [dbo].[tblAnswer] DROP CONSTRAINT [FK__tblAnswer__quest__656C112C]
GO
ALTER TABLE [dbo].[tblAccount] DROP CONSTRAINT [FK__tblAccoun__roleI__5CD6CB2B]
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 4/10/2021 3:42:22 PM ******/
DROP TABLE [dbo].[tblSubject]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 4/10/2021 3:42:22 PM ******/
DROP TABLE [dbo].[tblRole]
GO
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 4/10/2021 3:42:22 PM ******/
DROP TABLE [dbo].[tblQuestion]
GO
/****** Object:  Table [dbo].[tblHistoryQuiz]    Script Date: 4/10/2021 3:42:22 PM ******/
DROP TABLE [dbo].[tblHistoryQuiz]
GO
/****** Object:  Table [dbo].[tblAnswer]    Script Date: 4/10/2021 3:42:22 PM ******/
DROP TABLE [dbo].[tblAnswer]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 4/10/2021 3:42:22 PM ******/
DROP TABLE [dbo].[tblAccount]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 4/10/2021 3:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAccount](
	[email] [nvarchar](50) NOT NULL,
	[password] [varchar](300) NULL,
	[name] [nvarchar](50) NULL,
	[roleID] [nvarchar](10) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAnswer]    Script Date: 4/10/2021 3:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnswer](
	[answerID] [nvarchar](10) NOT NULL,
	[answerContent] [nvarchar](200) NULL,
	[status] [bit] NULL,
	[questionID] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[answerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHistoryQuiz]    Script Date: 4/10/2021 3:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistoryQuiz](
	[historyID] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NULL,
	[subjectID] [nvarchar](10) NULL,
	[correctAnswerID] [nvarchar](max) NULL,
	[quizTime] [nvarchar](200) NULL,
	[grade] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[historyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 4/10/2021 3:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[questionID] [nvarchar](10) NOT NULL,
	[questionContent] [nvarchar](200) NULL,
	[createDate] [datetime] NULL,
	[status] [bit] NULL,
	[subjectID] [nvarchar](10) NULL,
	[email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 4/10/2021 3:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [nvarchar](10) NOT NULL,
	[roleName] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 4/10/2021 3:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubject](
	[subjectID] [nvarchar](10) NOT NULL,
	[subjectName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblAccount] ([email], [password], [name], [roleID], [status]) VALUES (N'congtt@fpt.edu.vn', N'123', N'Tran Thanh Cong', N'SD', 1)
INSERT [dbo].[tblAccount] ([email], [password], [name], [roleID], [status]) VALUES (N'duc@fpt.edu.vn', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'Dao Huu Duc', N'SD', 1)
INSERT [dbo].[tblAccount] ([email], [password], [name], [roleID], [status]) VALUES (N'ducdh@fpt.edu.vn', N'b3a8e0e1f9ab1bfe3a36f231f676f78bb30a519d2b21e6c530c0eee8ebb4a5d0', N'Dao Huu Duc', N'SD', 1)
INSERT [dbo].[tblAccount] ([email], [password], [name], [roleID], [status]) VALUES (N'ducdhhhh@fpt.edu.vn', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'Dao Huu Duc', N'SD', 1)
INSERT [dbo].[tblAccount] ([email], [password], [name], [roleID], [status]) VALUES (N'minhdra@gmail.com', N'2205', N'Minh', N'SD', 1)
INSERT [dbo].[tblAccount] ([email], [password], [name], [roleID], [status]) VALUES (N'minhnq@fpt.edu.vn', N'fd46eeaff3247656d3b7d936d0956776a928a323157d9a79fa07ded516f852fb', N'Minh Nguyen', N'SD', 1)
INSERT [dbo].[tblAccount] ([email], [password], [name], [roleID], [status]) VALUES (N'minhnqse140536@fpt.edu.vn', N'fd46eeaff3247656d3b7d936d0956776a928a323157d9a79fa07ded516f852fb', N'Nguyen Quang Minh', N'AD', 1)
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD001-A1', N'a. getNumberFormat()', 0, N'JD001')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD001-A2', N'b. getCurrencyInstance()', 0, N'JD001')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD001-A3', N'c. getNumberInstance()', 1, N'JD001')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD001-A4', N'd. getInstance()', 0, N'JD001')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD002-A1', N'a. Type-1', 0, N'JD002')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD002-A2', N'b. Type-2', 1, N'JD002')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD002-A3', N'c. Type-4', 0, N'JD002')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD002-A4', N'd. Type-3', 0, N'JD002')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD003-A1', N'a. socket.obtainInetAddress();', 0, N'JD003')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD003-A2', N'b. socket.InetAddress();', 0, N'JD003')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD003-A3', N'c. socket.retrieveInetAddress();', 0, N'JD003')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD003-A4', N'd. socket.getInetAddress();', 1, N'JD003')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD004-A1', N'a. TRUE', 1, N'JD004')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD004-A2', N'b. FALSE

', 0, N'JD004')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD005-A1', N'a. cal.getHour();', 0, N'JD005')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD005-A2', N'b. cal.get(Hour);', 0, N'JD005')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD005-A3', N'c. cal.get(Calendar.HOUR);', 1, N'JD005')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD005-A4', N'd. cal.hour();', 0, N'JD005')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD006-A1', N'a. FALSE', 0, N'JD006')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD006-A2', N'b. TRUE', 1, N'JD006')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD007-A1', N'a. Type-4', 0, N'JD007')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD007-A2', N'b. Type-2', 0, N'JD007')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD007-A3', N'c. Type-1', 1, N'JD007')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD007-A4', N'd. Type-3', 0, N'JD007')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD008-A1', N'a. TRUE', 0, N'JD008')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD008-A2', N'b. FALSE', 1, N'JD008')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD009-A1', N'a. CORBA', 0, N'JD009')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD009-A2', N'b. RMI', 1, N'JD009')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD009-A3', N'c. DOM', 0, N'JD009')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD009-A4', N'd. DCE', 0, N'JD009 ')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD010-A1', N'a. makeConnection()', 0, N'JD010')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD010-A2', N'b. openConnection()', 1, N'JD010')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD010-A3', N'c. connect()', 0, N'JD010')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD010-A4', N'd. accept()', 0, N'JD010')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD011-A1', N'a. input stream', 0, N'JD011')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD011-A2', N'b. output stream', 0, N'JD011')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD011-A3', N'c. both input stream and output stream', 1, N'JD011')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD011-A4', N'd. in-out stream', 0, N'JD011')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD012-A1', N'a. FALSE', 0, N'JD012')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD012-A2', N'b. TRUE', 1, N'JD012')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD013-A1', N'a. notify()', 0, N'JD013')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD013-A2', N'b. join()', 0, N'JD013')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD013-A3', N'c. notifyAll()', 1, N'JD013')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD013-A4', N'd. wait()', 0, N'JD013')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD014-A1', N'a. Remote Reference layer', 1, N'JD014')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD014-A2', N'b. Transport layer', 0, N'JD014')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD014-A3', N'c. Stub and Skeleton layer', 0, N'JD014')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD015-A1', N'a. Multithread', 1, N'JD015')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD015-A2', N'b. DaemonThread', 0, N'JD015')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD015-A3', N'c. Threading', 0, N'JD015')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD015-A4', N'd. MonoThread', 0, N'JD015')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD016-A1', N'a. TRUE', 0, N'JD016')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD016-A2', N'b. FALSE', 1, N'JD016')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD017-A1', N'a. FALSE', 0, N'JD017')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD017-A2', N'b. TRUE', 1, N'JD017')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD018-A1', N'a. synchronization', 0, N'JD018')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD018-A2', N'b. race', 0, N'JD018')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD018-A3', N'c. blocking', 0, N'JD018')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD018-A4', N'd. deadlock', 1, N'JD018')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD019-A1', N'a. TRUE', 0, N'JD019')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD019-A2', N'b. FALSE', 1, N'JD019')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD020-A1', N'a. Transport layer', 0, N'JD020')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD020-A2', N'b. Remote Reference layer', 0, N'JD020')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD020-A3', N'c. Stub and Skeleton layer', 1, N'JD020')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD021-A1', N'a. java.rmi.RemoteException', 1, N'JD021')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD021-A2', N'b. java.rmi.ServerRuntimeException', 0, N'JD021')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD021-A3', N'c. java.rmi.MarshalException', 0, N'JD021')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD021-A4', N'd. java.rmi.RMIException', 0, N'JD021')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD022-A1', N'a. URL', 1, N'JD022')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD022-A2', N'b. Connection', 0, N'JD022')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD022-A3', N'c. InternetAddr', 0, N'JD022')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD022-A4', N'd. URLConnection', 0, N'JD022')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD023-A1', N'a. rmip', 0, N'JD023')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD023-A2', N'b. ftp', 0, N'JD023')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD023-A3', N'c. rmic', 1, N'JD023')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD023-A4', N'd. http', 0, N'JD023')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD024-A1', N'a. FALSE', 1, N'JD024')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD024-A2', N'b. TRUE', 0, N'JD024')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD025-A1', N'a. isDaemon()', 0, N'JD025')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD025-A2', N'b. setDaemon()', 1, N'JD025')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD025-A3', N'c. convertToDaemon()', 0, N'JD025')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD025-A4', N'd. SetDaemon()', 0, N'JD025')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD026-A1', N'a. java.net', 0, N'JD026')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD026-A2', N'b. javax.rmi', 0, N'JD026')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD026-A3', N'c. java.rmi', 1, N'JD026')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD026-A4', N'd. javax.net', 0, N'JD026')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD027-A1', N'A. InputStream in = new InputStream(s);', 0, N'JD027')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD027-A2', N'B. InputStream in = s.getInputStream();', 1, N'JD027')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD027-A3', N'C. InputStream in = s.obtainInputStream();', 0, N'JD027')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD027-A4', N'D. InputStream in = s.getStream();', 0, N'JD027')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD028-A1', N'a. TRUE', 0, N'JD028')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD028-A2', N'b. FALSE', 1, N'JD028')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD029-A1', N'a. getFile()', 0, N'JD029')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD029-A2', N'b. getLocalHost()', 0, N'JD029')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD029-A3', N'c. getHostAddress()', 1, N'JD029')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD029-A4', N'd. getHost()', 0, N'JD029')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD030-A1', N'a. interrupt()', 0, N'JD030')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD030-A2', N'b. wait()', 0, N'JD030')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD030-A3', N'c. join()', 1, N'JD030')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD030-A4', N'd. sleep()', 0, N'JD030')
GO
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD031-A1', N'a. FALSE', 0, N'JD031')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD031-A2', N'b. TRUE', 1, N'JD031')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD032-A1', N'a. TRUE', 1, N'JD032')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD032-A2', N'b. FALSE', 0, N'JD032')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD033-A1', N'a. FALSE', 0, N'JD033')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD033-A2', N'b. TRUE', 1, N'JD033')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD034-A1', N'a. FALSE', 1, N'JD034')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD034-A2', N'b. TRUE', 0, N'JD034')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD035-A1', N'a. wait()', 1, N'JD035')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD035-A2', N'b. notifyAll()', 0, N'JD035')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD035-A3', N'c. finalize()', 0, N'JD035')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD035-A4', N'd. notify()', 0, N'JD035')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD036-A1', N'a. verifyDaemon()', 0, N'JD036')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD036-A2', N'b. setDaemon()', 0, N'JD036')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD036-A3', N'c. isDaemon()', 1, N'JD036')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD036-A4', N'd. getDaemon()', 0, N'JD036')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD037-A1', N'a. TRUE', 1, N'JD037')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD037-A2', N'b. FALSE', 0, N'JD037')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD038-A1', N'a. FALSE', 1, N'JD038')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD038-A2', N'b. TRUE', 0, N'JD038')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD039-A1', N'a. Depends on the particular implementation of the Java Virtual Machine', 0, N'JD039')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD039-A2', N'b. FALSE', 1, N'JD039')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD039-A3', N'c. TRUE', 0, N'JD039')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD040-A1', N'a. TRUE', 1, N'JD040')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD040-A2', N'b. FALSE', 0, N'JD040')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD041-A1', N'A. banh tet', 1, N'JD041')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD041-A2', N'B. banh chung', 0, N'JD041')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD041-A3', N'C. banh day', 0, N'JD041')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD041-A4', N'D. banh u', 0, N'JD041')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD042-A1', N'A. Pho', 1, N'JD042')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD042-A2', N'B. Banh cuon', 0, N'JD042')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD042-A3', N'C. Banh mi', 0, N'JD042')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD042-A4', N'D. Hu tieu', 0, N'JD042')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD043-A1', N'A.11B3', 1, N'JD043')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD043-A2', N'B.11B1', 0, N'JD043')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD043-A3', N'C.11B2', 0, N'JD043')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JD043-A4', N'D.11b4', 0, N'JD043')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW001-A1', N'A. A status of 200 to 299 signifies that the request was successful.', 1, N'JW001')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW001-A2', N'B. A status of 300 to 399 is informational messages.', 0, N'JW001')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW001-A3', N'C. A status of 400 to 499 indicates an error in the server', 0, N'JW001')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW001-A4', N'D. A status of 500 to 599 indicates an error in the client.', 0, N'JW001')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW002-A1', N'A. Servlet', 1, N'JW002')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW002-A2', N'B. Http', 0, N'JW002')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW002-A3', N'C. HttpServletRequest', 0, N'JW002')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW002-A4', N'D. HttpServletResponse', 0, N'JW002')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW003-A1', N'A. response.setContentType("image/gif");', 1, N'JW003')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW003-A2', N'B. response.setType("application/gif");', 0, N'JW003')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW003-A3', N'C. response.setContentType("application/bin");', 0, N'JW003')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW003-A4', N'D. response.setType("image/gif");', 0, N'JW003')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW004-A1', N'A. ReportServlet will throw exception at runtime.', 0, N'JW004')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW004-A2', N'B. ReportServlet.java won''t compile.', 0, N'JW004')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW004-A3', N'C. ReportServlet.java will compile and run without any problems.', 1, N'JW004')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW005-A1', N'A. Information resources(sources) on the Internet', 1, N'JW005')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW005-A2', N'B. E-mail addresses for use in the Internet', 0, N'JW005')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW005-A3', N'C. IP addresses of servers connected to the Internet', 0, N'JW005')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW005-A4', N'D. Owners of PCs connected to the Internet', 0, N'JW005')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW006-A1', N'A. It is an XML document.', 0, N'JW006')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW006-A2', N'B. It cannot be unpackaged by the container.', 0, N'JW006')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW006-A3', N'C. It is used by web application developer to deliver the web application in a single unit.', 0, N'JW006')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW006-A4', N'D. It contains web components such as servlets as well as EJBs.', 1, N'JW006')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW007-A1', N'A. It is accessible to all the servlets of the webapp.', 1, N'JW007')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW007-A2', N'B. It is accessible to all the servlets of all the webapps of the container.', 0, N'JW007')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW007-A3', N'C. It is accessible only to the servlet it is defined for.', 0, N'JW007')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW008-A1', N'A. Web Container', 1, N'JW008')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW008-A2', N'B. EJB Container', 0, N'JW008')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW008-A3', N'C. Servlets', 0, N'JW008')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW008-A4', N'D. Applets', 0, N'JW008')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW009-A1', N'A. Cookie', 1, N'JW009')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW009-A2', N'B. Session', 0, N'JW009')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW009-A3', N'C. Request', 0, N'JW009')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW009-A4', N'D. Response', 0, N'JW009')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW010-A1', N'A. getObject("roleName");', 0, N'JW010')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW010-A2', N'B. getValue("roleName");', 0, N'JW010')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW010-A3', N'C. get("roleName");', 0, N'JW010')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW010-A4', N'D. getAttribute("roleName");', 1, N'JW010')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW011-A1', N'A. The container is shutdown and brought up again.', 0, N'JW011')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW011-A2', N'B. No request comes from the client for more than "session timeout" period.', 0, N'JW011')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW011-A3', N'C. A servlet explicitly calls invalidate() on a session object.', 0, N'JW011')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW011-A4', N'D. If the session time out is set to 0 using setMaxInactiveInterval() method.', 1, N'JW011')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW012-A1', N'A. setMaxInactiveInterval(-1)', 1, N'JW012')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW012-A2', N'B. setTimeOut(Integer.MAX_INT)', 0, N'JW012')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW012-A3', N'C. setMaxInactiveInterval(Integer.MAX_INT)', 0, N'JW012')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW012-A4', N'D. setTimeOut(-1)', 0, N'JW012')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW013-A1', N'A. True', 1, N'JW013')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW013-A2', N'B. False', 0, N'JW013')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW014-A1', N'A. session, page, application, request
', 1, N'JW014')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW014-A2', N'B. session, page, application, global', 0, N'JW014')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW014-A3', N'C. session, page, application, context', 0, N'JW014')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW014-A4', N'D. session, page, response, request

A', 0, N'JW014')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW015-A1', N'A. page', 1, N'JW015')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW015-A2', N'B. session', 0, N'JW015')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW015-A3', N'C. application', 0, N'JW015')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW015-A4', N'D. request', 0, N'JW015')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW016-A1', N'A. <%@page import=''java.util.*'' %>', 1, N'JW016')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW016-A2', N'B. <%@import package=''java.util.*'' %>', 0, N'JW016')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW016-A3', N'C. <%@ package import =''java.util.*'' %>', 0, N'JW016')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW016-A4', N'D. <%! page import=''java.util.*'' %>', 0, N'JW016')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW017-A1', N'A. HttpServletRequest and ServletContext respectively.', 1, N'JW017')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW017-A2', N'B. ServletRequest and ServletConfig respectively.', 0, N'JW017')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW017-A3', N'C. ServletRequest and PageContext respectively.', 0, N'JW017')
GO
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW017-A4', N'D. HttpServletRequest and PageContext respectively.', 0, N'JW017')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW018-A1', N'A. <jsp:expression=x/>', 0, N'JW018')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW018-A2', N'B. <jsp:expression>x</jsp:expression>', 1, N'JW018')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW018-A3', N'C. <jsp:statement>x</jsp:statement>', 0, N'JW018')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW018-A4', N'D. <jsp:declaration>x</jsp:declaration>', 0, N'JW018')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW019-A1', N'A. The browser will print either hello or hi based upon the return value of random.', 0, N'JW019')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW019-A2', N'B. The string hello will always get printed.', 0, N'JW019')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW019-A3', N'C. The string hi will always get printed.', 0, N'JW019')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW019-A4', N'D. The JSP file will not compile.', 1, N'JW019')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW020-A1', N'A. <%= request.getParameter("myParm") %>', 0, N'JW020')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW020-A2', N'B. <% String s = getInitParameter("myParm"); %>', 1, N'JW020')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW020-A3', N'C. <% = application.getInitParameter("myParm") %>', 0, N'JW020')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW020-A4', N'D. <%= getParameter("myParm") %>', 0, N'JW020')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW021-A1', N'A. declaration', 1, N'JW021')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW021-A2', N'B. scriptlet', 0, N'JW021')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW021-A3', N'C. expression', 0, N'JW021')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW022-A1', N'A. jsp:useBean', 0, N'JW022')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW022-A2', N'B. jsp:useBean.property', 0, N'JW022')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW022-A3', N'C. jsp:useBean.setProperty', 0, N'JW022')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW022-A4', N'D jsp:setProperty', 1, N'JW022')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW023-A1', N'A. <jsp:setProperty>', 1, N'JW023')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW023-A2', N'B. <jsp:getProperty>', 0, N'JW023')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW023-A3', N'C. <jsp:useBean>', 0, N'JW023')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW023-A4', N'D. <jsp:include>', 0, N'JW023')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW024-A1', N'A. <attribute-name>', 0, N'JW024')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW024-A2', N'B. <name>', 1, N'JW024')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW024-A3', N'C. <attributename>', 0, N'JW024')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW024-A4', N'D. <param-name>', 0, N'JW024')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW025-A1', N'A. blank', 0, N'JW025')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW025-A2', N'B. empty', 1, N'JW025')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW025-A3', N'C. null', 0, N'JW025')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW025-A4', N'D. false', 0, N'JW025')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW026-A1', N'A. <uri>', 0, N'JW026')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW026-A2', N'B. <tag-uri>', 0, N'JW026')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW026-A3', N'C. <uri-name>', 0, N'JW026')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW026-A4', N'D. <taglib-uri>', 1, N'JW026')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW027-A1', N'A. EVAL_PAGE', 0, N'JW027')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW027-A2', N'B. EVAL_BODY', 0, N'JW027')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW027-A3', N'C. EVAL_PAGE_AGAIN', 0, N'JW027')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW027-A4', N'D. SKIP_BODY', 1, N'JW027')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW028-A1', N'A. attribute', 1, N'JW028')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW028-A2', N'B. tag-attribute', 0, N'JW028')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW028-A3', N'C. tag-attribute-type', 0, N'JW028')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW028-A4', N'D. attribute-type', 0, N'JW028')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW029-A1', N'A. Tag', 1, N'JW029')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW029-A2', N'B. Description', 0, N'JW029')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW029-A3', N'C. Validator', 0, N'JW029')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW029-A4', N'D. Name', 0, N'JW029')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW030-A1', N'A. the user has closed all his/her browser windows.', 0, N'JW030')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW030-A2', N'B. the request is the first request from the user.', 0, N'JW030')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW030-A3', N'C. the user''s browser does not support URL rewriting.', 0, N'JW030')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW030-A4', N'D. the session attribute of page directive is set to false.', 1, N'JW030')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW031-A1', N'A. HttpServletSession.', 0, N'JW031')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW031-A2', N'B. HttpResponseSession.', 0, N'JW031')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW031-A3', N'C. HttpRequestSession.', 0, N'JW031')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW031-A4', N'D. HttpSession.', 1, N'JW031')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW032-A1', N'A. data integrity', 1, N'JW032')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW032-A2', N'B. authentication', 0, N'JW032')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW032-A3', N'C. authorization', 0, N'JW032')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW033-A1', N'A. DoGet, DoPost', 0, N'JW033')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW033-A2', N'B. doGet, doPost', 1, N'JW033')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW033-A3', N'C. doGET, doPOST', 0, N'JW033')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW033-A4', N'D. Get, Post', 0, N'JW033')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW034-A1', N'A. taguri
', 0, N'JW034')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW034-A2', N'B. info ', 0, N'JW034')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW034-A3', N'C. taglib-location', 1, N'JW034')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW034-A4', N'D. display-name', 0, N'JW034')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW035-A1', N'A. getValue("userid");', 0, N'JW035')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW035-A2', N'B. get("userid");', 0, N'JW035')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW035-A3', N'C. getAttribute("userid");', 1, N'JW035')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW035-A4', N'D. getParameter("userid");', 0, N'JW035')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW036-A1', N'A. JNDI', 0, N'JW036')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW036-A2', N'B. UDDI', 0, N'JW036')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW036-A3', N'C. JMS', 1, N'JW036')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW036-A4', N'D. JSP', 0, N'JW036')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW037-A1', N'A. They are used to represent data stored in a RDBMS
', 1, N'JW037')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW037-A2', N'B. They are used to implement business logic', 0, N'JW037')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW037-A3', N'C. They are an Enterprises Beans', 0, N'JW037')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW037-A4', N'D. They are CANNOT hold client state', 0, N'JW037')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW038-A1', N'A. scriptlets', 1, N'JW038')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW038-A2', N'B. expressions', 0, N'JW038')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW038-A3', N'C. declarations', 0, N'JW038')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW039-A1', N'A. Session beans and web components', 0, N'JW039')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW039-A2', N'B. Only stateless session beans', 0, N'JW039')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW039-A3', N'C. Only stateful session beans', 1, N'JW039')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW039-A4', N'D. Any EJB component', 0, N'JW039')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW040-A1', N'A. CONNECT method', 0, N'JW040')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW040-A2', N'B. COMPARE method', 1, N'JW040')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW040-A3', N'C. OPTIONS method', 0, N'JW040')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW040-A4', N'D. TRACE method', 0, N'JW040')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW041-A1', N'
A. Message-Driven Beans', 0, N'JW041')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW041-A2', N'B. Business Beans', 1, N'JW041')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW041-A3', N'C. Entity Beans', 0, N'JW041')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW041-A4', N'D. Session Beans', 0, N'JW041')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW042-A1', N'A. JNI', 0, N'JW042')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW042-A2', N'B. JDBC', 0, N'JW042')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW042-A3', N'C. EJB', 0, N'JW042')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW042-A4', N'D. JNDI', 1, N'JW042')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW043-A1', N'A. <attribute-name>', 0, N'JW043')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW043-A2', N'B. <attributename>', 0, N'JW043')
GO
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW043-A3', N'C. <name>', 1, N'JW043')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW043-A4', N'D. <param-name>', 0, N'JW043')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW044-A1', N'A. <error_page>', 0, N'JW044')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW044-A2', N'B. <error-page>', 1, N'JW044')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW044-A3', N'C. <error-location>', 0, N'JW044')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW044-A4', N'D. <error>', 0, N'JW044')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW045-A1', N'A. tagname', 0, N'JW045')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW045-A2', N'B. name', 1, N'JW045')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW045-A3', N'C. tag', 0, N'JW045')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW045-A4', N'D. prefix', 0, N'JW045')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW046-A1', N'A. The class attribute must be defined for <jsp:useBean>.', 0, N'JW046')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW046-A2', N'B. The id attribute must be defined for <jsp:useBean>.', 1, N'JW046')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW046-A3', N'C. The scope attribute must be defined for <jsp:useBean>.', 0, N'JW046')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW047-A1', N'A. SSL Sessions', 0, N'JW047')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW047-A2', N'B. HTTP is already a stateful protocol.', 1, N'JW047')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW047-A3', N'C. Cookies', 0, N'JW047')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW047-A4', N'D. URL rewriting', 0, N'JW047')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW048-A1', N'A. DataSource', 1, N'JW048')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW048-A2', N'B. Netbean', 0, N'JW048')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW048-A3', N'C. Eclipse
', 0, N'JW048')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW048-A4', N'D. Web server', 0, N'JW048')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW049-A1', N'A. @PostConstruct
public boolean init() {return true;}', 0, N'JW049')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW049-A2', N'B. @PostConstruct
private void init() {};', 1, N'JW049')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW049-A3', N'C. @PostConstruct
private static void init() {}', 0, N'JW049')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW049-A4', N'D. @PostConstruct
public static void init() {}', 0, N'JW049')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW050-A1', N'A. XML Parsing', 1, N'JW050')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW050-A2', N'B. Concurrency control', 0, N'JW050')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW050-A3', N'C. Transaction management', 0, N'JW050')
INSERT [dbo].[tblAnswer] ([answerID], [answerContent], [status], [questionID]) VALUES (N'JW050-A4', N'D. Security', 0, N'JW050')
SET IDENTITY_INSERT [dbo].[tblHistoryQuiz] ON 

INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (1, N'minhnq@fpt.edu.vn', N'PRJ311', N'null, JD031-A2, JD004-A1, JD030-A3, JD012-A2, JD006-A2, JD031-A2, JD004-A1, JD012-A2', N'Feb 24, 2021 07:16:41', 2)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (2, N'minhnq@fpt.edu.vn', N'PRJ321', NULL, N'Feb 24, 2021 07:51:34', 0)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (3, N'minhnq@fpt.edu.vn', N'PRJ311', NULL, N'Feb 24, 2021 07:36:36', 0)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (4, N'minhnq@fpt.edu.vn', N'PRJ321', N'null, JW048-A1, JW008-A1, JW035-A3', N'Feb 24, 2021 07:56:43', 0.60000002384185791)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (5, N'minhnq@fpt.edu.vn', N'PRJ311', NULL, N'Feb 24, 2021 08:37:20', 0)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (6, N'minhnq@fpt.edu.vn', N'PRJ311', NULL, N'Feb 24, 2021 08:19:09', 0)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (7, N'minhnq@fpt.edu.vn', N'PRJ311', N'null, JD026-A2, JD014-A1, JD027-A3, JD025-A3, JD019-A1', N'Feb 24, 2021 08:26:26', 0.25)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (8, N'minhnq@fpt.edu.vn', N'PRJ311', NULL, N'Feb 24, 2021 08:26:46', 0)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (9, N'minhnq@fpt.edu.vn', N'PRJ321', NULL, N'Feb 24, 2021 08:46:52', 0)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (10, N'minhnq@fpt.edu.vn', N'PRJ311', N'null, JD025-A3, JD027-A3, JD024-A2, JD030-A3, JD008-A1, JD002-A2, JD034-A2, JD026-A2', N'Feb 25, 2021 18:12:38', 0.5)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (11, N'minhnq@fpt.edu.vn', N'PRJ311', N'null, JD004-A1, JD019-A1, JD018-A1, JD036-A1, JD041-A2, JD023-A1, JD031-A2, JD016-A1, JD012-A2, JD006-A2', N'Feb 25, 2021 20:01:00', 2.5)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (12, N'minhnq@fpt.edu.vn', N'PRJ311', N'null, JD011-A3, JD037-A1, JD002-A2, JD004-A1, JD009-A2, JD032-A1, JD027-A3', N'Feb 25, 2021 20:18:40', 1.75)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (13, N'minhnq@fpt.edu.vn', N'PRJ321', N'null, JD011-A3, JD037-A1, JD002-A2, JD004-A1, JD009-A2, JD032-A1, JD027-A3, JW042-A4, JW050-A3, JW028-A4, JW009-A1, null, null, null, null, null, null, null, null, null', N'Feb 25, 2021 20:41:28', 4)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (14, N'minhnq@fpt.edu.vn', N'PRJ311', N'null, JD016-A1, JD024-A2, JD010-A1', N'Feb 25, 2021 20:52:37', 0.75)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (15, N'minhnq@fpt.edu.vn', N'PRJ321', N'null, JD016-A1, JD024-A2, JD010-A1, JW038-A1, JW040-A1, null, null, null, null', N'Feb 25, 2021 21:16:42', 1.7999999523162842)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (16, N'minhnq@fpt.edu.vn', N'PRJ311', N'null, JD013-A3, JD029-A3, null, null, null, null', N'Feb 25, 2021 21:01:47', 0.5)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (17, N'minhnq@fpt.edu.vn', N'PRJ311', N'JD030-A3, null', N'Feb 25, 2021 21:31:42', 0.25)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (18, N'ducdh@fpt.edu.vn', N'PRJ321', N'JW041-A4, JW006-A1, JW029-A4, JW014-A3, JW002-A4, JW017-A2, JW048-A1, JW050-A4, JW027-A4, JW041-A4, JW006-A1, JW029-A4, JW014-A3, JW002-A4, JW017-A2, JW048-A1, JW050-A4, null', N'Feb 25, 2021 23:03:40', 0.60000002384185791)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (19, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD037-A1, JD025-A4, JD015-A1, JD019-A2, JD031-A1, JD030-A1, JW041-A4, JW006-A1, JW029-A4, JW014-A3, JW002-A4, JW017-A2, JW048-A1, JW050-A4, JW027-A4, JW041-A4, JW006-A1, JW029-A4, JW014-A3, JW002-A4, JW017-A2, JW048-A1, JW050-A4, null', N'Feb 25, 2021 22:44:40', 1.5)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (20, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD004-A1, JD030-A3, JD017-A1, JD035-A4, JD024-A2, JD006-A2, JD004-A1, null', N'Feb 25, 2021 22:44:40', 1)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (21, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD041-A2, JD009-A1, JD005-A3, JD041-A2, JD009-A1, null', N'Feb 25, 2021 22:47:22', 0.25)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (22, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD041-A1, JD041-A1, null', N'Feb 25, 2021 22:47:46', 0.5)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (23, N'ducdh@fpt.edu.vn', N'PRJ321', N'JW045-A4, JW027-A3, null', N'Feb 25, 2021 23:09:49', 0)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (24, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD026-A1, null', N'Feb 25, 2021 22:50:05', 0)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (25, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD040-A1, JD018-A1, JD040-A1, null', N'Feb 25, 2021 22:50:15', 0.5)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (26, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD037-A2, JD027-A1, JD037-A2, JD027-A1, null', N'Feb 25, 2021 22:50:28', 0)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (27, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD012-A2, JD024-A2, JD034-A2, JD004-A1, JD034-A2, JD004-A1, null', N'Feb 25, 2021 22:50:28', 0.75)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (28, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD001-A1, JD010-A2, JD024-A1, JD035-A4, JD009-A1, JD008-A1, JD008-A1, JD009-A1, JD008-A1, null', N'Feb 25, 2021 22:55:44', 0.5)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (29, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD001-A1, JD010-A2, JD024-A1, JD035-A4, JD009-A1, JD008-A1, JD008-A1, JD009-A1, JD008-A1, null', N'Feb 25, 2021 22:55:44', 0.5)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (30, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD041-A1, JD038-A2, JD038-A2, null', N'Feb 25, 2021 23:03:06', 0.25)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (31, N'ducdh@fpt.edu.vn', N'PRJ321', N'JD041-A2, JD013-A2, JD041-A2, JD038-A2, JD041-A2, JD038-A2, JD038-A2, null', N'Feb 25, 2021 23:03:06', 0)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (32, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD002-A2, null', N'Feb 25, 2021 23:06:34', 0.25)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (33, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD024-A2, JD001-A3, JD011-A3, JD037-A1, JD015-A1, null', N'Feb 25, 2021 23:16:29', 1)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (34, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD034-A2, JD040-A1, JD040-A1, null', N'Feb 25, 2021 23:16:53', 0.5)
INSERT [dbo].[tblHistoryQuiz] ([historyID], [email], [subjectID], [correctAnswerID], [quizTime], [grade]) VALUES (35, N'ducdh@fpt.edu.vn', N'PRJ311', N'JD031-A2, JD026-A2, JD035-A2, JD017-A2, JD012-A2, JD008-A1, null', N'Feb 26, 2021 08:13:26', 0.75)
SET IDENTITY_INSERT [dbo].[tblHistoryQuiz] OFF
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD001', N'To get an object NumberFormat class that initialized to the specified locale, we use
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD002', N'Which type of driver can interpret JDBC calls to the database-specific native call interface
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD003', N'You can invoke ______________ on a Socket object, say socket, to obtain an InetAddress object.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD004', N'Formatting the captions of the GUI components ensures that the look and feel of the application is in a locale-sensitive manner
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD005', N'Which of the following code is correct to obtain hour from a Calendar object cal?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD006', N'Internationalized software should be developed such that it can be adapted without engineering changes
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD007', N'Which type of driver can use a bridging technology that provides JDBC access via ODBC drivers
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD008', N'RMI does not allow you to serialize and transmit objects
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD009', N'Which distributed object technology is most appropriate for systems that consist entirely of Java objects?
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD010', N'When using URL class, which method is used to make a connection with that URL?
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD011', N'When a connection is established, we can get which streams
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD012', N'A server must retrieve the InputStream and OutputStream from the proxy socket object to communicate with the client
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD013', N'The _______ method wakes up all threads that are waiting for a monitor
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD014', N'Which RMI layer make invocation to remote methods
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD015', N'______ facilitates many parts of same program to run serially but access a same resource
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD016', N'To create ServerSocket object, it should know the address or port of the client to communicate
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD017', N'A remote object is an instance of the class that implements the java.rmi.Remote interface Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD018', N'The _______ condition describes a situation where two or more threads a blocked forever, waiting for each other
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD019', N'Remote object and remote server are the same concept
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD020', N'_____ is used to transmit and receive data. Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 0, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD021', N'All the remote methods declared should be qualified to throw the exception ___________
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD022', N'Which class stores information about an Internet resource address including host name, file name, port number.
Select one:qualified', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD023', N'Which protocol is used in RMI connection
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD024', N'The isAlive() method sends a query to inquire, whether the thread is block or notSelect one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD025', N'The ______ method with the argument as true will convert the user thread to a daemon thread
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD026', N'Which package providing classes and interfaces for distributed computing in JavaSelect one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD027', N'o create an InputStream on a socket s, you use __________.
', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD028', N'The ServerSocket class has a method clientAccept() for listening to client request?
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD029', N'Which method is used to to retrieve the row IP address in textual format
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD030', N'The _____ method forces the current running thread to wait until the thread it is joining with is no longer alive
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD031', N'TCP is a connection-based protocol that provide a reliable flow of data between two computers
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD032', N'Java provides the java.net package which contains all the necessary classes to perform system-dependent network communications

Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD033', N'The JFileChooser by default displays all the files in the current directory
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD034', N'Thread priorities are numbers and range from Thread.NORM_PRIORITY to Thread.MAX_PRIORITY
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD035', N'The ______ method causes a thread to release the lock or monitor of the object, allowing another thread to access it', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD036', N'The ______ method returns true if the thread is a user thread
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD037', N'The getPriority() and setPriority() methods retrieve and set the current priority of any thread respectively
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD038', N'The deadlock situation allows the normal execution of the program after few minutes
Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD039', N'Using new TextField(10) will create a TextField that only accepts 10 characters of input.Select one:', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD040', N'The JList has a method addListSelectionListener() to register a selection listener
Select one:
', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD041', N'ahhihihhihii', CAST(N'2021-02-19 19:33:26.350' AS DateTime), 1, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD042', N'Hom nay an gi ta?', CAST(N'2021-02-23 13:35:51.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD043', N'Phuong Uyen em tui hoc lop may?', CAST(N'2021-02-24 07:36:09.770' AS DateTime), 0, N'PRJ311', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JD044', N'May tinh', CAST(N'2021-02-24 08:15:13.453' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW001', N'Which of the following statements are correct about the status of the Http response? Select the one correct answer', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW002', N'Classes HttpServlet and GenericServlet implement the ___ interface.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW003', N'You have to send a gif image to the client as a response to a request. Which of the following calls will you have to make?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW004', N'Consider the code of ReportServlet servlet of a web application. Assuming generateReport() is valid method and have no problems, which of the following statement about these servlet is true?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW005', N'Which of the following is indicated by URL, which is used on the Internet?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW006', N'Identify correct statement about a WAR file.(Choose one)', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW007', N'A parameter is defined in a <context-param> element of the deployment descriptor for a web application. Which of the following statements is correct?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW008', N'A .................... manages the threading for the servlets and JSPs and provides the necessary interface with the Web server.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW009', N'A ________has a name, a single value, and optional attributes such as a comment, path and domain qualifiers, a maximum age, and a version number.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW010', N'Which of the following method calls can be used to retrieve an object from the session that was stored using the name "roleName"?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW011', N'Which is NOT a standard technique for a session be definitely invalidated?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW012', N'Which method can be invoked on a session object so that it is never invalidated by the servlet container automatically?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 0, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW013', N'Session death is more likely to come about through a time-out mechanism. If there is no activity on a session for a predefined length of time, the web container invalidates the session.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW014', N'What are the different scope values for the ‹jsp:useBean›? (Choose one correct answer)', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW015', N'Name the default value of the scope attribute of <jsp:useBean>', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW016', N'Select the correct directive statement insert into the first line of following lines of code (1 insert code here):', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW017', N'For JSP scopes of request and page, what type of object is used to store the attributes?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW018', N'Which of the following correctly represents the following JSP statement? Select one correct answer  =x', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW019', N'What gets printed when the following JSP code is invoked in a browser? Select one correct answer.
<%= if(Math.random() < 0.5) %>
hello
<%= } else { %>
hi
<%= } %>', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW020', N'Which technique is likely to return an initialization parameter for a JSP page ?  ', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW021', N'A JSP ________________ lets you define methods or fields that get inserted into the main body of the servlet class (outside of the _jspService method that is called by service to process the request).', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW022', N'Which jsp tag can be used to set bean property?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW023', N'Action _______has the ability to match request parameters to properties of the same name in a bean by specifying "*" for attribute property.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW024', N'What sub element of <attribute> tag defines the name of the attribute that might be passed to the tag handler? (Choose one)', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW025', N'What should be the value of <body-content> subelement of element <tag> in a TLD file if the tag should not have any contents as its body?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW026', N'Identify the correct element is required for a valid <taglib> tag in web.xml (Choose one)', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW027', N'Which of these is legal return types of the doAfterBody method defined in a class that extends TagSupport class?.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW028', N'Which of the following elements defines the properties of an attribute that a tag needs?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW029', N'Which element defined within the taglib element of taglib descriptor file is required? Select one correct answer.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW030', N'A JSP page will not have access to session implicit variable if.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW031', N'HttpServletRequest.getSession() method returns a_____object.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW032', N'You need to make sure that the response stream of your web application is secure. Which factor will you look at? (Choose one)', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW033', N'Class HttpServlet defines the methods _____ and _______ to response to get and post request from a client.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW034', N'Which of the elements defined within the taglib element of taglib descriptor file are required? Select one correct answer.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW035', N'Which of the following method calls can be used to retrieve an object from the session that was stored using the name "userid"?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW036', N'Which Java technology provides a standard API for publish-subscribe messaging model?
', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW037', N'Which is NOT true about stateless session beans?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW038', N'JSP_let you insert arbitrary code into the servlet''s JspService method (which is called by service).', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW039', N'Which component can use a container-managed entity manager with an extended persistent context?
', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW040', N'Which of the following is not a valid HTTP/1.1 method. Select the one correct answer.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW041', N'Which is NOT Enterprise Beans?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW042', N'Which Java technology provides a unified interface to multiple naming and directory services?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW043', N'What sub element of <attribute> tag defines the name of the attribute that might be passed to the tag handler? (Choose one)', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW044', N'Which of the following elements are used for error handling and are child elements of<web-app> of a deployment descriptor?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW045', N'A JSP file uses a tag as <myTaglib:myTag>. The myTag element here should be defined in the which element of the taglib element in the tag library descriptor file ?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW046', N'Which of the following statement is true for jsp:useBean ?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW047', N'Which of the following is NOT a standard technique for providing a sense of "state" to HTTP?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW048', N'A(n)_enables a web application to obtain a Connection to a database.', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW049', N'Which is a valid PostConstruct method in a message-driven bean class?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [createDate], [status], [subjectID], [email]) VALUES (N'JW050', N'Which is NOT provided by the EJB tier in a multitier JEE (J2EE) application?', CAST(N'2021-02-04 00:00:00.000' AS DateTime), 1, N'PRJ321', N'minhnqse140536@fpt.edu.vn')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'SD', N'Student')
INSERT [dbo].[tblSubject] ([subjectID], [subjectName]) VALUES (N'PRJ311', N'Java Desktop')
INSERT [dbo].[tblSubject] ([subjectID], [subjectName]) VALUES (N'PRJ321', N'Java Web')
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblAnswer]  WITH CHECK ADD FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestion] ([questionID])
GO
ALTER TABLE [dbo].[tblHistoryQuiz]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[tblAccount] ([email])
GO
ALTER TABLE [dbo].[tblHistoryQuiz]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubject] ([subjectID])
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[tblAccount] ([email])
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubject] ([subjectID])
GO
