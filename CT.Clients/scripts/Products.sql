USE [DNN_CT_dev]
GO

/****** Object:  Table [dbo].[dnn_CT_Product]    Script Date: 02-01-19 11:58:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dnn_CT_Product](
	[Product_Category] [nvarchar](max) NULL,
	[Qty_in_Demand] [int] NULL,
	[Owner] [bigint] NULL,
	[Description] [nvarchar](max) NULL,
	[currency_symbol] [nvarchar](max) NULL,
	[Vendor_Name] [nvarchar](max) NULL,
	[Sales_Start_Date] [nvarchar](max) NULL,
	[Product_Active] [bit] NULL,
	[Record_Image] [nvarchar](max) NULL,
	[Modified_By] [bigint] NULL,
	[Product_Code] [nvarchar](max) NULL,
	[process_flow] [bit] NULL,
	[Manufacturer] [nvarchar](max) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Support_Expiry_Date] [nvarchar](max) NULL,
	[approved] [bit] NULL,
	[approval] [bigint] NULL,
	[Modified_Time] [datetime] NULL,
	[Created_Time] [datetime] NULL,
	[Commission_Rate] [int] NULL,
	[Product_Name] [nvarchar](max) NULL,
	[Handler] [nvarchar](max) NULL,
	[taxable] [bit] NULL,
	[editable] [bit] NULL,
	[Support_Start_Date] [nvarchar](max) NULL,
	[Usage_Unit] [nvarchar](max) NULL,
	[Qty_Ordered] [int] NULL,
	[Qty_in_Stock] [int] NULL,
	[Created_By] [bigint] NULL,
	[Sales_End_Date] [nvarchar](max) NULL,
	[Unit_Price] [int] NULL,
	[Taxable_Price] [bit] NULL,
	[Reorder_Level] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


