using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using System.Web.Script.Serialization;

namespace digno
{
    public partial class neworder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //   GetPatientinfo();
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
        [WebMethod(EnableSession = true)]
        public static List<ListItem> GetTEST(Int32 categoryid)
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
        public static string SaveOrder( billblo[] PTest, neworderBLO cat)
        {
            string status = string.Empty;
            try
            {
                neworderBLO objBE = new neworderBLO();
            BL objuser = new BL();
            
            objuser = (BL)HttpContext.Current.Session["userinfo"];
           objBE.initial = cat.initial;
           objBE.Paidamt = cat.Paidamt;
           objBE.Discount = cat.Discount;
            objBE.Patient_name = cat.Patient_name;
             objBE.gender = cat.gender;
    objBE.email = cat.email;
    objBE.refdr = cat.refdr;
    objBE.mobile = cat.mobile;
    objBE.refcenter = cat.refcenter;
                
                    objBE.totalamt = cat.totalamt;

                objBE.Org_Id = objuser.Org_Id;
            objBE.Branch_Id = objuser.Branch_Id;
                objBE.userid = objuser.Id;











                DataTable dt = new DataTable();
                dt.Columns.Add("Category_id", Type.GetType("System.Int32"));
                dt.Columns.Add("Test_id", Type.GetType("System.Int32"));
                dt.Columns.Add("Test_name", Type.GetType("System.String"));
                dt.Columns.Add("Amount", Type.GetType("System.Decimal"));
               
                dt.Columns.Add("Org_id", Type.GetType("System.Int32"));
                dt.Columns.Add("Branch_id", Type.GetType("System.String"));
                dt.Columns.Add("User_id", Type.GetType("System.String"));
                foreach (var item in PTest)
                {
                    dt.Rows.Add();
                    dt.Rows[dt.Rows.Count - 1]["Category_id"] = item.catId;
                    dt.Rows[dt.Rows.Count - 1]["Test_id"] = item.TId;
                    dt.Rows[dt.Rows.Count - 1]["Test_name"] = item.TesteName;
                    dt.Rows[dt.Rows.Count - 1]["Amount"] = item.TestAmt;
                   
                    dt.Rows[dt.Rows.Count - 1]["Org_id"] = objuser.Org_Id;
                    dt.Rows[dt.Rows.Count - 1]["Branch_id"] = objuser.Branch_Id;
                    dt.Rows[dt.Rows.Count - 1]["User_id"] = objuser.Id;
                }
                    BillBL bl = new BillBL();
                 status = bl.SaveOrder(objBE,dt);
            }
           catch (Exception e)
            {
               Console.Write(e);
            }
            return status;
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
        public static string[] Saveneworder(neworderBLO cat)
        {
            string[] status =new string[1] ;
           
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
                    DataSet ds = new DataSet();
                    dt  = bl.saveneworder(objBE);
                    ds.Tables.Add(dt);
                   
                    var pid = ds.Tables[0].Rows[0][0].ToString();
                    var pname = ds.Tables[0].Rows[0][1].ToString();
                   // return String.Format("Patient Id: {0}{2} <br/>Patient Name: {1}", pid, pname, Environment.NewLine);
                    string description = pid + "," + pname;
                    string[] a = description.Split(',');
                    return a;
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