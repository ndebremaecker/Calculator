<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductList.ascx.cs" Inherits="Calculator.Products.ProductList" %>

<asp:DataGrid ID="products" runat="server"
    AutoGenerateColumns="false"
    GridLines="None"
    OnItemCommand="DeleteProduct">

    <HeaderStyle CssClass="productListHeader" />
    <ItemStyle CssClass="productListRow" />
    <Columns>
        <asp:BoundColumn DataField="Product_Category"
            HeaderText="Product_Category"></asp:BoundColumn>
        <asp:BoundColumn DataField="Qty_in_Demand"
            HeaderText="Qty_in_Demand"></asp:BoundColumn>
        <asp:BoundColumn DataField="Description"
            HeaderText="Description"></asp:BoundColumn>
        <asp:BoundColumn DataField="Modified_By"
            HeaderText="Modified_By"></asp:BoundColumn>
        <asp:BoundColumn DataField="Product_Code"
            HeaderText="Product_Code"></asp:BoundColumn>
        <asp:BoundColumn DataField="Manufacturer"
            HeaderText="Manufacturer"></asp:BoundColumn>
        <asp:BoundColumn DataField="Product_Name"
            HeaderText="Product_Name"></asp:BoundColumn>
        <asp:BoundColumn DataField="Usage_Unit"
            HeaderText="Usage_Unit"></asp:BoundColumn>
        <asp:BoundColumn DataField="Qty_Ordered"
            HeaderText="Qty_Ordered"></asp:BoundColumn>
        <asp:BoundColumn DataField="Qty_in_Stock"
            HeaderText="Qty_in_Stock"></asp:BoundColumn>
        <asp:BoundColumn DataField="Unit_Price"
            HeaderText="Unit_Price"></asp:BoundColumn>

        <asp:TemplateColumn>
            <HeaderStyle Width="75px" />
            <ItemTemplate>
                <asp:HyperLink ID="Hyperlink1" runat="server"
                    NavigateUrl='<%# ModuleContext.EditUrl("id", Eval("id").ToString(), "Edit") %>'
                    Text="Edit">
                </asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn>
            <HeaderStyle Width="75px" />
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server"
                    CommandArgument='<%# Eval("id") %>'
                    CommandName="Delete"
                    Text="Delete">
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateColumn>
    </Columns>
</asp:DataGrid>



<%-- ReSharper disable UnknownCssClass --%>
<ul class="dnnActions dnnClear">
    <li>
        <asp:HyperLink ID="addButton" runat="server"
            CssClass="dnnPrimaryAction"
            Text="Create New Product">
        </asp:HyperLink>
    </li>
</ul>
<%-- ReSharper restore UnknownCssClass --%>