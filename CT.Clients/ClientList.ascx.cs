using DotNetNuke.UI.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Calculator.Clients.Controller;

namespace Calculator.Clients
{
    public partial class ClientList : ModuleUserControlBase
    {
        ClientController controller = new ClientController();

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (!IsPostBack)
            {
                var contacts = controller.GetContacts();
                clients.DataSource = contacts;
                clients.DataBind();
                //testDataGrid.DataSource = contacts;
                //testDataGrid.DataBind();
            }

            addButton.NavigateUrl = ModuleContext.EditUrl("Edit");
        }

        protected void DeleteClient(object source, DataGridCommandEventArgs e)
        {
            var id = Convert.ToInt64(e.CommandArgument);
            var contact = controller.GetContact(id);
            controller.DeleteContact(contact);

            Response.Redirect(Request.RawUrl);
        }

        protected void DeleteClient(object source, RepeaterCommandEventArgs e)
        {
            var id = Convert.ToInt64(e.CommandArgument);
            var contact = controller.GetContact(id);
            controller.DeleteContact(contact);

            Response.Redirect(Request.RawUrl);
        }
    }
}