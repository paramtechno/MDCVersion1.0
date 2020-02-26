using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
            ViewState["TempTable"] = ds;
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            
        }
        //protected void ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    DataTable TempTable = new DataTable();
        //    if (e.CommandArgument != null)
        //    {
        //        if (e.CommandName.Equals("Edit"))
        //        {
        //            //int ID = Convert.ToInt64(e.CommandArgumet);
        //            TempTable = (DataTable)ViewState["tmbTable"];
        //            DataRow dr = TempTable.NewRow();
        //            DataRow[] rows = TempTable.Select("ID =" + "'" + ID + "'");
        //            foreach (DataRow r in rows)
        //            {
        //                ((HtmlInputText)inputorderby.FindControl("inputorderby")).Value. = r["NAME"];
        //                inputorderby.Text = r["AGE"];
        //                lbl.Text = r["ID"];
        //            }
        //        }
        //    }
        //}

        [System.Web.Services.WebMethod]
        public static Int32 SaveType(BL cat)
        {
            Int32 status = 0;
            try {
                OrgBLO objBE = new OrgBLO();
                BL objuser = new BL();
                objBE.categoryname = cat.categoryname.ToUpper();
                objBE.orderby = cat.orderby;
                objuser = (BL)HttpContext.Current.Session["userinfo"];
                objBE.Org_Id = objuser.Org_Id;
                objBE.Branch_Id = objuser.Branch_Id;
                objBE.Email = objuser.Id;
                objBE.ERROR = 0;
                if (objBE != null)
                {
                    OrgBL bl = new OrgBL();
                     status = bl.savecategoryinfo(objBE);

                }
            }
            catch(Exception e)
            {
                Console.Write(e);
            }
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