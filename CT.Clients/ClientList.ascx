<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClientList.ascx.cs" Inherits="Calculator.Clients.ClientList" %>

<%-- ReSharper disable UnknownCssClass --%>
    <ul class="dnnActions dnnClear">
        <li>
            <asp:HyperLink ID="addButton" runat="server"
                CssClass="dnnPrimaryAction"
                Text="Create New Client">
            </asp:HyperLink>
        </li>
    </ul>
<%-- ReSharper restore UnknownCssClass --%>


<%--<asp:DataGrid ID="clients" runat="server"
    AutoGenerateColumns="false"
    GridLines="None"
    OnItemCommand="DeleteClient">
    <HeaderStyle CssClass="clientListHeader" />
    <ItemStyle CssClass="clientListRow" />
    <Columns>
        <asp:BoundColumn DataField="Full_Name" 
                  HeaderText="Full_Name" ></asp:BoundColumn> 
        <asp:BoundColumn DataField="Title" 
                  HeaderText="Title" ></asp:BoundColumn> 
        <asp:BoundColumn DataField="First_Name" 
                  HeaderText="First_Name" ></asp:BoundColumn> 
        <asp:BoundColumn DataField="Last_Name" 
                  HeaderText="Last_Name" ></asp:BoundColumn> 
        <asp:BoundColumn DataField="Email" 
                  HeaderText="Email" ></asp:BoundColumn> 
        <asp:BoundColumn DataField="Description" 
                  HeaderText="Description" ></asp:BoundColumn> 
        <asp:BoundColumn DataField="Phone" 
                  HeaderText="Phone" ></asp:BoundColumn> 
        <asp:BoundColumn DataField="Mobile" 
                  HeaderText="Mobile" ></asp:BoundColumn>
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

<div class="row">
    <asp:Repeater ID="clients" runat="server"
        OnItemCommand="DeleteClient">
        <ItemTemplate>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label ID="Age" Text='<%# Eval("First_Name") %>' runat="server" />
                            <asp:Label ID="Label1" Text='<%# Eval("Last_Name") %>' runat="server" /></h5>
                        <p class="card-text"><%# Eval("Email") %></p>
                        <asp:Hyperlink Cssclass="btn btn-primary" ID="Hyperlink1" runat="server"
                            NavigateUrl='<%# ModuleContext.EditUrl("id", Eval("id").ToString(), "Edit") %>'
                            Text="Edit" ForeColor="White">
                        </asp:Hyperlink>
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
