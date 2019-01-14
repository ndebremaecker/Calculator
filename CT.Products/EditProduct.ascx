<%@ Control AutoEventWireup="true"
    CodeBehind="EditProduct.ascx.cs"
    Inherits="Calculator.Products.EditProduct"
    Language="C#" %>

<%-- ReSharper disable UnknownCssClass --%>
<span id="debug" runat="server"></span>

<div id="dnnUsers" class="dnnForm dnnClear">
    <fieldset>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Product_CategoryLabel" runat="server" Text="Product_Category: "> </asp:Label>
            </div>
            <asp:TextBox ID="Product_CategoryTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Qty_in_DemandLabel" runat="server" Text="Qty_in_Demand: "> </asp:Label>
            </div>
            <asp:TextBox ID="Qty_in_DemandTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="OwnerLabel" runat="server" Text="Owner: "> </asp:Label>
            </div>
            <asp:TextBox ID="OwnerTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="DescriptionLabel" runat="server" Text="Description: "> </asp:Label>
            </div>
            <asp:TextBox ID="DescriptionTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="currency_symbolLabel" runat="server" Text="currency_symbol: "> </asp:Label>
            </div>
            <asp:TextBox ID="currency_symbolTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Vendor_NameLabel" runat="server" Text="Vendor_Name: "> </asp:Label>
            </div>
            <asp:TextBox ID="Vendor_NameTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Sales_Start_DateLabel" runat="server" Text="Sales_Start_Date: "> </asp:Label>
            </div>
            <asp:TextBox ID="Sales_Start_DateTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="TaxLabel" runat="server" Text="Tax: "> </asp:Label>
            </div>
            <asp:TextBox ID="TaxTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Product_ActiveLabel" runat="server" Text="Product_Active: "> </asp:Label>
            </div>
            <asp:TextBox ID="Product_ActiveTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Record_ImageLabel" runat="server" Text="Record_Image: "> </asp:Label>
            </div>
            <asp:TextBox ID="Record_ImageTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Modified_ByLabel" runat="server" Text="Modified_By: "> </asp:Label>
            </div>
            <asp:TextBox ID="Modified_ByTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Product_CodeLabel" runat="server" Text="Product_Code: "> </asp:Label>
            </div>
            <asp:TextBox ID="Product_CodeTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="process_flowLabel" runat="server" Text="process_flow: "> </asp:Label>
            </div>
            <asp:TextBox ID="process_flowTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="ManufacturerLabel" runat="server" Text="Manufacturer: "> </asp:Label>
            </div>
            <asp:TextBox ID="ManufacturerTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="idLabel" runat="server" Text="id: "> </asp:Label>
            </div>
            <asp:TextBox ID="idTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Support_Expiry_DateLabel" runat="server" Text="Support_Expiry_Date: "> </asp:Label>
            </div>
            <asp:TextBox ID="Support_Expiry_DateTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="approvedLabel" runat="server" Text="approved: "> </asp:Label>
            </div>
            <asp:TextBox ID="approvedTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="approvalLabel" runat="server" Text="approval: "> </asp:Label>
            </div>
            <asp:TextBox ID="approvalTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Modified_TimeLabel" runat="server" Text="Modified_Time: "> </asp:Label>
            </div>
            <asp:TextBox ID="Modified_TimeTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Created_TimeLabel" runat="server" Text="Created_Time: "> </asp:Label>
            </div>
            <asp:TextBox ID="Created_TimeTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Commission_RateLabel" runat="server" Text="Commission_Rate: "> </asp:Label>
            </div>
            <asp:TextBox ID="Commission_RateTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Product_NameLabel" runat="server" Text="Product_Name: "> </asp:Label>
            </div>
            <asp:TextBox ID="Product_NameTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="HandlerLabel" runat="server" Text="Handler: "> </asp:Label>
            </div>
            <asp:TextBox ID="HandlerTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="taxableLabel" runat="server" Text="taxable: "> </asp:Label>
            </div>
            <asp:TextBox ID="taxableTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="editableLabel" runat="server" Text="editable: "> </asp:Label>
            </div>
            <asp:TextBox ID="editableTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Support_Start_DateLabel" runat="server" Text="Support_Start_Date: "> </asp:Label>
            </div>
            <asp:TextBox ID="Support_Start_DateTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Usage_UnitLabel" runat="server" Text="Usage_Unit: "> </asp:Label>
            </div>
            <asp:TextBox ID="Usage_UnitTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Qty_OrderedLabel" runat="server" Text="Qty_Ordered: "> </asp:Label>
            </div>
            <asp:TextBox ID="Qty_OrderedTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Qty_in_StockLabel" runat="server" Text="Qty_in_Stock: "> </asp:Label>
            </div>
            <asp:TextBox ID="Qty_in_StockTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Created_ByLabel" runat="server" Text="Created_By: "> </asp:Label>
            </div>
            <asp:TextBox ID="Created_ByTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="TagLabel" runat="server" Text="Tag: "> </asp:Label>
            </div>
            <asp:TextBox ID="TagTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Sales_End_DateLabel" runat="server" Text="Sales_End_Date: "> </asp:Label>
            </div>
            <asp:TextBox ID="Sales_End_DateTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Unit_PriceLabel" runat="server" Text="Unit_Price: "> </asp:Label>
            </div>
            <asp:TextBox ID="Unit_PriceTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Label1" runat="server" Text="Taxable: "> </asp:Label>
            </div>
            <asp:TextBox ID="TextBox1" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
        <div class="dnnFormItem">
            <div class="dnnLabel">
                <asp:Label ID="Reorder_LevelLabel" runat="server" Text="Reorder_Level: "> </asp:Label>
            </div>
            <asp:TextBox ID="Reorder_LevelTextBox" runat="server" MaxLength="200"> 
            </asp:TextBox>
        </div>
    </fieldset>
</div>

<ul class="dnnActions dnnClear">
    <li>
        <asp:LinkButton ID="saveButton" runat="server"
            CssClass="dnnPrimaryAction"
            OnClick="SaveProduct"
            Text="Save Product">
        </asp:LinkButton>
    </li>
    <li>
        <asp:LinkButton ID="cancelButton" runat="server"
            CssClass="dnnSecondaryAction"
            OnClick="Cancel"
            Text="Cancel">
        </asp:LinkButton>
    </li>
</ul>
<%-- ReSharper restore UnknownCssClass --%>