<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeleteDevis.ascx.cs" Inherits="Calculator.DevisGenerator.DeleteDevis" %>

<div id="actionDeniedDiv" runat="server" visible="false">
    <div style="text-align: center; font-size: 1.1em; font-weight: 600; padding: 20px;">
        Seuls les administrateurs peuvent supprimer un devis signé.
    </div>
    <div style="text-align: center;">
        <ul class="dnnActions dnnClear" style="display: inline-block;">
            <li style="font-size: 1em;">
                <asp:LinkButton runat="server" CssClass="dnnSecondaryAction" Text="Annuler" OnClick="CancelDelete">
                </asp:LinkButton>
            </li>
        </ul>
    </div>
</div>

<div id="deleteConfirmationDiv" runat="server">
    <div style="text-align: center; font-size: 1.1em; padding: 20px;">
        Vous êtes sur le point d'effacer le devis de 
    <asp:Label ID="nomSocieteLabel" runat="server" Style="font-weight: 800;"></asp:Label>
        du 
    <asp:Label ID="dateCreationLabel" runat="server" Style="font-weight: 600;"></asp:Label>
        ! 
    Êtes-vous sûr ?
    </div>

    <div style="text-align: center;">
        <ul class="dnnActions dnnClear" style="display: inline-block;">
            <li style="font-size: 1em;">
                <asp:LinkButton runat="server" CssClass="dnnPrimaryAction" Text="Confirmer la suppression" OnClick="ConfirmDelete">
                </asp:LinkButton>
            </li>
            <li style="font-size: 1em;">
                <asp:LinkButton runat="server" CssClass="dnnSecondaryAction" Text="Annuler" OnClick="CancelDelete">
                </asp:LinkButton>
            </li>
        </ul>
    </div>
</div>
