using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace digno
{
    public class BranchUsersDT
    {
        public string SaveUsers(BranchUsersBLO cat)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            SqlCommand cmd = new SqlCommand("hunmdc.sp_SaveUsers", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (cat.Actions == 0)
            {
                cmd.Parameters.AddWithValue("@User_id", cat.PrevUID);
                cmd.Parameters.AddWithValue("@User_name", cat.User_name);
                cmd.Parameters.AddWithValue("@Password", cat.Password);
                cmd.Parameters.AddWithValue("@Role_type", cat.Role_type);
                cmd.Parameters.AddWithValue("@Org_id", cat.Org_id);
                cmd.Parameters.AddWithValue("@Branch_id", cat.Branch_id);
                cmd.Parameters.AddWithValue("@Status", cat.UStatus);
                cmd.Parameters.AddWithValue("@Action", cat.Actions);
                cmd.Parameters.AddWithValue("@Last_modified", DBNull.Value);
                cmd.Parameters.AddWithValue("@Mobile_no", cat.Mobile);
                cmd.Parameters.AddWithValue("@Email", cat.Email);

            }
            else if (cat.Actions == 1)
            {
                cmd.Parameters.AddWithValue("@User_id", cat.PrevUID);
                cmd.Parameters.AddWithValue("@User_name", cat.User_name);
                cmd.Parameters.AddWithValue("@Password", cat.Password);
                cmd.Parameters.AddWithValue("@Role_type", DBNull.Value);
                cmd.Parameters.AddWithValue("@Org_id", cat.Org_id);
                cmd.Parameters.AddWithValue("@Branch_id", cat.Branch_id);
                cmd.Parameters.AddWithValue("@Status", DBNull.Value);
                cmd.Parameters.AddWithValue("@Action", cat.Actions);
                cmd.Parameters.AddWithValue("@Last_modified", DBNull.Value);
                cmd.Parameters.AddWithValue("@Mobile_no", cat.Mobile);
                cmd.Parameters.AddWithValue("@Email", cat.Email);

            }
            else if (cat.Actions == 2)
            {
                cmd.Parameters.AddWithValue("@User_id", cat.PrevUID);
                cmd.Parameters.AddWithValue("@User_name", DBNull.Value);
                cmd.Parameters.AddWithValue("@Password", DBNull.Value);
                cmd.Parameters.AddWithValue("@Role_type", DBNull.Value);
                cmd.Parameters.AddWithValue("@Org_id", cat.Org_id);
                cmd.Parameters.AddWithValue("@Branch_id", cat.Branch_id);
                cmd.Parameters.AddWithValue("@Status", cat.UStatus);
                cmd.Parameters.AddWithValue("@Action", cat.Actions);
                cmd.Parameters.AddWithValue("@Last_modified", DBNull.Value);
                cmd.Parameters.AddWithValue("@Mobile_no", DBNull.Value);
                cmd.Parameters.AddWithValue("@Email", DBNull.Value);

            }

            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 6);
            //cmd.Parameters.AddWithValue("@ERROR", DBNull.Value);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string status = Convert.ToString(cmd.Parameters["@ERROR"].Value);

            return status;
        }

        public DataSet GetUsers(BL userinfo)
        {
            DataSet ds = new DataSet();
            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("sp_GetUsersByBranch", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Org_id", userinfo.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_id", userinfo.Branch_Id);

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
        public DataTable BindBranchName(BL userinfo)
        {

            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("sp_GetBranchNameONBID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Branch_id", userinfo.Branch_Id);

                //cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                //cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                SqlDataAdapter da = new SqlDataAdapter();

                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception e)
            {
                throw e;

            }
        }
    }
}