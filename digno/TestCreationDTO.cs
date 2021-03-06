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
                cmd.Parameters.AddWithValue("@Category_id", 0);
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

        public string savesubtest(OrgBLO cat)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            SqlCommand cmd = new SqlCommand("hunmdc.sp_Test", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (cat.Actions == 0)
            {
                cmd.Parameters.AddWithValue("@Test_ID", DBNull.Value);
                cmd.Parameters.AddWithValue("@Category_ID", cat.categoryid);
                cmd.Parameters.AddWithValue("@Test_Name", cat.subtestname);
                cmd.Parameters.AddWithValue("@Amount", cat.tstamount);
                cmd.Parameters.AddWithValue("@Org_ID", cat.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_ID", cat.Branch_Id);
                cmd.Parameters.AddWithValue("@UserID", cat.Email);
                cmd.Parameters.AddWithValue("@Status", 0);
                cmd.Parameters.AddWithValue("@Created_Date", DBNull.Value);
                cmd.Parameters.AddWithValue("@Action", cat.Actions);
                cmd.Parameters.AddWithValue("@Is_Deleted", DBNull.Value);
                cmd.Parameters.AddWithValue("@Test_Code", DBNull.Value);

            }
            else if (cat.Actions == 1)
            {
                cmd.Parameters.AddWithValue("@Test_ID",cat.prvsorderid);
                cmd.Parameters.AddWithValue("@Category_ID", cat.categoryid);
                cmd.Parameters.AddWithValue("@Test_Name", cat.subtestname);
                cmd.Parameters.AddWithValue("@Amount", cat.tstamount);
                cmd.Parameters.AddWithValue("@Org_ID", cat.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_ID", cat.Branch_Id);
                cmd.Parameters.AddWithValue("@UserID", cat.Email);
                cmd.Parameters.AddWithValue("@Status", 0);
                cmd.Parameters.AddWithValue("@Created_Date", DBNull.Value);
                cmd.Parameters.AddWithValue("@Action", cat.Actions);
                cmd.Parameters.AddWithValue("@Is_Deleted", DBNull.Value);
                cmd.Parameters.AddWithValue("@Test_Code", DBNull.Value);

            }
            else if (cat.Actions == 2)
            {
                cmd.Parameters.AddWithValue("@Test_ID", cat.prvsorderid);
                cmd.Parameters.AddWithValue("@Category_ID", cat.categoryid);
                cmd.Parameters.AddWithValue("@Test_Name", DBNull.Value);
                cmd.Parameters.AddWithValue("@Amount", DBNull.Value);
                cmd.Parameters.AddWithValue("@Org_ID", cat.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_ID", cat.Branch_Id);
                cmd.Parameters.AddWithValue("@UserID", cat.Email);
                cmd.Parameters.AddWithValue("@Status", cat.activestatus);
                cmd.Parameters.AddWithValue("@Created_Date", DBNull.Value);
                cmd.Parameters.AddWithValue("@Action", cat.Actions);
                cmd.Parameters.AddWithValue("@Is_Deleted", DBNull.Value);
                cmd.Parameters.AddWithValue("@Test_Code", DBNull.Value);

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
        public string Saveparam(TestCreationBLO cat)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            SqlCommand cmd = new SqlCommand("hunmdc.sp_SaveTestParametersInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
           
                cmd.Parameters.AddWithValue("@Test_id", cat.tid);
                cmd.Parameters.AddWithValue("@Parameter_name", cat.parname);
                cmd.Parameters.AddWithValue("@Exam_method", cat.exmtd);
                cmd.Parameters.AddWithValue("@Gender", cat.gender);
                cmd.Parameters.AddWithValue("@Org_id", cat.Org_id);
                cmd.Parameters.AddWithValue("@Branch_id", cat.branchid);
                cmd.Parameters.AddWithValue("@User_id", cat.userid);
               // cmd.Parameters.AddWithValue("@Status", 0);
               // cmd.Parameters.AddWithValue("@Created_Date", DBNull.Value);
                //cmd.Parameters.AddWithValue("@Action", cat.Actions);
               // cmd.Parameters.AddWithValue("@Is_Deleted", DBNull.Value);
                cmd.Parameters.AddWithValue("@Units", cat.unit);

  

            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 6);
            //cmd.Parameters.AddWithValue("@ERROR", DBNull.Value);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string status = Convert.ToString(cmd.Parameters["@ERROR"].Value);

            return status;
        }


        public DataTable Getparameter(TestCreationBLO userinfo)
        {
            DataTable ds = new DataTable();
            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("hunmdc.sp_GetTestParametersInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Org_id", userinfo.Org_id);
                cmd.Parameters.AddWithValue("@Test_id", userinfo.tid);
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
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



        public string Saveparametersranges(TestCreationBLO cat)
        {
            try {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("hunmdc.sp_SaveTestRangesInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Test_id", cat.tid);
                cmd.Parameters.AddWithValue("@Parameter_id", cat.parid);
                cmd.Parameters.AddWithValue("@Age_type", cat.agetype);
                cmd.Parameters.AddWithValue("@Gender", cat.gender);
                cmd.Parameters.AddWithValue("@Org_id", cat.Org_id);
                cmd.Parameters.AddWithValue("@Branch_id", cat.branchid);
                cmd.Parameters.AddWithValue("@User_id", cat.userid);
                cmd.Parameters.AddWithValue("@Age_ranges", 0);
                cmd.Parameters.AddWithValue("@Min_age", cat.minAg);
                cmd.Parameters.AddWithValue("@Max_age", cat.maxAg);
                cmd.Parameters.AddWithValue("@Min_age_days", DBNull.Value);
                cmd.Parameters.AddWithValue("@Max_age_days", cat.unit);
                cmd.Parameters.AddWithValue("@Min_parameter_val", cat.Minval);
                cmd.Parameters.AddWithValue("@Max_parameter_val", cat.Maxval);
                cmd.Parameters.AddWithValue("@Text_value", cat.textval);
                cmd.Parameters.AddWithValue("@Normal_val", cat.narval);
                cmd.Parameters.AddWithValue("@Special_condition", cat.SC);



                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 6);
                //cmd.Parameters.AddWithValue("@ERROR", DBNull.Value);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                string status = Convert.ToString(cmd.Parameters["@ERROR"].Value);

                return status;
            }
            catch (Exception ex)
            {
                Console.Write(ex);
                return "fail";
            }
        }

        public DataTable Getparameterranges(TestCreationBLO userinfo)
        {
            DataTable ds = new DataTable();
            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                SqlCommand cmd = new SqlCommand("hunmdc.sp_GetTestRangesInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Org_id", userinfo.Org_id);
                cmd.Parameters.AddWithValue("@Test_id", userinfo.tid);
                cmd.Parameters.AddWithValue("@Parameter_id", userinfo.tid);
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
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