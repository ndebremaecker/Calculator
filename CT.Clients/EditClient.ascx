<%@ Control AutoEventWireup="true"
    CodeBehind="EditClient.ascx.cs"
    Inherits="Calculator.Clients.EditClient"
    Language="C#" %>

<%-- ReSharper disable UnknownCssClass --%>
<span id="debug" runat="server"></span>

<div id="dnnUsers" class="dnnForm dnnClear">
    <fieldset>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="OwnerLabel" runat="server" Text="Owner: "> </asp:Label>
            </div>
            <asp:TextBox ID="OwnerTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="EmailLabel" runat="server" Text="Email: "> </asp:Label>
            </div>
            <asp:TextBox ID="EmailTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="DescriptionLabel" runat="server" Text="Description: "> </asp:Label>
            </div>
            <asp:TextBox ID="DescriptionTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="currency_symbolLabel" runat="server" Text="currency_symbol: "> </asp:Label>
            </div>
            <asp:TextBox ID="currency_symbolTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Vendor_NameLabel" runat="server" Text="Vendor_Name: "> </asp:Label>
            </div>
            <asp:TextBox ID="Vendor_NameTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Mailing_ZipLabel" runat="server" Text="Mailing_Zip: "> </asp:Label>
            </div>
            <asp:TextBox ID="Mailing_ZipTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Other_PhoneLabel" runat="server" Text="Other_Phone: "> </asp:Label>
            </div>
            <asp:TextBox ID="Other_PhoneTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Mailing_StateLabel" runat="server" Text="Mailing_State: "> </asp:Label>
            </div>
            <asp:TextBox ID="Mailing_StateTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="TwitterLabel" runat="server" Text="Twitter: "> </asp:Label>
            </div>
            <asp:TextBox ID="TwitterTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Other_ZipLabel" runat="server" Text="Other_Zip: "> </asp:Label>
            </div>
            <asp:TextBox ID="Other_ZipTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Mailing_StreetLabel" runat="server" Text="Mailing_Street: "> </asp:Label>
            </div>
            <asp:TextBox ID="Mailing_StreetTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Other_StateLabel" runat="server" Text="Other_State: "> </asp:Label>
            </div>
            <asp:TextBox ID="Other_StateTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="SalutationLabel" runat="server" Text="Salutation: "> </asp:Label>
            </div>
            <asp:TextBox ID="SalutationTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Other_CountryLabel" runat="server" Text="Other_Country: "> </asp:Label>
            </div>
            <asp:TextBox ID="Other_CountryTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Last_Activity_TimeLabel" runat="server" Text="Last_Activity_Time: "> </asp:Label>
            </div>
            <asp:TextBox ID="Last_Activity_TimeTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="First_NameLabel" runat="server" Text="First_Name: "> </asp:Label>
            </div>
            <asp:TextBox ID="First_NameTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Full_NameLabel" runat="server" Text="Full_Name: "> </asp:Label>
            </div>
            <asp:TextBox ID="Full_NameTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Asst_PhoneLabel" runat="server" Text="Asst_Phone: "> </asp:Label>
            </div>
            <asp:TextBox ID="Asst_PhoneTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Record_ImageLabel" runat="server" Text="Record_Image: "> </asp:Label>
            </div>
            <asp:TextBox ID="Record_ImageTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="DepartmentLabel" runat="server" Text="Department: "> </asp:Label>
            </div>
            <asp:TextBox ID="DepartmentTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Modified_ByLabel" runat="server" Text="Modified_By: "> </asp:Label>
            </div>
            <asp:TextBox ID="Modified_ByTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Skype_IDLabel" runat="server" Text="Skype_ID: "> </asp:Label>
            </div>
            <asp:TextBox ID="Skype_IDTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="process_flowLabel" runat="server" Text="process_flow: "> </asp:Label>
            </div>
            <asp:TextBox ID="process_flowTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="AssistantLabel" runat="server" Text="Assistant: "> </asp:Label>
            </div>
            <asp:TextBox ID="AssistantTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="PhoneLabel" runat="server" Text="Phone: "> </asp:Label>
            </div>
            <asp:TextBox ID="PhoneTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Mailing_CountryLabel" runat="server" Text="Mailing_Country: "> </asp:Label>
            </div>
            <asp:TextBox ID="Mailing_CountryTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Account_NameLabel" runat="server" Text="Account_Name: "> </asp:Label>
            </div>
            <asp:TextBox ID="Account_NameTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Email_Opt_OutLabel" runat="server" Text="Email_Opt_Out: "> </asp:Label>
            </div>
            <asp:TextBox ID="Email_Opt_OutTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="approvedLabel" runat="server" Text="approved: "> </asp:Label>
            </div>
            <asp:TextBox ID="approvedTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Reporting_ToLabel" runat="server" Text="Reporting_To: "> </asp:Label>
            </div>
            <asp:TextBox ID="Reporting_ToTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="approvalLabel" runat="server" Text="approval: "> </asp:Label>
            </div>
            <asp:TextBox ID="approvalTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Modified_TimeLabel" runat="server" Text="Modified_Time: "> </asp:Label>
            </div>
            <asp:TextBox ID="Modified_TimeTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Date_of_BirthLabel" runat="server" Text="Date_of_Birth: "> </asp:Label>
            </div>
            <asp:TextBox ID="Date_of_BirthTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Mailing_CityLabel" runat="server" Text="Mailing_City: "> </asp:Label>
            </div>
            <asp:TextBox ID="Mailing_CityTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Other_CityLabel" runat="server" Text="Other_City: "> </asp:Label>
            </div>
            <asp:TextBox ID="Other_CityTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Created_TimeLabel" runat="server" Text="Created_Time: "> </asp:Label>
            </div>
            <asp:TextBox ID="Created_TimeTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="TitleLabel" runat="server" Text="Title: "> </asp:Label>
            </div>
            <asp:TextBox ID="TitleTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="editableLabel" runat="server" Text="editable: "> </asp:Label>
            </div>
            <asp:TextBox ID="editableTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Other_StreetLabel" runat="server" Text="Other_Street: "> </asp:Label>
            </div>
            <asp:TextBox ID="Other_StreetTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="MobileLabel" runat="server" Text="Mobile: "> </asp:Label>
            </div>
            <asp:TextBox ID="MobileTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Home_PhoneLabel" runat="server" Text="Home_Phone: "> </asp:Label>
            </div>
            <asp:TextBox ID="Home_PhoneTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Last_NameLabel" runat="server" Text="Last_Name: "> </asp:Label>
            </div>
            <asp:TextBox ID="Last_NameTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Lead_SourceLabel" runat="server" Text="Lead_Source: "> </asp:Label>
            </div>
            <asp:TextBox ID="Lead_SourceTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Created_ByLabel" runat="server" Text="Created_By: "> </asp:Label>
            </div>
            <asp:TextBox ID="Created_ByTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="FaxLabel" runat="server" Text="Fax: "> </asp:Label>
            </div>
            <asp:TextBox ID="FaxTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Secondary_EmailLabel" runat="server" Text="Secondary_Email: "> </asp:Label>
            </div>
            <asp:TextBox ID="Secondary_EmailTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>

    </fieldset>
</div>

<ul class="dnnActions dnnClear">
    <li>
        <asp:LinkButton ID="saveButton" runat="server"
            CssClass="dnnPrimaryAction"
            OnClick="SaveClient"
            Text="Save Client">
        </asp:LinkButton>
    </li>
    <li>
        <asp:LinkButton ID="cancelButton" runat="server"
            CssClass="dnnSecondaryAction"
            OnClick="Cancel"
            Text="Cancel">
        </asp:LinkButton>
    </li>
</ul>
<%-- ReSharper restore UnknownCssClass --%>