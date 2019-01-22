using DotNetNuke.Collections;
using DotNetNuke.Common;
using DotNetNuke.UI.Modules;
using System;
using System.Globalization;
using Calculator.DevisGenerator.Controller;
using Calculator.Model;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Linq;
using System.Web.UI;

namespace Calculator.DevisGenerator
{
    public partial class EditDevis : ModuleUserControlBase
    {
        private int devisId;
        private readonly DevisController controller = new DevisController();
        private string debugText = "";
        private IList<Accessoire> accessoireList;
        private decimal commissionAccessoires;
        private decimal commissionMaitenanceAccessoires;

        private IList<Antenne> antenneList;
        private List<DropDownList> antenneDropDownLists = new List<DropDownList>();
        private List<TextBox> antenneQtTextBoxes = new List<TextBox>();
        private List<Label> antenneUnitLabels = new List<Label>();
        private List<TextBox> antennePcTextBoxes = new List<TextBox>();
        private List<Label> antennePrixLabels = new List<Label>();
        private List<Label> antenneMaintenanceLabels = new List<Label>();
        private List<decimal> commissionAntennes = new List<decimal>();
        private List<decimal> commissionMaintenanceAntennes = new List<decimal>();

        private IList<Audit> auditList;
        private decimal commissionAudit;

        private IList<CablageEtGestion> cablageList;
        private List<DropDownList> cablageDropDownLists = new List<DropDownList>();
        private List<TextBox> cablageQtTextBoxes = new List<TextBox>();
        private List<Label> cablageUnitLabels = new List<Label>();
        private List<TextBox> cablagePcTextBoxes = new List<TextBox>();
        private List<Label> cablagePrixLabels = new List<Label>();
        private List<TextBox> cablagePrixForfaitTextBoxes = new List<TextBox>();
        private List<Label> cablageMaintenanceLabels = new List<Label>();
        private List<decimal> commissionCablage = new List<decimal>();

        private IList<Divers> diversList;
        private List<DropDownList> diversDropDownLists = new List<DropDownList>();
        private List<TextBox> diversQtTextBoxes = new List<TextBox>();
        private List<Label> diversUnitLabels = new List<Label>();
        private List<TextBox> diversPcTextBoxes = new List<TextBox>();
        private List<Label> diversPrixLabels = new List<Label>();
        private List<Label> diversMaintenanceLabels = new List<Label>();
        private List<decimal> commissionDivers = new List<decimal>();
        private List<decimal> commissionMaintenanceDivers = new List<decimal>();

        private IList<FanBox> fanBoxList;
        private decimal commissionFanBox;
        private decimal commissionMaintenanceFanBox;

        private IList<PrestationDeServiceIT> prestationList;
        private decimal commissionPrestation;

        private IList<Switch> switchList;
        private decimal commissionSwitch;
        private decimal commissionMaitenanceSwitch;

        private const decimal ratioPIEC = 0.95M;

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
            System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("en-US");

            Page.MaintainScrollPositionOnPostBack = true;

            FillListVariables();
            InitCommissionVariables();

            if (!IsPostBack) FillDropDownLists();

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
                dateSignatureTextBox.Text = (devis.DateSignature.Year == 1) ? "" : devis.DateSignature.ToString("dd/MM/yy");
                autoliquidationCheckBox.Checked = devis.Autoliquidation;
                devisSigneCheckBox.Checked = devis.DevisSigne;
                remarquesTextBox.Text = devis.Remarques;
                maintenanceDropDownList.SelectedValue = devis.PeriodiciteMaintenance.ToString();
                facturationMaintenanceDropDownList.SelectedValue = devis.PeriodiciteFacturationMaintenance.ToString();
                if (devis.PeriodiciteMaintenance > 0) facturationMaintenance.Visible = true;
                UpdateCommMaintenanceLabel();

                IList<DevisAudit> savedAuditList = controller.GetDevisAudits(devisId);
                if (savedAuditList.Count > 0)
                {
                    auditDropDownList.SelectedValue = savedAuditList[0].Item.ToString();
                    auditQt.Text = savedAuditList[0].Qt.ToString();
                    auditPc.Text = savedAuditList[0].Pc.ToString();
                    auditUnit.Text = auditList.Single(u => u.Id == savedAuditList[0].Item).Unite;
                }

                IList<DevisFanBox> savedFanBoxList = controller.GetDevisFanBoxes(devisId);
                if (savedFanBoxList.Count > 0)
                {
                    fanBoxDropDownList.SelectedValue = savedFanBoxList[0].Item.ToString();
                    fanBoxQt.Text = savedFanBoxList[0].Qt.ToString();
                    fanBoxPc.Text = savedFanBoxList[0].Pc.ToString();
                    fanBoxUnit.Text = fanBoxList.Single(u => u.Id == savedFanBoxList[0].Item).Unite;
                }

                IList<DevisSwitch> savedSwitchList = controller.GetDevisSwitches(devisId);
                if (savedSwitchList.Count > 0)
                {
                    switchDropDownList.SelectedValue = savedSwitchList[0].Item.ToString();
                    switchQt.Text = savedSwitchList[0].Qt.ToString();
                    switchPc.Text = savedSwitchList[0].Pc.ToString();
                    switchUnit.Text = switchList.Single(u => u.Id == savedSwitchList[0].Item).Unite;
                }

                IList<DevisPrestationDeServiceIT> savedPrestationList = controller.GetDevisPrestationsDeServiceIT(devisId);
                if (savedPrestationList.Count > 0)
                {
                    prestationDropDownList.SelectedValue = savedPrestationList[0].Item.ToString();
                    prestationQt.Text = savedPrestationList[0].Qt.ToString();
                    prestationPc.Text = savedPrestationList[0].Pc.ToString();
                    prestationUnit.Text = prestationList.Single(u => u.Id == savedPrestationList[0].Item).Unite;
                }

                IList<DevisAccessoire> savedAccessoireList = controller.GetDevisAccessoires(devisId);
                if (savedAccessoireList.Count > 0)
                {
                    accessoireDropDownList.SelectedValue = savedAccessoireList[0].Item.ToString();
                    accessoireQt.Text = savedAccessoireList[0].Qt.ToString();
                    accessoirePc.Text = savedAccessoireList[0].Pc.ToString();
                    accessoireUnit.Text = accessoireList.Single(u => u.Id == savedAccessoireList[0].Item).Unite;
                }

