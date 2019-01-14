using DotNetNuke.Common.Utilities;
using DotNetNuke.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using Calculator.Model;

namespace Calculator.DevisGenerator.Controller
{
    public class DevisController
    {
        public IList<Devis> GetAllDevis()
        {
            IList<Devis> devisList = CBO.FillCollection<Devis>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetAllDevis"));
            foreach (var devis in devisList)
            {
                FillDevisExtraFields(devis);
            }
            return devisList;
        }

        public void AddDevis(Devis devis)
        {
            devis.Id = DataProvider.Instance().ExecuteScalar<int>("dnn_Calculator_CreateDevis", devis.NomSociete, devis.AdresseSociete, devis.AdresseFacturation,
                devis.AdresseInstallation, devis.TelSociete, devis.NumeroEntreprise, devis.NomClient, devis.PrenomClient, devis.TelDirect, devis.Email, devis.NomIT,
                devis.PrenomIT, devis.TelIT, devis.EmailIT, devis.TotalHTVA, (devis.DateSignature.Year == 1753) ? SqlDateTime.Null : devis.DateSignature, 
                devis.Autoliquidation, devis.DevisSigne, devis.Remarques, DateTime.Today);
        }

        public void DeleteDevis(Devis devis)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteDevis", devis.Id);
        }

        public Devis GetDevis(int devisId)
        {
            Devis devis = CBO.FillObject<Devis>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetDevis", devisId));
            FillDevisExtraFields(devis);
            return devis;
        }

        public void UpdateDevis(Devis devis)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevis", devis.Id, devis.NomSociete, devis.AdresseSociete, devis.AdresseFacturation,
                devis.AdresseInstallation, devis.TelSociete, devis.NumeroEntreprise, devis.NomClient, devis.PrenomClient, devis.TelDirect, devis.Email, devis.NomIT,
                devis.PrenomIT, devis.TelIT, devis.EmailIT, devis.TotalHTVA, (devis.DateSignature.Year == 1753) ? SqlDateTime.Null : devis.DateSignature, 
                devis.Autoliquidation, devis.DevisSigne, devis.Remarques);
        }

        private void FillDevisExtraFields(Devis devis)
        {
            devis.DateSignatureAsString = (devis.DateSignature.Year == 1) ? "-" : devis.DateSignature.ToString("dd/MM/yyyy");
            devis.NomClientComplet = devis.NomClient + " " + devis.PrenomClient;
            devis.DevisSigneAsString = (devis.DevisSigne) ? "oui" : "non";
            devis.DateCreationAsString = devis.DateCreation.ToString("dd/MM/yyyy");
            devis.DateUploadPDFAsString = (devis.DateUploadPDF.Year == 1) ? "" : devis.DateUploadPDF.ToString("dd/MM/yyyy");
        }
    }
}