using Calculator.DevisGenerator.Controller;
using DotNetNuke.UI.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Calculator.DevisGenerator
{
    public partial class DevisList : ModuleUserControlBase
    {
        private readonly DevisController controller = new DevisController();

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (!IsPostBack)
            {
                devisDataGrid.DataSource = controller.GetAllDevis();
                devisDataGrid.DataBind();
            }

            addButton.NavigateUrl = ModuleContext.EditUrl("Edit");
        }

        protected void DeleteDevis(object source, DataGridCommandEventArgs e)
        {
            var devisId = Convert.ToInt32(e.CommandArgument);
            var devis = controller.GetDevis(devisId);
            controller.DeleteDevis(devis);

            Response.Redirect(Request.RawUrl);
        }

    }
}