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
            getdoctorinfo();

        }

        public void getdoctorinfo()
        {
            DataSet ds = new DataSet();
            BL objsess = new BL();
            DRBL bl = new DRBL();
            objsess = (BL)HttpContext.Current.Session["Userinfo"];
            ds = bl.getdoctorinfo(objsess);
            doctorrpt.DataSource = ds;
            doctorrpt.DataBind();

        }

        [System.Web.Services.WebMethod]
        public static string savedoctorinfo(DRBLO cat, int Actions, int prevsid)
        {
            string status = string.Empty;
            try
            { 
                DRBLO objBE = new DRBLO();
                BL objuser = new BL();
                if (Actions != 2)
                {
                    objBE.Drname = cat.Drname;
                    objBE.Drmobi = cat.Drmobi;
                    objBE.drclinic = cat.drclinic;
                }
                objuser = (BL)HttpContext.Current.Session["userinfo"];
                objBE.Org_Id = objuser.Org_Id;
                objBE.Branch_Id = objuser.Branch_Id;
                objBE.UserID = objuser.Id;
                objBE.ERROR = 0;
                objBE.Actions = Actions;
                if (Actions == 1 || Actions == 2)
                    objBE.Drid = prevsid;

                if (Actions == 2)
                    objBE.Drstatus = cat.Drstatus;

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