                IList<DevisAntenne> savedAntenneList = controller.GetDevisAntennes(devisId);
                if (savedAntenneList.Count > 0)
                {
                    for (int i = 0; i < savedAntenneList.Count; i++)
                    {
                        antenneDropDownLists[i].SelectedValue = savedAntenneList[i].Item.ToString();
                        antenneQtTextBoxes[i].Text = savedAntenneList[i].Qt.ToString();
                        antennePcTextBoxes[i].Text = savedAntenneList[i].Pc.ToString();
                        antenneUnitLabels[i].Text = antenneList.Single(u => u.Id == savedAntenneList[i].Item).Unite;
                    }
                }

                IList<DevisDivers> savedDiversList = controller.GetDevisDivers(devisId);
                if (savedDiversList.Count > 0)
                {
                    for (int i = 0; i < savedDiversList.Count; i++)
                    {
                        diversDropDownLists[i].SelectedValue = savedDiversList[i].Item.ToString();
                        diversQtTextBoxes[i].Text = savedDiversList[i].Qt.ToString();
                        diversPcTextBoxes[i].Text = savedDiversList[i].Pc.ToString();
                        diversUnitLabels[i].Text = diversList.Single(u => u.Id == savedDiversList[i].Item).Unite;
                    }
                }

                IList<DevisCablageEtGestion> savedCablageList = controller.GetDevisCablages(devisId);
                if (savedCablageList.Count > 0)
                {
                    for (int i = 0; i < savedCablageList.Count; i++)
                    {
                        cablageDropDownLists[i].SelectedValue = savedCablageList[i].Item.ToString();
                        cablageQtTextBoxes[i].Text = savedCablageList[i].Qt.ToString();
                        cablagePcTextBoxes[i].Text = (savedCablageList[i].Pc > 0) ? savedCablageList[i].Pc.ToString() : "";
                        cablageUnitLabels[i].Text = cablageList.Single(u => u.Id == savedCablageList[i].Item).Unite;
                        if (cablageUnitLabels[i].Text.Equals("Forf"))
                        {
                            ShowCablageForfaitTextBox(i);
                            cablagePrixForfaitTextBoxes[i].Text = (Convert.ToDecimal(savedCablageList[i].PrixForfait, CultureInfo.InvariantCulture)).ToString();
                        }
                    }
                }
            }

            else if (devisId == -1 && !IsPostBack)
            {
                totalProduitsHTVATextBox.Text = "0.00";
                totalMaintenanceHTVATextBox.Text = "0.00";
                commRevendeurOneShotTextBox.Text = "0.00";
                commRevendeurMaintenanceTextBox.Text = "0.00";
            }

