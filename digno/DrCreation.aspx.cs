using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digno
{
    public partial class DrCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //getdoctorinfo();

        }

        public void getdoctorinfo()
        {
            DataSet ds = new DataSet();
            DRBLO objsess = new DRBLO();
            DRBL bl = new DRBL();
            objsess = (DRBLO)HttpContext.Current.Session["Userinfo"];
            ds = bl.getdoctorinfo(objsess);
            doctorrpt.DataSource = ds;
            doctorrpt.DataBind();

        }

        [System.Web.Services.WebMethod]
        public static string savedoctorinfo(Object cat, int Actions, int prevsid)
        {
            string status = string.Empty;
            try
            {
                var objBE1 = (DRBLO)cat;
                DRBLO objBE = new DRBLO();
                BL objuser = new BL();
                if (Actions != 2)
                {
                    objBE.subtestname = objBE1.subtestname.First().ToString().ToUpper() + objBE1.subtestname.Substring(1);
                    objBE.tstamount = objBE1.tstamount;
                }
                objuser = (BL)HttpContext.Current.Session["userinfo"];
                objBE.Org_Id = objuser.Org_Id;
                objBE.Branch_Id = objuser.Branch_Id;
                objBE.Email = objuser.Id;
                objBE.ERROR = 0;
                objBE.Actions = Actions;
                objBE.categoryid = objBE1.categoryid;
                if (Actions == 1 || Actions == 2)
                    objBE.prvsorderid = prevsid;

                if (Actions == 2)
                    objBE.activestatus = objBE1.Status;

                if (objBE != null)
                {
                    DRBL bl = new DRBL();
                    status = bl.savedoctorinfo(objBE);

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