using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digno
{
    public partial class TestParameters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Testid.Value = Request.QueryString["tid"];
            Testname.Text = Request.QueryString["testname"];
            BindTestparameterCategory();
        }

        public void BindTestparameterCategory()
        {
            DropDownList myControl1 = (DropDownList)Page.FindControl("Testcategory");
            try
            {
                BL objsess = new BL();
                TestCreationBL bl = new TestCreationBL();
                objsess = (BL)HttpContext.Current.Session["Userinfo"];
                TestCreationBLO blo = new TestCreationBLO();
                blo.branchid = objsess.Branch_Id;
                blo.Org_id = objsess.Org_Id;
                blo.tid = Convert.ToInt16(Testid.Value);
                DataTable dt = bl.Getparameter(blo);
                if (dt.Rows.Count > 0)
                {
                    Billrept.DataSource = dt;
                    Billrept.DataBind();
                    
                }
                else
                    myControl1.DataSource = null;
                myControl1.DataBind();
            }
            catch (Exception e)

            {
                Console.Write(e);
            }
        }

        [System.Web.Services.WebMethod]
        public static string Saveparameters(TestCreationBLO cat)
        {
            string status = string.Empty;
            try
            {
                OrgBLO objBE = new OrgBLO();
                BL objuser = new BL();
                
                objuser = (BL)HttpContext.Current.Session["userinfo"];
                cat.Org_id = objuser.Org_Id;
                cat.branchid = objuser.Branch_Id;
                cat.userid = objuser.Id;
                if (objBE != null)
                {
                    TestCreationBL bl = new TestCreationBL();
                    status = bl.Saveparameter(cat);

                }
            }
            catch (Exception e)
            {
                Console.Write(e);
            }
            return status;
        }



        [System.Web.Services.WebMethod]
        public static string Saveparametersranges(TestCreationBLO cat)
        {
            string status = string.Empty;
            try
            {
                OrgBLO objBE = new OrgBLO();
                BL objuser = new BL();

                objuser = (BL)HttpContext.Current.Session["userinfo"];
                cat.Org_id = objuser.Org_Id;
                cat.branchid = objuser.Branch_Id;
                cat.userid = objuser.Id;
                
                if (objBE != null)
                {
                    TestCreationBL bl = new TestCreationBL();
                    status = bl.Saveparametersranges(cat);

                }
            }
            catch (Exception e)
            {
                Console.Write(e);
            }
            return status;
        }

        protected void Submit(object sender, EventArgs e)
        {
           // BindGetparameterranges();
        }


        //public void BindGetparameterranges()
        //{
        //    DropDownList myControl1 = (DropDownList)Page.FindControl("Testcategory");
        //    try
        //    {
        //        BL objsess = new BL();
        //        TestCreationBL bl = new TestCreationBL();
        //        objsess = (BL)HttpContext.Current.Session["Userinfo"];
        //        TestCreationBLO blo = new TestCreationBLO();
        //        blo.branchid = objsess.Branch_Id;
        //        blo.Org_id = objsess.Org_Id;
        //        blo.tid = Convert.ToInt16(Testid.Value);
        //        DataTable dt = bl.Getparameterranges(blo);
        //        if (dt.Rows.Count > 0)
        //        {
        //            Rangerept.DataSource = dt;
        //            Rangerept.DataBind();

        //        }
        //        else
        //            myControl1.DataSource = null;
        //        myControl1.DataBind();
        //    }
        //    catch (Exception e)

        //    {
        //        Console.Write(e);
        //    }
        //}

        
    }
}