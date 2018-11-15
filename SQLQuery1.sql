USE [FtpMonitoring]
GO
/****** Object:  Schema [staging]    Script Date: 10/1/2018 11:34:45 PM ******/
CREATE SCHEMA [staging]
GO
/****** Object:  Table [dbo].[HistoryMonitoringLog]    Script Date: 10/1/2018 11:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryMonitoringLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileId] [int] NULL,
	[StatusId] [int] NULL,
	[MonitoringLogDate] [date] NULL,
	[FileName] [nvarchar](255) NULL,
	[FileModifiedDatetime] [datetime] NULL,
	[ETLRunDatetime] [datetime] NULL,
 CONSTRAINT [PK_HistoryMonitoringLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterBatchFile]    Script Date: 10/1/2018 11:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterBatchFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PathName] [nvarchar](128) NULL,
 CONSTRAINT [PK_MasterBatchFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterFile]    Script Date: 10/1/2018 11:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SroId] [int] NULL,
	[Name] [nvarchar](64) NULL,
 CONSTRAINT [PK_MasterFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterPath]    Script Date: 10/1/2018 11:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterPath](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_MasterPath] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterPatternExtension]    Script Date: 10/1/2018 11:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterPatternExtension](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NULL,
 CONSTRAINT [PK_MasterPatternExtension] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterSRO]    Script Date: 10/1/2018 11:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterSRO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MasterSRO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterStatus]    Script Date: 10/1/2018 11:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatternExtensionId] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MasterStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonitoringConfiguration]    Script Date: 10/1/2018 11:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonitoringConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusId] [int] NULL,
	[PathId] [int] NULL,
	[BatchFileId] [int] NULL,
 CONSTRAINT [PK_MonitoringConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonitoringLog]    Script Date: 10/1/2018 11:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonitoringLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileId] [int] NULL,
 CONSTRAINT [PK_MonitoringLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonitoringLogDetail]    Script Date: 10/1/2018 11:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonitoringLogDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusId] [int] NULL,
	[MonitoringLogId] [int] NULL,
	[FileName] [nvarchar](255) NULL,
	[FileModifiedDatetime] [datetime] NULL,
	[ETLRunDatetime] [datetime] NULL,
 CONSTRAINT [PK_MonitoringLogDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [staging].[RawFiles]    Script Date: 10/1/2018 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[RawFiles](
	[FileId] [int] NULL,
	[FileName] [nvarchar](255) NULL,
	[FileModifiedDatetime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [staging].[SearchResults]    Script Date: 10/1/2018 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[SearchResults](
	[Id] [int] NULL,
	[Result] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HistoryMonitoringLog] ON 

INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (1, 1, 3, CAST(N'2018-07-19' AS Date), N'2018071902BEITOOJK', CAST(N'2018-07-19T04:40:07.000' AS DateTime), CAST(N'2018-07-19T15:38:26.930' AS DateTime))
INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (2, 3, 3, CAST(N'2018-07-19' AS Date), N'2018071902FROMBEITOOJKDATAKSEI', CAST(N'2018-07-19T15:11:20.000' AS DateTime), CAST(N'2018-07-19T15:38:27.137' AS DateTime))
INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (3, 4, 3, CAST(N'2018-07-19' AS Date), N'2018071903FROMBEITOOJKDATAOJK', CAST(N'2018-07-19T15:26:48.000' AS DateTime), CAST(N'2018-07-19T15:38:27.323' AS DateTime))
INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (4, 1, 3, CAST(N'2018-07-19' AS Date), N'2018071906BEITOOJK', CAST(N'2018-07-19T08:41:14.000' AS DateTime), CAST(N'2018-07-19T15:38:27.487' AS DateTime))
INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (5, 2, 3, CAST(N'2018-07-19' AS Date), N'2018071910FROMBEITOOJKDATAKPEI', CAST(N'2018-07-19T12:30:13.000' AS DateTime), CAST(N'2018-07-19T15:38:27.637' AS DateTime))
INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (6, 3, 3, CAST(N'2018-07-19' AS Date), N'2018071910FROMBEITOOJKDATAKSEI', CAST(N'2018-07-19T12:27:57.000' AS DateTime), CAST(N'2018-07-19T15:38:27.783' AS DateTime))
INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (7, 6, 7, CAST(N'2018-07-19' AS Date), N'2018071902OJKKSEITOBEI', CAST(N'2018-07-19T14:39:02.000' AS DateTime), CAST(N'2018-07-19T15:39:11.757' AS DateTime))
INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (8, 5, 7, CAST(N'2018-07-19' AS Date), N'2018071910OJKKPEITOBEI', CAST(N'2018-07-19T10:26:05.000' AS DateTime), CAST(N'2018-07-19T15:39:11.920' AS DateTime))
INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (9, 6, 7, CAST(N'2018-07-19' AS Date), N'2018071910OJKKSEITOBEI', CAST(N'2018-07-19T10:39:37.000' AS DateTime), CAST(N'2018-07-19T15:39:12.080' AS DateTime))
INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (10, 1, 4, CAST(N'2018-07-19' AS Date), N'2018071902BEITOOJK', CAST(N'2018-07-19T04:40:07.000' AS DateTime), CAST(N'2018-07-19T16:08:26.930' AS DateTime))
INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (11, 1, 1, CAST(N'2018-07-19' AS Date), N'2018071902BEITOOJK', CAST(N'2018-07-19T04:40:07.000' AS DateTime), CAST(N'2018-07-19T14:40:07.000' AS DateTime))
INSERT [dbo].[HistoryMonitoringLog] ([Id], [FileId], [StatusId], [MonitoringLogDate], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (12, 1, 2, CAST(N'2018-07-19' AS Date), N'2018071902BEITOOJK', CAST(N'2018-07-19T04:40:07.000' AS DateTime), CAST(N'2018-07-19T14:41:07.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[HistoryMonitoringLog] OFF
SET IDENTITY_INSERT [dbo].[MasterBatchFile] ON 

INSERT [dbo].[MasterBatchFile] ([Id], [PathName]) VALUES (1, N'C:\DATA_EXPORT_IMPORT\FtpBeiDirList.bat')
INSERT [dbo].[MasterBatchFile] ([Id], [PathName]) VALUES (2, N'C:\DATA_EXPORT_IMPORT\FtpOjkDirList.bat')
INSERT [dbo].[MasterBatchFile] ([Id], [PathName]) VALUES (3, N'C:\DATA_EXPORT_IMPORT\FtpDirListLocal.bat')
INSERT [dbo].[MasterBatchFile] ([Id], [PathName]) VALUES (4, N'C:\DATA_EXPORT_IMPORT\FtpKpeiDirList.bat')
INSERT [dbo].[MasterBatchFile] ([Id], [PathName]) VALUES (5, N'C:\DATA_EXPORT_IMPORT\FtpKseiDirList.bat')
SET IDENTITY_INSERT [dbo].[MasterBatchFile] OFF
SET IDENTITY_INSERT [dbo].[MasterFile] ON 

INSERT [dbo].[MasterFile] ([Id], [SroId], [Name]) VALUES (1, 1, N'BEITOOJK')
INSERT [dbo].[MasterFile] ([Id], [SroId], [Name]) VALUES (2, 1, N'FROMBEITOOJKDATAKPEI')
INSERT [dbo].[MasterFile] ([Id], [SroId], [Name]) VALUES (3, 1, N'FROMBEITOOJKDATAKSEI')
INSERT [dbo].[MasterFile] ([Id], [SroId], [Name]) VALUES (4, 1, N'FROMBEITOOJKDATAOJK')
INSERT [dbo].[MasterFile] ([Id], [SroId], [Name]) VALUES (5, 1, N'OJKKPEITOBEI')
INSERT [dbo].[MasterFile] ([Id], [SroId], [Name]) VALUES (6, 1, N'OJKKSEITOBEI')
INSERT [dbo].[MasterFile] ([Id], [SroId], [Name]) VALUES (7, 2, N'DATAKPEI')
INSERT [dbo].[MasterFile] ([Id], [SroId], [Name]) VALUES (8, 3, N'DATAKSEI')
SET IDENTITY_INSERT [dbo].[MasterFile] OFF
SET IDENTITY_INSERT [dbo].[MasterPath] ON 

INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (1, N'/C:/DATA_EXPORT_IMPORT/EXPORT/OJK')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (2, N'/C:/DATA_EXPORT_IMPORT/IMPORT/BEI')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (3, N'/C:/DATA_EXPORT_IMPORT/IMPORT/BEI/Done')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (4, N'C:\DATA_EXPORT_IMPORT\IMPORT\OJK\Done')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (5, N'/C:/DATA_EXPORT_IMPORT/EXPORT/BEI')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (6, N'/C:/DATA_EXPORT_IMPORT/IMPORT/OJK/Done')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (7, N'/C:/DATA_EXPORT_IMPORT/IMPORT/KPEI')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (8, N'/C:/DATA_EXPORT_IMPORT/IMPORT/KPEI/done')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (9, N'/C:/DATA_EXPORT_IMPORT/IMPORT/KSEI')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (10, N'/C:/DATA_EXPORT_IMPORT/IMPORT/KSEI/done')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (11, N'/I:/Tectia/DATA_EXPORT_IMPORT/EXPORT/OJK')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (12, N'C:\FTP_OJK\DATA_EXPORT_IMPORT\IMPORT\KPEI\Done')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (13, N'C:\FTP_OJK\DATA_EXPORT_IMPORT\IMPORT\KSEI')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (14, N'C:\FTP_OJK\DATA_EXPORT_IMPORT\IMPORT\KSEI\Done')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (15, N'C:\FTP_KPEI\DATA_EXPORT_IMPORT\EXPORT\OJK')
INSERT [dbo].[MasterPath] ([Id], [Name]) VALUES (16, N'C:\FTP_KSEI\DATA_EXPORT_IMPORT\EXPORT\OJK')
SET IDENTITY_INSERT [dbo].[MasterPath] OFF
SET IDENTITY_INSERT [dbo].[MasterPatternExtension] ON 

INSERT [dbo].[MasterPatternExtension] ([Id], [Name]) VALUES (1, N'.rar.ready')
INSERT [dbo].[MasterPatternExtension] ([Id], [Name]) VALUES (2, N'.rar.ready.transfer')
INSERT [dbo].[MasterPatternExtension] ([Id], [Name]) VALUES (4, N'.rar.ready.done.moved')
INSERT [dbo].[MasterPatternExtension] ([Id], [Name]) VALUES (5, N'.rar.ready.processed')
SET IDENTITY_INSERT [dbo].[MasterPatternExtension] OFF
SET IDENTITY_INSERT [dbo].[MasterSRO] ON 

INSERT [dbo].[MasterSRO] ([Id], [Name]) VALUES (1, N'BEI')
INSERT [dbo].[MasterSRO] ([Id], [Name]) VALUES (2, N'KPEI')
INSERT [dbo].[MasterSRO] ([Id], [Name]) VALUES (3, N'KSEI')
SET IDENTITY_INSERT [dbo].[MasterSRO] OFF
SET IDENTITY_INSERT [dbo].[MasterStatus] ON 

INSERT [dbo].[MasterStatus] ([Id], [PatternExtensionId], [Name]) VALUES (1, 1, N'Siap Dikirim Dari BEI')
INSERT [dbo].[MasterStatus] ([Id], [PatternExtensionId], [Name]) VALUES (2, 2, N'Sedang Dalam Proses Pengiriman Dari BEI Ke OJK')
INSERT [dbo].[MasterStatus] ([Id], [PatternExtensionId], [Name]) VALUES (3, 4, N'Sudah Diterima Dan Dipindahkan Ke Server SSIS OJK')
INSERT [dbo].[MasterStatus] ([Id], [PatternExtensionId], [Name]) VALUES (4, 5, N'Sudah Melewati Proses ETL Pada Server SSIS OJK')
INSERT [dbo].[MasterStatus] ([Id], [PatternExtensionId], [Name]) VALUES (5, 1, N'Siap Dikirim Dari OJK')
INSERT [dbo].[MasterStatus] ([Id], [PatternExtensionId], [Name]) VALUES (6, 2, N'Sedang Dalam Proses Pengiriman Dari OJK Ke BEI')
INSERT [dbo].[MasterStatus] ([Id], [PatternExtensionId], [Name]) VALUES (7, 4, N'Sudah Diterima Dan Dipindahkan Ke Server SSIS BEI')
INSERT [dbo].[MasterStatus] ([Id], [PatternExtensionId], [Name]) VALUES (8, 1, N'Siap Dikirim Dari KPEI')
INSERT [dbo].[MasterStatus] ([Id], [PatternExtensionId], [Name]) VALUES (9, 2, N'Sedang Dalam Proses Pengiriman Dari KPEI Ke OJK')
INSERT [dbo].[MasterStatus] ([Id], [PatternExtensionId], [Name]) VALUES (10, 1, N'Siap Dikirim Dari KSEI')
INSERT [dbo].[MasterStatus] ([Id], [PatternExtensionId], [Name]) VALUES (11, 2, N'Sedang Dalam Proses Pengiriman Dari KSEI Ke OJK')
SET IDENTITY_INSERT [dbo].[MasterStatus] OFF
SET IDENTITY_INSERT [dbo].[MonitoringConfiguration] ON 

INSERT [dbo].[MonitoringConfiguration] ([Id], [StatusId], [PathId], [BatchFileId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[MonitoringConfiguration] ([Id], [StatusId], [PathId], [BatchFileId]) VALUES (8, 2, 2, 2)
INSERT [dbo].[MonitoringConfiguration] ([Id], [StatusId], [PathId], [BatchFileId]) VALUES (9, 3, 3, 2)
INSERT [dbo].[MonitoringConfiguration] ([Id], [StatusId], [PathId], [BatchFileId]) VALUES (10, 4, 4, 3)
INSERT [dbo].[MonitoringConfiguration] ([Id], [StatusId], [PathId], [BatchFileId]) VALUES (11, 5, 5, 2)
INSERT [dbo].[MonitoringConfiguration] ([Id], [StatusId], [PathId], [BatchFileId]) VALUES (12, 6, 5, 2)
INSERT [dbo].[MonitoringConfiguration] ([Id], [StatusId], [PathId], [BatchFileId]) VALUES (13, 7, 6, 1)
INSERT [dbo].[MonitoringConfiguration] ([Id], [StatusId], [PathId], [BatchFileId]) VALUES (14, 8, 11, 4)
INSERT [dbo].[MonitoringConfiguration] ([Id], [StatusId], [PathId], [BatchFileId]) VALUES (15, 9, 2, 2)
INSERT [dbo].[MonitoringConfiguration] ([Id], [StatusId], [PathId], [BatchFileId]) VALUES (16, 10, 1, 5)
INSERT [dbo].[MonitoringConfiguration] ([Id], [StatusId], [PathId], [BatchFileId]) VALUES (17, 11, 2, 2)
SET IDENTITY_INSERT [dbo].[MonitoringConfiguration] OFF
SET IDENTITY_INSERT [dbo].[MonitoringLog] ON 

INSERT [dbo].[MonitoringLog] ([Id], [FileId]) VALUES (1, 1)
INSERT [dbo].[MonitoringLog] ([Id], [FileId]) VALUES (2, 2)
INSERT [dbo].[MonitoringLog] ([Id], [FileId]) VALUES (3, 3)
INSERT [dbo].[MonitoringLog] ([Id], [FileId]) VALUES (4, 4)
INSERT [dbo].[MonitoringLog] ([Id], [FileId]) VALUES (5, 5)
INSERT [dbo].[MonitoringLog] ([Id], [FileId]) VALUES (6, 6)
INSERT [dbo].[MonitoringLog] ([Id], [FileId]) VALUES (7, 7)
INSERT [dbo].[MonitoringLog] ([Id], [FileId]) VALUES (8, 8)
SET IDENTITY_INSERT [dbo].[MonitoringLog] OFF
SET IDENTITY_INSERT [dbo].[MonitoringLogDetail] ON 

INSERT [dbo].[MonitoringLogDetail] ([Id], [StatusId], [MonitoringLogId], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (1, 3, 1, N'2018071902BEITOOJK', CAST(N'2018-07-19T04:40:07.000' AS DateTime), CAST(N'2018-07-19T15:38:26.930' AS DateTime))
INSERT [dbo].[MonitoringLogDetail] ([Id], [StatusId], [MonitoringLogId], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (2, 3, 3, N'2018071902FROMBEITOOJKDATAKSEI', CAST(N'2018-07-19T15:11:20.000' AS DateTime), CAST(N'2018-07-19T15:38:27.137' AS DateTime))
INSERT [dbo].[MonitoringLogDetail] ([Id], [StatusId], [MonitoringLogId], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (3, 3, 4, N'2018071903FROMBEITOOJKDATAOJK', CAST(N'2018-07-19T15:26:48.000' AS DateTime), CAST(N'2018-07-19T15:38:27.323' AS DateTime))
INSERT [dbo].[MonitoringLogDetail] ([Id], [StatusId], [MonitoringLogId], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (4, 3, 1, N'2018071906BEITOOJK', CAST(N'2018-07-19T08:41:14.000' AS DateTime), CAST(N'2018-07-19T15:38:27.487' AS DateTime))
INSERT [dbo].[MonitoringLogDetail] ([Id], [StatusId], [MonitoringLogId], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (5, 3, 2, N'2018071910FROMBEITOOJKDATAKPEI', CAST(N'2018-07-19T12:30:13.000' AS DateTime), CAST(N'2018-07-19T15:38:27.637' AS DateTime))
INSERT [dbo].[MonitoringLogDetail] ([Id], [StatusId], [MonitoringLogId], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (6, 3, 3, N'2018071910FROMBEITOOJKDATAKSEI', CAST(N'2018-07-19T12:27:57.000' AS DateTime), CAST(N'2018-07-19T15:38:27.783' AS DateTime))
INSERT [dbo].[MonitoringLogDetail] ([Id], [StatusId], [MonitoringLogId], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (7, 7, 6, N'2018071902OJKKSEITOBEI', CAST(N'2018-07-19T14:39:02.000' AS DateTime), CAST(N'2018-07-19T15:39:11.757' AS DateTime))
INSERT [dbo].[MonitoringLogDetail] ([Id], [StatusId], [MonitoringLogId], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (8, 7, 5, N'2018071910OJKKPEITOBEI', CAST(N'2018-07-19T10:26:05.000' AS DateTime), CAST(N'2018-07-19T15:39:11.920' AS DateTime))
INSERT [dbo].[MonitoringLogDetail] ([Id], [StatusId], [MonitoringLogId], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (9, 7, 6, N'2018071910OJKKSEITOBEI', CAST(N'2018-07-19T10:39:37.000' AS DateTime), CAST(N'2018-07-19T15:39:12.080' AS DateTime))
INSERT [dbo].[MonitoringLogDetail] ([Id], [StatusId], [MonitoringLogId], [FileName], [FileModifiedDatetime], [ETLRunDatetime]) VALUES (10, 3, 1, N'2018072002BEITOOJK', CAST(N'2018-07-20T04:40:07.000' AS DateTime), CAST(N'2018-07-20T04:40:07.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[MonitoringLogDetail] OFF
ALTER TABLE [dbo].[HistoryMonitoringLog]  WITH CHECK ADD  CONSTRAINT [FK_HistoryMonitoringLog_MasterFile] FOREIGN KEY([FileId])
REFERENCES [dbo].[MasterFile] ([Id])
GO
ALTER TABLE [dbo].[HistoryMonitoringLog] CHECK CONSTRAINT [FK_HistoryMonitoringLog_MasterFile]
GO
ALTER TABLE [dbo].[HistoryMonitoringLog]  WITH CHECK ADD  CONSTRAINT [FK_HistoryMonitoringLog_MasterStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[MasterStatus] ([Id])
GO
ALTER TABLE [dbo].[HistoryMonitoringLog] CHECK CONSTRAINT [FK_HistoryMonitoringLog_MasterStatus]
GO
ALTER TABLE [dbo].[MasterFile]  WITH CHECK ADD  CONSTRAINT [FK_MasterFile_MasterSRO] FOREIGN KEY([SroId])
REFERENCES [dbo].[MasterSRO] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterFile] CHECK CONSTRAINT [FK_MasterFile_MasterSRO]
GO
ALTER TABLE [dbo].[MasterStatus]  WITH CHECK ADD  CONSTRAINT [FK_MasterStatus_MasterPatternExtension] FOREIGN KEY([PatternExtensionId])
REFERENCES [dbo].[MasterPatternExtension] ([Id])
GO
ALTER TABLE [dbo].[MasterStatus] CHECK CONSTRAINT [FK_MasterStatus_MasterPatternExtension]
GO
ALTER TABLE [dbo].[MonitoringConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_MonitoringConfiguration_MasterBatchFile] FOREIGN KEY([BatchFileId])
REFERENCES [dbo].[MasterBatchFile] ([Id])
GO
ALTER TABLE [dbo].[MonitoringConfiguration] CHECK CONSTRAINT [FK_MonitoringConfiguration_MasterBatchFile]
GO
ALTER TABLE [dbo].[MonitoringConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_MonitoringConfiguration_MasterPath] FOREIGN KEY([PathId])
REFERENCES [dbo].[MasterPath] ([Id])
GO
ALTER TABLE [dbo].[MonitoringConfiguration] CHECK CONSTRAINT [FK_MonitoringConfiguration_MasterPath]
GO
ALTER TABLE [dbo].[MonitoringConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_MonitoringConfiguration_MasterStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[MasterStatus] ([Id])
GO
ALTER TABLE [dbo].[MonitoringConfiguration] CHECK CONSTRAINT [FK_MonitoringConfiguration_MasterStatus]
GO
ALTER TABLE [dbo].[MonitoringLog]  WITH CHECK ADD  CONSTRAINT [FK_MonitoringLog_MasterFile] FOREIGN KEY([FileId])
REFERENCES [dbo].[MasterFile] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MonitoringLog] CHECK CONSTRAINT [FK_MonitoringLog_MasterFile]
GO
ALTER TABLE [dbo].[MonitoringLogDetail]  WITH CHECK ADD  CONSTRAINT [FK_MonitoringLogDetail_MasterStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[MasterStatus] ([Id])
GO
ALTER TABLE [dbo].[MonitoringLogDetail] CHECK CONSTRAINT [FK_MonitoringLogDetail_MasterStatus]
GO
ALTER TABLE [dbo].[MonitoringLogDetail]  WITH CHECK ADD  CONSTRAINT [FK_MonitoringLogDetail_MonitoringLog] FOREIGN KEY([MonitoringLogId])
REFERENCES [dbo].[MonitoringLog] ([Id])
GO
ALTER TABLE [dbo].[MonitoringLogDetail] CHECK CONSTRAINT [FK_MonitoringLogDetail_MonitoringLog]
GO
/****** Object:  StoredProcedure [dbo].[spListHistoryMonitoringLogs]    Script Date: 10/1/2018 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spListHistoryMonitoringLogs] 
	@fileId INT
AS
BEGIN
	SELECT hml.Id
		  ,hml.MonitoringLogDate as MonitoringLogDate
	      ,mf.Name as FileTemplateName
		  ,hml.FileName as FileName
		  ,hml.FileModifiedDatetime as FileModifiedDatetime
		  ,ms.Name as FileStatus
		  ,hml.ETLRunDatetime as ETLRunDatetime
FROM
(
   SELECT FileName, Max(ETLRunDatetime) ETLRunDatetime
   FROM   HistoryMonitoringLog
   WHERE FileId = @fileId
   GROUP BY FileName
) hmlTemp 
INNER JOIN HistoryMonitoringLog hml on hmlTemp.FileName = hml.FileName AND hmlTemp.ETLRunDatetime = hml.ETLRunDatetime
INNER JOIN MasterStatus ms on ms.Id = hml.StatusId
INNER JOIN MasterFile mf on mf.Id = hml.FileId 
END
GO