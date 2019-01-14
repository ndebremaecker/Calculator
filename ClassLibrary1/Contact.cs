using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Calculator.Model
{
    public class Contact 
    {
        public long Owner { get; set; }
        public Lambda _Owner { get; set; }
        public string Email { get; set; }
        public string Description { get; set; }
        public string currency_symbol { get; set; }
        public long Vendor_Name { get; set; }
        public Lambda _Vendor_Name { get; set; }
        public string Mailing_Zip { get; set; }
        public string Other_Phone { get; set; }
        public string Mailing_State { get; set; }
        public string Twitter { get; set; }
        public string Other_Zip { get; set; }
        public string Mailing_Street { get; set; }
        public string Other_State { get; set; }
        public string Salutation { get; set; }
        public string Other_Country { get; set; }
        public DateTime? Last_Activity_Time { get; set; }
        public string First_Name { get; set; }
        public string Full_Name { get; set; }
        public string Asst_Phone { get; set; }
        public string Record_Image { get; set; }
        public string Department { get; set; }
        public long Modified_By { get; set; }
        public Lambda _Modified_By { get; set; }
        public string Skype_ID { get; set; }
        public bool process_flow { get; set; }
        public string Assistant { get; set; }
        public string Phone { get; set; }
        public string Mailing_Country { get; set; }
        public long Account_Name { get; set; }
        public Lambda _Account_Name { get; set; }
        public long id { get; set; }
        public bool Email_Opt_Out { get; set; }
        public bool approved { get; set; }
        public long Reporting_To { get; set; }
        public Lambda _Reporting_To { get; set; }
        public long approval { get; set; }
        public Approval _approval { get; set; }
        public DateTime Modified_Time { get; set; }
        public string Date_of_Birth { get; set; }
        public string Mailing_City { get; set; }
        public string Other_City { get; set; }
        public DateTime Created_Time { get; set; }
        public string Title { get; set; }
        public bool editable { get; set; }
        public string Other_Street { get; set; }
        public string Mobile { get; set; }
        public string Home_Phone { get; set; }
        public string Last_Name { get; set; }
        public string Lead_Source { get; set; }
        public List<Lambda> Tag { get; set; }
        public long Created_By { get; set; }
        public string Fax { get; set; }
        public string Secondary_Email { get; set; }
    }
}