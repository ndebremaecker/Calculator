/****** Object:  StoredProcedure [dbo].[dnn_Calculator_UpdateDevisPDFInfo]    Script Date: 11-01-19 12:09:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dnn_Calculator_UpdateDevisPDFInfo]
	@DevisId int,
	@PathPDF nvarchar(max),
	@DateUploadPDF date
AS
	UPDATE dbo.dnn_Calculator_Devis 
		SET
			PathPDF = @PathPDF,
			DateUploadPDF = @DateUploadPDF
		WHERE Id = @DevisId
GO



/****** Object:  Table [dbo].[dnn_Calculator_Devis]    Script Date: 11-01-19 12:08:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dnn_Calculator_Devis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomSociete] [nvarchar](200) NULL,
	[AdresseSociete] [nvarchar](max) NULL,
	[AdresseFacturation] [nvarchar](max) NULL,
	[AdresseInstallation] [nvarchar](max) NULL,
	[TelSociete] [nvarchar](50) NULL,
	[NumeroEntreprise] [nvarchar](50) NULL,
	[NomClient] [nvarchar](50) NULL,
	[PrenomClient] [nvarchar](50) NULL,
	[TelDirect] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[NomIT] [nvarchar](50) NULL,
	[PrenomIT] [nvarchar](50) NULL,
	[TelIT] [nvarchar](50) NULL,
	[EmailIT] [nvarchar](50) NULL,
	[TotalHTVA] [decimal](10, 2) NOT NULL,
	[DateSignature] [date] NULL,
	[Autoliquidation] [bit] NULL,
	[DevisSigne] [bit] NOT NULL,
	[Remarques] [nvarchar](max) NULL,
	[DateCreation] [date] NOT NULL,
	[PathPDF] [nvarchar](max) NULL,
	[DateUploadPDF] [date] NULL,
 CONSTRAINT [PK_dnn_Calculator_Devis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[dnn_Calculator_Devis] ADD  CONSTRAINT [DF_dnn_Calculator_Devis_DevisSigne]  DEFAULT ((0)) FOR [DevisSigne]
GO

/****** Object:  Table [dbo].[dnn_CT_Approval]    Script Date: 11-01-19 10:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dnn_Calculator_Approval](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[_delegate] [bit] NULL,
	[approve] [bit] NULL,
	[reject] [bit] NULL,
	[resubmit] [bit] NULL,
 CONSTRAINT [PK_ddn_Calculator_Approval] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dnn_Calculator_Contact]    Script Date: 11-01-19 10:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dnn_Calculator_Contact](
	[Owner] [bigint] NULL,
	[Email] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[currency_symbol] [nvarchar](max) NULL,
	[Vendor_Name] [bigint] NULL,
	[Mailing_Zip] [nvarchar](max) NULL,
	[Other_Phone] [nvarchar](max) NULL,
	[Mailing_State] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[Other_Zip] [nvarchar](max) NULL,
	[Mailing_Street] [nvarchar](max) NULL,
	[Other_State] [nvarchar](max) NULL,
	[Salutation] [nvarchar](max) NULL,
	[Other_Country] [nvarchar](max) NULL,
	[Last_Activity_Time] [datetime] NULL,
	[First_Name] [nvarchar](max) NULL,
	[Full_Name] [nvarchar](max) NULL,
	[Asst_Phone] [nvarchar](max) NULL,
	[Record_Image] [nvarchar](max) NULL,
	[Department] [nvarchar](max) NULL,
	[Modified_By] [bigint] NULL,
	[Skype_ID] [nvarchar](max) NULL,
	[process_flow] [bit] NULL,
	[Assistant] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Mailing_Country] [nvarchar](max) NULL,
	[Account_Name] [bigint] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email_Opt_Out] [bit] NULL,
	[approved] [bit] NULL,
	[Reporting_To] [bigint] NULL,
	[approval] [bigint] NULL,
	[Modified_Time] [datetime] NULL,
	[Date_of_Birth] [nvarchar](max) NULL,
	[Mailing_City] [nvarchar](max) NULL,
	[Other_City] [nvarchar](max) NULL,
	[Created_Time] [datetime] NULL,
	[Title] [nvarchar](max) NULL,
	[editable] [bit] NULL,
	[Other_Street] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[Home_Phone] [nvarchar](max) NULL,
	[Last_Name] [nvarchar](max) NULL,
	[Lead_Source] [nvarchar](max) NULL,
	[Created_By] [bigint] NULL,
	[Fax] [nvarchar](max) NULL,
	[Secondary_Email] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dnn_Calculator_Lambda]    Script Date: 11-01-19 10:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dnn_Calculator_Lambda](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dnn_Calculator_Product]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dnn_Calculator_Product](
	[Product_Category] [nvarchar](max) NULL,
	[Qty_in_Demand] [int] NULL,
	[Owner] [bigint] NULL,
	[Description] [nvarchar](max) NULL,
	[currency_symbol] [nvarchar](max) NULL,
	[Vendor_Name] [bigint] NULL,
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
	[Handler] [bigint] NULL,
	[taxable] [bit] NULL,
	[editable] [bit] NULL,
	[Support_Start_Date] [nvarchar](max) NULL,
	[Usage_Unit] [nvarchar](max) NULL,
	[Qty_Ordered] [int] NULL,
	[Qty_in_Stock] [int] NULL,
	[Created_By] [bigint] NULL,
	[Sales_End_Date] [nvarchar](max) NULL,
	[Unit_Price] [int] NULL,
	[Taxable2] [bit] NULL,
	[Reorder_Level] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_CleanApprovals]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_CleanApprovals]
AS 

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM [dbo].[dnn_Calculator_Approval]
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_CleanContacts]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_CleanContacts]

AS
BEGIN

	SET NOCOUNT ON;

	DELETE FROM [dbo].[dnn_Calculator_Contact];
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_CleanLambdas]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_CleanLambdas]

AS
BEGIN
	
	SET NOCOUNT ON;

    DELETE FROM [dbo].[dnn_Calculator_Lambda]
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_CleanProducts]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_CleanProducts] 
	
AS
BEGIN
	
	SET NOCOUNT ON;

    DELETE FROM [dbo].[dnn_Calculator_Product]
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_CreateApproval]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_CreateApproval]
	@id bigint,
	@delegate bit,
	@approve bit,
	@reject bit,
	@resubmit bit
AS 

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET IDENTITY_INSERT [dbo].[dnn_Calculator_Approval] ON;

	DELETE FROM [dbo].[dnn_Calculator_Approval]
	WHERE id = @id;

	INSERT INTO [dbo].[dnn_Calculator_Approval]
           ([id]
		   ,[_delegate]
           ,[approve]
           ,[reject]
           ,[resubmit])
     VALUES
           (@id,
		   @delegate,
		   @approve,
		   @reject,
		   @resubmit)
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_CreateContact]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_CreateContact]
	@Owner bigint, 
	@Email nvarchar(MAX), 
	@Description nvarchar(MAX), 
	@currency_symbol nvarchar(MAX), 
	@Vendor_Name bigint, 
	@Mailing_Zip nvarchar(MAX), 
	@Other_Phone nvarchar(MAX), 
	@Mailing_State nvarchar(MAX), 
	@Twitter nvarchar(MAX), 
	@Other_Zip nvarchar(MAX), 
	@Mailing_Street nvarchar(MAX), 
	@Other_State nvarchar(MAX), 
	@Salutation nvarchar(MAX), 
	@Other_Country nvarchar(MAX), 
	@Last_Activity_Time DateTime, 
	@First_Name nvarchar(MAX), 
	@Full_Name nvarchar(MAX), 
	@Asst_Phone nvarchar(MAX), 
	@Record_Image nvarchar(MAX), 
	@Department nvarchar(MAX), 
	@Modified_By bigint, 
	@Skype_ID nvarchar(MAX), 
	@process_flow bit, 
	@Assistant nvarchar(MAX), 
	@Phone nvarchar(MAX), 
	@Mailing_Country nvarchar(MAX), 
	@Account_Name bigint, 
	@id bigint, 
	@Email_Opt_Out bit, 
	@approved bit, 
	@Reporting_To bigint, 
	@approval bigint, 
	@Modified_Time DateTime, 
	@Date_of_Birth nvarchar(MAX), 
	@Mailing_City nvarchar(MAX), 
	@Other_City nvarchar(MAX), 
	@Created_Time DateTime, 
	@Title nvarchar(MAX), 
	@editable bit, 
	@Other_Street nvarchar(MAX), 
	@Mobile nvarchar(MAX), 
	@Home_Phone nvarchar(MAX), 
	@Last_Name nvarchar(MAX), 
	@Lead_Source nvarchar(MAX),
	@Created_By bigint, 
	@Fax nvarchar(MAX), 
	@Secondary_Email nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;
	SET IDENTITY_INSERT [dbo].[dnn_Calculator_Contact] ON;

	
	DELETE FROM [dbo].[dnn_Calculator_Contact]
	WHERE id = @id;

    INSERT INTO [dbo].[dnn_Calculator_Contact]
           ([Owner]
           ,[Email]
           ,[Description]
           ,[currency_symbol]
           ,[Vendor_Name]
           ,[Mailing_Zip]
           ,[Other_Phone]
           ,[Mailing_State]
           ,[Twitter]
           ,[Other_Zip]
           ,[Mailing_Street]
           ,[Other_State]
           ,[Salutation]
           ,[Other_Country]
           ,[Last_Activity_Time]
           ,[First_Name]
           ,[Full_Name]
           ,[Asst_Phone]
           ,[Record_Image]
           ,[Department]
           ,[Modified_By]
           ,[Skype_ID]
           ,[process_flow]
           ,[Assistant]
           ,[Phone]
           ,[Mailing_Country]
           ,[Account_Name]
		   ,[id]
           ,[Email_Opt_Out]
           ,[approved]
           ,[Reporting_To]
           ,[approval]
           ,[Modified_Time]
           ,[Date_of_Birth]
           ,[Mailing_City]
           ,[Other_City]
           ,[Created_Time]
           ,[Title]
           ,[editable]
           ,[Other_Street]
           ,[Mobile]
           ,[Home_Phone]
           ,[Last_Name]
           ,[Lead_Source]
           ,[Created_By]
           ,[Fax]
           ,[Secondary_Email])
     VALUES
           (@Owner, 
			@Email, 
			@Description, 
			@currency_symbol, 
			@Vendor_Name, 
			@Mailing_Zip, 
			@Other_Phone, 
			@Mailing_State, 
			@Twitter, 
			@Other_Zip, 
			@Mailing_Street, 
			@Other_State, 
			@Salutation, 
			@Other_Country, 
			@Last_Activity_Time, 
			@First_Name, 
			@Full_Name, 
			@Asst_Phone, 
			@Record_Image, 
			@Department, 
			@Modified_By, 
			@Skype_ID, 
			@process_flow, 
			@Assistant, 
			@Phone, 
			@Mailing_Country, 
			@Account_Name, 
			@id, 
			@Email_Opt_Out, 
			@approved, 
			@Reporting_To, 
			@approval, 
			@Modified_Time, 
			@Date_of_Birth, 
			@Mailing_City, 
			@Other_City, 
			@Created_Time, 
			@Title, 
			@editable, 
			@Other_Street, 
			@Mobile, 
			@Home_Phone, 
			@Last_Name, 
			@Lead_Source,  
			@Created_By, 
			@Fax, 
			@Secondary_Email)
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_CreateContactWeb]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_CreateContactWeb]
	@Owner bigint, 
	@Email nvarchar(MAX), 
	@Description nvarchar(MAX), 
	@currency_symbol nvarchar(MAX), 
	@Vendor_Name bigint, 
	@Mailing_Zip nvarchar(MAX), 
	@Other_Phone nvarchar(MAX), 
	@Mailing_State nvarchar(MAX), 
	@Twitter nvarchar(MAX), 
	@Other_Zip nvarchar(MAX), 
	@Mailing_Street nvarchar(MAX), 
	@Other_State nvarchar(MAX), 
	@Salutation nvarchar(MAX), 
	@Other_Country nvarchar(MAX), 
	@Last_Activity_Time DateTime, 
	@First_Name nvarchar(MAX), 
	@Full_Name nvarchar(MAX), 
	@Asst_Phone nvarchar(MAX), 
	@Record_Image nvarchar(MAX), 
	@Department nvarchar(MAX), 
	@Modified_By bigint, 
	@Skype_ID nvarchar(MAX), 
	@process_flow bit, 
	@Assistant nvarchar(MAX), 
	@Phone nvarchar(MAX), 
	@Mailing_Country nvarchar(MAX), 
	@Account_Name bigint, 
	@Email_Opt_Out bit, 
	@approved bit, 
	@Reporting_To bigint, 
	@approval bigint, 
	@Modified_Time DateTime, 
	@Date_of_Birth nvarchar(MAX), 
	@Mailing_City nvarchar(MAX), 
	@Other_City nvarchar(MAX), 
	@Created_Time DateTime, 
	@Title nvarchar(MAX), 
	@editable bit, 
	@Other_Street nvarchar(MAX), 
	@Mobile nvarchar(MAX), 
	@Home_Phone nvarchar(MAX), 
	@Last_Name nvarchar(MAX), 
	@Lead_Source nvarchar(MAX),
	@Created_By bigint, 
	@Fax nvarchar(MAX), 
	@Secondary_Email nvarchar(MAX)
AS
BEGIN

	SET NOCOUNT ON;

    INSERT INTO [dbo].[dnn_Calculator_Contact]
           ([Owner]
           ,[Email]
           ,[Description]
           ,[currency_symbol]
           ,[Vendor_Name]
           ,[Mailing_Zip]
           ,[Other_Phone]
           ,[Mailing_State]
           ,[Twitter]
           ,[Other_Zip]
           ,[Mailing_Street]
           ,[Other_State]
           ,[Salutation]
           ,[Other_Country]
           ,[Last_Activity_Time]
           ,[First_Name]
           ,[Full_Name]
           ,[Asst_Phone]
           ,[Record_Image]
           ,[Department]
           ,[Modified_By]
           ,[Skype_ID]
           ,[process_flow]
           ,[Assistant]
           ,[Phone]
           ,[Mailing_Country]
           ,[Account_Name]
           ,[Email_Opt_Out]
           ,[approved]
           ,[Reporting_To]
           ,[approval]
           ,[Modified_Time]
           ,[Date_of_Birth]
           ,[Mailing_City]
           ,[Other_City]
           ,[Created_Time]
           ,[Title]
           ,[editable]
           ,[Other_Street]
           ,[Mobile]
           ,[Home_Phone]
           ,[Last_Name]
           ,[Lead_Source]
           ,[Created_By]
           ,[Fax]
           ,[Secondary_Email])
     VALUES
           (@Owner, 
			@Email, 
			@Description, 
			@currency_symbol, 
			@Vendor_Name, 
			@Mailing_Zip, 
			@Other_Phone, 
			@Mailing_State, 
			@Twitter, 
			@Other_Zip, 
			@Mailing_Street, 
			@Other_State, 
			@Salutation, 
			@Other_Country, 
			@Last_Activity_Time, 
			@First_Name, 
			@Full_Name, 
			@Asst_Phone, 
			@Record_Image, 
			@Department, 
			@Modified_By, 
			@Skype_ID, 
			@process_flow, 
			@Assistant, 
			@Phone, 
			@Mailing_Country, 
			@Account_Name, 
			@Email_Opt_Out, 
			@approved, 
			@Reporting_To, 
			@approval, 
			@Modified_Time, 
			@Date_of_Birth, 
			@Mailing_City, 
			@Other_City, 
			@Created_Time, 
			@Title, 
			@editable, 
			@Other_Street, 
			@Mobile, 
			@Home_Phone, 
			@Last_Name, 
			@Lead_Source,  
			@Created_By, 
			@Fax, 
			@Secondary_Email)

			SELECT @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_CreateLambda]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_CreateLambda]
	@id bigint,
	@name nvarchar(max)
AS
BEGIN
	
	SET NOCOUNT ON;
	SET IDENTITY_INSERT [dbo].[dnn_Calculator_Lambda] ON;

	DELETE FROM [dbo].[dnn_Calculator_Lambda]
	WHERE id = @id;

    INSERT INTO [dbo].[dnn_Calculator_Lambda](
		[id],
		[name])
	VALUES(@id,
			@name);

END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_CreateProduct]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_CreateProduct] 
	@Product_Category nvarchar(MAX), 
	@Qty_in_Demand int, 
	@Owner bigint, 
	@Description nvarchar(MAX), 
	@currency_symbol nvarchar(MAX), 
	@Vendor_Name bigint, 
	@Sales_Start_Date nvarchar(MAX), 
	@Product_Active bit, 
	@Record_Image nvarchar(MAX), 
	@Modified_By bigint, 
	@Product_Code nvarchar(MAX), 
	@process_flow bit, 
	@Manufacturer nvarchar(MAX), 
	@id nvarchar(MAX), 
	@Support_Expiry_Date nvarchar(MAX), 
	@approved bit, 
	@approval bigint, 
	@Modified_Time DateTime, 
	@Created_Time DateTime, 
	@Commission_Rate int, 
	@Product_Name nvarchar(MAX), 
	@Handler bigint, 
	@taxable bit, 
	@editable bit, 
	@Support_Start_Date nvarchar(MAX), 
	@Usage_Unit nvarchar(MAX), 
	@Qty_Ordered int, 
	@Qty_in_Stock int, 
	@Created_By bigint, 
	@Sales_End_Date nvarchar(MAX), 
	@Unit_Price int, 
	@Taxable2 bit, 
	@Reorder_Level int

AS
BEGIN
	
	SET NOCOUNT ON;
	SET IDENTITY_INSERT [dbo].[dnn_Calculator_Product] ON;

	DELETE FROM [dbo].[dnn_Calculator_Product]
	WHERE id = @id;

	INSERT INTO [dbo].[dnn_Calculator_Product]
           ([Product_Category]
           ,[Qty_in_Demand]
           ,[Owner]
           ,[Description]
           ,[currency_symbol]
           ,[Vendor_Name]
           ,[Sales_Start_Date]
           ,[Product_Active]
           ,[Record_Image]
           ,[Modified_By]
           ,[Product_Code]
           ,[process_flow]
           ,[Manufacturer]
		   ,[id]
           ,[Support_Expiry_Date]
           ,[approved]
           ,[approval]
           ,[Modified_Time]
           ,[Created_Time]
           ,[Commission_Rate]
           ,[Product_Name]
           ,[Handler]
           ,[taxable]
           ,[editable]
           ,[Support_Start_Date]
           ,[Usage_Unit]
           ,[Qty_Ordered]
           ,[Qty_in_Stock]
           ,[Created_By]
           ,[Sales_End_Date]
           ,[Unit_Price]
           ,[Taxable2]
           ,[Reorder_Level])
     VALUES
           (@Product_Category, 
		@Qty_in_Demand, 
		@Owner, 
		@Description, 
		@currency_symbol, 
		@Vendor_Name, 
		@Sales_Start_Date, 
		@Product_Active, 
		@Record_Image, 
		@Modified_By, 
		@Product_Code, 
		@process_flow, 
		@Manufacturer, 
		@id, 
		@Support_Expiry_Date, 
		@approved, 
		@approval, 
		@Modified_Time, 
		@Created_Time, 
		@Commission_Rate, 
		@Product_Name, 
		@Handler, 
		@taxable, 
		@editable, 
		@Support_Start_Date, 
		@Usage_Unit, 
		@Qty_Ordered, 
		@Qty_in_Stock, 
		@Created_By, 
		@Sales_End_Date, 
		@Unit_Price, 
		@Taxable2,
		@Reorder_Level)

    
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_CreateProductWeb]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_CreateProductWeb]
	@Product_Category nvarchar(MAX), 
	@Qty_in_Demand int, 
	@Owner bigint, 
	@Description nvarchar(MAX), 
	@currency_symbol nvarchar(MAX), 
	@Vendor_Name bigint, 
	@Sales_Start_Date nvarchar(MAX), 
	@Product_Active bit, 
	@Record_Image nvarchar(MAX), 
	@Modified_By bigint, 
	@Product_Code nvarchar(MAX), 
	@process_flow bit, 
	@Manufacturer nvarchar(MAX), 
	@Support_Expiry_Date nvarchar(MAX), 
	@approved bit, 
	@approval bigint, 
	@Modified_Time DateTime, 
	@Created_Time DateTime, 
	@Commission_Rate int, 
	@Product_Name nvarchar(MAX), 
	@Handler bigint, 
	@taxable bit, 
	@editable bit, 
	@Support_Start_Date nvarchar(MAX), 
	@Usage_Unit nvarchar(MAX), 
	@Qty_Ordered int, 
	@Qty_in_Stock int, 
	@Created_By bigint, 
	@Sales_End_Date nvarchar(MAX), 
	@Unit_Price int, 
	@Taxable2 bit, 
	@Reorder_Level int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[dnn_Calculator_Product]
           ([Product_Category]
           ,[Qty_in_Demand]
           ,[Owner]
           ,[Description]
           ,[currency_symbol]
           ,[Vendor_Name]
           ,[Sales_Start_Date]
           ,[Product_Active]
           ,[Record_Image]
           ,[Modified_By]
           ,[Product_Code]
           ,[process_flow]
           ,[Manufacturer]
           ,[Support_Expiry_Date]
           ,[approved]
           ,[approval]
           ,[Modified_Time]
           ,[Created_Time]
           ,[Commission_Rate]
           ,[Product_Name]
           ,[Handler]
           ,[taxable]
           ,[editable]
           ,[Support_Start_Date]
           ,[Usage_Unit]
           ,[Qty_Ordered]
           ,[Qty_in_Stock]
           ,[Created_By]
           ,[Sales_End_Date]
           ,[Unit_Price]
           ,[Taxable2]
           ,[Reorder_Level])
     VALUES
           (@Product_Category, 
			@Qty_in_Demand, 
			@Owner, 
			@Description, 
			@currency_symbol, 
			@Vendor_Name, 
			@Sales_Start_Date, 
			@Product_Active, 
			@Record_Image, 
			@Modified_By, 
			@Product_Code, 
			@process_flow, 
			@Manufacturer, 
			@Support_Expiry_Date, 
			@approved, 
			@approval, 
			@Modified_Time, 
			@Created_Time, 
			@Commission_Rate, 
			@Product_Name, 
			@Handler, 
			@taxable, 
			@editable, 
			@Support_Start_Date, 
			@Usage_Unit, 
			@Qty_Ordered, 
			@Qty_in_Stock, 
			@Created_By, 
			@Sales_End_Date, 
			@Unit_Price, 
			@Taxable2, 
			@Reorder_Level)

	SELECT @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_DeleteContact]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_DeleteContact] 
	@id bigint
AS
BEGIN

	SET NOCOUNT ON;

    	DELETE FROM [dbo].[dnn_Calculator_Contact]
		WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_DeleteProduct]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_DeleteProduct]
	@id bigint
AS
BEGIN

	SET NOCOUNT ON;

	DELETE
	  FROM [dbo].[dnn_Calculator_Product]
	  WHERE id = @id

END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_GetApproval]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_GetApproval]
	@id bigint
AS
BEGIN

	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[dnn_Calculator_Approval]
	WHERE id = @id

END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_GetContact]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_GetContact]
	@id bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[dnn_Calculator_Contact]
	WHERE [id] = @id

END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_GetContacts]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_GetContacts]
	
AS
BEGIN

	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[dnn_Calculator_Contact]
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_GetLambda]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_GetLambda]
	@id bigint
AS
BEGIN

	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[dnn_Calculator_Lambda]
	WHERE id = @id

END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_GetProduct]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_GetProduct]
	@id bigint
AS

BEGIN

	SET NOCOUNT ON;

	SELECT *
	  FROM [dbo].[dnn_Calculator_Product]
	  WHERE id = @id

END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_GetProducts]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dnn_Calculator_GetProducts]
	
AS
BEGIN

	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[dnn_Calculator_Product]
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_UpdateContactWeb]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_UpdateContactWeb]
	@id bigint,
	@Owner bigint, 
	@Email nvarchar(MAX), 
	@Description nvarchar(MAX), 
	@currency_symbol nvarchar(MAX), 
	@Vendor_Name bigint, 
	@Mailing_Zip nvarchar(MAX), 
	@Other_Phone nvarchar(MAX), 
	@Mailing_State nvarchar(MAX), 
	@Twitter nvarchar(MAX), 
	@Other_Zip nvarchar(MAX), 
	@Mailing_Street nvarchar(MAX), 
	@Other_State nvarchar(MAX), 
	@Salutation nvarchar(MAX), 
	@Other_Country nvarchar(MAX), 
	@Last_Activity_Time DateTime, 
	@First_Name nvarchar(MAX), 
	@Full_Name nvarchar(MAX), 
	@Asst_Phone nvarchar(MAX), 
	@Record_Image nvarchar(MAX), 
	@Department nvarchar(MAX), 
	@Modified_By bigint, 
	@Skype_ID nvarchar(MAX), 
	@process_flow bit, 
	@Assistant nvarchar(MAX), 
	@Phone nvarchar(MAX), 
	@Mailing_Country nvarchar(MAX), 
	@Account_Name bigint, 
	@Email_Opt_Out bit, 
	@approved bit, 
	@Reporting_To bigint, 
	@approval bigint, 
	@Modified_Time DateTime, 
	@Date_of_Birth nvarchar(MAX), 
	@Mailing_City nvarchar(MAX), 
	@Other_City nvarchar(MAX), 
	@Created_Time DateTime, 
	@Title nvarchar(MAX), 
	@editable bit, 
	@Other_Street nvarchar(MAX), 
	@Mobile nvarchar(MAX), 
	@Home_Phone nvarchar(MAX), 
	@Last_Name nvarchar(MAX), 
	@Lead_Source nvarchar(MAX),
	@Created_By bigint, 
	@Fax nvarchar(MAX), 
	@Secondary_Email nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;

UPDATE [dbo].[dnn_Calculator_Contact]
   SET [Owner] = @Owner, 
	[Email] = @Email, 
	[Description] = @Description, 
	[currency_symbol] = @currency_symbol, 
	[Vendor_Name] = @Vendor_Name, 
	[Mailing_Zip] = @Mailing_Zip, 
	[Other_Phone] = @Other_Phone, 
	[Mailing_State] = @Mailing_State, 
	[Twitter] = @Twitter, 
	[Other_Zip] = @Other_Zip, 
	[Mailing_Street] = @Mailing_Street, 
	[Other_State] = @Other_State, 
	[Salutation] = @Salutation, 
	[Other_Country] = @Other_Country, 
	[Last_Activity_Time] = @Last_Activity_Time, 
	[First_Name] = @First_Name, 
	[Full_Name] = @Full_Name, 
	[Asst_Phone] = @Asst_Phone, 
	[Record_Image] = @Record_Image, 
	[Department] = @Department, 
	[Modified_By] = @Modified_By, 
	[Skype_ID] = @Skype_ID, 
	[process_flow] = @process_flow, 
	[Assistant] = @Assistant, 
	[Phone] = @Phone, 
	[Mailing_Country] = @Mailing_Country, 
	[Account_Name] = @Account_Name, 
	[Email_Opt_Out] = @Email_Opt_Out, 
	[approved] = @approved, 
	[Reporting_To] = @Reporting_To, 
	[approval] = @approval, 
	[Modified_Time] = @Modified_Time, 
	[Date_of_Birth] = @Date_of_Birth, 
	[Mailing_City] = @Mailing_City, 
	[Other_City] = @Other_City, 
	[Created_Time] = @Created_Time, 
	[Title] = @Title, 
	[editable] = @editable, 
	[Other_Street] = @Other_Street, 
	[Mobile] = @Mobile, 
	[Home_Phone] = @Home_Phone, 
	[Last_Name] = @Last_Name, 
	[Lead_Source] = @Lead_Source, 
	[Created_By] = @Created_By, 
	[Fax] = @Fax, 
	[Secondary_Email] = @Secondary_Email
 WHERE [id] = @id

END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_UpdateProduct]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_UpdateProduct]
	@Product_Category nvarchar(MAX), 
	@Qty_in_Demand int, 
	@Owner bigint, 
	@Description nvarchar(MAX), 
	@currency_symbol nvarchar(MAX), 
	@Vendor_Name bigint, 
	@Sales_Start_Date nvarchar(MAX), 
	@Product_Active bit, 
	@Record_Image nvarchar(MAX), 
	@Modified_By bigint, 
	@Product_Code nvarchar(MAX), 
	@process_flow bit, 
	@Manufacturer nvarchar(MAX), 
	@id bigint, 
	@Support_Expiry_Date nvarchar(MAX), 
	@approved bit, 
	@approval bigint, 
	@Modified_Time DateTime, 
	@Created_Time DateTime, 
	@Commission_Rate int, 
	@Product_Name nvarchar(MAX), 
	@Handler bigint, 
	@taxable bit, 
	@editable bit, 
	@Support_Start_Date nvarchar(MAX), 
	@Usage_Unit nvarchar(MAX), 
	@Qty_Ordered int, 
	@Qty_in_Stock int, 
	@Created_By bigint, 
	@Sales_End_Date nvarchar(MAX), 
	@Unit_Price int, 
	@Taxable2 bit, 
	@Reorder_Level int

AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[dnn_Calculator_Product]
		   SET [Product_Category] = @Product_Category, 
				[Qty_in_Demand] = @Qty_in_Demand, 
				[Owner] = @Owner, 
				[Description] = @Description, 
				[currency_symbol] = @currency_symbol, 
				[Vendor_Name] = @Vendor_Name, 
				[Sales_Start_Date] = @Sales_Start_Date, 
				[Product_Active] = @Product_Active, 
				[Record_Image] = @Record_Image, 
				[Modified_By] = @Modified_By, 
				[Product_Code] = @Product_Code, 
				[process_flow] = @process_flow, 
				[Manufacturer] = @Manufacturer, 
				[Support_Expiry_Date] = @Support_Expiry_Date, 
				[approved] = @approved, 
				[approval] = @approval, 
				[Modified_Time] = @Modified_Time, 
				[Created_Time] = @Created_Time, 
				[Commission_Rate] = @Commission_Rate, 
				[Product_Name] = @Product_Name, 
				[Handler] = @Handler, 
				[taxable] = @taxable, 
				[editable] = @editable, 
				[Support_Start_Date] = @Support_Start_Date, 
				[Usage_Unit] = @Usage_Unit, 
				[Qty_Ordered] = @Qty_Ordered, 
				[Qty_in_Stock] = @Qty_in_Stock, 
				[Created_By] = @Created_By, 
				[Sales_End_Date] = @Sales_End_Date, 
				[Unit_Price] = @Unit_Price, 
				[Taxable2] = @Taxable2, 
				[Reorder_Level] = @Reorder_Level 
		 WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_CreateDevis]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_CreateDevis]
	@NomSociete nvarchar(200),
	@AdresseSociete nvarchar(max),
	@AdresseFacturation nvarchar(max),
	@AdresseInstallation nvarchar(max),
	@TelSociete nvarchar(50),
	@NumeroEntreprise nvarchar(50),
	@NomClient nvarchar(50),
	@PrenomClient nvarchar(50),
	@TelDirect nvarchar(50),
	@Email nvarchar(50),
	@NomIT nvarchar(50),
	@PrenomIT nvarchar(50),
	@TelIT nvarchar(50),
	@EmailIT nvarchar(50),
	@TotalHTVA decimal(10,2),
	@DateSignature date,
	@Autoliquidation bit,
	@DevisSigne bit,
	@Remarques nvarchar(max),
	@DateCreation date
AS
	INSERT INTO dbo.dnn_Calculator_Devis (
		NomSociete,
		AdresseSociete,
		AdresseFacturation,
		AdresseInstallation,
		TelSociete,
		NumeroEntreprise,
		NomClient,
		PrenomClient,
		TelDirect,
		Email,
		NomIT,
		PrenomIT,
		TelIT,
		EmailIT,
		TotalHTVA,
		DateSignature,
		Autoliquidation,
		DevisSigne,
		Remarques,
		DateCreation
	)
	VALUES (
		@NomSociete,
		@AdresseSociete,
		@AdresseFacturation,
		@AdresseInstallation,
		@TelSociete,
		@NumeroEntreprise,
		@NomClient,
		@PrenomClient,
		@TelDirect,
		@Email,
		@NomIT,
		@PrenomIT,
		@TelIT,
		@EmailIT,
		@TotalHTVA,
		@DateSignature,
		@Autoliquidation,
		@DevisSigne,
		@Remarques,
		@DateCreation
	)

	SELECT @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_DeleteDevis]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_DeleteDevis]
	@DevisId int
AS
	DELETE FROM dbo.dnn_Calculator_Devis
	WHERE Id = @DevisId
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_GetAllDevis]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_GetAllDevis]
AS
	SELECT * FROM dbo.dnn_Calculator_Devis
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_GetDevis]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dnn_Calculator_GetDevis]
	@DevisId int
AS
	SELECT * FROM dbo.dnn_Calculator_Devis
	WHERE Id = @DevisId
GO
/****** Object:  StoredProcedure [dbo].[dnn_Calculator_UpdateDevis]    Script Date: 11-01-19 10:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dnn_Calculator_UpdateDevis]
	@DevisId int,
	@NomSociete nvarchar(200),
	@AdresseSociete nvarchar(max),
	@AdresseFacturation nvarchar(max),
	@AdresseInstallation nvarchar(max),
	@TelSociete nvarchar(50),
	@NumeroEntreprise nvarchar(50),
	@NomClient nvarchar(50),
	@PrenomClient nvarchar(50),
	@TelDirect nvarchar(50),
	@Email nvarchar(50),
	@NomIT nvarchar(50),
	@PrenomIT nvarchar(50),
	@TelIT nvarchar(50),
	@EmailIT nvarchar(50),
	@TotalHTVA decimal(10,2),
	@DateSignature date,
	@Autoliquidation bit,
	@DevisSigne bit,
	@Remarques nvarchar(max)
AS
	UPDATE dbo.dnn_Calculator_Devis 
		SET
			NomSociete = @NomSociete,
			AdresseSociete = @AdresseSociete,
			AdresseFacturation = @AdresseFacturation,
			AdresseInstallation = @AdresseInstallation,
			TelSociete = @TelSociete,
			NumeroEntreprise = @NumeroEntreprise,
			NomClient = @NomClient,
			PrenomClient = @PrenomClient,
			TelDirect = @TelDirect,
			Email = @Email,
			NomIT = @NomIT,
			PrenomIT = @PrenomIT,
			TelIT = @TelIT,
			EmailIT = @EmailIT,
			TotalHTVA = @TotalHTVA,
			DateSignature = @DateSignature,
			Autoliquidation = @Autoliquidation,
			DevisSigne = @DevisSigne,
			Remarques = @Remarques
		WHERE Id = @DevisId
GO
