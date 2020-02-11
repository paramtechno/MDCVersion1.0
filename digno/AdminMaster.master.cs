using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["usrname"])) && !String.IsNullOrEmpty(Convert.ToString(Session["UID"])))
            {


                //Label3.Text = Convert.ToString(Session["usrname"]);
                //.Text = Convert.ToString(Session["usrname"]);
                // Label2.Text = Convert.ToString(Session["UID"]);
                //Label1.Text = Convert.ToString(Session["dcid"]);

                if (Convert.ToString(Session["type"]) == "admin")
                {
                    //treeId.Visible = true;
                    // testResultId.Visible = true;
                }
                else if (Convert.ToString(Session["type"]) == "user")
                {

                    // treeId.Visible = false;
                    // testResultId.Visible = false;
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }

        }
    }
}
