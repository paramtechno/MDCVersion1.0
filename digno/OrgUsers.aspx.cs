using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digno
{
    public partial class OrgUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetUsers();
            BindBranchName();
        }

        [System.Web.Services.WebMethod]
        public static string SaveUsers(OrgUsersBLO cat, int Actions)
        {
            string status = string.Empty;
            try
            {

                BL objuser = new BL();
                //if (Actions != 2)
                //{
                //    objBE.subtestname = cat.subtestname.First().ToString().ToUpper() + cat.subtestname.Substring(1);
                //    objBE.tstamount = cat.tstamount;
                //}
                objuser = (BL)HttpContext.Current.Session["userinfo"];

                cat.Org_id = objuser.Org_Id;
                cat.Branch_id = objuser.Branch_Id;
                cat.Actions = Actions;

                if (Actions == 0)
                    cat.PrevUID = null;

                if (Actions == 2)
                    cat.UStatus = cat.UStatus;



                //objBE.ERROR = 0;
                //objBE.Action = Actions;
                //objBE.categoryid = cat.categoryid;

                //if (Actions == 1 || Actions == 2)
                //    objBE.prvsorderid = prevsid;

                //if (Actions == 2)
                //    objBE.activestatus = cat.Status;


                OrgUsersBL bl = new OrgUsersBL();
                status = bl.SaveUsers(cat);


            }
            catch (Exception e)
            {
                Console.Write(e);
            }
            return status;
        }

        public void GetUsers()
        {
            DataSet ds = new DataSet();
            BL objsess = new BL();
            OrgUsersBL bl = new OrgUsersBL();
            objsess = (BL)HttpContext.Current.Session["Userinfo"];
            ds = bl.GetUsers(objsess);
            Usersrpt.DataSource = ds;
            Usersrpt.DataBind();

        }

        public void BindBranchName()
        {
            DataTable ds = new DataTable();
            BL obj = new BL();
            OrgUsersBL bl = new OrgUsersBL();
            obj = (BL)HttpContext.Current.Session["Userinfo"];
            ds = bl.BindBranchName(obj);
            Branchname.DataSource = ds;
            Branchname.DataTextField = "Branch_name";
            Branchname.DataValueField = "Branch_id";
            Branchname.DataBind();
        }
    }

}