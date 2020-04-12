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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {




        }



        //[System.Web.Services.WebMethod(EnableSession = true)]
        //public static string MyMethod(string username, string password)
        //{
        //    var url="";
        //   BL obJBE = new BL();
        //   obJBE.User_name = username;
        //   obJBE.Password = password;
        //    DataSet ds = new DataSet();
        //    BLO bl = new BLO();
        //    ds = bl.UserLogin(obJBE);
        //    if (ds.Tables.Count == 1)
        //    {
        //        //lblErrorMsg.Text = ds.Tables[0].Rows[0][0].ToString();
        //    }
        //    else if (ds.Tables[1].Rows[0][0].ToString() == "1")
        //    {
        //       // lblErrorMsg.Text = string.Empty;
               
        //        String name = null;
        //        if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0][1].ToString()))
        //        {
        //            if (ds.Tables[0].Rows[0][1].ToString()=="admin")
        //                HttpContext.Current.Session["UserId"] = ds.Tables[0].Rows[0][0].ToString();
        //                url = "admin.aspx";
        //        }
               
               

                   
        //        //.Redirect("~/Default.aspx");
        //    }
        //    return url;
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            var url = "";
            string User = inputText.Value;
            string Password = inputSigninPassword.Value;
            if (!string.IsNullOrEmpty(User) && !string.IsNullOrEmpty(Password))
            {
                BL obJBE = new BL();
                obJBE.User_name = User;
                obJBE.Password = Password;
                DataSet ds = new DataSet();
                BLO bl = new BLO();
                ds = bl.UserLogin(obJBE);
                if (ds.Tables.Count == 1)
                {
                    lblErrorMsg.Text = ds.Tables[0].Rows[0][0].ToString();
                }
                else if (ds.Tables[0].Rows[0][0].ToString() == "1")
                {
                    lblErrorMsg.Text = string.Empty;

                    String name = null;
                    if (!string.IsNullOrEmpty(ds.Tables[1].Rows[0][0].ToString()))
                    {
                        if (ds.Tables[1].Rows[0][2].ToString() == "Super Admin")
                        {

                            BL objsess = new BL();
                            objsess.Org_Id = Convert.ToInt32(ds.Tables[1].Rows[0][3].ToString());
                            objsess.Branch_Id = ds.Tables[1].Rows[0][4].ToString();
                            objsess.Id = ds.Tables[1].Rows[0][0].ToString();
                            objsess.User_name = ds.Tables[1].Rows[0][1].ToString();
                            HttpContext.Current.Session["Userinfo"] = objsess;
                           Response.Redirect("~/dashboard.aspx");
                        }
                        else if (ds.Tables[0].Rows[0][2].ToString() == "tech")
                        
                        {
                            BL objsess = new BL();
                            objsess.Org_Id = Convert.ToInt32(ds.Tables[0].Rows[0][3].ToString());
                            objsess.Branch_Id = ds.Tables[0].Rows[0][4].ToString();
                            objsess.Id = ds.Tables[0].Rows[0][0].ToString();
                            objsess.User_name = ds.Tables[0].Rows[1].ToString();
                            HttpContext.Current.Session["Userinfo"] = objsess;
                            Response.Redirect("~/Dr/dashboard.aspx");
                        }
                        else if (ds.Tables[0].Rows[0][2].ToString() == "user")
                        {
                            BL objsess = new BL();
                            objsess.Org_Id = Convert.ToInt32(ds.Tables[0].Rows[0][3].ToString());
                            objsess.Branch_Id = ds.Tables[0].Rows[0][4].ToString();
                            objsess.Id = ds.Tables[0].Rows[0][0].ToString();
                            objsess.User_name = ds.Tables[0].Rows[1].ToString();
                            HttpContext.Current.Session["Userinfo"] = objsess;
                            Response.Redirect("~/users/dashboard.aspx");
                        }
                        else if (ds.Tables[0].Rows[0][2].ToString() == "patient")
                        {
                            BL objsess = new BL();
                            objsess.Org_Id = Convert.ToInt32(ds.Tables[0].Rows[0][3].ToString());
                            objsess.Branch_Id = ds.Tables[0].Rows[0][4].ToString();
                            objsess.Id = ds.Tables[0].Rows[0][0].ToString();
                            objsess.User_name = ds.Tables[0].Rows[1].ToString();
                            HttpContext.Current.Session["Userinfo"] = objsess;
                            Response.Redirect("~/admin/dashboard.aspx");
                        }
                    }




                    //Response.Redirect("~/index.aspx");
                }




            }
            else
            {


                lblErrorMsg.Text = "Please enter Login Details";
            }



        }




        [System.Web.Services.WebMethod]
        public static string Orginformation(OrgBLO emp)
        {
            OrgBLO objBE = new OrgBLO();
            objBE.Org_name = emp.Org_name;
            objBE.Reg_no = emp.Reg_no;
            objBE.Status = "a";
            objBE.Email = emp.Email;
            objBE.Mobile_no = emp.Mobile_no;
            objBE.Password = emp.Password;
            objBE.Exp_type = 1;
            objBE.Subscription_type = "Monthly";
            objBE.ERROR = emp.ERROR;

            OrgBL bl = new OrgBL();
            string status = bl.OrgInfo(objBE);
            return status;
        }

    }
}