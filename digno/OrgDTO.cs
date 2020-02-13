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

    }
}