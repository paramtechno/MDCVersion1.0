using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services;
using System.Web.Script.Services;
using System.Collections.Generic;
using System.Web.Script.Serialization;

//using System.Data.Entity;
//using System.Linq;
//using System.Web;
//using System.Linq.Dynamic;
//using System.Data.Entity;


public partial class Test : System.Web.UI.Page
{
    string str;
    string str1;
    SqlCommand com;
    SqlCommand com1;
   string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

   public string billno = String.Empty;
   public string pid = String.Empty;
   public string billno1 { get; set; }
   public string Pname { get; set; }
   public string Page { get; set; }
   public string Psex { get; set; }
   public string Pdr { get; set; }
   public string Pdate { get; set; }
   public string Pid1 { get; set; }
   public string PAddress { get; set; }
   public string PMobile { get; set; }
   public string up {get;set;}
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["usrname"])) && !String.IsNullOrEmpty(Convert.ToString(Session["DCID"])))
            {

                bool isupdate;
                int id = Convert.ToInt32(Request.QueryString["billno"].ToString());
                isupdate = Convert.ToBoolean(Request.QueryString["isupdate"]);

                if (isupdate)
                {
                    up = "update";
                    loadupdatedetails(id);
                }
                else
                {
                    up = "insert";
                    SqlConnection conn = new SqlConnection(constr);
                    conn.Open();
                    str = "select billno,pid from bill where uid=" + Convert.ToInt64(HttpContext.Current.Session["DCID"]) + "";
                    com = new SqlCommand(str, conn);
                    SqlDataReader reader = com.ExecuteReader();

                    reader.Read();

                    billno = reader["billno"].ToString();
                    pid = reader["pid"].ToString();

                    reader.Close();
                    conn.Close();

                }
        

            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }
       
        

           

    }
    [WebMethod]
    public static string GetTestAmount(string testid)
    {
        string jsonData = "";
        string constr1 = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr1))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT amount FROM Test_Creation WHERE slno = @testid", con))
            {
                cmd.Parameters.AddWithValue("@testid", testid);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    var input = new
                    {
                        amount = sdr["amount"]
                    };
                    jsonData = (new JavaScriptSerializer()).Serialize(input);
                }
                con.Close();
            }
        }

        return jsonData;
    }
    
    
    public void loadupdatedetails(int id)
    {

        SqlConnection conn = new SqlConnection(constr);
        conn.Open();
        str = "select TesteName,TestAmt from PTest where PBillNo='" + id + "' and uid='" + Convert.ToInt64(HttpContext.Current.Session["DCID"]) + "'";
        com = new SqlCommand(str, conn);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(com);
        da.Fill(ds);
        rptCustomers.DataSource = ds;
        rptCustomers.DataBind();
        conn.Close();



        SqlConnection conn1 = new SqlConnection(constr);
        conn1.Open();
        str1 = "select * from Pinfo where PBillNo='" + id + "'  and uid='" + Convert.ToInt64(HttpContext.Current.Session["DCID"]) + "'";
        com1 = new SqlCommand(str1, conn1);
        DataSet ds1 = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter(com1);
        da1.Fill(ds1);
       
        conn1.Close();
        billno1 = ds1.Tables[0].Rows[0]["PBillNo"].ToString();
        Pname = ds1.Tables[0].Rows[0]["PName"].ToString();
        Page = ds1.Tables[0].Rows[0]["PAge"].ToString();
        Psex = ds1.Tables[0].Rows[0]["PGender"].ToString();
        Pdr = ds1.Tables[0].Rows[0]["PDrName"].ToString();
        Pdate = ds1.Tables[0].Rows[0]["PDate"].ToString();
        Pid1 = ds1.Tables[0].Rows[0]["Pid1"].ToString();
        PAddress = ds1.Tables[0].Rows[0]["PAddress"].ToString();
        PMobile = ds1.Tables[0].Rows[0]["PMobile"].ToString();

    }





    [WebMethod]
    public static string InsertData(string docname, string mobno, string email)
    {
        string msg = string.Empty;
        string constr1 = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr1))

        //using (SqlConnection conn = new SqlConnection(@"Data Source=151.106.54.86;Initial Catalog=smmp.mdf;User ID=SMMP1;Password=qN0by4%8"))
        {
            using (SqlCommand cmd = new SqlCommand("insert into Pa(docname,mobno,email) VALUES(@docname,@mobno,@email)", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@docname", docname);
                cmd.Parameters.AddWithValue("@mobno", mobno);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@docname", docname);
                cmd.Parameters.AddWithValue("@mobno", mobno);
                cmd.Parameters.AddWithValue("@email", email);


                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    msg = "true";
                }
                else
                {
                    msg = "false";
                }
            }
        }
        return msg;
    }

