using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace digno
{
    public partial class DrCreations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gettesttype();
        }

        public void gettesttype()
        {
            DataSet ds = new DataSet();
            DRBLO objBE = new DRBLO();
            BL objuser = new BL();
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.UserID = objuser.Id;

            DRBL bll = new DRBL();
            //ds = bll.gettesttype(objBE);
            Repeaters.DataSource = ds;
            Repeaters.DataBind();

        }

        [System.Web.Services.WebMethod]

        public static string saveRefCenter(DRBLO cat)
        {


            DRBLO objBE = new DRBLO();
            BL objuser = new BL();
            objBE.Drname = cat.Drname;
            objBE.Draddress = cat.Draddress;
            objBE.Dremail = cat.Dremail;
            objBE.Drmobi = cat.Drmobi;


            objuser = (BL)HttpContext.Current.Session["userinfo"];

            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.UserID = objuser.Id;
            objBE.ERROR = 0;

            DRBL bl = new DRBL();
            string status = bl.insertRefCenter(objBE);
            return status;


        }


        [System.Web.Services.WebMethod]
        public void DeleteType(BL emp)
        {


            BL objBE = new BL();
            objBE.orgname = emp.orgname;
            objBE.mobile = emp.mobile;
            objBE.orgname = emp.labno;
            // objBE.orgname = emp.Email ;
            // objBE.orgname = emp.Password1 ;
            //  objBE.orgname = emp.Password2;
            DataSet ds = new DataSet();
            BLO bl = new BLO();
            //   ds = bl.UserLogin(obJBE);




        }
        [System.Web.Services.WebMethod]
        public void selectType(BL emp)
        {


            BL objBE = new BL();
            objBE.orgname = emp.orgname;
            objBE.mobile = emp.mobile;
            objBE.orgname = emp.labno;
            // objBE.orgname = emp.Email ;
            // objBE.orgname = emp.Password1 ;
            //  objBE.orgname = emp.Password2;
            DataSet ds = new DataSet();
            BLO bl = new BLO();
            //   ds = bl.UserLogin(obJBE);




        }
    }
}