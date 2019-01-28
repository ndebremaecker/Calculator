using DotNetNuke.Common.Utilities;
using DotNetNuke.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using Calculator.Model;
using DotNetNuke.Entities.Users;

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
        
        public IList<Devis> GetAllDevisFromVendor()
        {
            IList<Devis> devisList = CBO.FillCollection<Devis>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetAllDevisFromVendor", 
                UserController.Instance.GetCurrentUserInfo().UserID));
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
                devis.PrenomIT, devis.TelIT, devis.EmailIT, devis.TotalProduitsHTVA, devis.TotalMaintenanceHTVA,
                (devis.DateSignature.Year == 1753) ? SqlDateTime.Null : devis.DateSignature, devis.Autoliquidation, devis.DevisSigne, devis.Remarques,
                DateTime.Today, devis.PeriodiciteMaintenance, devis.PeriodiciteFacturationMaintenance, UserController.Instance.GetCurrentUserInfo().UserID);
        }

        public void DeleteDevis(Devis devis)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteAllDevisContent", devis.Id);
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
                devis.PrenomIT, devis.TelIT, devis.EmailIT, devis.TotalProduitsHTVA, devis.TotalMaintenanceHTVA,
                (devis.DateSignature.Year == 1753) ? SqlDateTime.Null : devis.DateSignature, devis.Autoliquidation, devis.DevisSigne, devis.Remarques,
                devis.PeriodiciteMaintenance, devis.PeriodiciteFacturationMaintenance);
        }

        private void FillDevisExtraFields(Devis devis)
        {
            devis.DateSignatureAsString = (devis.DateSignature.Year == 1) ? "-" : devis.DateSignature.ToString("dd/MM/yyyy");
            devis.NomClientComplet = devis.NomClient + " " + devis.PrenomClient;
            devis.DevisSigneAsString = (devis.DevisSigne) ? "oui" : "non";
            devis.DateCreationAsString = devis.DateCreation.ToString("dd/MM/yyyy");
            devis.DateUploadPDFAsString = (devis.DateUploadPDF.Year == 1) ? "" : devis.DateUploadPDF.ToString("dd/MM/yyyy");
            devis.TotalHTVACombined = devis.TotalProduitsHTVA + devis.TotalMaintenanceHTVA;
        }

        public IList<Accessoire> GetAllAccessoires()
        {
            return CBO.FillCollection<Accessoire>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetAllAccessoires"));
        }

        public IList<Antenne> GetAllAntennes()
        {
            return CBO.FillCollection<Antenne>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetAllAntennes"));
        }

        public IList<Audit> GetAllAudit()
        {
            return CBO.FillCollection<Audit>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetAllAudit"));
        }

        public IList<CablageEtGestion> GetAllCablageEtGestion()
        {
            return CBO.FillCollection<CablageEtGestion>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetAllCablageEtGestion"));
        }

        public IList<Divers> GetAllDivers()
        {
            return CBO.FillCollection<Divers>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetAllDivers"));
        }

        public IList<FanBox> GetAllFanBox()
        {
            return CBO.FillCollection<FanBox>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetAllFanBox"));
        }

        public IList<PrestationDeServiceIT> GetAllPrestationDeServiceIT()
        {
            return CBO.FillCollection<PrestationDeServiceIT>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetAllPrestationDeServiceIT"));
        }

        public IList<Switch> GetAllSwitch()
        {
            return CBO.FillCollection<Switch>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetAllSwitch"));
        }

        public void AddDevisAudit(DevisAudit devisAudit)
        {
            devisAudit.Id = DataProvider.Instance().ExecuteScalar<int>("dnn_Calculator_CreateDevisAudit", devisAudit.DevisId, devisAudit.Item, devisAudit.Qt,
                devisAudit.Pc);
        }

        public void UpdateDevisAudit(DevisAudit devisAudit)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevisAudit", devisAudit.Id, devisAudit.Item, devisAudit.Qt, devisAudit.Pc);
        }

        public IList<DevisAudit> GetDevisAudits(int devisId)
        {
            return CBO.FillCollection<DevisAudit>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetDevisAudits", devisId));
        }

        public void DeleteDevisAudit(int id)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteDevisAudit", id);
        }

        public void AddDevisFanBox(DevisFanBox devisFanBox)
        {
            devisFanBox.Id = DataProvider.Instance().ExecuteScalar<int>("dnn_Calculator_CreateDevisFanBox", devisFanBox.DevisId, devisFanBox.Item, devisFanBox.Qt,
                devisFanBox.Pc);
        }

        public void UpdateDevisFanBox(DevisFanBox devisFanBox)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevisFanBox", devisFanBox.Id, devisFanBox.Item, devisFanBox.Qt, devisFanBox.Pc);
        }

        public IList<DevisFanBox> GetDevisFanBoxes(int devisId)
        {
            return CBO.FillCollection<DevisFanBox>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetDevisFanBoxes", devisId));
        }

        public void DeleteDevisFanBox(int id)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteDevisFanBox", id);
        }

        public void AddDevisSwitch(DevisSwitch devisSwitch)
        {
            devisSwitch.Id = DataProvider.Instance().ExecuteScalar<int>("dnn_Calculator_CreateDevisSwitch", devisSwitch.DevisId, devisSwitch.Item, devisSwitch.Qt,
                devisSwitch.Pc);
        }

        public void UpdateDevisSwitch(DevisSwitch devisSwitch)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevisSwitch", devisSwitch.Id, devisSwitch.Item, devisSwitch.Qt, devisSwitch.Pc);
        }

        public IList<DevisSwitch> GetDevisSwitches(int devisId)
        {
            return CBO.FillCollection<DevisSwitch>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetDevisSwitches", devisId));
        }

        public void DeleteDevisSwitch(int id)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteDevisSwitch", id);
        }

        public void AddDevisPrestationDeServiceIT(DevisPrestationDeServiceIT devisPrestation)
        {
            devisPrestation.Id = DataProvider.Instance().ExecuteScalar<int>("dnn_Calculator_CreateDevisPrestationDeServiceIT", devisPrestation.DevisId,
                devisPrestation.Item, devisPrestation.Qt, devisPrestation.Pc);
        }

        public void UpdateDevisPrestationDeServiceIT(DevisPrestationDeServiceIT devisPrestation)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevisPrestationDeServiceIT", devisPrestation.Id, devisPrestation.Item, devisPrestation.Qt,
                devisPrestation.Pc);
        }

        public IList<DevisPrestationDeServiceIT> GetDevisPrestationsDeServiceIT(int devisId)
        {
            return CBO.FillCollection<DevisPrestationDeServiceIT>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetDevisPrestationsDeServiceIT", devisId));
        }

        public void DeleteDevisPrestationDeServiceIT(int id)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteDevisPrestationDeServiceIT", id);
        }

        public void AddDevisAccessoire(DevisAccessoire devisAccessoire)
        {
            devisAccessoire.Id = DataProvider.Instance().ExecuteScalar<int>("dnn_Calculator_CreateDevisAccessoire", devisAccessoire.DevisId,
                devisAccessoire.Item, devisAccessoire.Qt, devisAccessoire.Pc);
        }

        public void UpdateDevisAccessoire(DevisAccessoire devisAccessoire)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevisAccessoire", devisAccessoire.Id, devisAccessoire.Item, devisAccessoire.Qt,
                devisAccessoire.Pc);
        }

        public IList<DevisAccessoire> GetDevisAccessoires(int devisId)
        {
            return CBO.FillCollection<DevisAccessoire>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetDevisAccessoires", devisId));
        }

        public void DeleteDevisAccessoire(int id)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteDevisAccessoire", id);
        }

        public void AddDevisAntenne(DevisAntenne devisAntenne)
        {
            devisAntenne.Id = DataProvider.Instance().ExecuteScalar<int>("dnn_Calculator_CreateDevisAntenne", devisAntenne.DevisId, devisAntenne.Item,
                devisAntenne.Qt, devisAntenne.Pc);
        }

        public void UpdateDevisAntenne(DevisAntenne devisAntenne)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevisAntenne", devisAntenne.Id, devisAntenne.Item, devisAntenne.Qt,
                devisAntenne.Pc);
        }

        public IList<DevisAntenne> GetDevisAntennes(int devisId)
        {
            return CBO.FillCollection<DevisAntenne>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetDevisAntennes", devisId));
        }

        public void DeleteDevisAntenne(int id)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteDevisAntenne", id);
        }

        public void AddDevisDivers(DevisDivers devisDivers)
        {
            devisDivers.Id = DataProvider.Instance().ExecuteScalar<int>("dnn_Calculator_CreateDevisDivers", devisDivers.DevisId, devisDivers.Item,
                devisDivers.Qt, devisDivers.Pc);
        }

        public void UpdateDevisDivers(DevisDivers devisDivers)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevisDivers", devisDivers.Id, devisDivers.Item, devisDivers.Qt,
                devisDivers.Pc);
        }

        public IList<DevisDivers> GetDevisDivers(int devisId)
        {
            return CBO.FillCollection<DevisDivers>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetDevisDivers", devisId));
        }

        public void DeleteDevisDivers(int id)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteDevisDivers", id);
        }

        public void AddDevisCablage(DevisCablageEtGestion devisCablage)
        {
            devisCablage.Id = DataProvider.Instance().ExecuteScalar<int>("dnn_Calculator_CreateDevisCablage", devisCablage.DevisId, devisCablage.Item,
                devisCablage.Qt, devisCablage.Pc, devisCablage.PrixForfait);
        }

        public void UpdateDevisCablage(DevisCablageEtGestion devisCablage)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevisCablage", devisCablage.Id, devisCablage.Item, devisCablage.Qt,
                devisCablage.Pc, devisCablage.PrixForfait);
        }

        public IList<DevisCablageEtGestion> GetDevisCablages(int devisId)
        {
            return CBO.FillCollection<DevisCablageEtGestion>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetDevisCablages", devisId));
        }

        public void DeleteDevisCablage(int id)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteDevisCablage", id);
        }
        
        public void AddDevisUserPreferences()
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_CreateDevisUserPreferences", UserController.Instance.GetCurrentUserInfo().UserID);
        }

        public DevisUserPreferences GetDevisUserPreferences()
        {
            return CBO.FillObject<DevisUserPreferences>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetDevisUserPreferences", 
                UserController.Instance.GetCurrentUserInfo().UserID));
        }

        public void UpdateDevisUserPreferences(int devisTab)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateDevisUserPreferences", UserController.Instance.GetCurrentUserInfo().UserID, 
                devisTab);
        }
    }
}