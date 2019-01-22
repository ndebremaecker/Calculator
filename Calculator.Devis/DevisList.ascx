<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DevisList.ascx.cs" Inherits="Calculator.DevisGenerator.DevisList" %>

<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<div id="devis">
    <div style="padding: 20px">
        <asp:DataGrid ID="devisDataGrid" runat="server" AutoGenerateColumns="false" GridLines="None" OnItemCommand="DeleteDevis">
            <HeaderStyle CssClass="devisListHeader" />
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
                        <asp:LinkButton ID="LinkButton1" runat="server"
                            CommandArgument='<%# Eval("Id") %>'
                            CommandName="Delete"
                            Text="Effacer">
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
    </div>
</div>

<%-- ReSharper disable UnknownCssClass --%>
<ul class="dnnActions dnnClear" style="padding-left: 10px;">
    <li>
        <asp:HyperLink ID="addButton" runat="server" CssClass="dnnPrimaryAction" Text="Nouveau Devis">
        </asp:HyperLink>
    </li>
</ul>
<%-- ReSharper restore UnknownCssClass --%>