[WebMethod(EnableSession = true)]
    public static List<ListItem> GetAMT()
    {
        string query = "SELECT top(500) test_name,slno FROM Test_Creation where uid=" + Convert.ToInt64(HttpContext.Current.Session["DCID"]) + " order by test_name ";
        string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                List<ListItem> customers = new List<ListItem>();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(new ListItem
                        {
                            Value = sdr["slno"].ToString(),
                            Text = sdr["test_name"].ToString()
                        });
                       
                       
                    }
                }
                con.Close();
                return customers;
            }
        }
    }

[WebMethod(EnableSession = true)]
 public static List<ListItem> GetDoctor()
 {
     string query = "SELECT slno,docname FROM Dr_creation where  uid=" + Convert.ToInt64(HttpContext.Current.Session["DCID"]) + "";
     string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
     using (SqlConnection con = new SqlConnection(constr))
     {
         using (SqlCommand cmd = new SqlCommand(query))
         {
             List<ListItem> customers = new List<ListItem>();
             cmd.CommandType = CommandType.Text;
             cmd.Connection = con;
             con.Open();
             using (SqlDataReader sdr = cmd.ExecuteReader())
             {
                 while (sdr.Read())
                 {
                     customers.Add(new ListItem
                     {
                         Value = sdr["slno"].ToString(),
                         Text = sdr["docname"].ToString()
                     });
                 }
             }
             con.Close();
             return customers;
         }
     }
 }

 
 public class pinfo
 {
     public string PName { get; set; }
     public string PAddress { get; set; }
     public DateTime PDate { get; set; }
     public int PBillNo { get; set; }
     public string PMobile { get; set; }
     public string PDrName { get; set; }
     public int pid { get; set; }
     public string PGender { get; set; }
     public int Page { get; set; }
 }

 public partial class PTest
 {
     public int Id { get; set; }
     public Nullable<int> PBillNo { get; set; }
     public string TesteName { get; set; }
     public Nullable<int> TId { get; set; }
     public Nullable<double> TestAmt { get; set; }
     public string stu { get; set; }
 }



     [WebMethod(EnableSession = true)]
 public static string SaveOrder(string name,string address, int billno, string gen, string mobil, string Dr,int pid,int Page, PTest[] PTest)
 {
     string result = "Error! Order Is Not Complete!";

     var cutomerId = Guid.NewGuid();
     
     pinfo model = new pinfo();

     model.PName = name;
     model.PAddress = address;
     model.PDate = DateTime.Now;
     model.PBillNo = billno;
     model.PGender = gen;
     model.PMobile = mobil;
     model.PDrName = Dr;
     model.pid = pid;
     model.Page = Page;


     string msg = string.Empty;
     string constr1 = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
     using (SqlConnection con = new SqlConnection(constr1))
     //using (SqlConnection conn = new SqlConnection(@"Data Source=151.106.54.86;Initial Catalog=smmp.mdf;User ID=SMMP1;Password=qN0by4%8"))
     {
         using (SqlCommand cmd = new SqlCommand("insert into Pinfo(PName,PAddress,PDate,PBillNo,PMobile,PDrName,Pid1,PAge,PGender,uid,dcid) VALUES(@PName,@PAddress,@PDate,@PBillNo,@PMobile,@PDrName,@Pid1,@page,@Pgen,@uid,@dcid)", con))
         {
             con.Open();
             cmd.Parameters.AddWithValue("@PName", model.PName);
             cmd.Parameters.AddWithValue("@PAddress", model.PAddress);
             cmd.Parameters.AddWithValue("@PDate", model.PDate);
             cmd.Parameters.AddWithValue("@PBillNo", model.PBillNo);
             cmd.Parameters.AddWithValue("@PMobile", model.PMobile);
             cmd.Parameters.AddWithValue("@PDrName", model.PDrName);
             cmd.Parameters.AddWithValue("@Pid1", model.pid);
             cmd.Parameters.AddWithValue("@Page", model.Page);
             cmd.Parameters.AddWithValue("@Pgen", model.PGender);
             cmd.Parameters.AddWithValue("@uid", Convert.ToInt64(HttpContext.Current.Session["UID"]));
             cmd.Parameters.AddWithValue("@dcid", Convert.ToInt64(HttpContext.Current.Session["DCID"]));
             int i = cmd.ExecuteNonQuery();
             con.Close();
             
                 foreach (var item in PTest)
                 {
                     con.Open();
                     using (SqlCommand cmd1 = new SqlCommand("insert into PTest(PBillNo,TesteName,TestAmt,uid,TId,dcid) VALUES(@PBillNo,@TestName,@TestAmt,@uid,@tid,@dcid)", con))
                     {

                     var orderId = Guid.NewGuid();
                     PTest O = new PTest();
                     // O.OrderId = orderId;
                     O.PBillNo = billno;
                     O.TesteName = item.TesteName;
                     O.TestAmt = item.TestAmt;
                     O.TId = item.TId;
                     cmd1.Parameters.AddWithValue("@PBillNo", O.PBillNo);
                     cmd1.Parameters.AddWithValue("@TestName", O.TesteName);
                     cmd1.Parameters.AddWithValue("@TestAmt", O.TestAmt);
                     cmd1.Parameters.AddWithValue("@tid", O.TId);
                     cmd1.Parameters.AddWithValue("@uid", Convert.ToInt64(HttpContext.Current.Session["UID"]));
                     cmd1.Parameters.AddWithValue("@dcid", Convert.ToInt64(HttpContext.Current.Session["DCID"]));
                     cmd1.ExecuteNonQuery();
                    // db.PTests.Add(O);
                     con.Close();
                 }
             }




                 string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                 using (SqlConnection conn1 = new SqlConnection(constr))
                 //using (SqlConnection conn1 = new SqlConnection(@"Data Source=151.106.54.86;Initial Catalog=smmp.mdf;User ID=SMMP1;Password=qN0by4%8"))
                 {
                     using (SqlCommand cmd3 = new SqlCommand("update bill set billno=@billno,pid=@pid where uid=@uid", conn1))
                     {
                         conn1.Open();
                         var updatebillno = billno + 1;
                         var updatepid = pid + 1;
                         cmd3.Parameters.AddWithValue("@billno", updatebillno);
                         cmd3.Parameters.AddWithValue("@pid", updatepid);
                         cmd3.Parameters.AddWithValue("@uid", Convert.ToInt64(HttpContext.Current.Session["DCID"]));
                         int i2 = cmd3.ExecuteNonQuery();
                         conn1.Close();
                     }

                 }


                 if (i == 1)
                 {
                     msg = "true";
                 }
                 else
                 {
                     msg = "false";
                 }
         }
     }

     result = "Success! Order Is Complete!";

     return result;
 }



     //[WebMethod]
     //public static string updateOrder(string name, string address, int billno, string gen, string mobil, string Dr, int pid, int Page, PTest[] PTest)
     //{
     //    string result = "Error! Order Is Not Complete!";

     //    var cutomerId = Guid.NewGuid();

     //    pinfo model = new pinfo();

     //    model.PName = name;
     //    model.PAddress = address;
     //    model.PDate = DateTime.Now;
     //    model.PBillNo = billno;
     //    model.PGender = gen;
     //    model.PMobile = mobil;
     //    model.PDrName = Dr;
     //    model.pid = pid;
     //    model.Page = Page;


     //    string msg = string.Empty;
     //    string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
     //    using (SqlConnection conn1 = new SqlConnection(constr))
     //    //using (SqlConnection conn = new SqlConnection(@"Data Source=151.106.54.86;Initial Catalog=smmp.mdf;User ID=SMMP1;Password=qN0by4%8"))
     //    {
     //        using (SqlCommand cmd = new SqlCommand("update Pinfo set PName=@PName,PAddress=@PAddress,PDate=@PDate,PMobile=@PMobile,PDrName=@PDrName,PAge=@page,PGender=@Pgen where PBillNo=@PBillNo", conn1))
     //        {
     //            conn1.Open();
     //            cmd.Parameters.AddWithValue("@PName", model.PName);
     //            cmd.Parameters.AddWithValue("@PAddress", model.PAddress);
     //            cmd.Parameters.AddWithValue("@PDate", model.PDate);
     //            cmd.Parameters.AddWithValue("@PBillNo", model.PBillNo);
     //            cmd.Parameters.AddWithValue("@PMobile", model.PMobile);
     //            cmd.Parameters.AddWithValue("@PDrName", model.PDrName);
     //            cmd.Parameters.AddWithValue("@Pid1", model.pid);
     //            cmd.Parameters.AddWithValue("@Page", model.Page);
     //            cmd.Parameters.AddWithValue("@Pgen", model.PGender);

     //            int i = cmd.ExecuteNonQuery();
     //            conn1.Close();
     //            conn1.Open();

     //            using (SqlCommand cmd2 = new SqlCommand("delete  from PTest where PBillNo=@PBillNo ", conn1))
     //            {
     //                cmd2.Parameters.AddWithValue("@PBillNo", model.PBillNo);
     //                cmd2.ExecuteNonQuery();
     //            }


     //            conn1.Close();
     //            foreach (var item in PTest)
     //            {
     //                conn1.Open();
     //                using (SqlCommand cmd1 = new SqlCommand("insert into PTest(PBillNo,TesteName,TestAmt) VALUES(@PBillNo,@TestName,@TestAmt)", conn1))
     //                {

     //                    var orderId = Guid.NewGuid();
     //                    PTest O = new PTest();
     //                    // O.OrderId = orderId;
     //                    O.PBillNo = billno;
     //                    O.TesteName = item.TesteName;
     //                    O.TestAmt = item.TestAmt;

     //                    cmd1.Parameters.AddWithValue("@PBillNo", O.PBillNo);
     //                    cmd1.Parameters.AddWithValue("@TestName", O.TesteName);
     //                    cmd1.Parameters.AddWithValue("@TestAmt", O.TestAmt);
     //                    cmd1.ExecuteNonQuery();
     //                    // db.PTests.Add(O);
     //                    conn1.Close();
     //                }
     //            }

     //            //using (SqlConnection conn1 = new SqlConnection(@"Data Source=151.106.54.86;Initial Catalog=smmp.mdf;User ID=SMMP1;Password=qN0by4%8"))
     //            //{
     //            //    using (SqlCommand cmd3 = new SqlCommand("update bill set billno=@billno,pid=@pid", conn1))
     //            //    {
     //            //        conn1.Open();
     //            //        var updatebillno = billno + 1;
     //            //        var updatepid = pid + 1;
     //            //        cmd3.Parameters.AddWithValue("@billno", updatebillno);
     //            //        cmd3.Parameters.AddWithValue("@pid", updatepid);

     //            //        int i2 = cmd3.ExecuteNonQuery();
     //            //        conn1.Close();
     //            //    }

     //            //}


     //            if (i == 1)
     //            {
     //                msg = "true";
     //            }
     //            else
     //            {
     //                msg = "false";
     //            }
     //        }
     //    }

     //    result = "Success! Order Is Complete!";

     //    return result;
     //}



     //    [WebMethod]
     //public void updatebill(int stlbillno)
     //{
     //    string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
     //    using (SqlConnection conn1 = new SqlConnection(constr))
     //    //using (SqlConnection conn = new SqlConnection(@"Data Source=151.106.54.86;Initial Catalog=smmp.mdf;User ID=SMMP1;Password=qN0by4%8"))
     //    {
     //        using (SqlCommand cmd = new SqlCommand("update bill set billno=@billno", conn1))
     //        {
     //            conn1.Open();
     //            cmd.Parameters.AddWithValue("@billno", stlbillno);


     //            int i = cmd.ExecuteNonQuery();
     //            conn1.Close();
     //        }

     //    }
     //}
       

 
}