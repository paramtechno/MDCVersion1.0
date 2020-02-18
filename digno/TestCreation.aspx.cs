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
                Testcateg.DataSource = dt;
                Testcateg.DataBind();
            }
            catch(Exception e)

            {
                Console.Write(e);
            }
        }
    }
}