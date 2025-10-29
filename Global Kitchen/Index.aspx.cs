using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Global_Kitchen
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    string username = Session["Username"].ToString();

                    lblWelcome.Text = "Welcome, " + username + "!";
                    lblWelcome.Visible = true;

                    lnkLogin.Visible = false;
                    lnkAdmin.Visible = false;
                    lnkProfile.Visible = true;
                    btnLogout.Visible = true;
                }
                else
                {
                    lblWelcome.Visible = false;
                    lnkLogin.Visible = true;
                    lnkAdmin.Visible = true;
                    lnkProfile.Visible = false;
                    btnLogout.Visible = false;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon(); 
            Response.Redirect("Index.aspx");
        }
    }
}using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Global_Kitchen
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    string username = Session["Username"].ToString();

                    lblWelcome.Text = "Welcome, " + username + "!";
                    lblWelcome.Visible = true;

                    lnkLogin.Visible = false;
                    lnkAdmin.Visible = false;
                    lnkProfile.Visible = true;
                    btnLogout.Visible = true;
                }
                else
                {
                    lblWelcome.Visible = false;
                    lnkLogin.Visible = true;
                    lnkAdmin.Visible = true;
                    lnkProfile.Visible = false;
                    btnLogout.Visible = false;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon(); 
            Response.Redirect("Index.aspx");
        }
    }
}
