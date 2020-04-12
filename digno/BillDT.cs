using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace digno
{
    public class BillDT
    {
        public string SaveOrder(neworderBLO objBE,DataTable dt)
        {
            try {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
                DataSet ds = new DataSet();

                billblo O = new billblo();
                con.Open();
                SqlCommand cmd = new SqlCommand("hunmdc.sp_Patients", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@initial ", objBE.initial);
                cmd.Parameters.AddWithValue("@Paid_amount ", objBE.Paidamt);
                cmd.Parameters.AddWithValue("@Discount_amount ", objBE.Discount);
                cmd.Parameters.AddWithValue("@Patient_name ", objBE.Patient_name);
                cmd.Parameters.AddWithValue("@Sex", objBE.gender);
                cmd.Parameters.AddWithValue("@Age", objBE.age);
                cmd.Parameters.AddWithValue("@Email", objBE.email);
                cmd.Parameters.AddWithValue("@Ref_DR", objBE.refdr);
                cmd.Parameters.AddWithValue("@Mobile", objBE.mobile);
                cmd.Parameters.AddWithValue("@tblDetails", dt);
                cmd.Parameters.AddWithValue("@Patient_type", objBE.email);
                cmd.Parameters.AddWithValue("@Org_id", objBE.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_id ", objBE.Branch_Id);
                cmd.Parameters.AddWithValue("@User_id", objBE.userid);
               
                cmd.Parameters.AddWithValue("@Isdeleted ", DBNull.Value);
                cmd.Parameters.AddWithValue("@Patient_id  ", DBNull.Value);
                cmd.Parameters.AddWithValue("@Reference_center", objBE.refcenter);
                cmd.Parameters.AddWithValue("@Total_amount", objBE.totalamt);
                cmd.Parameters.AddWithValue("@Age_type", 'y');
                cmd.Parameters.AddWithValue("@Status", '0');
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                SqlDataAdapter da = new SqlDataAdapter();

                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();
            }
            catch (Exception e)
            {
                Console.Write(e);
            }
            return "abc";

        }


    }
}