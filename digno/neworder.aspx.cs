﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace digno
{
    public partial class neworder : System.Web.UI.Page
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

            neworderBL bll = new neworderBL();
            ds = bll.GetPatientinfo(objBE);
            ViewState["TempTable"] = ds;
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

        }




        [System.Web.Services.WebMethod]
        public static List<ListItem> GetDoctor()
        {

            neworderBLO objBE = new neworderBLO();
            neworderBL newdt = new neworderBL();
            BL objuser = new BL();
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Uemail = objuser.Id;
            return newdt.GetDoctor(objBE);
                
            
        }

        [System.Web.Services.WebMethod]
        public static List<ListItem> GetRefcenter()
        {

            neworderBLO objBE = new neworderBLO();
            neworderBL newdt = new neworderBL();
            BL objuser = new BL();
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Uemail = objuser.Id;
            return newdt.GetRefcenter(objBE);


        }








        [System.Web.Services.WebMethod]
        public static string[] Saveneworder(neworderBLO cat)
        {
            string[] status =new string[1] ;
           
            try
            {
                neworderBLO objBE = new neworderBLO();
                BL objuser = new BL();
                objBE.initial = cat.initial;
                objBE.name = cat.name.ToUpper();
                objBE.mobile = cat.mobile;
                objBE.gender = cat.gender;
                objBE.age = cat.age;
                objBE.agetype = cat.agetype;
                objBE.refdr = cat.refdr;
                objBE.email = cat.email;
                objBE.refcenter = cat.refcenter;



                objuser = (BL)HttpContext.Current.Session["userinfo"];
                objBE.Org_Id = objuser.Org_Id;
                objBE.Branch_Id = objuser.Branch_Id;
                objBE.Uemail = objuser.Id;
              //  objBE.ERROR = 0;
                //if (isupdate == 1)
                //{
                // //   objBE.isupdate = isupdate;
                //  //  objBE.prvsorderid = prevsid;
                //}
                if (objBE != null)
                {
                    neworderBL bl = new neworderBL();
                    DataTable dt = new DataTable();
                    DataSet ds = new DataSet();
                    dt  = bl.saveneworder(objBE);
                    ds.Tables.Add(dt);
                   
                    var pid = ds.Tables[0].Rows[0][0].ToString();
                    var pname = ds.Tables[0].Rows[0][1].ToString();
                   // return String.Format("Patient Id: {0}{2} <br/>Patient Name: {1}", pid, pname, Environment.NewLine);
                    string description = pid + "," + pname;
                    string[] a = description.Split(',');
                    return a;
                }
            }
            catch (Exception e)
            {
                Console.Write(e);
            }
            return status;
        }


    }
}