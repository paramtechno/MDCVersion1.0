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
        public string SaveOrder(float paid, float totalamt, float discount, string pid, billblo[] PTest, OrgBLO objBE)
        {


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            DataSet ds = new DataSet();
            foreach (var item in PTest)
            {
                billblo O = new billblo();
                con.Open();
                SqlCommand cmd = new SqlCommand("hunmdc.sp_Patient_test", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Patient_id", pid);
                cmd.Parameters.AddWithValue("@Category_id", item.catId);
                cmd.Parameters.AddWithValue("@Test_id", item.TId);
                cmd.Parameters.AddWithValue("@Test_name", item.TesteName);
                cmd.Parameters.AddWithValue("@Amount", item.TestAmt);
                cmd.Parameters.AddWithValue("@Org_id", objBE.Org_Id);
                cmd.Parameters.AddWithValue("@Branch_id ", objBE.Branch_Id);
                cmd.Parameters.AddWithValue("@User_id", objBE.Email);
                cmd.Parameters.AddWithValue("@Isdeleted ", DBNull.Value);
                cmd.Parameters.AddWithValue("@Status", '0');
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                SqlDataAdapter da = new SqlDataAdapter();
               
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();
                    }
            return "abc";

        }


    }
}