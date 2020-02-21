using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace digno
{
    public class RefDTO
    {
        public string insertRefCenter(RefBLO Refcenter)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            SqlCommand cmd = new SqlCommand("sp_Master_RefCenter", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RefCenter_Name", Refcenter.Refname);
            cmd.Parameters.AddWithValue("@RefCenter_Address", Refcenter.Refaddress);
            cmd.Parameters.AddWithValue("@RefCenter_ContactPerson", Refcenter.Refperson);
            cmd.Parameters.AddWithValue("@RefCenter_MobNo", Refcenter.Refmobi);
            cmd.Parameters.AddWithValue("@Org_ID", Refcenter.Org_Id);
            cmd.Parameters.AddWithValue("@Branch_ID", Refcenter.Branch_Id);
            cmd.Parameters.AddWithValue("@UserID", Refcenter.UserID);
            cmd.Parameters.AddWithValue("@Created_Date", Refcenter.RefDate);
            cmd.Parameters.AddWithValue("@Is_Deleted", Refcenter.Refisdeleted);
            cmd.Parameters.AddWithValue("@Status", Refcenter.Refstatus);

            cmd.Parameters.AddWithValue("@RefID", DBNull.Value);
            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;

            con.Open();

            cmd.ExecuteNonQuery();
            con.Close();
            string status = cmd.Parameters["@ERROR"].Value.ToString();

            return status;
        }
      

        public DataSet gettesttype(RefBLO belogin)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("sp_GetRefCenterInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Branch_ID", belogin.Branch_Id);
            cmd.Parameters.AddWithValue("@Org_ID", belogin.Org_Id);
            cmd.Parameters.AddWithValue("@UserID", belogin.UserID);

            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();
            return ds;
        }
    }
}