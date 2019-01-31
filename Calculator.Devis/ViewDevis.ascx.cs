using Calculator.Model;
using Calculator.DevisGenerator.Controller;
using DotNetNuke.Collections;
using DotNetNuke.UI.Modules;
using System;
using System.Globalization;
using System.IO;
using DotNetNuke.Data;
using System.Collections.Generic;
using System.Web.UI;
using System.Linq;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Users;

namespace Calculator.DevisGenerator
{
    public partial class ViewDevis : ModuleUserControlBase
    {
        private int devisId;
        private readonly DevisController controller = new DevisController();

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            System.Threading.Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
            System.Threading.Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");

            Page.MaintainScrollPositionOnPostBack = true;

            devisId = Request.QueryString.GetValueOrDefault("Id", -1);
            if (devisId > -1 && !IsPostBack)
            {
                var devis = controller.GetDevis(devisId);
                nomSocieteLabel.Text = devis.NomSociete;
                nomSocieteLabel.Text = devis.NomSociete;
                adresseSocieteLabel.Text = devis.AdresseSociete;
                adresseFacturationLabel.Text = devis.AdresseFacturation;
                adresseInstallationLabel.Text = devis.AdresseInstallation;
                telSocieteLabel.Text = devis.TelSociete;
                numeroEntrepriseLabel.Text = devis.NumeroEntreprise;
                nomClientLabel.Text = devis.NomClient;
                prenomClientLabel.Text = devis.PrenomClient;
                telDirectLabel.Text = devis.TelDirect;
                emailLabel.Text = devis.Email;
                nomITLabel.Text = devis.NomIT;
                prenomITLabel.Text = devis.PrenomIT;
                telITLabel.Text = devis.TelIT;
                emailITLabel.Text = devis.EmailIT;

                totalProduitsHTVALabel.Text = (Convert.ToDecimal(devis.TotalProduitsHTVA, CultureInfo.InvariantCulture)).ToString().Replace('.', ',');

                decimal totalMaintenanceHTVA = Convert.ToDecimal(devis.TotalMaintenanceHTVA, CultureInfo.InvariantCulture);
                totalMaintenanceHTVALabel.Text = totalMaintenanceHTVA.ToString().Replace('.', ',');
                if (devis.PeriodiciteMaintenance > 0 && totalMaintenanceHTVA > 0)
                {
                    maintenanceExplanationDiv.Visible = true;
                    maintenanceExplanationLabel.Text = "La maintenance sera facturée sur " + devis.PeriodiciteMaintenance.ToString() + " ans ";
                    if (devis.PeriodiciteFacturationMaintenance == 0)
                    {
                        maintenanceExplanationLabel.Text += "avec une périodicité annuelle";
                        decimal trancheMaintenance = Math.Round(totalMaintenanceHTVA / devis.PeriodiciteMaintenance, 2);
                        if (trancheMaintenance * devis.PeriodiciteMaintenance < totalMaintenanceHTVA) trancheMaintenance += 0.01M;
                        totalMaintenanceTrancheLabel.Text = trancheMaintenance.ToString().Replace('.', ',');
                    }
                    else
                    {
                        maintenanceExplanationLabel.Text += "en One Shot";
                        totalMaintenanceTrancheLabel.Text = totalMaintenanceHTVA.ToString().Replace('.', ',');
                    }
                    maintenanceExplanationLabel.Text += " pour un montant HTVA de";
                }
                
                remarquesLabel.Text = devis.Remarques;

                if (devis.DateUploadPDF.Year > 1)
                {
                    PDFExistsLabel.Text = "Un PDF lié à ce devis a été uploadé le " + devis.DateUploadPDFAsString;
                }
            }

            AddDevisDetailsTables(devisId);
        }

