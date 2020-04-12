using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digno
{
    public partial class Billmaster : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (IsPostBack != true)
            //{
            //    if (!String.IsNullOrEmpty(Convert.ToString(Session["usrname"])) && !String.IsNullOrEmpty(Convert.ToString(Session["UID"])))
            //    {


            getbill();

            //    }
            //    else
            //    {
            //        Response.Redirect("index.aspx");
            //    }
            //}

        }
        public void getbill()
        {

            try
            {
                DataSet ds = new DataSet();
                BL objsess = new BL();
                BillCreationBL bl = new BillCreationBL();
                objsess = (BL)HttpContext.Current.Session["Userinfo"];
                ds = bl.BILLbind(objsess);



                //Billrept.DataSource = ds;
               // Billrept.DataBind();
                

            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "msg", "<script>alert('Some Error Occured');</script>");
            }
        }


        //[WebMethod]
        //public static void DeleteCustomer(int PId)
        //{
        //    string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("DELETE FROM Pinfo WHERE PBillNo = @PId and uid=@uid"))
        //        {
        //            cmd.Parameters.AddWithValue("@PId", PId);
        //            cmd.Parameters.AddWithValue("@uid", Convert.ToInt64(HttpContext.Current.Session["UID"]));
        //            cmd.Connection = con;
        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //            con.Close();
        //        }
        //    }
        //    using (SqlConnection con1 = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("DELETE FROM PTest WHERE PBillNo = @PId and uid=@uid"))
        //        {
        //            cmd.Parameters.AddWithValue("@PId", PId);
        //            cmd.Parameters.AddWithValue("@uid", Convert.ToInt64(HttpContext.Current.Session["UID"]));
        //            cmd.Connection = con1;
        //            con1.Open();
        //            cmd.ExecuteNonQuery();
        //            con1.Close();
        //        }
        //    }
        //}
    }
}