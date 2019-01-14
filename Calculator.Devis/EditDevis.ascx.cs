using DotNetNuke.Collections;
using DotNetNuke.Common;
using DotNetNuke.UI.Modules;
using System;
using System.Globalization;
using Calculator.DevisGenerator.Controller;
using Calculator.Model;

namespace Calculator.DevisGenerator
{
    public partial class EditDevis : ModuleUserControlBase
    {
        private int devisId;
        private readonly DevisController controller = new DevisController();
        private string debugText = "";

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
            System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("en-US");

            //get the devisid from the querystring
            devisId = Request.QueryString.GetValueOrDefault("Id", -1);
            if (devisId > -1 && !IsPostBack)
            {
                var devis = controller.GetDevis(devisId);
                nomSocieteTextBox.Text = devis.NomSociete;
                adresseSocieteTextBox.Text = devis.AdresseSociete;
                adresseFacturationTextBox.Text = devis.AdresseFacturation;
                adresseInstallationTextBox.Text = devis.AdresseInstallation;
                telSocieteTextBox.Text = devis.TelSociete;
                numeroEntrepriseTextBox.Text = devis.NumeroEntreprise;
                nomClientTextBox.Text = devis.NomClient;
                prenomClientTextBox.Text = devis.PrenomClient;
                telDirectTextBox.Text = devis.TelDirect;
                emailTextBox.Text = devis.Email;
                nomITTextBox.Text = devis.NomIT;
                prenomITTextBox.Text = devis.PrenomIT;
                telITTextBox.Text = devis.TelIT;
                emailITTextBox.Text = devis.EmailIT;
                totalHTVATextBox.Text = (Convert.ToDecimal(devis.TotalHTVA, CultureInfo.InvariantCulture)).ToString();
                dateSignatureTextBox.Text = (devis.DateSignature.Year == 1) ? "" : devis.DateSignature.ToString("dd/MM/yy");
                autoliquidationCheckBox.Checked = devis.Autoliquidation;
                devisSigneCheckBox.Checked = devis.DevisSigne;
                remarquesTextBox.Text = devis.Remarques;
            }
            else if (devisId == -1)
            {
                totalHTVATextBox.Text = "0.00";
            }

            if (debugText != "") debug.InnerText = debugText;
        }

        protected void SaveDevis(object sender, EventArgs e)
        {
            var devis = new Devis
            {
                Id = devisId,
                NomSociete = nomSocieteTextBox.Text,
                AdresseSociete = adresseSocieteTextBox.Text,
                AdresseFacturation = adresseFacturationTextBox.Text,
                AdresseInstallation = adresseInstallationTextBox.Text,
                TelSociete = telSocieteTextBox.Text,
                NumeroEntreprise = numeroEntrepriseTextBox.Text,
                NomClient = nomClientTextBox.Text,
                PrenomClient = prenomClientTextBox.Text,
                TelDirect = telDirectTextBox.Text,
                Email = emailTextBox.Text,
                NomIT = nomITTextBox.Text,
                PrenomIT = prenomITTextBox.Text,
                TelIT = telITTextBox.Text,
                EmailIT = emailITTextBox.Text,
                TotalHTVA = String.IsNullOrEmpty(totalHTVATextBox.Text.Trim()) ? 0 : Convert.ToDecimal(totalHTVATextBox.Text.Trim()),
                DateSignature = String.IsNullOrEmpty(dateSignatureTextBox.Text) ? Convert.ToDateTime("01/01/1753") : Convert.ToDateTime(dateSignatureTextBox.Text, new CultureInfo("fr-BE")),
                Autoliquidation = autoliquidationCheckBox.Checked,
                DevisSigne = devisSigneCheckBox.Checked,
                Remarques = remarquesTextBox.Text
            };

            if (devisId == -1)
                controller.AddDevis(devis);
            else controller.UpdateDevis(devis);

            Response.Redirect(Globals.NavigateURL());
        }
    }
}