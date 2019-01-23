using Calculator.Clients.Controller;
using DotNetNuke.Collections;
using DotNetNuke.Common;
using DotNetNuke.UI.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Calculator.Clients
{
    public partial class ViewClient : ModuleUserControlBase
    {
        private long _id;
        private readonly ClientController _controller = new ClientController();
        static string debugText = "";

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            //Get the TaskId from the QueryString
            _id = Request.QueryString.GetValueOrDefault<long>("id", -1);

            if (_id > -1 && !IsPostBack)
            {
                var contact = _controller.GetContact(_id);
                OwnerTextBox.Text = contact.Owner.ToString();
                EmailTextBox.Text = contact.Email;
                DescriptionTextBox.Text = contact.Description;
                currency_symbolTextBox.Text = contact.currency_symbol;
                Vendor_NameTextBox.Text = contact.Vendor_Name.ToString();
                Mailing_ZipTextBox.Text = contact.Mailing_Zip;
                Other_PhoneTextBox.Text = contact.Other_Phone;
                Mailing_StateTextBox.Text = contact.Mailing_State;
                TwitterTextBox.Text = contact.Twitter;
                Other_ZipTextBox.Text = contact.Other_Zip;
                Mailing_StreetTextBox.Text = contact.Mailing_Street;
                Other_StateTextBox.Text = contact.Other_State;
                SalutationTextBox.Text = contact.Salutation;
                Other_CountryTextBox.Text = contact.Other_Country;
                Last_Activity_TimeTextBox.Text = contact.Last_Activity_Time.ToString();
                First_NameTextBox.Text = contact.First_Name;
                Full_NameTextBox.Text = contact.Full_Name;
                Asst_PhoneTextBox.Text = contact.Asst_Phone;
                Record_ImageTextBox.Text = contact.Record_Image;
                DepartmentTextBox.Text = contact.Department;
                Modified_ByTextBox.Text = contact.Modified_By.ToString();
                Skype_IDTextBox.Text = contact.Skype_ID;
                process_flowTextBox.Text = contact.process_flow.ToString();
                AssistantTextBox.Text = contact.Assistant;
                PhoneTextBox.Text = contact.Phone;
                Mailing_CountryTextBox.Text = contact.Mailing_Country;
                Account_NameTextBox.Text = contact.Account_Name.ToString();
                Email_Opt_OutTextBox.Text = contact.Email_Opt_Out.ToString();
                approvedTextBox.Text = contact.approved.ToString();
                Reporting_ToTextBox.Text = contact.Reporting_To.ToString();
                approvalTextBox.Text = contact.approval.ToString();
                Modified_TimeTextBox.Text = contact.Modified_Time.ToString();
                Date_of_BirthTextBox.Text = contact.Date_of_Birth;
                Mailing_CityTextBox.Text = contact.Mailing_City;
                Other_CityTextBox.Text = contact.Other_City;
                Created_TimeTextBox.Text = contact.Created_Time.ToString();
                TitleTextBox.Text = contact.Title;
                editableTextBox.Text = contact.editable.ToString();
                Other_StreetTextBox.Text = contact.Other_Street;
                MobileTextBox.Text = contact.Mobile;
                Home_PhoneTextBox.Text = contact.Home_Phone;
                Last_NameTextBox.Text = contact.Last_Name;
                Lead_SourceTextBox.Text = contact.Lead_Source;
                Created_ByTextBox.Text = contact.Created_By.ToString();
                FaxTextBox.Text = contact.Fax;
                Secondary_EmailTextBox.Text = contact.Secondary_Email;
            }

            editButton.NavigateUrl = ModuleContext.EditUrl("id", _id.ToString(), "Edit");

            if (!String.IsNullOrEmpty(debugText)) debug.InnerText = debugText;
        }

        protected void Delete(object sender, EventArgs e)
        {
            _controller.DeleteContact(_id);
            Response.Redirect(Globals.NavigateURL());
        }
    }

}