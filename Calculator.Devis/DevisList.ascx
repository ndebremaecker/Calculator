<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DevisList.ascx.cs" Inherits="Calculator.DevisGenerator.DevisList" %>

<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<div style="text-align: center">
    <asp:Label ID="logInPromptLabel" runat="server" Visible="false" Style="display: inline-block; font-size: 1.1em; font-weight: 600; padding: 20px;">
    Vous devez être authentifié pour accéder aux devis
    </asp:Label>
</div>

<div style="text-align: right;">
    <ul class="dnnActions dnnClear" style="display: inline-block; padding-right: 10px;">
        <li style="font-size: 1em;">
            <asp:LinkButton ID="allDevisButton" runat="server" CssClass="dnnSecondaryAction" Text="Tous les devis" OnClick="ShowAllDevis">
            </asp:LinkButton>
        </li>
        <li style="font-size: 1em;">
            <asp:LinkButton ID="userDevisButton" runat="server" CssClass="dnnSecondaryAction" Text="Mes devis" OnClick="ShowUserDevis">
            </asp:LinkButton>
        </li>
    </ul>
</div>

<div id="devis">
    <div style="padding: 20px">     
        <asp:DataGrid ID="devisDataGrid" runat="server" AutoGenerateColumns="false" GridLines="None">
            <HeaderStyle CssClass="devisListHeader" />
            <PagerStyle Mode="NumericPages" Height="40px" HorizontalAlign="Center" VerticalAlign="Bottom"/>
            <ItemStyle CssClass="devisListRow" />
            <Columns>
                <asp:BoundColumn
                    DataField="NomSociete"
                    HeaderStyle-Width="100px"
                    HeaderText="Société"></asp:BoundColumn>
                <asp:BoundColumn
                    DataField="NomClientComplet"
                    HeaderStyle-Width="100px"
                    HeaderText="Client"></asp:BoundColumn>
                <asp:BoundColumn
                    DataField="TelDirect"
                    HeaderStyle-Width="100px"
                    HeaderText="Tél direct"></asp:BoundColumn>
                <asp:BoundColumn
                    DataField="Email"
                    HeaderStyle-Width="150px"
                    HeaderText="Email"></asp:BoundColumn>                
                <asp:BoundColumn
                    DataField="TotalHTVACombined"
                    HeaderStyle-Width="100px"
                    HeaderText="Total HTVA"></asp:BoundColumn>
                <asp:BoundColumn
                    DataField="DateCreationAsString"
                    HeaderStyle-Width="130px"
                    HeaderText="Date création"></asp:BoundColumn>
                <asp:BoundColumn
                    DataField="DevisSigneAsString"
                    HeaderStyle-Width="70px"
                    HeaderText="Signé ?"></asp:BoundColumn>
                <asp:BoundColumn
                    DataField="DateSignatureAsString"
                    HeaderStyle-Width="130px"
                    HeaderText="Date signature"></asp:BoundColumn>
                <asp:TemplateColumn>
                    <HeaderStyle Width="75px" />
                    <ItemTemplate>
                        <asp:HyperLink ID="ViewHyperLink1" runat="server"
                            NavigateUrl='<%# ModuleContext.EditUrl("Id",  Eval("Id").ToString(), "View") %>'
                            Text="Consulter">
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderStyle Width="75px" />
                    <ItemTemplate>
                        <asp:HyperLink ID="EditHyperLink1" runat="server"
                            NavigateUrl='<%# ModuleContext.EditUrl("Id",  Eval("Id").ToString(), "Edit") %>'
                            Text="Modifier">
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateColumn>                
                <asp:TemplateColumn>
                    <HeaderStyle Width="75px" />
                    <ItemTemplate>
                        <asp:HyperLink ID="DeleteHyperLink1" runat="server"
                            NavigateUrl='<%# ModuleContext.EditUrl("Id",  Eval("Id").ToString(), "Delete") %>'
                            Text="Effacer">
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
    </div>
</div>


<%-- ReSharper disable UnknownCssClass --%>
<ul class="dnnActions dnnClear" style="padding-left: 10px; padding-top: 0;">
    <li>
        <asp:HyperLink ID="addButton" runat="server" CssClass="dnnPrimaryAction" Text="Nouveau Devis" Style="font-size: 90%;">
        </asp:HyperLink>
    </li>
</ul>
<%-- ReSharper restore UnknownCssClass --%>