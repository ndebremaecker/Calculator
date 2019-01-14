using Calculator.Model;
using Calculator.Products.Controller;
using DotNetNuke.Collections;
using DotNetNuke.Common;
using DotNetNuke.UI.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Calculator.Products
{
    public partial class EditProduct : ModuleUserControlBase
    {
        private long _id;
        private readonly ProductController _controller = new ProductController();
        static string debugText = "";

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            //Get the TaskId from the QueryString
            _id = Request.QueryString.GetValueOrDefault<long>("id", -1);


            if (_id > -1 && !IsPostBack)
            {
                var product = _controller.GetProduct(_id);
                Product_CategoryTextBox.Text = product.Product_Category;
                Qty_in_DemandTextBox.Text = product.Qty_in_Demand.ToString();
                OwnerTextBox.Text = product.Owner.ToString();
                DescriptionTextBox.Text = product.Description;
                currency_symbolTextBox.Text = product.currency_symbol;
                Vendor_NameTextBox.Text = product.Vendor_Name.ToString();
                Sales_Start_DateTextBox.Text = product.Sales_Start_Date;
                Product_ActiveTextBox.Text = product.Product_Active.ToString();
                Record_ImageTextBox.Text = product.Record_Image;
                Modified_ByTextBox.Text = product.Modified_By.ToString();
                Product_CodeTextBox.Text = product.Product_Code;
                process_flowTextBox.Text = product.process_flow.ToString();
                ManufacturerTextBox.Text = product.Manufacturer;
                Support_Expiry_DateTextBox.Text = product.Support_Expiry_Date;
                approvedTextBox.Text = product.approved.ToString();
                approvalTextBox.Text = product.approval.ToString();
                Modified_TimeTextBox.Text = product.Modified_Time.ToString();
                Created_TimeTextBox.Text = product.Created_Time.ToString();
                Commission_RateTextBox.Text = product.Commission_Rate.ToString();
                Product_NameTextBox.Text = product.Product_Name;
                HandlerTextBox.Text = product.Handler.ToString();
                taxableTextBox.Text = product.taxable.ToString();
                editableTextBox.Text = product.editable.ToString();
                Support_Start_DateTextBox.Text = product.Support_Start_Date;
                Usage_UnitTextBox.Text = product.Usage_Unit;
                Qty_OrderedTextBox.Text = product.Qty_Ordered.ToString();
                Qty_in_StockTextBox.Text = product.Qty_in_Stock.ToString();
                Created_ByTextBox.Text = product.Created_By.ToString();
                Sales_End_DateTextBox.Text = product.Sales_End_Date;
                Unit_PriceTextBox.Text = product.Unit_Price.ToString();
                Reorder_LevelTextBox.Text = product.Reorder_Level.ToString();
            }

            if (!String.IsNullOrEmpty(debugText)) debug.InnerText = debugText;
        }

        protected void SaveProduct(object sender, EventArgs e)
        {
            var product = new Product
            {
                id = _id,
                Product_Category = Product_CategoryTextBox.Text,
                //Qty_in_Demand = Int32.Parse(Qty_in_DemandTextBox.Text),
                //Owner = Int64.Parse(OwnerTextBox.Text),
                Description = DescriptionTextBox.Text,
                //currency_symbol = currency_symbolTextBox.Text,
                //Vendor_Name = Int64.Parse(Vendor_NameTextBox.Text),
                Sales_Start_Date = Sales_Start_DateTextBox.Text,
                //Product_Active = Boolean.Parse(Product_ActiveTextBox.Text),
                Record_Image = Record_ImageTextBox.Text,
                //Modified_By = Int64.Parse(Modified_ByTextBox.Text),
                Product_Code = Product_CodeTextBox.Text,
                //process_flow = Boolean.Parse(process_flowTextBox.Text),
                Manufacturer = ManufacturerTextBox.Text,
                Support_Expiry_Date = Support_Expiry_DateTextBox.Text,
                //approved = Boolean.Parse(approvedTextBox.Text),
                Modified_Time = DateTime.Now,
                Created_Time = DateTime.Now,
                //Commission_Rate = Int32.Parse(Commission_RateTextBox.Text),
                Product_Name = Product_NameTextBox.Text,
                //Handler = Int64.Parse(HandlerTextBox.Text),
                //taxable = Boolean.Parse(taxableTextBox.Text),
                //editable = Boolean.Parse(editableTextBox.Text),
                Support_Start_Date = Support_Start_DateTextBox.Text,
                Usage_Unit = Usage_UnitTextBox.Text,
                //Qty_Ordered = Int32.Parse(Qty_OrderedTextBox.Text),
                //Qty_in_Stock = Int32.Parse(Qty_in_StockTextBox.Text),
                //Created_By = Int64.Parse(Created_ByTextBox.Text),
                Sales_End_Date = Sales_End_DateTextBox.Text,
                //Unit_Price = Int32.Parse(Unit_PriceTextBox.Text),
                //Reorder_Level = Int32.Parse(Reorder_LevelTextBox.Text)

            };

            if (_id == -1)
            {
                _controller.AddProduct(product);
            }
            else
            {
                _controller.UpdateProduct(product);
            }

            Response.Redirect(Globals.NavigateURL());
        }

        protected void Cancel(object sender, EventArgs e)
        {
            Response.Redirect(Globals.NavigateURL());
        }
    }
}