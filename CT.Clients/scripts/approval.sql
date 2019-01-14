USE [DNN_CT_dev]
GO

/****** Object:  Table [dbo].[ddn_CT_Approval]    Script Date: 28-12-18 13:46:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dnn_CT_Approval](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[_delegate] [bit] NULL,
	[approve] [bit] NULL,
	[reject] [bit] NULL,
	[resubmit] [bit] NULL,
 CONSTRAINT [PK_ddn_CT_Approval] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


