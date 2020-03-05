﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digno
{
    public partial class GetTestPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetPatientinfo();
        }

        public void GetPatientinfo()
        {
            DataSet ds = new DataSet();
            neworderBLO bl = new neworderBLO();
            neworderBLO objBE = new neworderBLO();
            BL objuser = new BL();
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Uemail = objuser.Id;
            objBE.Patient_id = Request.QueryString["Pid"];


            neworderBL bll = new neworderBL();
            ds = bll.GetPatientbyid(objBE);
            ViewState["TempTable"] = ds;
            Label1.Text = ds.Tables[0].Rows[0][1].ToString();
            Label2.Text = ds.Tables[0].Rows[0][3].ToString();
            Label3.Text = ds.Tables[0].Rows[0][6].ToString();
            Label4.Text = ds.Tables[0].Rows[0][9].ToString();


        }

[WebMethod(EnableSession = true)]
        public static List<ListItem> GetTEST()
        {
            neworderBLO objBE = new neworderBLO();
            BL objuser = new BL();

            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            

            TestCreationBL tb = new TestCreationBL();
            DataTable dt = new DataTable();
            dt = tb.GetTEST(objBE);



            List<ListItem> customers = new List<ListItem>();

            foreach (DataRow row in dt.Rows)
            {
                customers.Add(new ListItem
                            {
                                Value = row["Test_id"].ToString(),
                                Text = row["Test_name"].ToString()
                            });


                        }
                    
                    
                    return customers;
                
            
        }

        [WebMethod]
        public static string GetTestAmount(Int32 testid)
        {
            string jsonData = "";
            neworderBLO objBE = new neworderBLO();
            BL objuser = new BL();
            
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Test_id = testid;
            
            TestCreationBL tb = new TestCreationBL();
            DataTable dt = new DataTable();
            dt = tb.GetTestAmount(objBE);

            foreach (DataRow row in dt.Rows)
            {
                var input = new
                        {
                            amount = row["Amount"]
                        };
                        jsonData = (new JavaScriptSerializer()).Serialize(input);
             }
            return jsonData;
        }
            

           
    }
}