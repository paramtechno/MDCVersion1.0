using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digno
{
    public partial class GetTestPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetPatientinfo();
            BindTestCategory();
        }
        public void BindTestCategory()
        {
            try
            {
                BL objsess = new BL();
                GettestBL bl = new GettestBL();
                objsess = (BL)HttpContext.Current.Session["Userinfo"];
                GettestBLO blo = new GettestBLO();
                blo.Branch_Id = objsess.Branch_Id;
                blo.Org_Id = objsess.Org_Id;
               DataTable dt = bl.TestCategorybind(blo);
                if (dt.Rows.Count > 0)
                {
                    Testcateg.DataSource = dt;
                    Testcateg.DataTextField = "Test_category_name";
                    Testcateg.DataValueField = "Category_id";
                    Testcateg.DataBind();
                }
                else
                    Testcateg.DataSource = null;
                Testcateg.DataBind();
            }
            catch (Exception e)

            {
                Console.Write(e);
            }
        }


        public void GetPatientinfo()
        {
            DataSet ds = new DataSet();
            neworderBLO bl = new neworderBLO();
            neworderBLO objBE = new neworderBLO();
            BL objuser = new BL();
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Uemail = objuser.Id;
            objBE.Patient_id = Request.QueryString["Pid"];


            neworderBL bll = new neworderBL();
            ds = bll.GetPatientbyid(objBE);
            ViewState["TempTable"] = ds;
            Label1.Text = ds.Tables[0].Rows[0][1].ToString();
            Label2.Text = ds.Tables[0].Rows[0][3].ToString();
            Label3.Text = ds.Tables[0].Rows[0][6].ToString();
            Label4.Text = ds.Tables[0].Rows[0][9].ToString();


        }

[WebMethod(EnableSession = true)]
        public static List<ListItem> GetTEST(Int32 categoryid )
        {
            GettestBLO objBE = new GettestBLO();
            BL objuser = new BL();

            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Category_ID = categoryid;
            

            GettestBL tb = new GettestBL();
            DataTable dt = new DataTable();
            dt = tb.GetTEST(objBE);



            List<ListItem> customers = new List<ListItem>();

            foreach (DataRow row in dt.Rows)
            {
                customers.Add(new ListItem
                            {
                                Value = row["Test_id"].ToString(),
                                Text = row["Test_name"].ToString()
                            });


                        }
                    
                    
                    return customers;
                
            
        }

        [WebMethod]
        public static string GetTestAmount(Int32 testid)
        {
            string jsonData = "";
            GettestBLO objBE = new GettestBLO();
            BL objuser = new BL();
            
            objuser = (BL)HttpContext.Current.Session["userinfo"];
            objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
            objBE.Test_id = testid;
            
            GettestBL tb = new GettestBL();
            DataTable dt = new DataTable();
            dt = tb.GetTestAmount(objBE);

            foreach (DataRow row in dt.Rows)
            {
                var input = new
                        {
                            amount = row["Amount"]
                        };
                        jsonData = (new JavaScriptSerializer()).Serialize(input);
             }
            return jsonData;
        }


        public partial class PTest
        {
            public int catId { get; set; }
          
            public string TesteName { get; set; }
            public Nullable<int> TId { get; set; }
            public Nullable<double> TestAmt { get; set; }
          
        }
        [System.Web.Services.WebMethod]
        public static string SaveOrder(float paid,float totalamt,float discount,string pid,billblo[] PTest)
        {
            string status = string.Empty;
            //try
            //{
             OrgBLO objBE = new OrgBLO();
               BL objuser = new BL();
            //    if (Actions != 2)
            //    {
            //        objBE.subtestname = cat.subtestname.First().ToString().ToUpper() + cat.subtestname.Substring(1);
            //        objBE.tstamount = cat.tstamount;
            //    }
               objuser = (BL)HttpContext.Current.Session["userinfo"];
                objBE.Org_Id = objuser.Org_Id;
                objBE.Branch_Id = objuser.Branch_Id;
                objBE.Email = objuser.Id;
                objBE.ERROR = 0;
            //    objBE.Actions = Actions;
            //    objBE.categoryid = cat.categoryid;
            //    if (Actions == 1 || Actions == 2)
            //        objBE.prvsorderid = prevsid;

            //    if (Actions == 2)
            //        objBE.activestatus = cat.Status;

            //    if (objBE != null)
            //    {
                 BillBL bl = new BillBL();
             status = bl.SaveOrder(paid,totalamt,discount,pid,PTest, objBE);

            //    }
            //}
            //catch (Exception e)
            //{
            //    Console.Write(e);
            //}
            return status;
        }

    }
}