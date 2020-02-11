using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace digno
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string MyMethod(string username, string password)
        {
            var url = "";
            BL obJBE = new BL();
            obJBE.User_name = username;
            obJBE.Password = password;
            DataSet ds = new DataSet();
            BLO bl = new BLO();
            ds = bl.UserLogin(obJBE);
            if (ds.Tables.Count == 1)
            {
                //lblErrorMsg.Text = ds.Tables[0].Rows[0][0].ToString();
            }
            else if (ds.Tables[1].Rows[0][0].ToString() == "1")
            {
                // lblErrorMsg.Text = string.Empty;

                String name = null;
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0][1].ToString()))
                {
                    if (ds.Tables[0].Rows[0][1].ToString() == "admin")
                        HttpContext.Current.Session["UserId"] = ds.Tables[0].Rows[0][0].ToString();
                    url = "admin.aspx";
                }




                //.Redirect("~/Default.aspx");
            }
            return url;
        }

    }
}