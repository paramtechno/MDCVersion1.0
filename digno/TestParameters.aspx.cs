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
            BindTestCategory();
        }

        public void BindTestCategory()
        {
            DropDownList myControl1 = (DropDownList)Page.FindControl("Testcategory");
            try
            {
                BL objsess = new BL();
                GettestBL bl = new GettestBL();
                objsess = (BL)HttpContext.Current.Session["Userinfo"];
                GettestBLO blo = new GettestBLO();
                blo.Branch_Id = objsess.Branch_Id;
                blo.Org_Id = objsess.Org_Id;
                DataTable dt = bl.TestCategorybind(blo);
                if (dt.Rows.Count > 0)
                {
                    testid.DataSource = dt;
                    testid.DataTextField = "Test_category_name";
                    testid.DataValueField = "Category_id";
                    testid.DataBind();
                    
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


        [WebMethod(EnableSession = true)]
        public static List<ListItem> GetTEST(Int32 categoryid)
        {
            GettestBLO objBE = new GettestBLO();
            BL objuser = new BL();

            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Category_ID = categoryid;


            GettestBL tb = new GettestBL();
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


    }
}