<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClientList.ascx.cs" Inherits="Calculator.Clients.ClientList" %>

<%-- ReSharper disable UnknownCssClass --%>
    <ul class="dnnActions dnnClear floatRight">
        <li>
            <asp:HyperLink ID="addButton" runat="server"
                CssClass="btn btn-primary"
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
            <div class="col-sm-12">
                <div class="card listItem">
                    <div class="card-body">
                        <asp:HyperLink ID="Hyperlink1" runat="server"
                            NavigateUrl='<%# ModuleContext.EditUrl("id",  Eval("id").ToString(), "View") %>'>
                            <asp:Image runat="server" ImageUrl="~/desktopmodules/Calculator/Clients/Images/blankuser.png" 
                                CssClass="profileImg" />
                            <h5 class="card-title">
                                <asp:Label ID="First_Name" Text='<%# Eval("First_Name") %>' runat="server" /> &nbsp;
                                <asp:Label ID="Last_Name" Text='<%# Eval("Last_Name") %>' runat="server" />
                        </asp:HyperLink> &nbsp;
                            <asp:Label ID="lblAccount_Name" Text='<%# Eval("_Account_Name.name") %>' runat="server" CssClass="chocolateItalic" />
                            </h5>
                        <p class="card-text"><%# Eval("Email") %> / <%# Eval("Phone")%> / <%# Eval("Mobile") %> <br />
                            <%# Eval("Title") %>  /  <%#  Eval("Department") %>  /  <%# Eval("Lead_Source")  %>
                            <span style="float: right; margin-top: -30px; font-style: italic; color:lightgray"> <%# Eval("Created_Time") %></span>
                        </p>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