        private void AddDevisDetailsTables(int devisId)
        {
            IList<DevisAudit> savedAuditList = controller.GetDevisAudits(devisId);
            if (savedAuditList.Count > 0)
            {
                IList<Audit> auditList = controller.GetAllAudit();
                string codeString = "<table class='devisDetailsTable'><tr><th>Audit</th><th>QTS</th></tr>";
                for (int i = 0; i < savedAuditList.Count; i++)
                {
                    codeString += "<tr><td>" + auditList.Single(u => u.Id == savedAuditList[i].Item).Description
                        + "</td><td>" + savedAuditList[i].Qt + "</td></tr>";
                }
                codeString += "</table>";
                panelAudit.Controls.Add(new LiteralControl(codeString));
            }

            IList<DevisAntenne> savedAntenneList = controller.GetDevisAntennes(devisId);
            if (savedAntenneList.Count > 0)
            {
                IList<Antenne> antenneList = controller.GetAllAntennes();
                string codeString = "<table class='devisDetailsTable'><tr><th>Antennes</th><th>QTS</th></tr>";
                for (int i = 0; i < savedAntenneList.Count; i++)
                {
                    codeString += "<tr><td>" + antenneList.Single(u => u.Id == savedAntenneList[i].Item).Description
                        + "</td><td>" + savedAntenneList[i].Qt + "</td></tr>";
                }
                codeString += "</table>";
                panelAntennes.Controls.Add(new LiteralControl(codeString));
            }

            IList<DevisFanBox> savedFanBoxList = controller.GetDevisFanBoxes(devisId);
            if (savedFanBoxList.Count > 0)
            {
                IList<FanBox> fanBoxList = controller.GetAllFanBox();
                string codeString = "<table class='devisDetailsTable'><tr><th>FanBox</th><th>QTS</th></tr>";
                for (int i = 0; i < savedFanBoxList.Count; i++)
                {
                    codeString += "<tr><td>" + fanBoxList.Single(u => u.Id == savedFanBoxList[i].Item).Description
                        + "</td><td>" + savedFanBoxList[i].Qt + "</td></tr>";
                }
                codeString += "</table>";
                panelFanBox.Controls.Add(new LiteralControl(codeString));
            }

            IList<DevisSwitch> savedSwitchList = controller.GetDevisSwitches(devisId);
            if (savedSwitchList.Count > 0)
            {
                IList<Switch> switchList = controller.GetAllSwitch();
                string codeString = "<table class='devisDetailsTable'><tr><th>Switch</th><th>QTS</th></tr>";
                for (int i = 0; i < savedSwitchList.Count; i++)
                {
                    codeString += "<tr><td>" + switchList.Single(u => u.Id == savedSwitchList[i].Item).Description
                        + "</td><td>" + savedSwitchList[i].Qt + "</td></tr>";
                }
                codeString += "</table>";
                panelSwitch.Controls.Add(new LiteralControl(codeString));
            }

            IList<DevisPrestationDeServiceIT> savedPrestationList = controller.GetDevisPrestationsDeServiceIT(devisId);
            if (savedPrestationList.Count > 0)
            {
                IList<PrestationDeServiceIT> prestationList = controller.GetAllPrestationDeServiceIT();
                string codeString = "<table class='devisDetailsTable'><tr><th>Prestation de service IT</th><th>QTS</th></tr>";
                for (int i = 0; i < savedPrestationList.Count; i++)
                {
                    codeString += "<tr><td>" + prestationList.Single(u => u.Id == savedPrestationList[i].Item).Description
                        + "</td><td>" + savedPrestationList[i].Qt + "</td></tr>";
                }
                codeString += "</table>";
                panelPrestationDeServiceIT.Controls.Add(new LiteralControl(codeString));
            }

            IList<DevisCablageEtGestion> savedCablageList = controller.GetDevisCablages(devisId);
            if (savedCablageList.Count > 0)
            {
                IList<CablageEtGestion> cablageList = controller.GetAllCablageEtGestion();
                string codeString = "<table class='devisDetailsTable'><tr><th>Cablage & Gestion</th><th>QTS</th></tr>";
                for (int i = 0; i < savedCablageList.Count; i++)
                {
                    codeString += "<tr><td>" + cablageList.Single(u => u.Id == savedCablageList[i].Item).Description
                        + "</td><td>" + savedCablageList[i].Qt + "</td></tr>";
                }
                codeString += "</table>";
                panelCablageEtGestion.Controls.Add(new LiteralControl(codeString));
            }

            IList<DevisAccessoire> savedAccessoireList = controller.GetDevisAccessoires(devisId);
            if (savedAccessoireList.Count > 0)
            {
                IList<Accessoire> accessoireList = controller.GetAllAccessoires();
                string codeString = "<table class='devisDetailsTable'><tr><th>Accessoires</th><th>QTS</th></tr>";
                for (int i = 0; i < savedAccessoireList.Count; i++)
                {
                    codeString += "<tr><td>" + accessoireList.Single(u => u.Id == savedAccessoireList[i].Item).Description
                        + "</td><td>" + savedAccessoireList[i].Qt + "</td></tr>";
                }
                codeString += "</table>";
                panelAccessoires.Controls.Add(new LiteralControl(codeString));
            }

            IList<DevisDivers> savedDiversList = controller.GetDevisDivers(devisId);
            if (savedDiversList.Count > 0)
            {
                IList<Divers> diversList = controller.GetAllDivers();
                string codeString = "<table class='devisDetailsTable'><tr><th>Divers</th><th>QTS</th></tr>";
                for (int i = 0; i < savedDiversList.Count; i++)
                {
                    codeString += "<tr><td>" + diversList.Single(u => u.Id == savedDiversList[i].Item).Description
                        + "</td><td>" + savedDiversList[i].Qt + "</td></tr>";
                }
                codeString += "</table>";
                panelDivers.Controls.Add(new LiteralControl(codeString));
            }
        }

        protected void UploadPDF(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/PDF_Devis/") + VendorFolderName() + "/";
            string filename = folderPath + "Devis " + devisId.ToString() + ".pdf";

            try
            {
                string convertedString = pdfString.Text.Replace('-', '+');
                convertedString = convertedString.Replace('_', '/');
                var pdfBytes = Convert.FromBase64String(convertedString);

                if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                using (var fs = new FileStream(filename, FileMode.Create))
                using (var writer = new BinaryWriter(fs))
                {
                    writer.Write(pdfBytes, 0, pdfBytes.Length);
                    writer.Close();
                }

                UploadStatusLabel.Text = "PDF uploadé avec succès !";

                DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevisPDFInfo", devisId, filename, DateTime.Now);
                PDFExistsLabel.Text = "Un PDF lié à ce devis a été uploadé le " + DateTime.Today.ToString("dd/MM/yyyy");
            }
            catch (Exception ex)
            {
                UploadStatusLabel.Text = "Erreur lors de l'upload: " + ex.Message;
            }
        }
                
        private string VendorFolderName()
        {
            var devis = controller.GetDevis(devisId);
            var vendor = UserController.Instance.GetUserById(PortalController.Instance.GetCurrentPortalSettings().PortalId, devis.GestionnaireUserId);
            return vendor.UserID.ToString() + " - " + vendor.FirstName + " " + vendor.LastName;
        }
    }
}