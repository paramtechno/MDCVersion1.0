using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digno
{
    public partial class Refcenters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gettesttype();
        }

        public void gettesttype()
        {
            DataSet ds = new DataSet();
            RefBLO objBE = new RefBLO();
            BL objuser = new BL();
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.UserID = objuser.Id;

            RefBL bll = new RefBL();
            ds = bll.gettesttype(objBE);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

        }

        [System.Web.Services.WebMethod]

        public static string saveRefCenter(RefBLO cat)
        {


            RefBLO objBE = new RefBLO();
            BL objuser = new BL();
            objBE.Refname = cat.Refname;
            objBE.Refaddress = cat.Refaddress;
            objBE.Refperson = cat.Refperson;
            objBE.Refmobi = cat.Refmobi;
            objBE.RefDate = cat.RefDate;
            objBE.Refstatus = cat.Refstatus;

            objuser = (BL)HttpContext.Current.Session["userinfo"];

            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.UserID = objuser.Id;
            objBE.ERROR = 0;

            RefBL bl = new RefBL();
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