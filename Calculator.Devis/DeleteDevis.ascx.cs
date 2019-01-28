
using DotNetNuke.Collections;
using DotNetNuke.Common;
using DotNetNuke.Entities.Users;
using DotNetNuke.UI.Modules;
using System;
using Calculator.Model;
using Calculator.DevisGenerator.Controller;

namespace Calculator.DevisGenerator
{
    public partial class DeleteDevis : ModuleUserControlBase
    {
        private int devisId;
        private Devis devis;
        private readonly DevisController controller = new DevisController();

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            devisId = Request.QueryString.GetValueOrDefault("Id", -1);
            devis = controller.GetDevis(devisId);

            if (devisId > -1 && !IsPostBack)
            {
                if (devis.DevisSigne && !UserController.Instance.GetCurrentUserInfo().IsSuperUser)
                {
                    deleteConfirmationDiv.Visible = false;
                    actionDeniedDiv.Visible = true;
                }
                else
                {
                    nomSocieteLabel.Text = devis.NomSociete;
                    dateCreationLabel.Text = devis.DateCreationAsString;
                }                
            }
        }

        protected void ConfirmDelete(object sender, EventArgs e)
        {
            if (devisId > -1) controller.DeleteDevis(devis);
            Response.Redirect(Globals.NavigateURL());
        }

        protected void CancelDelete(object sender, EventArgs e)
        {
            Response.Redirect(Globals.NavigateURL());
        }
    }
}