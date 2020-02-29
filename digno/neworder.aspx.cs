using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace digno
{
    public partial class neworder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static List<ListItem> GetDoctor()
        {

            neworderBLO objBE = new neworderBLO();
            neworderBL newdt = new neworderBL();
            BL objuser = new BL();
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Uemail = objuser.Id;
            return newdt.GetDoctor(objBE);
                
            
        }

        [System.Web.Services.WebMethod]
        public static List<ListItem> GetRefcenter()
        {

            neworderBLO objBE = new neworderBLO();
            neworderBL newdt = new neworderBL();
            BL objuser = new BL();
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Uemail = objuser.Id;
            return newdt.GetRefcenter(objBE);


        }








        [System.Web.Services.WebMethod]
        public static Int32 Saveneworder(neworderBLO cat)
        {
            Int32 status = 0;
            try
            {
                neworderBLO objBE = new neworderBLO();
                BL objuser = new BL();
                objBE.initial = cat.initial;
                objBE.name = cat.name.ToUpper();
                objBE.mobile = cat.mobile;
                objBE.gender = cat.gender;
                objBE.age = cat.age;
                objBE.agetype = cat.agetype;
                objBE.refdr = cat.refdr;
                objBE.email = cat.email;
                objBE.refcenter = cat.refcenter;



                objuser = (BL)HttpContext.Current.Session["userinfo"];
                objBE.Org_Id = objuser.Org_Id;
                objBE.Branch_Id = objuser.Branch_Id;
                objBE.Uemail = objuser.Id;
              //  objBE.ERROR = 0;
                //if (isupdate == 1)
                //{
                // //   objBE.isupdate = isupdate;
                //  //  objBE.prvsorderid = prevsid;
                //}
                if (objBE != null)
                {
                    neworderBL bl = new neworderBL();
                    DataTable dt = new DataTable();
                      dt  = bl.saveneworder(objBE);

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