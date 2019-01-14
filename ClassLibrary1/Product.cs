using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Calculator.Model
{
    public class Product
    {
        public string Product_Category { get; set; }
        public int Qty_in_Demand { get; set; }
        public long Owner { get; set; }
        public Lambda _Owner { get; set; }
        public string Description { get; set; }
        public string currency_symbol { get; set; }
        public long Vendor_Name { get; set; }
        public Lambda _Vendor_Name { get; set; }
        public string Sales_Start_Date { get; set; }
        public List<string> Tax { get; set; }
        public bool Product_Active { get; set; }
        public string Record_Image { get; set; }
        public long Modified_By { get; set; }
        public Lambda _Modified_By { get; set; }
        public string Product_Code { get; set; }
        public bool process_flow { get; set; }
        public string Manufacturer { get; set; }
        public long id { get; set; }
        public string Support_Expiry_Date { get; set; }
        public bool approved { get; set; }
        public long approval { get; set; }
        public Approval _approval { get; set; }
        public DateTime? Modified_Time { get; set; }
        public DateTime Created_Time { get; set; }
        public int Commission_Rate { get; set; }
        public string Product_Name { get; set; }
        public long Handler { get; set; }
        public Lambda _Handler { get; set; }
        public bool taxable { get; set; }
        public bool editable { get; set; }
        public string Support_Start_Date { get; set; }
        public string Usage_Unit { get; set; }
        public int Qty_Ordered { get; set; }
        public int Qty_in_Stock { get; set; }
        public long Created_By { get; set; }
        public Lambda _Created_By { get; set; }
        public List<Lambda> Tag { get; set; }
        public string Sales_End_Date { get; set; }
        public int Unit_Price { get; set; }
        public bool Taxable2 { get; set; }
        public int Reorder_Level { get; set; }
    }
}
