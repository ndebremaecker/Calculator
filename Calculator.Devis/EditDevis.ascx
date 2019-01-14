<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditDevis.ascx.cs" Inherits="Calculator.DevisGenerator.EditDevis" %>

<%-- ReSharper disable UnknownCssClass --%>
<div id="dnnUsers" class="dnnForm dnnClear">
    <p>* dénote un champ obligatoire</p>
    <span runat="server" id="debug"></span>
    <fieldset>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="nomSocieteLabel" runat="server" Text="*Nom société:"></asp:Label>
            </div>
            <asp:TextBox ID="nomSocieteTextBox" runat="server" MaxLength="200"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" controltovalidate="nomSocieteTextBox" class="errorMessage" errormessage="Champ obligatoire !" />
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="adresseSocieteLabel" runat="server" Text="Adresse société:"></asp:Label>
            </div>
            <asp:TextBox ID="adresseSocieteTextBox" runat="server" MaxLength="4000"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="adresseFacturationLabel" runat="server" Text="Adresse facturation:"></asp:Label>
            </div>
            <asp:TextBox ID="adresseFacturationTextBox" runat="server" MaxLength="4000"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="adresseInstallationLabel" runat="server" Text="Adresse installation:"></asp:Label>
            </div>
            <asp:TextBox ID="adresseInstallationTextBox" runat="server" MaxLength="4000"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="telSocieteLabel" runat="server" Text="Téléphone société:"></asp:Label>
            </div>
            <asp:TextBox ID="telSocieteTextBox" runat="server" MaxLength="50"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="numeroEntrepriseLabel" runat="server" Text="N° d'entreprise:"></asp:Label>
            </div>
            <asp:TextBox ID="numeroEntrepriseTextBox" runat="server" MaxLength="50"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="nomClientLabel" runat="server" Text="*Nom client:"></asp:Label>
            </div>
            <asp:TextBox ID="nomClientTextBox" runat="server" MaxLength="50"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" controltovalidate="nomClientTextBox" class="errorMessage" errormessage="Champ obligatoire !" />
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="prenomClientLabel" runat="server" Text="*Prénom client:"></asp:Label>
            </div>
            <asp:TextBox ID="prenomClientTextBox" runat="server" MaxLength="50"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" controltovalidate="prenomClientTextBox" class="errorMessage" errormessage="Champ obligatoire !" />
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="telDirectLabel" runat="server" Text="Téléphone direct:"></asp:Label>
            </div>
            <asp:TextBox ID="telDirectTextBox" runat="server" MaxLength="50"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="emailLabel" runat="server" Text="Email:"></asp:Label>
            </div>
            <asp:TextBox ID="emailTextBox" runat="server" MaxLength="50"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="nomITLabel" runat="server" Text="Nom IT:"></asp:Label>
            </div>
            <asp:TextBox ID="nomITTextBox" runat="server" MaxLength="50"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="prenomITLabel" runat="server" Text="Prénom IT:"></asp:Label>
            </div>
            <asp:TextBox ID="prenomITTextBox" runat="server" MaxLength="50"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="telITLabel" runat="server" Text="Téléphone IT:"></asp:Label>
            </div>
            <asp:TextBox ID="telITTextBox" runat="server" MaxLength="50"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="emailITLabel" runat="server" Text="Email IT:"></asp:Label>
            </div>
            <asp:TextBox ID="emailITTextBox" runat="server" MaxLength="50"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="totalHTVALabel" runat="server" Text="*Total HTVA:"></asp:Label>
            </div>
            <asp:TextBox ID="totalHTVATextBox" runat="server" MaxLength="50"></asp:TextBox>
            <asp:RegularExpressionValidator runat="server" ControlToValidate="totalHTVATextBox" ValidationExpression="^\d*\.?\d*$" class="errorMessage" ErrorMessage="Valeur non valide !" />
        </div>        
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="autoliquidationLabel" runat="server" Text="Autoliquidation ?"></asp:Label>
            </div>
            <asp:CheckBox ID="autoliquidationCheckBox" runat="server" style="margin-top: 5px;"/>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="devisSigneLabel" runat="server" Text="Devis signé ?"></asp:Label>
            </div>
            <asp:CheckBox ID="devisSigneCheckBox" runat="server" style="margin-top: 5px;"/>
        </div>
        <br />
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="dateSignatureLabel" runat="server" Text="Date signature:"></asp:Label>
            </div>
            <asp:TextBox ID="dateSignatureTextBox" runat="server" MaxLength="50"></asp:TextBox>
            <asp:RegularExpressionValidator runat="server" ControlToValidate="dateSignatureTextBox" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[- /.](0?[1-9]|1[012])[- /.]([0-9]{2}|[0-9]{4})$" class="errorMessage" ErrorMessage="Date non valide !" />
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="remarquesLabel" runat="server" Text="Remarques:"></asp:Label>
            </div>
            <asp:TextBox ID="remarquesTextBox" runat="server" MaxLength="4000"></asp:TextBox>
        </div>
    </fieldset>
</div>

<ul class="dnnActions dnnClear">
    <li>
        <asp:LinkButton ID="saveButton" runat="server" CssClass="dnnPrimaryAction" OnClick="SaveDevis" Text="Sauver Devis"></asp:LinkButton>
    </li>
</ul>
<%-- ReSharper restore UnknownCssClass --%>