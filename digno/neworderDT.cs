using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace digno
{
    public class neworderDT
    {


        public DataTable saveneworder(neworderBLO userinfo)
        {
            DataTable ds = new DataTable();
            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("hunmdc.sp_Patients", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@initial", userinfo.initial);
                cmd.Parameters.AddWithValue("@Patient_name", userinfo.name);
                cmd.Parameters.AddWithValue("@Mobile", userinfo.mobile);
                cmd.Parameters.AddWithValue("@Email", userinfo.email);
                cmd.Parameters.AddWithValue("@Age", userinfo.age);
                cmd.Parameters.AddWithValue("@Age_type", userinfo.agetype);
                cmd.Parameters.AddWithValue("@Ref_DR", userinfo.refdr);
                cmd.Parameters.AddWithValue("@Reference_center", userinfo.Uemail);
                cmd.Parameters.AddWithValue("@Sex", userinfo.gender);
                cmd.Parameters.AddWithValue("@Patient_type", "opd");
                cmd.Parameters.AddWithValue("@Isdeleted", DBNull.Value);
                cmd.Parameters.AddWithValue("@Status", DBNull.Value);

                cmd.Parameters.AddWithValue("@Patient_id", DBNull.Value);
                cmd.Parameters.AddWithValue("@Org_id", userinfo.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_id", userinfo.Branch_Id);
                cmd.Parameters.AddWithValue("@User_id", userinfo.Uemail);
         
                //cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
               // cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                  SqlDataAdapter da = new SqlDataAdapter();
                con.Open();
                //SqlDataReader sdr = cmd.ExecuteReader();
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();
                return ds;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return ds;
            }
        }


        public  List<ListItem> GetDoctor(neworderBLO userinfo)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
            List<ListItem> customers = new List<ListItem>();
            SqlCommand cmd = new SqlCommand("hunmdc.sp_GetDRInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Org_id", userinfo.Org_Id);
            cmd.Parameters.AddWithValue("@Branch_id", userinfo.Branch_Id);
            cmd.Parameters.AddWithValue("@User_id", userinfo.Uemail);
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    customers.Add(new ListItem
                    {
                        Value = sdr["Dr_id"].ToString(),
                        Text = sdr["Dr_name"].ToString()
                    });
                }
            }
            con.Close();
            return customers;
        }


        public List<ListItem> GetRefcenter(neworderBLO userinfo)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
            List<ListItem> customers = new List<ListItem>();
            SqlCommand cmd = new SqlCommand("hunmdc.sp_GetRefCenterInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Org_id", userinfo.Org_Id);
            cmd.Parameters.AddWithValue("@Branch_id", userinfo.Branch_Id);
            cmd.Parameters.AddWithValue("@User_id", userinfo.Uemail);
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    customers.Add(new ListItem
                    {
                        Value = sdr["Ref_id"].ToString(),
                        Text = sdr["RefCenter_name"].ToString()
                    });
                }
            }
            con.Close();
            return customers;
        }



        public DataSet GetPatientinfo(neworderBLO userinfo)
        {
            DataSet ds = new DataSet();
            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("sp_GetPatientsinfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Org_id", userinfo.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_id", userinfo.Branch_Id);
                cmd.Parameters.AddWithValue("@User_id", userinfo.Uemail);
                
                //cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                //cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                SqlDataAdapter da = new SqlDataAdapter();

                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();
                return ds;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return ds;
            }
        }

        public DataSet GetPatientbyid(neworderBLO userinfo)
        {
            DataSet ds = new DataSet();
            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("sp_GetPatientsUseridinfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Org_id", userinfo.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_id", userinfo.Branch_Id);
                cmd.Parameters.AddWithValue("@User_id", userinfo.Uemail);
                cmd.Parameters.AddWithValue("@Patient_id", userinfo.Patient_id);

                //cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                //cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                SqlDataAdapter da = new SqlDataAdapter();

                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();
                return ds;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return ds;
            }
        }
    }
}