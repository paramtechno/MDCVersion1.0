﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
namespace digno
{
    public class TestCreationDTO
    {

        public DataTable testcategory(BL userinfo)
        {
            DataTable ds = new DataTable();
            try {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("hunmdc.sp_SelectTestCategory", con);
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


        public DataSet subtestbind(BL userinfo)
        {
            DataSet ds = new DataSet();
            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("sp_gettestinfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Org_id", userinfo.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_id", userinfo.Branch_Id);
                cmd.Parameters.AddWithValue("@User_id", userinfo.Id);
                cmd.Parameters.AddWithValue("@Category_id", 8);
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

        public DataTable GetTEST(neworderBLO userinfo)
        {
            
            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("sp_gettestsinfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Org_id", userinfo.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_id", userinfo.Branch_Id);
                
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                SqlDataAdapter da = new SqlDataAdapter();

                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception e)
            {
                throw(e);
               
            }
        }

        public DataTable GetTestAmount(neworderBLO userinfo)
        {

            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("sp_gettestsamount", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Org_id", userinfo.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_id", userinfo.Branch_Id);
                cmd.Parameters.AddWithValue("@Test_id", userinfo.Test_id);

                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                SqlDataAdapter da = new SqlDataAdapter();
                
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception e)
            {
                throw (e);

            }
        }
    }
}