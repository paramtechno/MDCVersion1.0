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

public partial class Billmaster : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        //if (IsPostBack != true)
        //{
        //    if (!String.IsNullOrEmpty(Convert.ToString(Session["usrname"])) && !String.IsNullOrEmpty(Convert.ToString(Session["UID"])))
        //    {
                
              
        //        getbill();
               
        //    }
        //    else
        //    {
        //        Response.Redirect("index.aspx");
        //    }
        //}
       
    }
    //public void getbill()
    //{
       
    //    try
    //    {
    //        using (SqlConnection con = new SqlConnection(constr))
    //        {
    //            //using (SqlCommand cmd = new SqlCommand("select PId,PBillNo,PName,convert(varchar, Pdate, 103) as 'Pdate' from Pinfo where uid='" + Convert.ToInt64(HttpContext.Current.Session["DCID"]) + "' order by PBillNo desc", con))
    //            //{
    //            //    con.Open();
    //            //    DataSet ds = new DataSet();
    //            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
    //            //    da.Fill(ds);
    //            //    con.Close();

    //                Hashtable httst1;
    //                httst1 = new Hashtable();
    //                var uid = Convert.ToInt64(HttpContext.Current.Session["UID"]);
    //                var dcid = Convert.ToInt64(HttpContext.Current.Session["DCID"]);
    //                var Utype = Convert.ToString(HttpContext.Current.Session["type"]);
    //                DataTable dt = new DataTable();
    //                data_Access dta = new data_Access();

    //                httst1.Add("@Trans", "select");
    //                httst1.Add("@uid", uid);
    //                httst1.Add("@dcid", dcid);
    //                httst1.Add("@type", Utype);
    //                dt = dta.executeSP("sp_Bills", httst1, con);

    //                if (dt.Rows.Count > 0)
    //                {
    //                    rptCustomers.DataSource = dt;
    //                    rptCustomers.DataBind();
    //                }
    //           // }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClientScript.RegisterClientScriptBlock(GetType(), "msg", "<script>alert('Some Error Occured');</script>");
    //    }
    //} 


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