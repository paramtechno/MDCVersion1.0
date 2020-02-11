using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace digno
{
    public class DTO
    {

        public DataSet LoginCredential(BL belogin)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
      
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_LoginVerification", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", belogin.User_name);
            cmd.Parameters.AddWithValue("@Password", belogin.Password);
            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();
            return ds;

           

        }  
         public DataSet insertORG(BL orginfo)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
      
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_tblOrg_info", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Org_name", orginfo.orgname);
             cmd.Parameters.AddWithValue("@Reg_no", orginfo.labno);
            cmd.Parameters.AddWithValue("@Email", orginfo.email);
              cmd.Parameters.AddWithValue("@Mobile_no", orginfo.mobile);
              cmd.Parameters.AddWithValue("@Password", orginfo.Password);
              cmd.Parameters.AddWithValue("@Exp_type", orginfo.exptype);
             cmd.Parameters.AddWithValue("@Subscritpion_type", orginfo.subtype);

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