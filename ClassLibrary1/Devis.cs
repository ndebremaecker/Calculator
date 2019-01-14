using System;

namespace Calculator.Model
{
    public class Devis
    {
        public int Id { get; set; }
        public string NomSociete { get; set; }
        public string AdresseSociete { get; set; }
        public string AdresseFacturation { get; set; }
        public string AdresseInstallation { get; set; }
        public string TelSociete { get; set; }
        public string NumeroEntreprise { get; set; }
        public string NomClient { get; set; }
        public string PrenomClient { get; set; }
        public string TelDirect { get; set; }
        public string Email { get; set; }
        public string NomIT { get; set; }
        public string PrenomIT { get; set; }
        public string TelIT { get; set; }
        public string EmailIT { get; set; }
        public decimal TotalHTVA { get; set; }
        public DateTime DateSignature { get; set; }
        public bool Autoliquidation { get; set; }
        public bool DevisSigne { get; set; }
        public string Remarques { get; set; }
        public DateTime DateCreation { get; set; }
        public string PathPDF { get; set; }
        public DateTime DateUploadPDF { get; set; }

        public string NomClientComplet { get; set; }
        public string DateSignatureAsString { get; set; }
        public string DevisSigneAsString { get; set; }
        public string DateCreationAsString { get; set; }
        public string DateUploadPDFAsString { get; set; }
    }
}