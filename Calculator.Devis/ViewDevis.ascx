﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewDevis.ascx.cs" Inherits="Calculator.DevisGenerator.ViewDevis" %>

<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<dnn:DnnJsInclude runat="server" FilePath="~/desktopmodules/Calculator/Devis/jsPDF/jsPDF/dist/jspdf.min.js" />
<dnn:DnnJsInclude runat="server" FilePath="~/desktopmodules/Calculator/Devis/jsPDF/html2canvas.js" />

<asp:Label runat="server" ID="debug" Text="" Style="font-weight: 600;" />

<div id="devisBody" class="devisBody" style="margin-left: auto; margin-right: auto;">

    <div class="devisHeader">
        <div class="devisHeaderLeft">
            <span class="italicBold" style="font-size: 1.2em;">Computer Telecom sprl
            </span>
            <br />
            <span class="italic">Chaussée du pont du sart 232<br />
                7110 Houdeng-Almeries<br />
                BE0878.785.851<br />
                www.computer-telecom.be
            </span>
        </div>
        <div class="devisHeaderCentral">
            <div class="devisH1">
                Offre budgétaire
            </div>
        </div>
        <div class="devisHeaderRight">
            <asp:Image ImageUrl="~/desktopmodules/Calculator/Devis/Images/logo_CT.jpg" Style="height: 90px;" runat="server" />&nbsp;
        <asp:Image ImageUrl="~/desktopmodules/Calculator/Devis/Images/logo_ProximusICTE.jpg" Style="height: 90px;" runat="server" />
        </div>
    </div>

    <table class="devisTable">
        <tr>
            <td>
                <span class="italicBold">Nom de la soc : </span>
                <asp:Label ID="nomSocieteLabel" runat="server" class="italicBold"></asp:Label>
            </td>
            <td>
                <span class="italicBold">Nom & Prénom : </span>
                <asp:Label ID="nomClientLabel" runat="server" class="italicBold"></asp:Label>&nbsp;
                <asp:Label ID="prenomClientLabel" runat="server" class="italicBold"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <span>Adresse de la soc :</span>
                <asp:Label ID="adresseSocieteLabel" runat="server"></asp:Label>
            </td>
            <td>
                <span>N° tél direct :</span>
                <asp:Label ID="telDirectLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <span>Adresse de facturation :</span>
                <asp:Label ID="adresseFacturationLabel" runat="server"></asp:Label>
            </td>
            <td>
                <span>Adresse e-mail :</span>
                <asp:Label ID="emailLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <span>Adresse d'install :</span>
                <asp:Label ID="adresseInstallationLabel" runat="server"></asp:Label>
            </td>
            <td>
                <span>Nom & Prénom IT :</span>
                <asp:Label ID="nomITLabel" runat="server"></asp:Label>&nbsp;
                <asp:Label ID="prenomITLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <span>N° tél général de la soc :</span>
                <asp:Label ID="telSocieteLabel" runat="server"></asp:Label>
            </td>
            <td>
                <span>N° tél IT :</span>
                <asp:Label ID="telITLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <span>N° d'entreprise :</span>
                <asp:Label ID="numeroEntrepriseLabel" runat="server"></asp:Label>
            </td>
            <td>
                <span>Adresse e-mail IT :</span>
                <asp:Label ID="emailITLabel" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    <asp:Panel runat="server" ID="panelAudit"></asp:Panel>
    <asp:Panel runat="server" ID="panelAntennes"></asp:Panel>
    <asp:Panel runat="server" ID="panelFanBox"></asp:Panel>
    <asp:Panel runat="server" ID="panelSwitch"></asp:Panel>
    <asp:Panel runat="server" ID="panelPrestationDeServiceIT"></asp:Panel>
    <asp:Panel runat="server" ID="panelCablageEtGestion"></asp:Panel>
    <asp:Panel runat="server" ID="panelAccessoires"></asp:Panel>
    <asp:Panel runat="server" ID="panelDivers"></asp:Panel>


    <div class="devisPriceBox">
        <div>
            <span>Total HTVA</span>
            <span style="padding-left: 30px; font-style: normal;">€&nbsp;</span>
            <asp:Label ID="totalProduitsHTVALabel" runat="server" Style="font-style: normal;"></asp:Label>
            <span style="padding-left: 50px; font-style: normal;">€&nbsp;</span>
            <asp:Label ID="totalMaintenanceHTVALabel" runat="server" Style="font-style: normal;"></asp:Label>
        </div>
        <div id="maintenanceExplanationDiv" runat="server" visible="false">
            <asp:Label ID="maintenanceExplanationLabel" runat="server"></asp:Label>
            <span style="padding-left: 138px; font-style: normal;">€&nbsp;</span>
            <asp:Label ID="totalMaintenanceTrancheLabel" runat="server" Style="font-style: normal;"></asp:Label>
        </div>
    </div>

    <table class="devisTable">
        <tr>
            <td>
                <span class="italicBold purple">Le client (Nom, prénom) : </span>
            </td>
            <td>
                <span class="italicBold purple">Gestionnaire du dossier (Nom, prénom) : </span>
            </td>
        </tr>
        <tr>
            <td>
                <span>Date :</span>
            </td>
            <td>
                <span>Date :</span>
            </td>
        </tr>
        <tr>
            <td>
                <span>Pour accord :</span>
            </td>
            <td>
                <span>Pour accord :</span>
            </td>
        </tr>
        <tr>
            <td style="padding-bottom: 60px;">
                <span>Signature :</span>
                <span style="float: right; padding-right: 10px;">Autoliquidation (Oui / Non)</span>
            </td>
            <td style="padding-bottom: 60px;">
                <span>Signature :</span>
            </td>
        </tr>
    </table>

    <div class="devisBox" style="min-height: 70px;">
        <span style="font-size: 1.1em; text-decoration: underline;">Remarques :</span>
        <br />
        <asp:Label ID="remarquesLabel" runat="server"></asp:Label>
    </div>

    <div class="devisBoxDisclaimer">
        <span>
            Le signataire garantit qu'il détient les pouvoirs et l'autorité nécessaires pour accorder la réception de l'installation, ainsi que pour exécuter les obligations qui en découlent. 
            Ce document ('budgétaire') est purement présenté à titre d'information et donc non soumis à une date de validité. Certains prix fluctuent en fonction du cours du USD, ou 
            chez nos distributeurs. Un bon de commande ferme, validé par du personnel technique suivra après votre accord sur ce document.
        </span>
    </div>

