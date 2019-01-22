<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditDevis.ascx.cs" Inherits="Calculator.DevisGenerator.EditDevis" %>

<%-- ReSharper disable UnknownCssClass --%>
<div id="dnnUsers" class="dnnForm dnnClear">
    <p>* dénote un champ obligatoire</p>
    <span runat="server" id="debug"></span>
    <fieldset>
        <div class="calculatorHeader">
            <span>INFORMATIONS DE CONTACT</span>
        </div>
        <br />
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


        <div class="calculatorHeader">
            <span>CALCULATEUR DE DEVIS</span>
        </div>
        <br />
        <div class="calculatorWrapper">

            <div style="text-align: center;">
                <span style="display: inline-block; font-weight: 600; width: 266px; text-align: left;">PERIODICITE MAINTENANCE : </span>
                <asp:DropDownList ID="maintenanceDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="MaintenanceSelected"
                    Style="width: 172px;">
                    <asp:ListItem Text="Pas de maintenance" Value="0"></asp:ListItem>
                    <asp:ListItem Text="3 ans" Value="3"></asp:ListItem>
                    <asp:ListItem Text="5 ans" Value="5"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div id="facturationMaintenance" runat="server" visible="false" style="margin-top: 6px; text-align: center;">
                <span style="display: inline-block; font-weight: 600; width: 266px; text-align: left;">PERIODICITE FACTURATION MAINTENANCE : </span>
                <asp:DropDownList ID="facturationMaintenanceDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="FacturationMaintenanceSelected"
                    Style="width: 172px;">
                    <asp:ListItem Text="Par an" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Toute la durée du contrat" Value="1"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div style="margin: 20px 0;">% : entre 3 et 50</div>

            <asp:Table ID="auditTable" runat="server" CssClass="calculatorTable">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>AUDIT</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Qt</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Unit.</asp:TableHeaderCell>
                    <asp:TableHeaderCell>%</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Prix</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Maint.</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="auditDropDownList" runat="server" CssClass="calculatorList" AutoPostBack="True"
                            OnSelectedIndexChanged="AuditItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="auditQt" runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="auditUnit" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="auditPc" runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="auditPrix" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="auditMaintenance" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Table ID="antennesTable" runat="server" CssClass="calculatorTable">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>ANTENNES</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Qt</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Unit.</asp:TableHeaderCell>
                    <asp:TableHeaderCell>%</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Prix</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Maint.</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" CssClass="calculatorList _DDList" AutoPostBack="True"
                            OnSelectedIndexChanged="AntenneItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Qt"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Unit"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Pc">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Prix"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Maintenance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" CssClass="calculatorList _DDList" AutoPostBack="True"
                            OnSelectedIndexChanged="AntenneItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Qt"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Unit"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Pc">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Prix"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Maintenance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" CssClass="calculatorList _DDList" AutoPostBack="True"
                            OnSelectedIndexChanged="AntenneItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Qt"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Unit"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Pc">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Prix"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Maintenance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Table ID="fanBoxTable" runat="server" CssClass="calculatorTable">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>FANBOX</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Qt</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Unit.</asp:TableHeaderCell>
                    <asp:TableHeaderCell>%</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Prix</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Maint.</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="fanBoxDropDownList" runat="server" CssClass="calculatorList" AutoPostBack="True"
                            OnSelectedIndexChanged="FanBoxItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="fanBoxQt" runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="fanBoxUnit" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="fanBoxPc" runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="fanBoxPrix" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="fanBoxMaintenance" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Table ID="switchTable" runat="server" CssClass="calculatorTable">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>SWITCH</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Qt</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Unit.</asp:TableHeaderCell>
                    <asp:TableHeaderCell>%</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Prix</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Maint.</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="switchDropDownList" runat="server" CssClass="calculatorList" AutoPostBack="True"
                            OnSelectedIndexChanged="SwitchItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="switchQt" runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="switchUnit" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="switchPc" runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="switchPrix" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="switchMaintenance" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Table ID="prestationTable" runat="server" CssClass="calculatorTable">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>PRESTATION DE SERVICE IT</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Qt</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Unit.</asp:TableHeaderCell>
                    <asp:TableHeaderCell>%</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Prix</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Maint.</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="prestationDropDownList" runat="server" CssClass="calculatorList" AutoPostBack="True"
                            OnSelectedIndexChanged="PrestationItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="prestationQt" runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="prestationUnit" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="prestationPc" runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="prestationPrix" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="prestationMaintenance" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Table ID="cablageTable" runat="server" CssClass="calculatorTable">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>CABLAGE ET GESTION</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Qt</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Unit.</asp:TableHeaderCell>
                    <asp:TableHeaderCell>%</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Prix</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Maint.</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" CssClass="calculatorList _DDList" AutoPostBack="True"
                            OnSelectedIndexChanged="CablageItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Qt"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Unit"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Pc">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Prix"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="8" OnKeyPress="return isNumberOrDot(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 46px; font-size: 99%;" CssClass="_PrixForfait" Visible="false"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Maintenance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" CssClass="calculatorList _DDList" AutoPostBack="True"
                            OnSelectedIndexChanged="CablageItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Qt"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Unit"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Pc">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Prix"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="8" OnKeyPress="return isNumberOrDot(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 46px; font-size: 99%;" CssClass="_PrixForfait" Visible="false"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Maintenance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" CssClass="calculatorList _DDList" AutoPostBack="True"
                            OnSelectedIndexChanged="CablageItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Qt"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Unit"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Pc">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Prix"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="8" OnKeyPress="return isNumberOrDot(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 46px; font-size: 99%;" CssClass="_PrixForfait" Visible="false"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Maintenance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" CssClass="calculatorList _DDList" AutoPostBack="True"
                            OnSelectedIndexChanged="CablageItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Qt"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Unit"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Pc">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Prix"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="8" OnKeyPress="return isNumberOrDot(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 46px; font-size: 99%;" CssClass="_PrixForfait" Visible="false"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Maintenance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" CssClass="calculatorList _DDList" AutoPostBack="True"
                            OnSelectedIndexChanged="CablageItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Qt"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Unit"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Pc">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Prix"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="8" OnKeyPress="return isNumberOrDot(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 46px; font-size: 99%;" CssClass="_PrixForfait" Visible="false"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Maintenance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Table ID="accessoiresTable" runat="server" CssClass="calculatorTable">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>ACCESSOIRES</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Qt</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Unit.</asp:TableHeaderCell>
                    <asp:TableHeaderCell>%</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Prix</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Maint.</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="accessoireDropDownList" runat="server" CssClass="calculatorList" AutoPostBack="True"
                            OnSelectedIndexChanged="AccessoireItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="accessoireQt" runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="accessoireUnit" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="accessoirePc" runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="accessoirePrix" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="accessoireMaintenance" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Table ID="diversTable" runat="server" CssClass="calculatorTable">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>DIVERS</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Qt</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Unit.</asp:TableHeaderCell>
                    <asp:TableHeaderCell>%</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Prix</asp:TableHeaderCell>
                    <asp:TableHeaderCell Style="min-width: 54px;">Maint.</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" CssClass="calculatorList _DDList" AutoPostBack="True"
                            OnSelectedIndexChanged="DiversItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Qt"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Unit"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Pc">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Prix"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Maintenance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" CssClass="calculatorList _DDList" AutoPostBack="True"
                            OnSelectedIndexChanged="DiversItemSelected">
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Qt"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Unit"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" MaxLength="2" OnKeyPress="return isNumber(event)" OnTextChanged="Recalculate"
                            AutoPostBack="True" Style="width: 16px;" CssClass="_Pc">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Prix"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" CssClass="_Maintenance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>

        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label runat="server" Text="TOTAL PRODUITS HTVA:" Style="font-weight: 600;"></asp:Label>
            </div>
            <asp:TextBox ID="totalProduitsHTVATextBox" runat="server" ReadOnly="true"
                Style="background-color: lightgray; font-weight: 600; text-align: right;"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label runat="server" Text="TOTAL MAINTENANCE HTVA:" Style="font-weight: 600;"></asp:Label>
            </div>
                <asp:TextBox ID="totalMaintenanceHTVATextBox" runat="server" ReadOnly="true"
                    Style="background-color: lightgray; font-weight: 600; text-align: right;"></asp:TextBox>
        </div>

        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label runat="server" Text="Comm revendeur One Shot:"></asp:Label>
            </div>
            <asp:TextBox ID="commRevendeurOneShotTextBox" runat="server" ReadOnly="true"
                Style="background-color: lightgray; text-align: right;"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="commRevendeurMaintenanceLabel" runat="server" Text="Comm revendeur Maintenance:"></asp:Label>
            </div>
            <asp:TextBox ID="commRevendeurMaintenanceTextBox" runat="server" ReadOnly="true"
                Style="background-color: lightgray; text-align: right;"></asp:TextBox>
            <br />
        </div>

        <div class="calculatorHeader">
            <span>SIGNATURE ET REMARQUES</span>
        </div>
        <br />
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="autoliquidationLabel" runat="server" Text="Autoliquidation ?"></asp:Label>
            </div>
            <asp:CheckBox ID="autoliquidationCheckBox" runat="server" Style="margin-top: 5px;" />
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="devisSigneLabel" runat="server" Text="Devis signé ?"></asp:Label>
            </div>
            <asp:CheckBox ID="devisSigneCheckBox" runat="server" Style="margin-top: 5px;" />
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

<script>
    function isNumber(e) {
        var charCode = (e.which) ? e.which : e.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
    function isNumberOrDot(e) {
        var charCode = (e.which) ? e.which : e.keyCode;
        if (charCode == 46) return true;
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
</script>
