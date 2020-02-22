using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace digno
{
    public partial class DrCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getDRinfo();
        }

        public void getDRinfo()
        {
            DataSet ds = new DataSet();
            DRBLO objBE = new DRBLO();
            BL objuser = new BL();
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_id = objuser.Org_Id;
            objBE.Branch_id = objuser.Branch_Id;
            objBE.User_id = objuser.Id;

            DRBL bll = new DRBL();
            ds = bll.getDRinfo(objBE);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

        }

        [System.Web.Services.WebMethod]

        public static string saveDRinfo(DRBLO cat)
        {


            DRBLO objBE = new DRBLO();
            BL objuser = new BL();
            
            objBE.DR_name = cat.DR_name;
            objBE.DR_address = cat.DR_address;
            objBE.Dr_email = cat.Dr_email;
            objBE.Dr_mob = cat.Dr_mob;
            objBE.Dr_Refid = cat.Dr_Refid;
            objBE.Created_date = cat.Created_date;
            objBE.Isdeleted = cat.Isdeleted;
            objBE.Status = cat.Status;

            objuser = (BL)HttpContext.Current.Session["userinfo"];

            objBE.Org_id = objuser.Org_Id;
            objBE.Branch_id = objuser.Branch_Id;
            objBE.User_id = objuser.Id;
            objBE.ERROR = 0;

            DRBL bl = new DRBL();
            string status = bl.insertDRinfo(objBE);
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