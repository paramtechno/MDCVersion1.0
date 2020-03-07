using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace digno
{
    public partial class TestCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getsubtest();
            BindTestCategory();
        }
        public void BindTestCategory()
        {
            try
            {
                BL objsess = new BL();
                TestCreationBL bl = new TestCreationBL();
                objsess = (BL)HttpContext.Current.Session["Userinfo"];
                DataTable dt = bl.TestCategorybind(objsess);
                if (dt.Rows.Count > 0)
                {
                    Testcateg.DataSource = dt;
                    Testcateg.DataTextField = "Test_category_name";
                    Testcateg.DataValueField = "Category_id";
                    Testcateg.DataBind();
                }
                else
                    Testcateg.DataSource = null;
                Testcateg.DataBind();
            }
            catch(Exception e)

            {
                Console.Write(e);
            }
        }

        public void getsubtest()
        {
            DataSet ds = new DataSet();
            BL objsess = new BL();
            TestCreationBL bl = new TestCreationBL();
            objsess = (BL)HttpContext.Current.Session["Userinfo"];
            ds = bl.subtestbind(objsess);
            subtestrept.DataSource = ds;
            subtestrept.DataBind();

        }

        [System.Web.Services.WebMethod]
        public static string savesubtest(TestCreationBLO cat, int Actions, int prevsid)
        {
            string status = string.Empty;
            try
            {
                OrgBLO objBE = new OrgBLO();
                BL objuser = new BL();
                if (Actions != 2)
                {
                    objBE.subtestname = cat.subtestname.First().ToString().ToUpper() + cat.subtestname.Substring(1);
                    objBE.tstamount = cat.tstamount;
                }
                objuser = (BL)HttpContext.Current.Session["userinfo"];
                objBE.Org_Id = objuser.Org_Id;
                objBE.Branch_Id = objuser.Branch_Id;
                objBE.Email = objuser.Id;
                objBE.ERROR = 0;
                objBE.Actions = Actions;
                objBE.categoryid = cat.categoryid;
                if (Actions == 1 || Actions == 2)
                    objBE.prvsorderid = prevsid;

                if (Actions == 2)
                    objBE.activestatus = cat.Status;

                if (objBE != null)
                {
                    TestCreationBL bl = new TestCreationBL();
                    status = bl.savesubtest(objBE);

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