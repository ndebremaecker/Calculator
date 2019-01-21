using Calculator.Products.Controller;
using DotNetNuke.UI.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Calculator.Products
{
    public partial class ProductList : ModuleUserControlBase
    {
        ProductController controller = new ProductController();

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (!IsPostBack)
            {
                products.DataSource = controller.GetProducts();
                products.DataBind();
            }

            addButton.NavigateUrl = ModuleContext.EditUrl("Edit");
        }

        protected void DeleteProduct(object source, RepeaterCommandEventArgs e)
        {
            var id = Convert.ToInt64(e.CommandArgument);
            var product = controller.GetProduct(id);
            controller.DeleteProduct(product);

            Response.Redirect(Request.RawUrl);
        }
    }
}