</div>

<div style="display: none;">
    <ul class="dnnActions dnnClear">
        <li>
            <button id="downloadPdfButton" type="button" class="dnnPrimaryAction">Télécharger en PDF</button>
            <span id="downloadStatusLabel" style="font-weight: 600;"></span>
        </li>
    </ul>
</div>

<div style="margin-top: 20px;">
    <asp:Label ID="PDFExistsLabel" runat="server" Style="font-weight: 600;"></asp:Label>
    <br />
    <asp:Label ID="UploadStatusLabel" runat="server" Style="font-weight: 600;"></asp:Label>
</div>

<asp:TextBox ID="pdfString" runat="server" Style="display: none;"></asp:TextBox>

<div>
    <ul class="dnnActions dnnClear">
        <li>
            <button id="uploadPdfButton" type="button" class="dnnPrimaryAction" style="width: 140px;">Uploader PDF</button>
            <asp:Button ID="uploadPdfFinalButton" runat="server" Text="Envoi" OnClick="UploadPDF" class="dnnPrimaryAction" Style="display: none; width: 140px;" />
            <span id="tempUploadStatusLabel" style="font-weight: 600;"></span>
        </li>
    </ul>
</div>


<script>
    $(document).ready(function () {
        $("#downloadPdfButton").click(function () {
            $("#downloadStatusLabel").text("Préparation du PDF en cours...");
            var pageWidth = $('#devisBody').width();
            var pageHeight = $('#devisBody').height();
            var margin = 15;
            var pdfWidth = pageWidth + (margin * 2);
            var pdfHeight = pageHeight + (margin * 2);

            html2canvas(document.querySelector('#devisBody'),
                { scale: 3 }
            ).then(canvas => {
                var nomSociete = $('#<%=nomSocieteLabel.ClientID%>').text();
                var filename = ('Devis ' + nomSociete).replace(/[\W_]+/g, ' '); + '.pdf';
                let pdf = new jsPDF('p', 'pt', [pdfWidth, pdfHeight], true);
                pdf.addImage(canvas.toDataURL('image/png'), 'PNG', margin, margin, pageWidth, pageHeight, '', 'FAST');
                $("#downloadStatusLabel").text("");
                pdf.save(filename);
            });
        });

        
        $("#uploadPdfButton").click(function () {
            $("#tempUploadStatusLabel").text("Préparation du PDF en cours...");
            var pageWidth = $('#devisBody').width();
            var pageHeight = $('#devisBody').height();
            var margin = 15;
            var pdfWidth = pageWidth + (margin * 2);
            var pdfHeight = pageHeight + (margin * 2);

            html2canvas(document.querySelector('#devisBody'),
                { scale: 3 }
            ).then(canvas => {
                var nomSociete = $('#<%=nomSocieteLabel.ClientID%>').text();
                var filename = ('Devis ' + nomSociete).replace(/[\W_]+/g, ' '); + '.pdf';
                let pdf = new jsPDF('p', 'pt', [pdfWidth, pdfHeight], true);
                pdf.addImage(canvas.toDataURL('image/png'), 'PNG', margin, margin, pageWidth, pageHeight, '', 'FAST');
                var binary = btoa(pdf.output());
                $("#<%=pdfString.ClientID%>").val(binary);
                $("#uploadPdfButton").hide();
                $("#<%=uploadPdfFinalButton.ClientID%>").show();
                $("#tempUploadStatusLabel").text("Le PDF est prêt. Appuyez sur Envoi.");
            });
        });
    });
</script>
