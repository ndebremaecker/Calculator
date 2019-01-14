using Calculator.Model;
using Calculator.DevisGenerator.Controller;
using DotNetNuke.Collections;
using DotNetNuke.UI.Modules;
using System;
using System.Globalization;
using System.IO;
using DotNetNuke.Data;

namespace Calculator.DevisGenerator
{
    public partial class ViewDevis : ModuleUserControlBase
    {
        private int devisId;
        private readonly DevisController controller = new DevisController();

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            //get the devisid from the querystring
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
                totalHTVALabel.Text = (Convert.ToDecimal(devis.TotalHTVA, CultureInfo.InvariantCulture)).ToString().Replace('.', ',');
                remarquesLabel.Text = devis.Remarques;

                if (devis.DateUploadPDF.Year > 1)
                {
                    PDFExistsLabel.Text = "Un PDF lié à ce devis a été uploadé le " + devis.DateUploadPDFAsString;
                }
            }
        }

        protected void UploadPDF(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                try
                {
                    string folderPath = Server.MapPath("~/PDF_Devis/");
                    string originalFilename = Path.GetFileName(FileUploadControl.FileName);
                    string filename = "Devis " + devisId.ToString() + ".pdf";

                    if (FileUploadControl.PostedFile.ContentType == "application/pdf" && Path.GetExtension(originalFilename).ToLower().Equals(".pdf"))
                    {
                        if (FileUploadControl.PostedFile.ContentLength < 10240000)
                        {
                            if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);
                            FileUploadControl.SaveAs(folderPath + filename);
                            UploadStatusLabel.Text = "Fichier uploadé avec succès !";
                            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevisPDFInfo", devisId, folderPath + filename, DateTime.Now);
                            PDFExistsLabel.Text = "Un PDF lié à ce devis a été uploadé le " + DateTime.Today.ToString("dd/MM/yyyy");
                        }
                        else UploadStatusLabel.Text = "Erreur lors de l'upload: la taille du fichier doit être inférieure à 10 Mb !";
                    }
                    else UploadStatusLabel.Text = "Erreur lors de l'upload: seuls les fichiers PDF sont acceptés !";

                }
                catch (Exception ex)
                {
                    UploadStatusLabel.Text = "Erreur lors de l'upload: " + ex.Message;
                }
            }
            else
            {
                UploadStatusLabel.Text = "Vous devez d'abord choisir un fichier";
                debug.Text = FileUploadControl.HasFile.ToString();
            }
        }
    }
}