using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace digno
{
    public class OrgDTO
    {
        public string insertORG(OrgBLO orginfo)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            SqlCommand cmd = new SqlCommand("usp_tblOrg_info", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Org_name", orginfo.Org_name);
            cmd.Parameters.AddWithValue("@Reg_no", orginfo.Reg_no);
            cmd.Parameters.AddWithValue("@Status", orginfo.Status);
            cmd.Parameters.AddWithValue("@Email", orginfo.Email);
            cmd.Parameters.AddWithValue("@Mobile_no", orginfo.Mobile_no);
            cmd.Parameters.AddWithValue("@Password", orginfo.Password);
            cmd.Parameters.AddWithValue("@Exp_type", orginfo.Exp_type);
            cmd.Parameters.AddWithValue("@Subscritpion_type", orginfo.Subscription_type);

            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string status = cmd.Parameters["@ERROR"].Value.ToString();

            return status;
        }
        public Int32 savecategoryinfo(OrgBLO cat)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            SqlCommand cmd = new SqlCommand("sp_SaveTestCategory", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Test_category_name", cat.categoryname);
            cmd.Parameters.AddWithValue("@Order_by", cat.orderby);
            cmd.Parameters.AddWithValue("@Org_id", cat.Org_Id);
            cmd.Parameters.AddWithValue("@Branch_id", cat.Branch_Id);
            cmd.Parameters.AddWithValue("@User_id", cat.Email);
            if(cat.isupdate==1)
                cmd.Parameters.AddWithValue("@Category_id", cat.prvsorderid);
            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            int status = Convert.ToInt32(cmd.Parameters["@ERROR"].Value);

            return status;
        }

        public DataSet gettesttype(OrgBLO belogin)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("sp_gettestcategoryinfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Branch_id", belogin.Branch_Id);
            cmd.Parameters.AddWithValue("@Org_id", belogin.Org_Id);
            cmd.Parameters.AddWithValue("@User_id", belogin.Email);

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