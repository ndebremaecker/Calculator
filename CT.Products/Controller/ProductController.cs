using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Calculator.Model;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Data;

namespace Calculator.Products.Controller
{
    public class ProductController
    {
        public List<Product> GetProducts()
        {
            var list = CBO.FillCollection<Product>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetProducts"));
            list = CompleteLambdas(list);
            return list;
        }

        public Product GetProduct(long id)
        {
            return CBO.FillObject<Product>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetProduct", id));
        }

        private List<Product> CompleteLambdas(List<Product> list)
        {
            foreach (Product p in list)
            {
                list[list.IndexOf(p)]._Created_By = GetLambda(p.Created_By);
                list[list.IndexOf(p)]._Handler = GetLambda(p.Handler);
                list[list.IndexOf(p)]._Modified_By = GetLambda(p.Modified_By);
                list[list.IndexOf(p)]._Owner = GetLambda(p.Owner);
                list[list.IndexOf(p)]._Vendor_Name = GetLambda(p.Vendor_Name);
            }
            return list;
        }

        private List<Product> CompleteApproval(List<Product> list)
        {
            foreach (Product p in list)
            {
                list[list.IndexOf(p)]._approval = GetApproval(p.approval);
            }
            return list;
        }

        private Lambda GetLambda(long id)
        {
            return CBO.FillObject<Lambda>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetLambda", id));
        }

        private Approval GetApproval(long id)
        {
            return CBO.FillObject<Approval>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetApproval", id));
        }

        public void AddProduct(Product p)
        {
            p.id = DataProvider.Instance().ExecuteScalar<long>("dnn_Calculator_CreateProductWeb",
                                                    p.Product_Category,
                                                    p.Qty_in_Demand,
                                                    p.Owner,
                                                    p.Description,
                                                    p.currency_symbol,
                                                    p.Vendor_Name,
                                                    p.Sales_Start_Date,
                                                    p.Product_Active,
                                                    p.Record_Image,
                                                    p.Modified_By,
                                                    p.Product_Code,
                                                    p.process_flow,
                                                    p.Manufacturer,
                                                    p.Support_Expiry_Date,
                                                    p.approved,
                                                    p.approval,
                                                    p.Modified_Time,
                                                    p.Created_Time,
                                                    p.Commission_Rate,
                                                    p.Product_Name,
                                                    p.Handler,
                                                    p.taxable,
                                                    p.editable,
                                                    p.Support_Start_Date,
                                                    p.Usage_Unit,
                                                    p.Qty_Ordered,
                                                    p.Qty_in_Stock,
                                                    p.Created_By,
                                                    p.Sales_End_Date,
                                                    p.Unit_Price,
                                                    p.Taxable2,
                                                    p.Reorder_Level
                                                    );
        }

        public void UpdateProduct(Product p)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateProduct",
                                            p.Product_Category,
                                            p.Qty_in_Demand,
                                            p.Owner,
                                            p.Description,
                                            p.currency_symbol,
                                            p.Vendor_Name,
                                            p.Sales_Start_Date,
                                            p.Product_Active,
                                            p.Record_Image,
                                            p.Modified_By,
                                            p.Product_Code,
                                            p.process_flow,
                                            p.Manufacturer,
                                            p.id,
                                            p.Support_Expiry_Date,
                                            p.approved,
                                            p.approval,
                                            p.Modified_Time,
                                            p.Created_Time,
                                            p.Commission_Rate,
                                            p.Product_Name,
                                            p.Handler,
                                            p.taxable,
                                            p.editable,
                                            p.Support_Start_Date,
                                            p.Usage_Unit,
                                            p.Qty_Ordered,
                                            p.Qty_in_Stock,
                                            p.Created_By,
                                            p.Sales_End_Date,
                                            p.Unit_Price,
                                            p.Taxable2,
                                            p.Reorder_Level);
        }

        public void DeleteProduct(Product p)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteProduct", p.id);
        }


    }
}