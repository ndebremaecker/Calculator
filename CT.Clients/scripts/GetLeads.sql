	IF  EXISTS (SELECT * FROM sys.objects 
				WHERE object_id = OBJECT_ID(N'dbo.dnn_CT_GetLeads') 
				AND type in (N'P', N'PC'))
		DROP PROCEDURE dbo.dnn_CT_GetLeads
	GO

	CREATE PROCEDURE dbo.dnn_CT_GetLeads
	AS
		SELECT * FROM dbo.dnn_CT_Lead
	GO