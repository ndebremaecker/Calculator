USE [DNN_CT_dev]
GO

/****** Object:  Table [dbo].[dnn_CT_Lead]    Script Date: 28-12-18 13:16:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dnn_CT_Lead](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_owner] [bigint] NOT NULL,
	[company] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[currency_symbol] [nvarchar](max) NULL,
	[rating] [nvarchar](max) NULL,
	[website] [nvarchar](max) NULL,
	[twitter] [nvarchar](max) NULL,
	[salutation] [nvarchar](max) NULL,
	[last_activity_time] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[full_name] [nvarchar](max) NULL,
	[lead_status] [nvarchar](max) NULL,
	[industry] [nvarchar](max) NULL,
	[record_image] [nvarchar](max) NULL,
	[user_modified_by] [bigint] NULL,
	[skype_id] [nvarchar](max) NULL,
	[converted] [bit] NULL,
	[process_flow] [bit] NULL,
	[phone] [nvarchar](max) NULL,
	[street] [nvarchar](max) NULL,
	[zip_code] [nvarchar](max) NULL,
	[email_opt_out] [bit] NULL,
	[approved] [bit] NULL,
	[designation] [nvarchar](max) NULL,
	[approval_id] [bigint] NULL,
	[modified_time] [datetime] NULL,
	[created_time] [datetime] NULL,
	[converted_detail_id] [bigint] NULL,
	[editable] [bit] NULL,
	[city] [nvarchar](max) NULL,
	[no_of_employees] [int] NULL,
	[mobile] [nvarchar](max) NULL,
	[prediction_score] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[state] [nvarchar](max) NULL,
	[lead_source] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
	[user_created_by] [bigint] NULL,
	[fax] [nvarchar](max) NULL,
	[annual_revenue] [int] NULL,
	[secondary_email] [nvarchar](max) NULL,
 CONSTRAINT [PK_dnn_CT_Leads] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


