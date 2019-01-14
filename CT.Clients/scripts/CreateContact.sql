
CREATE PROCEDURE dnn_CT_CreateContact
	@Owner bigint, 
	@Email nvarchar(MAX), 
	@Description nvarchar(MAX), 
	@currency_symbol nvarchar(MAX), 
	@Vendor_Name nvarchar(MAX), 
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
	@Account_Name nvarchar(MAX), 
	@id nvarchar(MAX), 
	@Email_Opt_Out bit, 
	@approved bit, 
	@Reporting_To nvarchar(MAX), 
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

	SET IDENTITY_INSERT [dbo].[dnn_CT_Contacts] ON;

    INSERT INTO [dbo].[dnn_CT_Contacts]
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