            CalculateFullDevis();
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
                TotalProduitsHTVA = Convert.ToDecimal(totalProduitsHTVATextBox.Text),
                TotalMaintenanceHTVA = Convert.ToDecimal(totalMaintenanceHTVATextBox.Text),
                DateSignature = String.IsNullOrEmpty(dateSignatureTextBox.Text) ? Convert.ToDateTime("01/01/1753") : Convert.ToDateTime(dateSignatureTextBox.Text, new CultureInfo("fr-BE")),
                Autoliquidation = autoliquidationCheckBox.Checked,
                DevisSigne = devisSigneCheckBox.Checked,
                Remarques = remarquesTextBox.Text,
                PeriodiciteMaintenance = Int32.Parse(maintenanceDropDownList.SelectedValue),
                PeriodiciteFacturationMaintenance = Int32.Parse(facturationMaintenanceDropDownList.SelectedValue)
            };

            if (devisId == -1)
                controller.AddDevis(devis);
            else controller.UpdateDevis(devis);

            SaveDevisAudits(devis);
            SaveDevisFanBoxes(devis);
            SaveDevisSwitches(devis);
            SaveDevisPrestations(devis);
            SaveDevisAccessoires(devis);
            SaveDevisAntennes(devis);
            SaveDevisDivers(devis);
            SaveDevisCablages(devis);

            Response.Redirect(Globals.NavigateURL());
        }


        private void SaveDevisAudits(Devis devis)
        {
            IList<DevisAudit> savedAuditList = controller.GetDevisAudits(devisId);
            if (!String.IsNullOrEmpty(auditPrix.Text))
            {
                if (savedAuditList.Count > 0)
                {
                    var devisAudit = new DevisAudit
                    {
                        Id = savedAuditList[0].Id,
                        Item = Int32.Parse(auditDropDownList.SelectedValue),
                        Qt = Int32.Parse(auditQt.Text),
                        Pc = Int32.Parse(auditPc.Text)
                    };
                    controller.UpdateDevisAudit(devisAudit);
                }
                else
                {
                    var devisAudit = new DevisAudit
                    {
                        DevisId = devis.Id,
                        Item = Int32.Parse(auditDropDownList.SelectedValue),
                        Qt = Int32.Parse(auditQt.Text),
                        Pc = Int32.Parse(auditPc.Text)
                    };
                    controller.AddDevisAudit(devisAudit);
                }
            }
            else
            {
                if (savedAuditList.Count > 0)
                {
                    controller.DeleteDevisAudit(savedAuditList[0].Id);
                }
            }
        }

        private void SaveDevisFanBoxes(Devis devis)
        {
            IList<DevisFanBox> savedFanBoxList = controller.GetDevisFanBoxes(devisId);
            if (!String.IsNullOrEmpty(fanBoxPrix.Text))
            {
                if (savedFanBoxList.Count > 0)
                {
                    var devisFanBox = new DevisFanBox
                    {
                        Id = savedFanBoxList[0].Id,
                        Item = Int32.Parse(fanBoxDropDownList.SelectedValue),
                        Qt = Int32.Parse(fanBoxQt.Text),
                        Pc = Int32.Parse(fanBoxPc.Text)
                    };
                    controller.UpdateDevisFanBox(devisFanBox);
                }
                else
                {
                    var devisFanBox = new DevisFanBox
                    {
                        DevisId = devis.Id,
                        Item = Int32.Parse(fanBoxDropDownList.SelectedValue),
                        Qt = Int32.Parse(fanBoxQt.Text),
                        Pc = Int32.Parse(fanBoxPc.Text)
                    };
                    controller.AddDevisFanBox(devisFanBox);
                }
            }
            else
            {
                if (savedFanBoxList.Count > 0)
                {
                    controller.DeleteDevisFanBox(savedFanBoxList[0].Id);
                }
            }
        }

        private void SaveDevisSwitches(Devis devis)
        {
            IList<DevisSwitch> savedSwitchList = controller.GetDevisSwitches(devisId);
            if (!String.IsNullOrEmpty(switchPrix.Text))
            {
                if (savedSwitchList.Count > 0)
                {
                    var devisSwitch = new DevisSwitch
                    {
                        Id = savedSwitchList[0].Id,
                        Item = Int32.Parse(switchDropDownList.SelectedValue),
                        Qt = Int32.Parse(switchQt.Text),
                        Pc = Int32.Parse(switchPc.Text)
                    };
                    controller.UpdateDevisSwitch(devisSwitch);
                }
                else
                {
                    var devisSwitch = new DevisSwitch
                    {
                        DevisId = devis.Id,
                        Item = Int32.Parse(switchDropDownList.SelectedValue),
                        Qt = Int32.Parse(switchQt.Text),
                        Pc = Int32.Parse(switchPc.Text)
                    };
                    controller.AddDevisSwitch(devisSwitch);
                }
            }
            else
            {
                if (savedSwitchList.Count > 0)
                {
                    controller.DeleteDevisSwitch(savedSwitchList[0].Id);
                }
            }
        }

        private void SaveDevisPrestations(Devis devis)
        {
            IList<DevisPrestationDeServiceIT> savedPrestationList = controller.GetDevisPrestationsDeServiceIT(devisId);
            if (!String.IsNullOrEmpty(prestationPrix.Text))
            {
                if (savedPrestationList.Count > 0)
                {
                    var devisPrestation = new DevisPrestationDeServiceIT
                    {
                        Id = savedPrestationList[0].Id,
                        Item = Int32.Parse(prestationDropDownList.SelectedValue),
                        Qt = Int32.Parse(prestationQt.Text),
                        Pc = Int32.Parse(prestationPc.Text)
                    };
                    controller.UpdateDevisPrestationDeServiceIT(devisPrestation);
                }
                else
                {
                    var devisPrestation = new DevisPrestationDeServiceIT
                    {
                        DevisId = devis.Id,
                        Item = Int32.Parse(prestationDropDownList.SelectedValue),
                        Qt = Int32.Parse(prestationQt.Text),
                        Pc = Int32.Parse(prestationPc.Text)
                    };
                    controller.AddDevisPrestationDeServiceIT(devisPrestation);
                }
            }
            else
            {
                if (savedPrestationList.Count > 0)
                {
                    controller.DeleteDevisPrestationDeServiceIT(savedPrestationList[0].Id);
                }
            }
        }

        private void SaveDevisAccessoires(Devis devis)
        {
            IList<DevisAccessoire> savedAccessoireList = controller.GetDevisAccessoires(devisId);
            if (!String.IsNullOrEmpty(accessoirePrix.Text))
            {
                if (savedAccessoireList.Count > 0)
                {
                    var devisAccessoire = new DevisAccessoire
                    {
                        Id = savedAccessoireList[0].Id,
                        Item = Int32.Parse(accessoireDropDownList.SelectedValue),
                        Qt = Int32.Parse(accessoireQt.Text),
                        Pc = Int32.Parse(accessoirePc.Text)
                    };
                    controller.UpdateDevisAccessoire(devisAccessoire);
                }
                else
                {
                    var devisAccessoire = new DevisAccessoire
                    {
                        DevisId = devis.Id,
                        Item = Int32.Parse(accessoireDropDownList.SelectedValue),
                        Qt = Int32.Parse(accessoireQt.Text),
                        Pc = Int32.Parse(accessoirePc.Text)
                    };
                    controller.AddDevisAccessoire(devisAccessoire);
                }
            }
            else
            {
                if (savedAccessoireList.Count > 0)
                {
                    controller.DeleteDevisAccessoire(savedAccessoireList[0].Id);
                }
            }
        }

        private void SaveDevisAntennes(Devis devis)
        {
            IList<DevisAntenne> savedAntenneList = controller.GetDevisAntennes(devisId);
            List<DevisAntenne> antennesToSave = new List<DevisAntenne>();
            for (int i = 0; i < antennePrixLabels.Count; i++)
            {
                if (!String.IsNullOrEmpty(antennePrixLabels[i].Text))
                {
                    var devisAntenne = new DevisAntenne
                    {
                        DevisId = devis.Id,
                        Item = Int32.Parse(antenneDropDownLists[i].SelectedValue),
                        Qt = Int32.Parse(antenneQtTextBoxes[i].Text),
                        Pc = Int32.Parse(antennePcTextBoxes[i].Text)
                    };
                    antennesToSave.Add(devisAntenne);
                }
            }
            int savedAntenneCount = savedAntenneList.Count;
            int antennesToSaveCount = antennesToSave.Count;
            if (savedAntenneCount == antennesToSaveCount)
            {
                for (int i = 0; i < antennesToSaveCount; i++)
                {
                    antennesToSave[i].Id = savedAntenneList[i].Id;
                    controller.UpdateDevisAntenne(antennesToSave[i]);
                }
            }
            else if (savedAntenneCount < antennesToSaveCount)
            {
                for (int i = 0; i < antennesToSaveCount; i++)
                {
                    if (savedAntenneCount > 0)
                    {
                        antennesToSave[i].Id = savedAntenneList[i].Id;
                        controller.UpdateDevisAntenne(antennesToSave[i]);
                        savedAntenneCount--;
                    }
                    else
                    {
                        controller.AddDevisAntenne(antennesToSave[i]);
                    }
                }
            }
            else if (savedAntenneCount > antennesToSaveCount)
            {
                for (int i = 0; i < savedAntenneCount; i++)
                {
                    if (antennesToSaveCount > 0)
                    {
                        antennesToSave[i].Id = savedAntenneList[i].Id;
                        controller.UpdateDevisAntenne(antennesToSave[i]);
                        antennesToSaveCount--;
                    }
                    else
                    {
                        controller.DeleteDevisAntenne(savedAntenneList[i].Id);
                    }
                }
            }
        }

        private void SaveDevisDivers(Devis devis)
        {
            IList<DevisDivers> savedDiversList = controller.GetDevisDivers(devisId);
            List<DevisDivers> diversToSave = new List<DevisDivers>();
            for (int i = 0; i < diversPrixLabels.Count; i++)
            {
                if (!String.IsNullOrEmpty(diversPrixLabels[i].Text))
                {
                    var devisDivers = new DevisDivers
                    {
                        DevisId = devis.Id,
                        Item = Int32.Parse(diversDropDownLists[i].SelectedValue),
                        Qt = Int32.Parse(diversQtTextBoxes[i].Text),
                        Pc = Int32.Parse(diversPcTextBoxes[i].Text)
                    };
                    diversToSave.Add(devisDivers);
                }
            }
            int savedDiversCount = savedDiversList.Count;
            int diversToSaveCount = diversToSave.Count;
            if (savedDiversCount == diversToSaveCount)
            {
                for (int i = 0; i < diversToSaveCount; i++)
                {
                    diversToSave[i].Id = savedDiversList[i].Id;
                    controller.UpdateDevisDivers(diversToSave[i]);
                }
            }
            else if (savedDiversCount < diversToSaveCount)
            {
                for (int i = 0; i < diversToSaveCount; i++)
                {
                    if (savedDiversCount > 0)
                    {
                        diversToSave[i].Id = savedDiversList[i].Id;
                        controller.UpdateDevisDivers(diversToSave[i]);
                        savedDiversCount--;
                    }
                    else
                    {
                        controller.AddDevisDivers(diversToSave[i]);
                    }
                }
            }
            else if (savedDiversCount > diversToSaveCount)
            {
                for (int i = 0; i < savedDiversCount; i++)
                {
                    if (diversToSaveCount > 0)
                    {
                        diversToSave[i].Id = savedDiversList[i].Id;
                        controller.UpdateDevisDivers(diversToSave[i]);
                        diversToSaveCount--;
                    }
                    else
                    {
                        controller.DeleteDevisDivers(savedDiversList[i].Id);
                    }
                }
            }
        }

        private void SaveDevisCablages(Devis devis)
        {
            IList<DevisCablageEtGestion> savedCablageList = controller.GetDevisCablages(devisId);
            List<DevisCablageEtGestion> cablagesToSave = new List<DevisCablageEtGestion>();
            for (int i = 0; i < cablagePrixLabels.Count; i++)
            {
                if (!String.IsNullOrEmpty(cablagePrixLabels[i].Text))
                {
                    var devisCablage = new DevisCablageEtGestion
                    {
                        DevisId = devis.Id,
                        Item = Int32.Parse(cablageDropDownLists[i].SelectedValue),
                        Qt = Int32.Parse(cablageQtTextBoxes[i].Text),
                        Pc = Int32.Parse(cablagePcTextBoxes[i].Text),
                        PrixForfait = 0.00M
                    };
                    cablagesToSave.Add(devisCablage);
                }
                else if (!String.IsNullOrEmpty(cablagePrixForfaitTextBoxes[i].Text))
                {
                    var devisCablage = new DevisCablageEtGestion
                    {
                        DevisId = devis.Id,
                        Item = Int32.Parse(cablageDropDownLists[i].SelectedValue),
                        Qt = Int32.Parse(cablageQtTextBoxes[i].Text),
                        Pc = (String.IsNullOrEmpty(cablagePcTextBoxes[i].Text)) ? 0 : Int32.Parse(cablagePcTextBoxes[i].Text),
                        PrixForfait = Convert.ToDecimal(cablagePrixForfaitTextBoxes[i].Text)
                    };
                    cablagesToSave.Add(devisCablage);
                }
            }
            int savedCablageCount = savedCablageList.Count;
            int cablagesToSaveCount = cablagesToSave.Count;
            if (savedCablageCount == cablagesToSaveCount)
            {
                for (int i = 0; i < cablagesToSaveCount; i++)
                {
                    cablagesToSave[i].Id = savedCablageList[i].Id;
                    controller.UpdateDevisCablage(cablagesToSave[i]);
                }
            }
            else if (savedCablageCount < cablagesToSaveCount)
            {
                for (int i = 0; i < cablagesToSaveCount; i++)
                {
                    if (savedCablageCount > 0)
                    {
                        cablagesToSave[i].Id = savedCablageList[i].Id;
                        controller.UpdateDevisCablage(cablagesToSave[i]);
                        savedCablageCount--;
                    }
                    else
                    {
                        controller.AddDevisCablage(cablagesToSave[i]);
                    }
                }
            }
            else if (savedCablageCount > cablagesToSaveCount)
            {
                for (int i = 0; i < savedCablageCount; i++)
                {
                    if (cablagesToSaveCount > 0)
                    {
                        cablagesToSave[i].Id = savedCablageList[i].Id;
                        controller.UpdateDevisCablage(cablagesToSave[i]);
                        cablagesToSaveCount--;
                    }
                    else
                    {
                        controller.DeleteDevisCablage(savedCablageList[i].Id);
                    }
                }
            }
        }

        private void SetUpAntennesLists()
        {
            foreach (Control ctlLevel1 in antennesTable.Controls)
            {
                if (ctlLevel1 is TableRow)
                {
                    foreach (Control ctlLevel2 in ctlLevel1.Controls)
                    {
                        if (ctlLevel2 is TableCell)
                        {
                            foreach (var item in ctlLevel2.Controls)
                            {
                                if (item is DropDownList)
                                {
                                    DropDownList d = item as DropDownList;
                                    if (d.CssClass.Contains("_DDList")) antenneDropDownLists.Add(d);
                                }
                                else if (item is TextBox)
                                {
                                    TextBox t = item as TextBox;
                                    if (t.CssClass.Contains("_Qt")) antenneQtTextBoxes.Add(t);
                                    else if (t.CssClass.Contains("_Pc")) antennePcTextBoxes.Add(t);
                                }
                                else if (item is Label)
                                {
                                    Label l = item as Label;
                                    if (l.CssClass.Contains("_Unit")) antenneUnitLabels.Add(l);
                                    else if (l.CssClass.Contains("_Prix")) antennePrixLabels.Add(l);
                                    else if (l.CssClass.Contains("_Maintenance")) antenneMaintenanceLabels.Add(l);
                                }
                            }
                        }
                    }
                }
            }
        }

        private void SetUpDiversLists()
        {
            foreach (Control ctlLevel1 in diversTable.Controls)
            {
                if (ctlLevel1 is TableRow)
                {
                    foreach (Control ctlLevel2 in ctlLevel1.Controls)
                    {
                        if (ctlLevel2 is TableCell)
                        {
                            foreach (var item in ctlLevel2.Controls)
                            {
                                if (item is DropDownList)
                                {
                                    DropDownList d = item as DropDownList;
                                    if (d.CssClass.Contains("_DDList")) diversDropDownLists.Add(d);
                                }
                                else if (item is TextBox)
                                {
                                    TextBox t = item as TextBox;
                                    if (t.CssClass.Contains("_Qt")) diversQtTextBoxes.Add(t);
                                    else if (t.CssClass.Contains("_Pc")) diversPcTextBoxes.Add(t);
                                }
                                else if (item is Label)
                                {
                                    Label l = item as Label;
                                    if (l.CssClass.Contains("_Unit")) diversUnitLabels.Add(l);
                                    else if (l.CssClass.Contains("_Prix")) diversPrixLabels.Add(l);
                                    else if (l.CssClass.Contains("_Maintenance")) diversMaintenanceLabels.Add(l);
                                }
                            }
                        }
                    }
                }
            }
        }

        private void SetUpCablageLists()
        {
            foreach (Control ctlLevel1 in cablageTable.Controls)
            {
                if (ctlLevel1 is TableRow)
                {
                    foreach (Control ctlLevel2 in ctlLevel1.Controls)
                    {
                        if (ctlLevel2 is TableCell)
                        {
                            foreach (var item in ctlLevel2.Controls)
                            {
                                if (item is DropDownList)
                                {
                                    DropDownList d = item as DropDownList;
                                    if (d.CssClass.Contains("_DDList")) cablageDropDownLists.Add(d);
                                }
                                else if (item is TextBox)
                                {
                                    TextBox t = item as TextBox;
                                    if (t.CssClass.Contains("_Qt")) cablageQtTextBoxes.Add(t);
                                    else if (t.CssClass.Contains("_Pc")) cablagePcTextBoxes.Add(t);
                                    else if (t.CssClass.Contains("_PrixForfait")) cablagePrixForfaitTextBoxes.Add(t);
                                }
                                else if (item is Label)
                                {
                                    Label l = item as Label;
                                    if (l.CssClass.Contains("_Unit")) cablageUnitLabels.Add(l);
                                    else if (l.CssClass.Contains("_Prix")) cablagePrixLabels.Add(l);
                                    else if (l.CssClass.Contains("_Maintenance")) cablageMaintenanceLabels.Add(l);
                                }
                            }
                        }
                    }
                }
            }
        }

        private void FillListVariables()
        {
            accessoireList = controller.GetAllAccessoires();
            antenneList = controller.GetAllAntennes();
            auditList = controller.GetAllAudit();
            cablageList = controller.GetAllCablageEtGestion();
            diversList = controller.GetAllDivers();
            fanBoxList = controller.GetAllFanBox();
            prestationList = controller.GetAllPrestationDeServiceIT();
            switchList = controller.GetAllSwitch();

            SetUpAntennesLists();
            SetUpDiversLists();
            SetUpCablageLists();
        }

        private void InitCommissionVariables()
        {
            commissionAccessoires = 0;
            commissionMaitenanceAccessoires = 0;
            commissionAudit = 0;
            commissionFanBox = 0;
            commissionMaintenanceFanBox = 0;
            commissionPrestation = 0;
            commissionSwitch = 0;
            commissionMaitenanceSwitch = 0;

            for (int i = 0; i < antenneDropDownLists.Count; i++)
            {
                commissionAntennes.Add(0);
                commissionMaintenanceAntennes.Add(0);
            }
            for (int i = 0; i < cablageDropDownLists.Count; i++)
            {
                commissionCablage.Add(0);
            }
            for (int i = 0; i < diversDropDownLists.Count; i++)
            {
                commissionDivers.Add(0);
                commissionMaintenanceDivers.Add(0);
            }
        }

        private void FillDropDownLists()
        {
            accessoireDropDownList.DataSource = accessoireList;
            accessoireDropDownList.DataTextField = "Description";
            accessoireDropDownList.DataValueField = "Id";
            accessoireDropDownList.DataBind();
            accessoireDropDownList.Items.Insert(0, new ListItem("", "0"));

            for (int i = 0; i < antenneDropDownLists.Count; i++)
            {
                antenneDropDownLists[i].DataSource = antenneList;
                antenneDropDownLists[i].DataTextField = "Description";
                antenneDropDownLists[i].DataValueField = "Id";
                antenneDropDownLists[i].DataBind();
                antenneDropDownLists[i].Items.Insert(0, new ListItem("", "0"));
            }

            auditDropDownList.DataSource = auditList;
            auditDropDownList.DataTextField = "Description";
            auditDropDownList.DataValueField = "Id";
            auditDropDownList.DataBind();
            auditDropDownList.Items.Insert(0, new ListItem("", "0"));

            for (int i = 0; i < cablageDropDownLists.Count; i++)
            {
                cablageDropDownLists[i].DataSource = cablageList;
                cablageDropDownLists[i].DataTextField = "Description";
                cablageDropDownLists[i].DataValueField = "Id";
                cablageDropDownLists[i].DataBind();
                cablageDropDownLists[i].Items.Insert(0, new ListItem("", "0"));
            }

            for (int i = 0; i < diversDropDownLists.Count; i++)
            {
                diversDropDownLists[i].DataSource = diversList;
                diversDropDownLists[i].DataTextField = "Description";
                diversDropDownLists[i].DataValueField = "Id";
                diversDropDownLists[i].DataBind();
                diversDropDownLists[i].Items.Insert(0, new ListItem("", "0"));
            }

            fanBoxDropDownList.DataSource = fanBoxList;
            fanBoxDropDownList.DataTextField = "Description";
            fanBoxDropDownList.DataValueField = "Id";
            fanBoxDropDownList.DataBind();
            fanBoxDropDownList.Items.Insert(0, new ListItem("", "0"));

            prestationDropDownList.DataSource = prestationList;
            prestationDropDownList.DataTextField = "Description";
            prestationDropDownList.DataValueField = "Id";
            prestationDropDownList.DataBind();
            prestationDropDownList.Items.Insert(0, new ListItem("", "0"));

            switchDropDownList.DataSource = switchList;
            switchDropDownList.DataTextField = "Description";
            switchDropDownList.DataValueField = "Id";
            switchDropDownList.DataBind();
            switchDropDownList.Items.Insert(0, new ListItem("", "0"));
        }

        private decimal ActualPrice(decimal price, int qt, int pc)
        {
            decimal PVFandigo = price * qt;
            decimal PVRev = PVFandigo + (PVFandigo * ((decimal)pc / 100));
            return Math.Round(PVRev / ratioPIEC, 2);
        }

        private decimal CommissionPrice(decimal price, int qt, int pc)
        {
            decimal PVFandigo = price * qt;
            return Math.Round((PVFandigo * ((decimal)pc / 100)), 2);
        }

        private decimal MaintenancePrice(decimal price, int qt, int pc)
        {
            decimal PVFandigo = ((price * qt) / 2) * Int32.Parse(maintenanceDropDownList.SelectedValue);
            decimal PVRev = PVFandigo + (PVFandigo * ((decimal)pc / 100));
            return Math.Round(PVRev / ratioPIEC, 2);
        }

        private decimal CommissionMaintenancePrice(decimal price, int qt, int pc)
        {
            decimal PVFandigo = ((price * qt) / 2) * Int32.Parse(maintenanceDropDownList.SelectedValue);
            return Math.Round((PVFandigo * ((decimal)pc / 100)), 2);
        }

        protected void MaintenanceSelected(object sender, EventArgs e)
        {
            if (Int32.Parse(maintenanceDropDownList.SelectedValue) > 0) facturationMaintenance.Visible = true;
            else facturationMaintenance.Visible = false;

            UpdateCommMaintenanceLabel();
        }

        protected void FacturationMaintenanceSelected(object sender, EventArgs e)
        {
            UpdateCommMaintenanceLabel();
        }

        private void UpdateCommMaintenanceLabel()
        {
            int periodiciteMaintenance = Int32.Parse(maintenanceDropDownList.SelectedValue);
            int periodiciteFacturation = Int32.Parse(facturationMaintenanceDropDownList.SelectedValue);
            if (periodiciteMaintenance == 0 || periodiciteFacturation == 1) commRevendeurMaintenanceLabel.Text = "Comm revendeur Maintenance:";
            else commRevendeurMaintenanceLabel.Text = "Comm revendeur Maintenance (par an pdt " + periodiciteMaintenance.ToString() + " ans):";

        }

        protected void Recalculate(object sender, EventArgs e)
        {
        }

            protected void AuditItemSelected(object sender, EventArgs e)
        {
            DropDownList d = sender as DropDownList;
            int val = Int32.Parse(d.SelectedValue);
            if (val == 0) auditUnit.Text = "";
            else auditUnit.Text = auditList.Single(u => u.Id == val).Unite;
        }

        protected void FanBoxItemSelected(object sender, EventArgs e)
        {
            DropDownList d = sender as DropDownList;
            int val = Int32.Parse(d.SelectedValue);
            if (val == 0) fanBoxUnit.Text = "";
            else fanBoxUnit.Text = fanBoxList.Single(u => u.Id == val).Unite;
        }

        protected void SwitchItemSelected(object sender, EventArgs e)
        {
            DropDownList d = sender as DropDownList;
            int val = Int32.Parse(d.SelectedValue);
            if (val == 0) switchUnit.Text = "";
            else switchUnit.Text = switchList.Single(u => u.Id == val).Unite;
        }

        protected void PrestationItemSelected(object sender, EventArgs e)
        {
            DropDownList d = sender as DropDownList;
            int val = Int32.Parse(d.SelectedValue);
            if (val == 0) prestationUnit.Text = "";
            else prestationUnit.Text = prestationList.Single(u => u.Id == val).Unite;
        }

        protected void AccessoireItemSelected(object sender, EventArgs e)
        {
            DropDownList d = sender as DropDownList;
            int val = Int32.Parse(d.SelectedValue);
            if (val == 0) accessoireUnit.Text = "";
            else accessoireUnit.Text = accessoireList.Single(u => u.Id == val).Unite;
        }

        protected void AntenneItemSelected(object sender, EventArgs e)
        {
            for (int i = 0; i < antenneDropDownLists.Count; i++)
            {
                int val = Int32.Parse(antenneDropDownLists[i].SelectedValue);
                if (val == 0) antenneUnitLabels[i].Text = "";
                else antenneUnitLabels[i].Text = antenneList.Single(u => u.Id == val).Unite;
            }
        }

        protected void DiversItemSelected(object sender, EventArgs e)
        {
            for (int i = 0; i < diversDropDownLists.Count; i++)
            {
                int val = Int32.Parse(diversDropDownLists[i].SelectedValue);
                if (val == 0) diversUnitLabels[i].Text = "";
                else diversUnitLabels[i].Text = diversList.Single(u => u.Id == val).Unite;
            }
        }

        protected void CablageItemSelected(object sender, EventArgs e)
        {
            for (int i = 0; i < cablageDropDownLists.Count; i++)
            {
                int val = Int32.Parse(cablageDropDownLists[i].SelectedValue);
                if (val == 0) cablageUnitLabels[i].Text = "";
                else cablageUnitLabels[i].Text = cablageList.Single(u => u.Id == val).Unite;

                if (cablageUnitLabels[i].Text.Equals("Forf")) ShowCablageForfaitTextBox(i);
                else HideCablageForfaitTextBox(i);
            }

        }

        private void ShowCablageForfaitTextBox(int index)
        {
            cablageQtTextBoxes[index].Text = "1";
            cablagePrixLabels[index].Visible = false;
            cablagePrixForfaitTextBoxes[index].Visible = true;
            if (String.IsNullOrEmpty(cablagePrixForfaitTextBoxes[index].Text)) cablagePrixForfaitTextBoxes[index].Text = "0.00";
        }

        private void HideCablageForfaitTextBox(int index)
        {
            cablagePrixLabels[index].Visible = true;
            cablagePrixForfaitTextBoxes[index].Text = "";
            cablagePrixForfaitTextBoxes[index].Visible = false;
        }

        private int PercentageTextBoxCheck(TextBox tBox)
        {
            if (String.IsNullOrEmpty(tBox.Text)) return 0;
            int pcAsInt = Int32.Parse(tBox.Text);
            if (pcAsInt < 3) pcAsInt = 3;
            else if (pcAsInt > 50) pcAsInt = 50;
            tBox.Text = pcAsInt.ToString();
            return pcAsInt;
        }

        private void CalculateAudit()
        {
            int dropDownListValue = Int32.Parse(auditDropDownList.SelectedValue);
            int qtValue = (String.IsNullOrEmpty(auditQt.Text)) ? 0 : Int32.Parse(auditQt.Text);
            int pcValue = PercentageTextBoxCheck(auditPc);
            if (dropDownListValue != 0 && qtValue != 0 && pcValue != 0)
            {
                auditPrix.Text = (ActualPrice(auditList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                commissionAudit = CommissionPrice(auditList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                auditMaintenance.Text = "0.00";
            }
            else
            {
                auditPrix.Text = "";
                commissionAudit = 0;
                auditMaintenance.Text = "";
            }
        }

        private void CalculateFanBox()
        {
            int dropDownListValue = Int32.Parse(fanBoxDropDownList.SelectedValue);
            int qtValue = (String.IsNullOrEmpty(fanBoxQt.Text)) ? 0 : Int32.Parse(fanBoxQt.Text);
            int pcValue = PercentageTextBoxCheck(fanBoxPc);
            if (dropDownListValue != 0 && qtValue != 0 && pcValue != 0)
            {
                fanBoxPrix.Text = (ActualPrice(fanBoxList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                commissionFanBox = CommissionPrice(fanBoxList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                if (fanBoxList.Single(u => u.Id == dropDownListValue).Maintenance && Int32.Parse(maintenanceDropDownList.SelectedValue) > 0)
                {
                    fanBoxMaintenance.Text = (MaintenancePrice(fanBoxList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                    commissionMaintenanceFanBox = CommissionMaintenancePrice(fanBoxList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                }
                else
                {
                    fanBoxMaintenance.Text = "0.00";
                    commissionMaintenanceFanBox = 0;
                }
            }
            else
            {
                fanBoxPrix.Text = "";
                commissionFanBox = 0;
                fanBoxMaintenance.Text = "";
                commissionMaintenanceFanBox = 0;
            }
        }

        private void CalculateSwitch()
        {
            int dropDownListValue = Int32.Parse(switchDropDownList.SelectedValue);
            int qtValue = (String.IsNullOrEmpty(switchQt.Text)) ? 0 : Int32.Parse(switchQt.Text);
            int pcValue = PercentageTextBoxCheck(switchPc);
            if (dropDownListValue != 0 && qtValue != 0 && pcValue != 0)
            {
                switchPrix.Text = (ActualPrice(switchList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                commissionSwitch = CommissionPrice(switchList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                if (switchList.Single(u => u.Id == dropDownListValue).Maintenance && Int32.Parse(maintenanceDropDownList.SelectedValue) > 0)
                {
                    switchMaintenance.Text = (MaintenancePrice(switchList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                    commissionMaitenanceSwitch = CommissionMaintenancePrice(switchList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                }
                else
                {
                    switchMaintenance.Text = "0.00";
                    commissionMaitenanceSwitch = 0;
                }
            }
            else
            {
                switchPrix.Text = "";
                commissionSwitch = 0;
                switchMaintenance.Text = "";
                commissionMaitenanceSwitch = 0;
            }
        }

        private void CalculatePrestation()
        {
            int dropDownListValue = Int32.Parse(prestationDropDownList.SelectedValue);
            int qtValue = (String.IsNullOrEmpty(prestationQt.Text)) ? 0 : Int32.Parse(prestationQt.Text);
            int pcValue = PercentageTextBoxCheck(prestationPc);
            if (dropDownListValue != 0 && qtValue != 0 && pcValue != 0)
            {
                prestationPrix.Text = (ActualPrice(prestationList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                commissionPrestation = CommissionPrice(prestationList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                prestationMaintenance.Text = "0.00";
            }
            else
            {
                prestationPrix.Text = "";
                commissionPrestation = 0;
                prestationMaintenance.Text = "";
            }
        }

        private void CalculateAccessoires()
        {
            int dropDownListValue = Int32.Parse(accessoireDropDownList.SelectedValue);
            int qtValue = (String.IsNullOrEmpty(accessoireQt.Text)) ? 0 : Int32.Parse(accessoireQt.Text);
            int pcValue = PercentageTextBoxCheck(accessoirePc);
            if (dropDownListValue != 0 && qtValue != 0 && pcValue != 0)
            {
                accessoirePrix.Text = (ActualPrice(accessoireList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                commissionAccessoires = CommissionPrice(accessoireList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                if (accessoireList.Single(u => u.Id == dropDownListValue).Maintenance && Int32.Parse(maintenanceDropDownList.SelectedValue) > 0)
                {
                    accessoireMaintenance.Text = (MaintenancePrice(accessoireList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                    commissionMaitenanceAccessoires = CommissionMaintenancePrice(accessoireList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                }
                else
                {
                    accessoireMaintenance.Text = "0.00";
                    commissionMaitenanceAccessoires = 0;
                }
            }
            else
            {
                accessoirePrix.Text = "";
                commissionAccessoires = 0;
                accessoireMaintenance.Text = "";
                commissionMaitenanceAccessoires = 0;
            }
        }

        private void CalculateAntennes()
        {
            for (int i = 0; i < antenneDropDownLists.Count; i++)
            {
                int dropDownListValue = Int32.Parse(antenneDropDownLists[i].SelectedValue);
                int qtValue = (String.IsNullOrEmpty(antenneQtTextBoxes[i].Text)) ? 0 : Int32.Parse(antenneQtTextBoxes[i].Text);
                int pcValue = PercentageTextBoxCheck(antennePcTextBoxes[i]);
                if (dropDownListValue != 0 && qtValue != 0 && pcValue != 0)
                {
                    antennePrixLabels[i].Text = (ActualPrice(antenneList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                    commissionAntennes[i] = CommissionPrice(antenneList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                    if (antenneList.Single(u => u.Id == dropDownListValue).Maintenance && Int32.Parse(maintenanceDropDownList.SelectedValue) > 0)
                    {
                        antenneMaintenanceLabels[i].Text = (MaintenancePrice(antenneList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                        commissionMaintenanceAntennes[i] = CommissionMaintenancePrice(antenneList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                    }
                    else
                    {
                        antenneMaintenanceLabels[i].Text = "0.00";
                        commissionMaintenanceAntennes[i] = 0;
                    }
                }
                else
                {
                    antennePrixLabels[i].Text = "";
                    commissionAntennes[i] = 0;
                    antenneMaintenanceLabels[i].Text = "";
                    commissionMaintenanceAntennes[i] = 0;
                }
            }
        }

        private void CalculateDivers()
        {
            for (int i = 0; i < diversDropDownLists.Count; i++)
            {
                int dropDownListValue = Int32.Parse(diversDropDownLists[i].SelectedValue);
                int qtValue = (String.IsNullOrEmpty(diversQtTextBoxes[i].Text)) ? 0 : Int32.Parse(diversQtTextBoxes[i].Text);
                int pcValue = PercentageTextBoxCheck(diversPcTextBoxes[i]);
                if (dropDownListValue != 0 && qtValue != 0 && pcValue != 0)
                {
                    diversPrixLabels[i].Text = (ActualPrice(diversList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                    commissionDivers[i] = CommissionPrice(diversList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                    if (diversList.Single(u => u.Id == dropDownListValue).Maintenance && Int32.Parse(maintenanceDropDownList.SelectedValue) > 0)
                    {
                        diversMaintenanceLabels[i].Text = (MaintenancePrice(diversList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                        commissionMaintenanceDivers[i] = CommissionMaintenancePrice(diversList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                    }
                    else
                    {
                        diversMaintenanceLabels[i].Text = "0.00";
                        commissionMaintenanceDivers[i] = 0;
                    }
                }
                else
                {
                    diversPrixLabels[i].Text = "";
                    commissionDivers[i] = 0;
                    diversMaintenanceLabels[i].Text = "";
                    commissionMaintenanceDivers[i] = 0;
                    }
                }
            }
        
            /*
            protected void CablageQtChange(object sender, EventArgs e)
            {
                TextBox t = sender as TextBox;
                int index = (cablageQtTextBoxes.IndexOf(t));
                if ((cablageList.SingleOrDefault(u => u.Id == Int32.Parse(cablageDropDownLists[index].SelectedValue))) != null &&
                    ((cablageList.Single(u => u.Id == Int32.Parse(cablageDropDownLists[index].SelectedValue)).Unite).Equals("Forf"))) t.Text = "1";
            }

            private int PercentageTextBoxCheck(TextBox tBox)
            {
                if (String.IsNullOrEmpty(tBox.Text)) return 0;
                int pcAsInt = Int32.Parse(tBox.Text);
                if (pcAsInt < 3) pcAsInt = 3;
                else if (pcAsInt > 50) pcAsInt = 50;
                tBox.Text = pcAsInt.ToString();
                return pcAsInt;
            }

            private int CablageQtTextBoxCheck(TextBox tBox)
            {
                int index = (cablageQtTextBoxes.IndexOf(tBox));
                if ((cablageList.SingleOrDefault(u => u.Id == Int32.Parse(cablageDropDownLists[index].SelectedValue))) != null &&
                    ((cablageList.Single(u => u.Id == Int32.Parse(cablageDropDownLists[index].SelectedValue)).Unite).Equals("Forf"))) t.Text = "1";
            }
            */

        private void CalculateCablage()
        {
            for (int i = 0; i < cablageDropDownLists.Count; i++)
            {
                int dropDownListValue = Int32.Parse(cablageDropDownLists[i].SelectedValue);
                int qtValue = (String.IsNullOrEmpty(cablageQtTextBoxes[i].Text)) ? 0 : Int32.Parse(cablageQtTextBoxes[i].Text);
                int pcValue = PercentageTextBoxCheck(cablagePcTextBoxes[i]);

                if (dropDownListValue != 0 && (cablageList.Single(u => u.Id == dropDownListValue).Unite).Equals("Forf"))
                {
                    cablagePrixLabels[i].Text = "";
                    if (qtValue != 1)
                    {
                        qtValue = 1;
                        cablageQtTextBoxes[i].Text = "1";
                    }
                    commissionCablage[i] = (String.IsNullOrEmpty(cablagePrixForfaitTextBoxes[i].Text)) ? 0 :
                        CommissionPrice(Decimal.Parse(cablagePrixForfaitTextBoxes[i].Text), qtValue, pcValue);
                    cablageMaintenanceLabels[i].Text = "0.00";
                }
                else if (dropDownListValue != 0 && qtValue != 0 && pcValue != 0)
                {
                    cablagePrixLabels[i].Text = (ActualPrice(cablageList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue)).ToString();
                    commissionCablage[i] = CommissionPrice(cablageList.Single(u => u.Id == dropDownListValue).PU, qtValue, pcValue);
                    cablageMaintenanceLabels[i].Text = "0.00";
                }
                else
                {
                    cablagePrixLabels[i].Text = "";
                    commissionCablage[i] = 0;
                    cablageMaintenanceLabels[i].Text = "";
                }
            }
        }

        private void CalculateCommission()
        {
            decimal totalCommissionProduits;
            decimal totalCommissionMaintenance;

            totalCommissionProduits = commissionAudit + commissionFanBox + commissionSwitch + commissionPrestation + commissionAccessoires;
            totalCommissionMaintenance = commissionMaintenanceFanBox + commissionMaitenanceAccessoires + commissionMaitenanceSwitch;

            for (int i = 0; i < antenneDropDownLists.Count; i++)
            {
                totalCommissionProduits += commissionAntennes[i];
                totalCommissionMaintenance += commissionMaintenanceAntennes[i];
            }
            for (int i = 0; i < cablageDropDownLists.Count; i++)
            {
                totalCommissionProduits += commissionCablage[i];
            }
            for (int i = 0; i < diversDropDownLists.Count; i++)
            {
                totalCommissionProduits += commissionDivers[i];
                totalCommissionMaintenance += commissionMaintenanceDivers[i];
            }

            if (Int32.Parse(facturationMaintenanceDropDownList.SelectedValue) == 0 && Int32.Parse(maintenanceDropDownList.SelectedValue) != 0)
                totalCommissionMaintenance /= Int32.Parse(maintenanceDropDownList.SelectedValue);

            commRevendeurOneShotTextBox.Text = Math.Round(totalCommissionProduits, 2).ToString("0.00");
            commRevendeurMaintenanceTextBox.Text = Math.Round(totalCommissionMaintenance, 2).ToString("0.00");
        }

        private void CalculateFullDevis()
        {
            decimal totalPrix = 0;
            decimal totalMaintenance = 0;

            CalculateAudit();
            CalculateAntennes();
            CalculateFanBox();
            CalculateSwitch();
            CalculatePrestation();
            CalculateCablage();
            CalculateAccessoires();
            CalculateDivers();

            if (!String.IsNullOrEmpty(auditPrix.Text)) totalPrix += Decimal.Parse(auditPrix.Text);

            if (!String.IsNullOrEmpty(fanBoxPrix.Text)) totalPrix += Decimal.Parse(fanBoxPrix.Text);
            if (!String.IsNullOrEmpty(fanBoxMaintenance.Text)) totalMaintenance += Decimal.Parse(fanBoxMaintenance.Text);

            if (!String.IsNullOrEmpty(switchPrix.Text)) totalPrix += Decimal.Parse(switchPrix.Text);
            if (!String.IsNullOrEmpty(switchMaintenance.Text)) totalMaintenance += Decimal.Parse(switchMaintenance.Text);

            if (!String.IsNullOrEmpty(prestationPrix.Text)) totalPrix += Decimal.Parse(prestationPrix.Text);

            if (!String.IsNullOrEmpty(accessoirePrix.Text)) totalPrix += Decimal.Parse(accessoirePrix.Text);
            if (!String.IsNullOrEmpty(accessoireMaintenance.Text)) totalMaintenance += Decimal.Parse(accessoireMaintenance.Text);

            for (int i = 0; i < antenneDropDownLists.Count; i++)
            {
                if (!String.IsNullOrEmpty(antennePrixLabels[i].Text)) totalPrix += Decimal.Parse(antennePrixLabels[i].Text);
                if (!String.IsNullOrEmpty(antenneMaintenanceLabels[i].Text)) totalMaintenance += Decimal.Parse(antenneMaintenanceLabels[i].Text);
            }

            for (int i = 0; i < diversDropDownLists.Count; i++)
            {
                if (!String.IsNullOrEmpty(diversPrixLabels[i].Text)) totalPrix += Decimal.Parse(diversPrixLabels[i].Text);
                if (!String.IsNullOrEmpty(diversMaintenanceLabels[i].Text)) totalMaintenance += Decimal.Parse(diversMaintenanceLabels[i].Text);
            }

            for (int i = 0; i < cablageDropDownLists.Count; i++)
            {
                if (!String.IsNullOrEmpty(cablagePrixLabels[i].Text)) totalPrix += Decimal.Parse(cablagePrixLabels[i].Text);
                if (!String.IsNullOrEmpty(cablagePrixForfaitTextBoxes[i].Text)) totalPrix += Decimal.Parse(cablagePrixForfaitTextBoxes[i].Text);
            }

            totalProduitsHTVATextBox.Text = Math.Round(totalPrix, 2).ToString("0.00");
            totalMaintenanceHTVATextBox.Text = Math.Round(totalMaintenance, 2).ToString("0.00");


            CalculateCommission();
        }
    }
}