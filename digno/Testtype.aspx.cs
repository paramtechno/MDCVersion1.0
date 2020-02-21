using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digno
{
    public partial class Testtype : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gettesttype();
        }

        public void gettesttype()
        {
            DataSet ds = new DataSet();
            BLO bl = new BLO();
            OrgBLO objBE = new OrgBLO();
            BL objuser = new BL();
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Email = objuser.Id;

            OrgBL bll = new OrgBL();
            ds = bll.gettesttype(objBE);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            
        }

        [System.Web.Services.WebMethod]
        public static Int32 SaveType(BL cat)
        {

            OrgBLO objBE = new OrgBLO();
            BL objuser = new BL();
            objBE.categoryname = cat.categoryname;
            objBE.orderby = cat.orderby;
            
            objuser = (BL)HttpContext.Current.Session["userinfo"];

            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Email = objuser.Id;
            objBE.ERROR = 0;

            OrgBL bl = new OrgBL();
            Int32 status = bl.savecategoryinfo(objBE);
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