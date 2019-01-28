using Calculator.DevisGenerator.Controller;
using Calculator.Model;
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

            if (!IsPostBack && HttpContext.Current.User.Identity.IsAuthenticated)
            {
                DevisUserPreferences prefs = controller.GetDevisUserPreferences();
                if (prefs == null)
                {
                    controller.AddDevisUserPreferences();
                    ShowAllDevis();
                }

                else if (prefs.DevisTab == 0) ShowAllDevis();

                else ShowUserDevis();
            }

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                addButton.NavigateUrl = ModuleContext.EditUrl("Edit");
            }
            else
            {
                addButton.Visible = false;
                devisDataGrid.Visible = false;
                allDevisButton.Visible = false;
                userDevisButton.Visible = false;
                logInPromptLabel.Visible = true;
            }

        }

        protected void ShowAllDevis(object sender, EventArgs e)
        {
            ShowAllDevis();
            controller.UpdateDevisUserPreferences(0);
        }

        private void ShowAllDevis()
        {
            devisDataGrid.DataSource = controller.GetAllDevis();
            devisDataGrid.DataBind();
            EnableButton(userDevisButton);
            DisableButton(allDevisButton);
        }

        protected void ShowUserDevis(object sender, EventArgs e)
        {
            ShowUserDevis();
            controller.UpdateDevisUserPreferences(1);
        }

        private void ShowUserDevis()
        {
            devisDataGrid.DataSource = controller.GetAllDevisFromVendor();
            devisDataGrid.DataBind();
            EnableButton(allDevisButton);
            DisableButton(userDevisButton);
        }

        private void EnableButton(LinkButton button)
        {
            button.Attributes.Remove("disabled");
            button.Attributes.Remove("style");
            button.Enabled = true;
        }

        private void DisableButton(LinkButton button)
        {
            button.Attributes.Add("disabled", "disabled");
            button.Attributes.Add("style", "color: gray");
            button.Enabled = false;
        }
    }
}