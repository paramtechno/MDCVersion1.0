using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digno
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                BL objuser = new BL();
                objuser = (BL)Session["userinfo"];
                
                if (!String.IsNullOrEmpty(Convert.ToString(objuser)))
                {
                                                   


                    Label3.Text = Convert.ToString(objuser.User_name);                   
                    Label1.Text = Convert.ToString(objuser.User_name);

                    if (Convert.ToString(Session["type"]) == "admin")
                    {
                        Label3.Text = Convert.ToString(objuser.User_name);
                        Label1.Text = Convert.ToString(objuser.User_name);
                        //treeId.Visible = true;
                        // testResultId.Visible = true;
                    }
                    else if (Convert.ToString(Session["type"]) == "user")
                    {
                        Label3.Text = Convert.ToString(objuser.User_name);
                        Label1.Text = Convert.ToString(objuser.User_name);
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
}