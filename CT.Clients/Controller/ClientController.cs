using System.Collections.Generic;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Data;
using Calculator.Model;

namespace Calculator.Clients.Controller
{
    public class ClientController
    {
        public void AddContact(Contact c)
        {
            c.id = DataProvider.Instance().ExecuteScalar<long>("dnn_Calculator_CreateContactWeb",
                                                c.Owner,
                                                c.Email,
                                                c.Description,
                                                c.currency_symbol,
                                                c.Vendor_Name,
                                                c.Mailing_Zip,
                                                c.Other_Phone,
                                                c.Mailing_State,
                                                c.Twitter,
                                                c.Other_Zip,
                                                c.Mailing_Street,
                                                c.Other_State,
                                                c.Salutation,
                                                c.Other_Country,
                                                c.Last_Activity_Time,
                                                c.First_Name,
                                                c.Full_Name,
                                                c.Asst_Phone,
                                                c.Record_Image,
                                                c.Department,
                                                c.Modified_By,
                                                c.Skype_ID,
                                                c.process_flow,
                                                c.Assistant,
                                                c.Phone,
                                                c.Mailing_Country,
                                                c.Account_Name,
                                                c.Email_Opt_Out,
                                                c.approved,
                                                c.Reporting_To,
                                                c.approval,
                                                c.Modified_Time,
                                                c.Date_of_Birth,
                                                c.Mailing_City,
                                                c.Other_City,
                                                c.Created_Time,
                                                c.Title,
                                                c.editable,
                                                c.Other_Street,
                                                c.Mobile,
                                                c.Home_Phone,
                                                c.Last_Name,
                                                c.Lead_Source,
                                                c.Created_By,
                                                c.Fax,
                                                c.Secondary_Email);
        }

        public Contact GetContact(long id)
        {
            return CBO.FillObject<Contact>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetContact", id));
        }

        public List<Contact> GetContacts()
        {
            var list = CBO.FillCollection<Contact>(DataProvider.Instance().ExecuteReader("dnn_Calculator_GetContacts"));
            list = CompleteLambdas(list);
            return list;
        }

        private List<Contact> CompleteLambdas(List<Contact> list)
        {
            foreach(Contact c in list)
            {
                list[list.IndexOf(c)]._Account_Name = GetLambda(c.Account_Name);
                list[list.IndexOf(c)]._Modified_By = GetLambda(c.Modified_By);
                list[list.IndexOf(c)]._Owner = GetLambda(c.Owner);
                list[list.IndexOf(c)]._Reporting_To = GetLambda(c.Reporting_To);
                list[list.IndexOf(c)]._Vendor_Name = GetLambda(c.Vendor_Name);
            }
            return list;
        }

        private List<Contact> CompleteApproval(List<Contact> list)
        {
            foreach (Contact c in list)
            {
                list[list.IndexOf(c)]._approval = GetApproval(c.approval);
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

        public void UpdateContact(Contact c)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_UpdateContactWeb",
                                                c.id,
                                                c.Owner,
                                                c.Email,
                                                c.Description,
                                                c.currency_symbol,
                                                c.Vendor_Name,
                                                c.Mailing_Zip,
                                                c.Other_Phone,
                                                c.Mailing_State,
                                                c.Twitter,
                                                c.Other_Zip,
                                                c.Mailing_Street,
                                                c.Other_State,
                                                c.Salutation,
                                                c.Other_Country,
                                                c.Last_Activity_Time,
                                                c.First_Name,
                                                c.Full_Name,
                                                c.Asst_Phone,
                                                c.Record_Image,
                                                c.Department,
                                                c.Modified_By,
                                                c.Skype_ID,
                                                c.process_flow,
                                                c.Assistant,
                                                c.Phone,
                                                c.Mailing_Country,
                                                c.Account_Name,
                                                c.Email_Opt_Out,
                                                c.approved,
                                                c.Reporting_To,
                                                c.approval,
                                                c.Modified_Time,
                                                c.Date_of_Birth,
                                                c.Mailing_City,
                                                c.Other_City,
                                                c.Created_Time,
                                                c.Title,
                                                c.editable,
                                                c.Other_Street,
                                                c.Mobile,
                                                c.Home_Phone,
                                                c.Last_Name,
                                                c.Lead_Source,
                                                c.Created_By,
                                                c.Fax,
                                                c.Secondary_Email);
        }

        public void DeleteContact(Contact c)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteContact", c.id);
        }

        public void DeleteContact(long id)
        {
            DataProvider.Instance().ExecuteNonQuery("dnn_Calculator_DeleteContact", id);
        }
    }
}