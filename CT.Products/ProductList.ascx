<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductList.ascx.cs" Inherits="Calculator.Products.ProductList" %>

<%--<asp:DataGrid ID="products" runat="server"
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
</asp:DataGrid>--%>



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

<div class="row">
    <asp:Repeater ID="products" runat="server"
        OnItemCommand="DeleteProduct">
        <ItemTemplate>
            <div class="col-sm-12">
                <div class="card" style="padding: 15px 0 15px 10px; border-bottom: 1px solid lightgrey;">
                    <div class="card-body">
                        <asp:Image runat="server" ImageUrl="~/desktopmodules/Calculator/Products/Images/empty-photo.jpg"
                            Style="float: left; padding: 5px; margin: 5px; margin-right: 15px; border: 1px solid lightgrey; border-radius: 5px; width: 80px; height: 80px;" />
                        <h5 class="card-title">
                            <asp:HyperLink ID="Hyperlink1" runat="server"
                                NavigateUrl='<%# ModuleContext.EditUrl("id", Eval("id").ToString(), "Edit") %>'
                                ForeColor="Blue">
                                <asp:Label ID="First_Name" Text='<%# Eval("Product_Name") %>' runat="server" />
                            </asp:HyperLink>
                        </h5>
                        <p class="card-text">
                            <%# Eval("Unit_Price") %>
                            <br />
                            En stock /  <%# Eval("Qty_in_Stock")  %>
                            <span style="float: right; margin-top: -30px; font-style: italic; color: lightgray"><%# Eval("Created_Time") %></span>
                        </p>
                    </div>
                    <div class="card-footer" style="float: right; margin-top: -25px">
                        
                        
                        <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" runat="server"
                            CommandArgument='<%# Eval("id") %>'
                            CommandName="Delete"
                            Text="Delete">
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
